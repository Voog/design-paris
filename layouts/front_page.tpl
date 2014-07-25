<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "bg-picker-variables" %}
</head>

<body class="front-page blog-page js-body js-bgpicker-body-image"{{ body_image_style }}>
  {% if body_color != '' or editmode %}<div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>{% endif %}

  <div class="container">
    {% include "header" %}
    {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}

    <main class="content js-content{{ body_color_class }}" role="main">
      <div class="wrap">
        <section class="blog">
          {% for item in site.menuitems_with_hidden %}
            {% if item.blog? %}
              {% comment %}<!-- TODO: Replace URL when this feature is added -->{% endcomment %}
              {% if editmode %}
                <a class="post-add-link post js-post-add" href="{{ item.url }}?new">
                  <div class="post-add-link-inner">
                    <div class="wrap">
                      <div class="align-middle">
                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="72px" height="57px" viewBox="-21 -13.5 72 57" enable-background="new -21 -13.5 72 57" xml:space="preserve">
                          <g>
                            <path fill="none" stroke="currentColor" stroke-width="5" d="M-6.28,32.412V-10H47v50H-6.28C-11.63,40-17,37.295-17,31.176V4.967h10.72"></path>
                            <path fill="currentColor" d="M23.067,7.514h15.917v4.99H23.067V7.514z"></path>
                            <path fill="currentColor" d="M23.067-2.465h15.917v4.989H23.067V-2.465z"></path>
                            <path fill="currentColor" d="M23.123,17.492h15.918v4.99H23.123V17.492z"></path>
                            <path fill="currentColor" d="M1.809,27.471h37.232v4.992H1.809V27.471z"></path>
                            <path fill="currentColor" d="M1.809-2.465h16.027v24.948H1.809V-2.465z"></path>
                          </g>
                        </svg>

                        <h3 class="post-add-title">Add a new blog post</h3>
                      </div>
                    </div>
                  </div>
                </a>
              {% endif %}

              {% break %}
            {% endif %}
          {% endfor %}

          {% for article in site.latest_articles %}
            {% include "post-box" %}
          {% endfor %}
        </section>

        <section class="content-formatted">
          {% content %}
        </section>
      </div>
    </main>

    {% include "footer" %}

  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}

</body>
</html>
