;(function($) {
  var articlePage = function () {
    return $('body').hasClass('post-page');
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
        colorExtractImage.on('load', function() {
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

  var normalizeValue = function(value) {
    if (value == null || (typeof value == 'string' && value.match(/^[\\'"]+$/))) {
      return '';
    } else {
      return value;
    }
  };

  // Body background image and color save logic function.
  var bodyBgCommit = function(data, dataName) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = normalizeValue(data.imageSizes);
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

    // ===========================================================================
  // Binds image drop areas.
  // ===========================================================================
  var bindContentItemImgDropAreas = function (placeholderText, itemImageKey, cropStateKey) {
    $('.js-content-item-img-drop-area').each(function (index, imgDropAreaTarget) {
      var $imgDropAreaTarget = $(imgDropAreaTarget),
        $contentItemBox = $imgDropAreaTarget.closest('.js-content-item-box'),
        $removeBtn = $contentItemBox.find('.image_settings-remove'),
        itemId = $contentItemBox.data('item-id'),
        itemType = $contentItemBox.data('item-type'),
        itemImageType = $contentItemBox.data('image-type'),
        itemData = new Edicy.CustomData({
          type: itemType,
          id: itemId
        });

      var imgDropArea = new Edicy.ImgDropArea($imgDropAreaTarget, {
        positionable: false,
        target_width: 2048,
        placeholder: '<div class="edy-img-drop-area-placeholder">' + placeholderText + '</div>',
        removeBtn: null,
        change: function (image) {
          var $cropToggleButton = $contentItemBox.find('.js-toggle-crop-state');
          $imgDropAreaTarget
            .removeClass('is-cropped')
            .addClass('not-cropped')
            .css('opacity', .1)
            ;

          if (image) {
            removeImagePlaceholder($contentItemBox, $cropToggleButton);
            $('.js-remove-image').css('display', 'flex');
          } else {
            $contentItemBox.find('.image_settings').hide();

            $contentItemBox
              .removeClass('with-image is-loaded with-error')
              .addClass('without-image not-loaded')
              ;

            $cropToggleButton
              .addClass('is-hidden')
              .removeClass('is-visible')
              ;
            $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 0);
          }


          var itemType = $contentItemBox.data('item-type');
          var itemId = $contentItemBox.data('item-id');

          var itemData = new Edicy.CustomData({
            type: itemType,
            id: itemId
          });

          itemData.set({ [cropStateKey]: 'not-cropped', [itemImageKey]: image });
          $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');
          $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 1);
          $imgDropAreaTarget.css('opacity', 1);
        }
      });

      $removeBtn.on('click', function () {
        var $el = $(this),
        itemId = $contentItemBox.data('item-id'),
        itemType = $contentItemBox.data('item-type'),
        itemData = new Edicy.CustomData({
          type: itemType,
          id: itemId
        });

        itemData.get({
          success: function (data) {
            if (data.item_image) {
              itemData.remove(itemImageKey, {
                success: function (data) {
                  itemData.remove(cropStateKey, {
                    success: function (data) {
                      if (itemType !== 'article') {
                        handleProductImage(placeholderText, itemId, null, $el);
                      } else {
                        addProductImagePlaceholder($el, placeholderText);
                      }
                    }
                  });
                }
              });
            } else {
              $.ajax({
                type: 'PUT',
                contentType: 'application/json',
                url: '/admin/api/pages/' + itemId,
                dataType: 'json',
                data: JSON.stringify({ "image_id": null })
              }).then(function (product) {
                addProductImagePlaceholder($el, placeholderText);
              });
            }
          }
        });

      });
    });
  };

  var removeImagePlaceholder = function ($contentItemBox, $cropToggleButton) {
    $contentItemBox.find('.image_settings').show();

    $contentItemBox
      .removeClass('without-image is-loaded with-error')
      .addClass('with-image not-loaded')
      ;

    $cropToggleButton
      .removeClass('is-hidden')
      .addClass('is-visible')
      ;
  }

  var addProductImagePlaceholder = function (el, placeholderText) {
    var itemBox = el.closest('.js-content-item-box');

    itemBox.find('.top-inner')
      .append('<div class="edy-img-drop-area-placeholder">' + placeholderText + '</div>');
    itemBox.find('.top-inner').attr("style", "");
    itemBox
      .removeClass('with-image is-loaded with-error')
      .addClass('without-image not-loaded')
    ;
    itemBox.find('.edy-img-drop-area').removeClass('active');
    itemBox.find('.image_settings').hide();

    // Remove alt image data
    itemBox.find('.image_settings-remove--input').val('');
    itemBox.find('.image_settings-remove--input').trigger('change');
    itemBox.find('.form_field-cms').removeClass('with-input');
  };

  // ===========================================================================
  // Sets functions that will be initiated globally when resizing the browser
  // window.
  // ===========================================================================
  var bindContentItemImageCropToggle = function (dataKey) {
    $('.js-toggle-crop-state').on('click', function () {
      var $contentItemBox = $(this).closest('.js-content-item-box'),
        $imgDropAreaTarget = $contentItemBox.find('.js-content-item-img-drop-area'),
        itemId = $contentItemBox.data('item-id'),
        itemType = $contentItemBox.data('item-type'),
        itemData = new Edicy.CustomData({
          type: itemType,
          id: itemId
        }),
        imageCropState;

      if ($imgDropAreaTarget.hasClass('is-cropped')) {
        $imgDropAreaTarget
          .removeClass('is-cropped')
          .addClass('not-cropped')
          ;

        imageCropState = 'not-cropped';
      } else {
        $imgDropAreaTarget
          .removeClass('not-cropped')
          .addClass('is-cropped')
          ;

        imageCropState = 'is-cropped';
      }

      itemData.set(dataKey, imageCropState);
    });
  };

  //==========================================================================
  // Sets site custom data saving fanction variable.
  //==========================================================================
  var bindCustomDataItem = function () {
    $('.js-data-item').each(function () {
      $(this).on('change', function (e) {
        if (e.target.type === 'checkbox') {
          var val = e.target.checked;
        } else {
          var val = e.target.value;
        }
        var dataKey = e.target.dataset.name;
        var dataId = e.target.dataset.id;
        var dataEntity = e.target.dataset.entity;
        var dataReload = e.target.dataset.reload;

        if (dataEntity == 'site') {
          var entityData = new Edicy.CustomData({
            type: 'site'
          });;
        } else {
          var entityData = new Edicy.CustomData({
            type: dataEntity,
            id: dataId
          });
        }

        entityData.set({ [dataKey]: val }, {
          success: function () {
            if (dataReload) { location.reload(); };
          }
        });
      });
    });
  };

  // ===========================================================================
  // Toggles product categories visibility in main menu.
  // ===========================================================================
  var bindRootItemSettings = function(rootItemValuesObj) {
    if (!('show_product_related_pages_in_main_menu' in rootItemValuesObj)) {
      rootItemValuesObj.show_product_related_pages_in_main_menu = false;
    }

    $('.js-root-item-settings-toggle').each(function(index, languageMenuSettingsButton) {
      var rootItemSettingsEditor = new Edicy.SettingsEditor(languageMenuSettingsButton, {
        menuItems: [
          {
            "titleI18n": "show_in_main_menu",
            "type": "checkbox",
            "key": "show_product_related_pages_in_main_menu",
            "states": {
              "on": true,
              "off": false
            }
          }
        ],

        buttonTitleI18n: "settings",

        values: rootItemValuesObj,

        containerClass: ['js-root-item-settings-popover', 'js-prevent-sideclick'],

        preview: function(data) {
          if (!data.show_product_related_pages_in_main_menu === true) {
            $('.js-menu-item-products').addClass('is-hidden');
          } else {
            $('.js-menu-item-products').removeClass('is-hidden');
          }
        },

        commit: function(data) {
          siteData.set('settings_root_item', data);
        }
      });
    });
  };

  handleProductImage = function(placeholderText, pageId, event, el) {
    var productId = $('.js-buy-btn-content  .partial .edy-buy-button-container').data( "product-id" );
    var productImageEl = $('.js-product-page-image .image-drop-area');
    $.ajax({
      type: 'GET',
      contentType: 'application/json',
      url: '/admin/api/pages/' + pageId,
      dataType: 'json'
    }).then(function(page) {
      var addPlaceholder = function() {
        if (el.closest('.content-item-box').find('.edy-img-drop-area-placeholder').length < 1) {
          addProductImagePlaceholder(el, placeholderText);
        }
      }
      if (event) {
        if (page.data.item_image) {
          productImageEl.css('background-image', 'url(' + page.data.item_image.url + ')');
          $('.js-remove-image').css('display', 'flex');
        } else if (event.detail.product.image) {
          $('.image_settings').css('display', 'flex');
          $('.js-remove-image').css('display', 'none');
          $('.edy-img-drop-area-placeholder').remove();
          removeImagePlaceholder(productImageEl.closest('.js-content-item-box'), productImageEl.find('.js-toggle-crop-state'))
          productImageEl.css('background-image', 'url(' + event.detail.product.image.url+ ')');
        } else if (!isEmpty(page.image)) {
          productImageEl.css('background-image', 'url(' + page.image.public_url + ')');
          $('.js-remove-image').css('display', 'flex');
        } else {
          if ($('.edy-img-drop-area-placeholder').length < 1) {
            addProductImagePlaceholder(productImageEl, placeholderText);
          }
        }
      } else if (productId) {
        $.ajax({
          type: 'GET',
          contentType: 'application/json',
          url: '/admin/api/ecommerce/v1/products/' + productId + '?include=details',
          dataType: 'json'
        }).then(function(product) {
          if (product.image) {
            $('.image_settings').css('display', 'flex');
            $('.js-remove-image').css('display', 'none');
            $('.edy-img-drop-area-placeholder').remove();
            removeImagePlaceholder(productImageEl.closest('.js-content-item-box'), productImageEl.find('.js-toggle-crop-state'))
            productImageEl.css('background-image', 'url(' + product.image.url+ ')');
          } else if (!isEmpty(page.image)) {
            productImageEl.css('background-image', 'url(' + page.image.public_url + ')');
            $('.js-remove-image').css('display', 'flex');
          } else {
            addPlaceholder();
          }
        });
      } else {
        addPlaceholder();
      }
    });
  };

  var isEmpty = function(obj) {
    for (var prop in obj) {
      if (obj.hasOwnProperty(prop)) {
        return false;
      }
    }
    return JSON.stringify(obj) === JSON.stringify({});
  };

  var bindProductListeners = function (placeholderText, pageId) {
    document.addEventListener('voog:ecommerce:buttonproductsave', function (event) {
      handleProductImage(placeholderText, pageId, event);
    });
  };

  var handleFocus = function (el, func) {
    el.focus(function () {
      $(window).keyup(function (e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if (code == 9) {
          func()
        }
      });
    });
  }

  handleFocus($('.js-toggle-image-settings'), toggleImageSettingsPopover);

  var handleDocument = function() {
    if ($('.form_field-cms input').length) {
      if ($('.form_field-cms input').val().length >= 1) {
        $('.form_field-cms input').closest('.form_field-cms').addClass('with-input');
      } else {
        $('.form_field-cms input').closest('.form_field-cms').removeClass('with-input');
      }
    }

    $(document).ready(function() {
      $('.form_field-cms input').keyup(function(e) {
        if ($(this).val().length >= 1) {
          $(this).closest('.form_field-cms').addClass('with-input');
        } else {
          $(this).closest('.form_field-cms').removeClass('with-input');
        }
      });
    });
  };

  var toggleImageSettingsPopover = function () {
    $('.js-image-settings-popover').toggleClass('active');
  }

  $('.js-toggle-image-settings').click(function () {
    toggleImageSettingsPopover();
  });

  var bindCustomTexteditorStyles = function(buttonTranslation) {
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: buttonTranslation, tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
  };

  var init = function () {
    bindCustomDataItem();
    handleDocument();
  };

  // Enables the usage of the initiations outside this file
  window.template = $.extend(window.template || {}, {
    bindRootItemSettings: bindRootItemSettings
  });

  window.site = $.extend(window.site || {}, {
    bodyBgPreview: bodyBgPreview,
    bodyBgCommit: bodyBgCommit,
    bindCustomTexteditorStyles: bindCustomTexteditorStyles,
    bindContentItemImgDropAreas: bindContentItemImgDropAreas,
    bindContentItemImageCropToggle: bindContentItemImageCropToggle,
    bindProductListeners: bindProductListeners
  });

  init();
})(jQuery);
