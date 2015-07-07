<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include 'edicy-tools-variables' %}
  {% include 'html-head' %}
  {% include 'edicy-tools-styles' %}
</head>

<body class="front-page blog-page body-background-image js-body{% if site.search.enabled %} search-enabled{% endif %}">
  {% if body_bg_color != '' or editmode %}<div class="body-background-color js-body-background-color"></div>{% endif %}

  <div class="container js-container">
    {% include "header" %}
    {% if editmode %}<button class="vg-bg-picker-btn js-bgpicker-body-settings" {% unless body_bg_image == '' %}data-bg-image="{{ body_bg_image }}"{% endunless %} {% unless body_bg_image_sizes == '' %}data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}"{% endunless %} {% unless body_bg_color == nil or body_bg_color == 'rgba(255,255,255,0)' %}data-bg-color="{{ body_bg_color }}"{% endunless %} {% unless body_bg_color_data == nil %}data-bg-color-data="{{ body_bg_color_data_str | escape }}"{% endunless %}></button>{% endif %}

    <main class="content js-background-type {{ body_bg_type }}" role="main">
      <div class="wrap">
        <section class="blog js-blog">
          {% comment %}TODO: Replace URL when this feature is added{% endcomment %}
          {% if editmode %}
            {% for item in site.menuitems_with_hidden %}
              {% if item.blog? %}
                <a class="post-add-link post js-post-add" href="{{ item.url }}?new">
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

                      <h3 class="post-add-title">{{ "add_new_post" | lc }}</h3>
                    </div>
                  </div>
                </a>

                {% break %}
              {% endif %}
            {% endfor %}
          {% endif %}

          {% for article in site.latest_12_articles %}
            {% include "post-box" %}
          {% endfor %}
        </section>

        <section class="content-formatted" data-search-indexing-allowed="true">{% content %}</section>
      </div>
    </main>

    {% include "footer" %}

  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" %}
</body>
</html>
