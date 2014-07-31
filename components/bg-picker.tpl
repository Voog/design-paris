{% editorjsblock %}
  <script src='/assets/admin/tools/0.1.3/edicy-tools.js'></script>
  <script>
      // Body background image and color data preview and save logic
      {% if bg-picker == "article" %}
        var articleData = new Edicy.CustomData({
          type: 'article',
          id: '{{ article.id }}'
        });
      {% else %}
      var pageData = new Edicy.CustomData({
          type: 'page',
          id: '{{ page.id }}'
        });
      {% endif %}

      var bgPickerBody = new Edicy.BgPicker($('.js-bgpicker-body-settings'), {
        picture: true,
        color: true,
        showAlpha: true,

        preview: function(data) {
          var img = (data.image && data.image !== '') ? 'url(' + data.image + ')' : 'none',
              oldImg = $('.js-bgpicker-body-image').css('background-image'),
              col = (data.color && data.color !== '') ? data.color : 'none',
              colorData = (data.colorData && data.colorData !== '') ? data.colorData : '',
              lightness = colorData && colorData !== '' && colorData.lightness ? colorData.lightness : 0;

          $('.js-content').removeClass('light-background dark-background').addClass(lightness <= 0.5 ? 'dark-background' : 'light-background');
          if (oldImg !== img) {
            $('.js-bgpicker-body-image').css({'background-image' : img});
          }
          $('.js-bgpicker-body-color').css({'background-color' : col});
        },

        commit: function(data) {
          {% if bg-picker == "article" %}
            Edicy.articles.currentArticle.setData({
          {% else %}
            pageData.set({
          {% endif %}
              'body_image': data.image || '',
              'body_color': data.color || '',
              'body_colorData' : data.colorData || '',
              'body_lightness' : data.colorData && data.colorData != '' && data.colorData.lightness ? data.colorData.lightness : 0
            });
          }
        });

        // Article background image save logic
        {% if bg-picker == "article" %}
          var pictureDropArea = new Edicy.ImgDropArea($('.js-post-cover-inner'), {
            positionable: true,

            change: function(data) {
              Edicy.articles.currentArticle.setData({
                'post_image': data
              });
            }
          });
        {% endif %}
    </script>
  {% endeditorjsblock %}
