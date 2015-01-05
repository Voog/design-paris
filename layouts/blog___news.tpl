<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include 'edicy-tools-variables' %}
  {% include 'html-head' %}
  {% include 'edicy-tools-styles' %}
</head>


<body class="blog-page body-background-image js-body-background-image{% if fallback_state %} bgpicker-fallback{% endif %}{% if site.search.enabled %} search-enabled{% endif %}">
  {% if body_bg_color != '' or editmode %}<div class="body-background-color js-body-background-color"></div>{% endif %}

  <div class="container">
    {% include "header" %}
    {% if editmode %}<button class="bgpicker-btn js-body-background-settings" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>{% endif %}

    <main class="content js-background-type {{ body_bg_type }}" role="main">
      <div class="wrap">

        <div class="post-add-btn js-post-add-btn">{% addbutton %}</div>
        {% if tags %}
          <div class="content-formatted">
            <svg class="ico-tags" width="24px" height="24px" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path d="M23.3,13.7C21.7,12,9.6,0,9.6,0H0v9.6l13.7,13.7c0,0,1.6,1.6,3.2,0l6.4-6.4 C23.3,16.9,24.9,15.3,23.3,13.7 M6.4,6.4c-0.9,0.9-2.3,0.9-3.2,0c-0.9-0.9-0.9-2.3,0-3.2 c0.9-0.9,2.3-0.9,3.2,0C7.3,4.1,7.3,5.5,6.4,6.4"></path>
            </svg>
            <h2>{{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.</h2>
          </div>
        {% endif %}

        <section class="blog">

          {% comment %}TODO: Replace URL when this feature is added{% endcomment %}
          {% if editmode %}
            <a class="post-add-link post" href="{{ page.path }}?new">
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
          {% endif %}

          {% for article in articles %}
            {% include "post-box" %}
          {% endfor %}
        </section>
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" %}
  {% if editmode %}<script>site.initBlogPageEditmode();</script>{% endif %}
</body>
</html>
