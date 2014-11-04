<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "bg-picker-variables" %}
</head>


<body class="blog-page js-body js-bgpicker-body-image"{{ body_image_style }}>
  {% if body_color != '' or editmode %}<div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>{% endif %}

  <div class="container">
    {% include "header" %}
    {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}

    <main class="content js-content" role="main">
      <div class="wrap">

        <div class="post-add-btn js-post-add-btn">{% addbutton %}</div>
        {% if tags %}<div class="content-formatted"><h2>{% if tags == empty %}{{ "no_posts_tagged" | lc }}{% else %}{{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.{% endif %}</h2></div>{% endif %}

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
  {% include "bg-picker" %}
  {% if editmode %}<script>site.initBlogPageEditmode();</script>{% endif %}
</body>
</html>
