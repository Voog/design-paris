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

  // Hides the popover main menu if clicked anywhere else than the menu itself (visible on smalles screens).
  var handlePopoverMenuHide = function() {
    $('html').click(function() {
      if ($('.js-menu-popover').hasClass('expanded')) {
        $('.js-menu-popover').removeClass('expanded');
      }
    });
  };

  // Reduces opacity of the gallery images that are not under the cursor.
  var handleFormFieldClick = function() {
    $('.form_field_with_errors').click(function() {
      $(this).removeClass('form_field_with_errors');
    });
  };

  var focusCommentsWithErrors = function() {
    $(document).ready(function() {
      if ($('.comment-form').hasClass('form_with_errors') === true) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      }
    });
  };

  var wrapTables = function() {
    $('.content-formatted table').wrap('<div class="table-container overthrow"></div>');
  };

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

  var handleTableHorizontalScrolling = function() {
    $.each($('.table-container'), function() {
      if ($(this).hasScrollBar('horizontal') === true) {
        $(this).addClass('horizontal-scroll');
      } else {
        $(this).removeClass('horizontal-scroll');
      }
    });
  };

  var handleWindowResize = function() {
    $(window).resize(function() {
      handleTableHorizontalScrolling();
    });
  };

  var getNewArticleURL = function() {
    newArticleUrl = $('.js-post-add-btn').find('.edy-site-menu-add').attr('href');
    $('.js-post-add').attr('href', newArticleUrl);
  };

  // Initiations
  var initBlogPage = function() {
  };

  var initBlogPageEditmode = function() {
    getNewArticleURL();
  };

  var initArticlePage = function() {
    handleFormFieldClick();
    focusCommentsWithErrors();
  };

  var init = function() {
    toggleMainMenu();
    toggleLangMenu();
    handlePopoverMenuHide();
    handleWindowResize();
    wrapTables();
    if ($('.table-container').length > 0) {
      checkScrollBar();
      handleTableHorizontalScrolling();
    }
  };

  window.site = $.extend(window.site || {}, {
    initBlogPage: initBlogPage,
    initBlogPageEditmode: initBlogPageEditmode,
    initArticlePage: initArticlePage,
    handleFormFieldClick: handleFormFieldClick
  });

  init();
})(jQuery);
