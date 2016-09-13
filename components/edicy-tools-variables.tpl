{% comment %} TODO: Optimize the logic.{% endcomment %}
{% capture dont_render %}
  {% if site.visible_menuitems != blank or site.has_many_languages? %}
    {% assign show_menu_btn = true %}
  {% else %}
    {% assign show_menu_btn = false %}
  {% endif %}

  {% comment %}Assign variables based on page type.{% endcomment %}
  {% if edicy-tools-variables == 'article' %}
    {% assign fallback_body_image = article.data.body_image %}
    {% assign fallback_body_color = article.data.body_color %}
    {% assign fallback_body_colorData = article.data.body_colorData %}
    {% assign fallback_body_lightness = article.data.body_lightness %}
    {% assign body_bg = article.data.body_bg %}
  {% else %}
    {% assign fallback_body_image = page.data.body_image %}
    {% assign fallback_body_color = page.data.body_color %}
    {% assign fallback_body_colorData = page.data.body_colorData %}
    {% assign fallback_body_lightness = page.data.body_lightness %}
    {% assign body_bg = page.data.body_bg %}
  {% endif %}

  {% assign body_bg_image = body_bg.image %}
  {% assign body_bg_image_sizes = body_bg.imageSizes %}
  {% assign body_bg_color = body_bg.color %}
  {% assign body_bg_color_data = body_bg.colorData %}
  {% assign body_bg_combined_lightness = body_bg.combinedLightness %}

  {% comment %}Sets the body background type.{% endcomment %}
  {% if body_bg %}
    {% if body_bg_combined_lightness %}
      {% if body_bg_combined_lightness > 0.5 %}
        {% assign body_bg_type = 'light-background' %}
      {% else %}
        {% assign body_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% if body_bg_color_data.a >= 0.5 %}
        {% if body_bg_color_data.lightness >= 0.5 %}
          {% assign body_bg_type = 'light-background' %}
        {% else %}
          {% assign body_bg_type = 'dark-background' %}
        {% endif %}
      {% else %}
        {% assign body_bg_type = 'light-background' %}
      {% endif %}
    {% endif %}
  {% else %}
    {% if fallback_body_colorData != nil and body_bg_color_data == nil %}
      {% if fallback_body_colorData.a >= 0.5 %}
        {% if fallback_body_lightness >= 0.5 %}
          {% assign body_bg_type = 'light-background' %}
        {% else %}
          {% assign body_bg_type = 'dark-background' %}
        {% endif %}
      {% else %}
        {% assign body_bg_type = 'light-background' %}
      {% endif %}
    {% else %}
      {% assign body_bg_type = 'dark-background' %}
    {% endif %}
  {% endif %}

  {% if fallback_body_image != nil and body_bg.image == nil %}
    {% assign body_bg_image = fallback_body_image %}
  {% else %}
    {% if body_bg_image == nil %}
      {% assign body_bg_image = images_path | append: '/body-bg_block.jpg' %}
    {% endif %}
  {% endif %}

  {% if fallback_body_image != nil and body_bg.image == nil %}
    {% assign body_bg_image_sizes_str = '[{"url": "' | append: fallback_body_image | append: '", "width": 0, "height": 0}]' %}
  {% else %}
    {% if body_bg_image_sizes == nil %}
      {% assign body_bg_image_sizes_str = '[{"url": "' | append: images_path | append: '/body-bg.jpg", "width": 626, "height": 626}, {"url": "' | append: images_path | append: '/body-bg_block.jpg", "width":600, "height":600}]' %}
    {% else %}
      {% assign body_bg_image_sizes_str = body_bg_image_sizes | json %}
    {% endif %}
  {% endif %}

  {% if fallback_body_color != nil and body_bg.color == nil %}
    {% assign body_bg_color = fallback_body_color %}
  {% else %}
    {% if body_bg_color == nil %}
      {% assign body_bg_color = 'rgba(0, 0, 0, 0.2)' %}
    {% endif %}
  {% endif %}

  {% if body_bg_color_data == nil %}
    {% assign body_bg_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.2, "lightness": 0}' %}
  {% else %}
    {% assign body_bg_color_data_str = body_bg_color_data | json %}
  {% endif %}

  {% comment %}=================================================================
  || Design editor variables.
  ============================================================= {% endcomment %}
  {% capture base_font_set %}
    [
      {
        "type": "group",
        "title": "Sans Serif",
        "list": [
          {
            "title": "Avenir Next",
            "value": "\"Avenir Next\", \"Helvetica Neue\", \"Helvetica\", \"Segoe UI\", sans-serif"
          },
          {
            "title": "Fira Sans",
            "value": "\"Fira Sans\", sans-serif"
          },
          {
            "title": "Lato",
            "value": "\"Lato\", \"Helvetica Neue\", \"Helvetica\", \"Arial\", sans-serif"
          },
          {
            "title": "Montserrat",
            "value": "\"Montserrat\", Helvetica, Arial, sans-serif"
          },
          {
            "title": "Open Sans",
            "value": "\"Open Sans\", \"Helvetica Neue\", \"Helvetica\", \"Arial\", sans-serif"
          },
          {
            "title": "Roboto",
            "value": "\"Roboto\", sans-serif"
          },
          {
            "title": "Source Sans Pro",
            "value": "\"Source Sans Pro\", sans-serif"
          },
          {
            "title": "Ubuntu",
            "value": "\"Ubuntu\", sans-serif"
          }
        ]
      },
      {
        "type": "group",
        "title": "Serif",
        "list": [
          {
            "title": "Arvo",
            "value": "\"Arvo\", serif"
          },
          {
            "title": "Crimson Text",
            "value": "\"Crimson Text\", serif"
          },
          {
            "title": "Lora",
            "value": "\"Lora\", serif"
          },
          {
            "title": "Noto Serif",
            "value": "\"Noto Serif\", serif"
          },
          {
            "title": "Playfair Display",
            "value": "\"Playfair Display\", serif"
          },
          {
            "title": "PT Serif",
            "value": "\"PT Serif\", serif"
          },
          {
            "title": "Roboto Slab",
            "value": "\"Roboto Slab\", serif"
          }
        ]
      },
      {
        "type": "group",
        "title": "Monospace",
        "list": [
          {
            "title": "Anonymous Pro",
            "value": "\"Anonymous Pro\", monospace"
          },
          {
            "title": "Cousine",
            "value": "\"Cousine\", monospace"
          },
          {
            "title": "Roboto Mono",
            "value": "\"Roboto Mono\", monospace"
          },
          {
            "title": "Ubuntu Mono",
            "value": "\"Ubuntu Mono\", monospace"
          }
        ]
      }
    ]
  {% endcapture %}

  {% capture base_alignment_set %}
    [
      {
        "titleI18n": "left",
        "value": "left"
      },
      {
        "titleI18n": "center",
        "value": "center"
      },
      {
        "titleI18n": "right",
        "value": "right"
      }
    ]
  {% endcapture %}

  {% capture base_border_style_set %}
    [
      {
        "titleI18n": "solid",
        "value": "solid"
      },
      {
        "titleI18n": "none",
        "value": "hidden"
      }
    ]
  {% endcapture %}

  {% comment %}VOOG intro popover targets. Add them where applicable popovers should appear.{% endcomment %}
  {% capture edy_intro_add_page %}{% if editmode %}data-edy-intro-popover="edy-add-page"{% endif %}{% endcapture %}
  {% capture edy_intro_add_lang %}{% if editmode %}data-edy-intro-popover="edy-add-lang"{% endif %}{% endcapture %}
  {% capture edy_intro_edit_text %}{% if editmode %}data-edy-intro-popover="edy-edit-text"{% endif %}{% endcapture %}

{% endcapture %}{% comment %} END edicy-tools-variables {% endcomment %}
