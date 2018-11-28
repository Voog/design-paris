<!DOCTYPE html>
{% include "blog-article-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include 'edicy-tools-variables' %}
  {% include "blog-settings-variables" %}
  {% include 'html-head' %}
  {% include 'edicy-tools-styles' %}
</head>

<body class="front-page blog-page body-background-image js-body{% if site.search.enabled %} search-enabled{% endif %}{% unless show_menu_btn or editmode %} menu-btn-hidden{% endunless %}">
  {% if body_bg_color != '' or editmode %}<div class="body-background-color js-body-background-color"></div>{% endif %}

  <div class="container js-container">
    {% include "header" %}
    {% if editmode %}<button class="vg-bg-picker-btn js-bgpicker-body-settings" {% unless body_bg_image == '' %}data-bg-image="{{ body_bg_image }}"{% endunless %} {% unless body_bg_image_sizes == '' %}data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}"{% endunless %} {% unless body_bg_color == nil or body_bg_color == 'rgba(255,255,255,0)' %}data-bg-color="{{ body_bg_color }}"{% endunless %} {% unless body_bg_color_data == nil %}data-bg-color-data="{{ body_bg_color_data_str | escape }}"{% endunless %}></button>{% endif %}

    <main class="content js-background-type {{ body_bg_type }}" role="main">
      <div class="wrap">
        <section class="blog js-blog">
          {% comment %}TODO: Replace URL when this feature is added{% endcomment %}
          {% if editmode %}
          {% include "blog-settings-editor" %}
            {% for item in site.menuitems_with_hidden %}
              {% if item.blog? %}
                <button class="post-add-link post" data-behavior="open-add-modal" data-component="article" data-page-id="{{ item.page_id }}">
                  <div class="wrap">
                    <div class="align-middle">
                      <div class="post-add-icon">
                        <svg class="icon-newspaper" xmlns="http://www.w3.org/2000/svg" width="72px" height="57px" viewBox="-21 -13.5 72 57">
                          <g>
                            <path fill="none" stroke="currentColor" stroke-width="5" d="M-6,32V-10H47v50H-6C-12,40-17,37-17,31V5h11"></path>
                            <path fill="currentColor" d="M23,8h16v5H23V8z"></path>
                            <path fill="currentColor" d="M23-2h16v5H23V-2z"></path>
                            <path fill="currentColor" d="M23,17h16v5H23V17z"></path>
                            <path fill="currentColor" d="M2,27h37v5H2V27z"></path>
                            <path fill="currentColor" d="M2-2h16v25H2V-2z"></path>
                          </g>
                        </svg>
                      </div>

                      <h3 class="post-add-title">{{ "add_new_post" | lc: editor_locale }}</h3>
                    </div>
                  </div>
                </button>

                {% break %}
              {% endif %}
            {% endfor %}
          {% endif %}

          {% for article in site.latest_12_articles %}
            {% include "blog-settings-variables" %}
            {% include "post-box" %}
          {% endfor %}

          {% include "post-box-placeholder" %}
          {% include "post-box-placeholder" %}
          {% include "post-box-placeholder" %}
        </section>

        <section class="content-formatted" data-search-indexing-allowed="true" {{ edy_intro_edit_text }}>{% content %}</section>
      </div>
    </main>

    {% include "footer" %}

  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" %}
</body>
</html>
