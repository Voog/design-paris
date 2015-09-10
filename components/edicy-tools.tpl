{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    // VARIABLES FOR THE CUSTOM DATA.
    {% if edicy-tools == "article" %}
      // Article pages custom data variable.
      var articleData = new Edicy.CustomData({
        type: 'article',
        id: '{{ article.id }}'
      });
    {% else %}
      // Article pages custom data variable.
      var pageData = new Edicy.CustomData({
        type: 'page',
        id: '{{ page.id }}'
      });
    {% endif %}

    // Front page header banner background picker.
    var bodyBg = new Edicy.BgPicker($('.js-bgpicker-body-settings'), {
        picture: true,
        target_width: 600,
        color: true,
        showAlpha: true,

      preview: function(data) {
        site.bodyBgPreview(data, '.js-body');
      },

      commit: function(data) {
        site.bodyBgCommit(data, 'body_bg');
      }
    });

    // Article background image save logic
    {% if edicy-tools == "article" %}
      var pictureDropArea = new Edicy.ImgDropArea($('.js-post-cover-inner'), {
        positionable: true,
        target_width: 800,

        change: function(data) {
          Edicy.articles.currentArticle.setData({
            'post_image': data
          });
        }
      });
    {% endif %}
  </script>
{% endeditorjsblock %}
