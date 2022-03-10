{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    // VARIABLES FOR THE CUSTOM DATA.

    var siteData = new Edicy.CustomData({
      type: 'site',
    });

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

    var bodyBg = new Edicy.BgPicker($('.js-bgpicker-body-settings'), {
      picture: true,
      target_width: 600,
      color: true,
      showAlpha: true,

      preview: function(data) {
        site.bodyBgPreview(data, '.js-body');
      },

      commit: function(data) {
        {% if product_page == true %}
          site.bodyBgCommit(data, '{{ product_body_bg_key }}');
        {% else %}
          site.bodyBgCommit(data, 'body_bg');
        {% endif %}
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

    site.bindCustomTexteditorStyles('{{ "button" | lc: editor_locale }}');

    {%- if page.layout_title == product_layout -%}
      {%- assign dropAreaPlaceholder = "drag_picture_for_product_here" | lce | escape -%}
      site.bindProductListeners("{{ dropAreaPlaceholder }}", {{ page.id }});
    {%- else -%}
      {%- assign dropAreaPlaceholder = "drag_picture_here" | lce | escape -%}

      {% if site.data.settings_root_item %}
        rootItemValuesObj = {{ site.data.settings_root_item | json }};
      {% else %}
        rootItemValuesObj = {};
      {% endif %}

      template.bindRootItemSettings(rootItemValuesObj);
    {%- endif -%}

    site.bindContentItemImgDropAreas('{{ dropAreaPlaceholder }}', "item_image", "image_crop_state");
    site.bindContentItemImageCropToggle("image_crop_state");
  </script>
{% endeditorjsblock %}
