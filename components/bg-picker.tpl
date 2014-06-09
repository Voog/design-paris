{% editorjsblock %}
  <script src='/assets/admin/tools/0.1.1/edicy-tools.js'></script>
  <script>
    // Body background image and color data preview and save logic
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    var bgPickerBody = new Edicy.BgPicker($('.js-bgpicker-body-settings'), {
      picture: true,
      color: true,

      preview: function(data) {
        var img = (data.image && data.image !== '') ? 'url("' + data.image + '")' : '',
            col = (data.color && data.color !== '') ? data.color : '';

        $('.js-bgpicker-body-image').css({'background-image' : img});
        $('.js-bgpicker-body-color').css({'background-color' : col});

        if (data.image === null || data.image === '') {
          $('.js-bgpicker-body-color').css({'opacity' : 1});
        } else {
          $('.js-bgpicker-body-color').css({'opacity' : 0.5});
        }
      },

      commit: function(data) {
        siteData.set({
          'body_image': data.image || null,
          'body_color': data.color || null
        });
      }
    });

    // Article cover image and color data preview and save logic
    var articleData = new Edicy.CustomData({
      type: 'article',
      id: '{{ article.id }}'
    });

    var bgPickerArticle = new Edicy.BgPicker($('.js-bgpicker-post-settings'), {
      picture: true,
      color: false,

      preview: function(data) {
        var img = (data.image && data.image !== '') ? 'url("' + data.image + '")' : '',
            col = (data.color && data.color !== '') ? data.color : '';

        $('.js-bgpicker-post-image').css({'background-image' : img});
        $('.js-bgpicker-post-color').css({'background-color' : col});

        if (data.image === null || data.image === '') {
          $('.js-bgpicker-post-color').css({'opacity' : 1});
        } else {
          $('.js-bgpicker-post-color').css({'opacity' : 0.5});
        }
      },

      commit: function(data) {
        articleData.set({
          'post_image': data.image || null,
          'post_color': data.color || null
        });
      }
    });

  </script>
{% endeditorjsblock %}
