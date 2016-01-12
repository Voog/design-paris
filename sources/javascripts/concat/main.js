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
  var getMoreArticles = function(langCode, pageId) {
    var hasArticles = true,
        pageNr = 2,
        perPage = 16,
        currentLang = (langCode == 'zh' ? 'zh-cn' : langCode);

    $(window).scroll(site.debounce(function() {
      if(hasArticles && (($(document).height() - $(window).height()) - $(window).scrollTop() < 500)) {

        $.ajax({
          url: '/admin/api/articles?per_page=' + perPage + '&page=' + pageNr + (pageId ? '&page_id=' + pageId : '') + '&language_code=' + langCode,
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

  // Returns the suitable version of the image depending on the viewport width.
  var getImageByWidth = function(sizes, targetWidth) {
    var prevImage;

    for (var i = 0, max = sizes.length; i < max; i++) {
      if (sizes[i].width < targetWidth) {
        return prevImage || sizes[i];
      }
      prevImage = sizes[i];
    }
    // Makes sure that smallest is returned if all images bigger than targetWidth.
    return sizes[sizes.length - 1];
  };

  var bodyBgImageSizesContains = function(sizes, url) {
    for (var i = sizes.length; i--;) {
      if (url.indexOf(sizes[i].url.trim()) > -1) {
        return true;
      }
    }
    return false;
  };

  // Checks the lightness sum of body background image and color and sets the lightness class depending on it's value.
  var handleBodyImageLightnessClass = function() {
    if (bodyBgCombinedLightness >= 0.5) {
      $('.js-background-type').addClass('light-background').removeClass('dark-background');
    } else {
      $('.js-background-type').addClass('dark-background').removeClass('light-background');
    }
  };

  // Body background image and color preview logic function.
  var bodyBgPreview = function(data, body) {
    // Defines the variables used in preview logic.

    var bodyBgImagePrevious = $('.js-body').css('background-image'),
        bodyBgImageSuitable = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : null,
        bodyBgImage = (data.image && data.image !== '') ? 'url(' + bodyBgImageSuitable.url + ')' : 'none',
        bodyBgImageSizes = (data.imageSizes && data.imageSizes !== '') ? data.imageSizes : null,
        bodyBgColor = (data.color && data.color !== '') ? data.color : 'rgba(0,0,0,0)',
        bodyBgColorDataLightness = (data.colorData && data.colorData !== '') ? data.colorData.lightness : 1,
        colorExtractImage = $('<img>'),
        colorExtractCanvas = $('<canvas>'),
        colorExtractImageUrl = (data.image && data.image !== '') ? data.image : null;

    if (colorExtractImageUrl) {
      if (bodyBgImageSizesContains(bodyBgImageSizes, bodyBgImagePrevious)) {
        bodyBg.bodyBgImageColor = bodyBg.bodyBgImageColor ? bodyBg.bodyBgImageColor : 'rgba(60,60,60,1)';

        bodyBgCombinedLightness = getCombinedLightness(bodyBg.bodyBgImageColor, bodyBgColor);
        handleBodyImageLightnessClass();
      } else {
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/(photos|voogstock)/g,'/photos'));
        colorExtractImage.load(function() {
          ColorExtract.extract(colorExtractImage[0], colorExtractCanvas[0], function(data) {
            bodyBg.bodyBgImageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            bodyBgCombinedLightness = getCombinedLightness(bodyBg.bodyBgImageColor, bodyBgColor);
            handleBodyImageLightnessClass();
          });
        });
      };
    } else {
      bodyBg.bodyBgImageColor = 'rgba(255,255,255,1)';
      bodyBgCombinedLightness = getCombinedLightness(bodyBg.bodyBgImageColor, bodyBgColor);
      handleBodyImageLightnessClass();
    };

    // Updates the body background image and background color.
    $(body).css({'background-image' : bodyBgImage});
    $(body).find('.js-body-background-color').css({'background-color' : bodyBgColor});
  };

  // Body background image and color save logic function.
  var bodyBgCommit = function(data, dataName) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = data.imageSizes || '';
    commitData.color = data.color || 'rgba(255,255,255,0)';
    commitData.combinedLightness = bodyBgCombinedLightness;

    if (articlePage()) {
      Edicy.articles.currentArticle.setData('body_bg', commitData);
    } else {
      pageData.set(dataName, commitData);
    };

  };

  var colorSum = function(bgColor, fgColor) {
    if (bgColor && fgColor) {
      if (typeof bgColor == 'string') {
        bgColor = bgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(bgColor, function(n, x) {bgColor[n] = +x;});
      }
      if (typeof fgColor == 'string') {
        fgColor = fgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(fgColor, function(n, x) {fgColor[n] = +x;});
      }
      if (typeof bgColor == 'object' && bgColor.hasOwnProperty('length')) {
        if (bgColor.length == 3) { bgColor.push(1.0); }
      }
      if (typeof fgColor == 'object' && fgColor.hasOwnProperty('length')) {
        if (fgColor.length == 3) { fgColor.push(1.0); }
      }
      var result = [0, 0, 0, 0];
      result[3] = 1 - (1 - fgColor[3]) * (1 - bgColor[3]);
      if (result[3] === 0) { result[3] = 1e-6; }
      result[0] = Math.min(fgColor[0] * fgColor[3] / result[3] + bgColor[0] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[1] = Math.min(fgColor[1] * fgColor[3] / result[3] + bgColor[1] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[2] = Math.min(fgColor[2] * fgColor[3] / result[3] + bgColor[2] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      return $.map(result, function(e) { return Math.floor(e); });
    }
  };

  var getCombinedColor = function(bgColor, fgColor) {
    var sum = colorSum(bgColor || [255,255,255,1], fgColor || [255,255,255,1]);
    return sum;
  };

  var getCombinedLightness = function(bgColor, fgColor) {
    var combinedColor = getCombinedColor(bgColor, fgColor);
    var color = Math.round(((+combinedColor[0]) * 0.2126 + (+combinedColor[1]) * 0.7152 + (+combinedColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  var bindCustomTexteditorStyles = function() {
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: 'Button', tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
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
    wrapTables();

    if (editmode()) {
      bindCustomTexteditorStyles();
    }

    if (!Modernizr.flexbox && editmode()) {
      bindFallbackHeaderLeftWidthCalculation();
    };
  };

  window.site = $.extend(window.site || {}, {
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage,
    bodyBgPreview: bodyBgPreview,
    bodyBgCommit: bodyBgCommit,
    debounce: debounce,
    getMoreArticles: getMoreArticles
  });

  init();
})(jQuery);
