;(function($) {
  // Shows/hides the popover main menu (visible on smalles screens).
  var toggleMainMenu = function() {
    $('.js-menu-btn').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');
    });
  };

  // Shows/hides the popover language menu.
  var toggleLangMenu = function() {
    $('.js-menu-lang-btn').click(function(event) {
      event.stopPropagation();
      $('.js-menu-lang-popover').toggleClass('expanded');
    });
  };

  // Hides the popover menus if clicked anywhere else than the menu itself.
  var handlePopoverMenuHide = function() {
    $('html').click(function() {
      if ($('.js-menu-popover').hasClass('expanded')) {
        $('.js-menu-popover').removeClass('expanded');
      }
    });
  };

  var handleSearchModalHeight = function() {
    windowHeight = $(window).height(),
    searchModalHeight = windowHeight - 124;
    $('.voog-search-modal').css({'max-height': searchModalHeight});
  };

  var handleSearchSubmit = function() {
    $('.js-search-form').on('submit', function() {
      handleSearchModalHeight();
    });
  };

  // Reduces opacity of the gallery images that are not under the cursor.
  var handleGalleryHover = function() {
    $('.edys-gallery-item').mouseover(function() {
      $(this).siblings('.edys-gallery-item').find('.edys-gallery-image').addClass('inactive');
    });

    $('.edys-gallery-item').mouseout(function() {
      $(this).siblings('.edys-gallery-item').find('.edys-gallery-image').removeClass('inactive');
    });
  };

  // Scrolls to the comment-form if comment submit failed (to show the error messages to the user).
  var focusCommentsWithErrors = function() {
    $(document).ready(function() {
      if ($('.comment-form').hasClass('form_with_errors') === true) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      }
    });
  };

  // Wraps tables in the container.
  // TODO: remove if edicy is going to wrap table with the container.
  var wrapTables = function() {
    $('.content-formatted table').wrap('<div class="table-container overthrow"></div>');
  };

  // Checks the presence of the table scrollbar.
  var checkScrollBar = function() {
    jQuery.fn.hasScrollBar = function(direction) {
      if (direction == 'vertical') {
        return this.get(0).scrollHeight > this.innerHeight();
      } else if (direction == 'horizontal') {
        return this.get(0).scrollWidth > this.innerWidth();
      }
      return false;
    }
  };

  // Adds horizontal scroll to tables that don't fit into the content area.
  var handleTableHorizontalScrolling = function() {
    $.each($('.table-container'), function() {
      if ($(this).hasScrollBar('horizontal') === true) {
        $(this).addClass('horizontal-scroll');
      } else {
        $(this).removeClass('horizontal-scroll');
      }
    });
  };

  // Sets the right URL for the custom "add new blog post" button.
  var getNewArticleURL = function() {
    newArticleUrl = $('.js-post-add-btn').find('.edy-site-menu-add').attr('href');
    $('.js-post-add').attr('href', newArticleUrl);
  };

  // Initiates the functions when window is resized.
  var handleWindowResize = function() {
    $(window).resize(function() {
      handleTableHorizontalScrolling();
      handleSearchModalHeight();
    });
  };

  // Initiations
  var initBlogPageEditmode = function() {
    getNewArticleURL();
  };

  var initArticlePage = function() {
    focusCommentsWithErrors();
  };

  var init = function() {
    toggleMainMenu();
    toggleLangMenu();
    handleSearchSubmit();
    handlePopoverMenuHide();
    handleGalleryHover();
    handleWindowResize();
    wrapTables();
    if ($('.table-container').length > 0) {
      checkScrollBar();
      handleTableHorizontalScrolling();
    }
  };

  window.site = $.extend(window.site || {}, {
    initBlogPageEditmode: initBlogPageEditmode,
    initArticlePage: initArticlePage
  });

  init();
})(jQuery);
