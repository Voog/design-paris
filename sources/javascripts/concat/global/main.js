;(function($) {
  var editmode = function () {
    return $('html').hasClass('editmode');
  };

  var articlePage = function () {
    return $('body').hasClass('post-page');
  };

  // Function to limit the rate at which a function can fire.
  var debounce = function(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  var bindSideClicks = function() {
    $('.js-container').on('mousedown', function(event) {
      if (!$(event.target).closest('.js-prevent-sideclick').length) {
        $('.js-popover').removeClass('expanded');
        $('.js-search-close-btn').removeClass('open');
        $('body').removeClass('search-open');
        $('.js-search-open-btn').removeClass('open');
        $('.js-search').removeClass('active');
      };
    });
  };

  var handleElementsClick = function() {
    // Toggles the popover main menu (visible on smalles screens).
    $('.js-menu-btn').click(function() {
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');

      if ($('.js-search-close-btn').hasClass('open')) {
        $('.js-search-close-btn').removeClass('open');
        $('body').removeClass('search-open');
        $('.js-search-open-btn').removeClass('open');
        $('.js-search').removeClass('active');
      }
    });

    // Toggles the popover language menu.
    $('.js-menu-lang-btn').click(function() {
      $('.js-menu-lang-popover').toggleClass('expanded');
    });

    // Opens the search modal.
    $('.js-search-open-btn').click(function() {
      if ($('.js-menu-main').hasClass('expanded')) {
        $('.js-menu-main').removeClass('expanded');
        $('.js-menu-btn').removeClass('open');
      }

      $(this).addClass('open');
      $('body').addClass('search-open');
      $('.js-search-close-btn').addClass('open');
      $('.js-search').addClass('active');
      $('.js-search-inner').css({'margin-top': '-25px'});
      $('.js-search-input').val('').focus();
    });

    // Closes the search modal.
    $('.js-search-close-btn').click(function(event) {
      $(this).removeClass('open');
      $('body').removeClass('search-open');
      $('.js-search-open-btn').removeClass('open');
      $('.js-search').removeClass('active');
    });

    // Prevents search modal closing on click
    $('.js-search').click(function(event) {
      // event.stopPropagation();
    });
  };

  // Sets the search modal synamic height.
  var handleSearchModalHeight = function() {
    windowHeight = $(window).height(),
    searchModalHeight = windowHeight - 124;

    $('.js-voog-search-modal-inner').css({'max-height': searchModalHeight});
  };

  // Triggers search modal height calculation.
  var handleSearchSubmit = function() {
    $('.js-search-form').on('submit', function() {
      handleSearchModalHeight();
    });
  };

  // Loads more blog articles via API.
  var getMoreArticles = function(langCode, pageId, tags) {
    var hasArticles = true,
        pageNr = 2,
        perPage = 16,
        currentLang = (langCode == 'zh' ? 'zh-cn' : langCode);

    $(window).scroll(site.debounce(function() {
      if(hasArticles && (($(document).height() - $(window).height()) - $(window).scrollTop() < 500)) {

        var url = '/admin/api/articles?per_page=' + perPage + '&page=' + pageNr + '&language_code=' + langCode;

        if (pageId) { url += '&page_id=' + pageId }
        if (tags) { url += '&tag[]=' + tags.join('&tag[]=') }

        $.ajax({
          url: url,
          type: 'get',
          dataType: 'json',
          success: function(data) {
            if (data.length > 0) {
              $.each(data, function(index, article) {
                if (editmode()) {
                  var articleTitle = article.autosaved_title,
                      articleExcerpt = article.autosaved_excerpt;
                } else {
                  var articleTitle = article.title,
                      articleExcerpt = article.excerpt;
                };

                var articleTemplate =
                  '<article class="post">\
                    <div class="post-position">\
                      <a class="post-top" href="' + article.public_url + '">\
                        ' + (article.data.post_image ? '<div class="background-image" style="background-image: url(\'' + article.data.post_image.url + '\'); background-position:' + article.data.post_image.left + 'px ' + article.data.post_image.top + 'px;"></div>' : '') + '\
                        <header class="post-header">\
                          <h2 class="post-title">' + article.title + '</h2>\
                        </header>\
                      </a>\
                    </div>\
                    <div class="post-bottom">\
                      <footer class="post-footer">\
                        <time class="post-date" datetime="' + moment(article.created_at).locale(langCode).format('YYYY-MM-DD') + '">' +
                          moment(article.created_at).locale(langCode).format('DD. MMMM YYYY') + '\
                        </time>\
                      </footer>\
                    </div>\
                  </article>';

                $('.js-blog').append(articleTemplate);
              });
            } else {
              hasArticles = false;
            };
          }
        });

        pageNr = pageNr + 1;
      };
    }, 500));
  };

  // Scrolls to the comment-form if comment submit failed (to show the error messages to the user)
  var focusFormWithErrors = function() {
    $(document).ready(function() {
      if ($('.comment-form').hasClass('form_with_errors')) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      } else if ($('form').find('.form_error, .form_notice').length > 0) {
        $('html, body').scrollTop($('.form_error, .form_notice').closest('form').offset().top);
      }
    });
  };

  var bindTextareaAutoSize = function() {
    $(document).ready(function() {
      $('.form_field_textarea').textareaAutoSize();
    });
  };

  // Wraps tables in the container.
  // TODO: remove if edicy is going to wrap table with the container.
  var wrapTables = function() {
    $('.content-formatted table').wrap('<div class="table-container"></div>');
  };

  var bindFallbackHeaderLeftWidthCalculation = function() {
    var headerWidth = $('.js-header-wrap').width(),
        headerRight = $('.js-header-right'),
        headerRightWidth = headerRight.width(),
        headerRightMargin = parseInt(headerRight.css('margin-left')) + 1;

    $('.js-header-left').css('min-width', headerWidth - headerRightWidth - headerRightMargin);
  };

  var bindCustomTexteditorStyles = function(buttonTranslation) {
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: buttonTranslation, tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
  };

  // Initiates the functions when window is resized.
  var handleWindowResize = function() {
    // Add functions that should be trgiggered while resizing the window here.
    // Example:
    // $(window).resize(debounce(yourFunctionName, 3000));
  };

  // Initiates the functions when window is scrolled.
  var handleWindowScroll = function() {
    // Add functions that should be trgiggered while resizing the window here.
    // Example:
    // $(window).scroll(debounce(yourFunctionName, 3000));
  };

  // Initiations
  var initBlogPage = function() {
  };

  var initArticlePage = function() {
  };

  var init = function() {
    bindSideClicks();
    handleElementsClick();
    handleSearchSubmit();
    handleWindowResize();
    focusFormWithErrors();
    bindTextareaAutoSize();

    if (!editmode()) {
      wrapTables();
    }

    if (!Modernizr.flexbox && editmode()) {
      bindFallbackHeaderLeftWidthCalculation();
    };
  };

  // ===========================================================================
  // Binds site search functionality.
  // ===========================================================================
  var bindSiteSearch = function(searchForm, languageCode, noResultsString) {
    if (searchForm) {
      var search = new VoogSearch(searchForm, {
        // This defines the number of results per query.
        per_page: 10,
        // Language code for restricting the search to page language.
        lang: languageCode,
        // If given, an DOM element results are rendered inside that element
        resultsContainer: $('.js-voog-search-modal-inner').get(0),
        // Defines if modal should close on sideclick.
        sideclick: true,
        // Mobile checkpoint.
        mobileModeWidth: 640,
        // Updates results on every keypress.
        updateOnKeypress: true,
        // String for feedback if no results are found.
        noResults: noResultsString
      });
    }
  };

  window.site = $.extend(window.site || {}, {
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage,
    debounce: debounce,
    getMoreArticles: getMoreArticles,
    bindCustomTexteditorStyles: bindCustomTexteditorStyles,
    bindSiteSearch: bindSiteSearch
  });

  init();
})(jQuery);
