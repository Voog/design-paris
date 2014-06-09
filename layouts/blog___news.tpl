<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}

  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ page.description }}">
  <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}"><!-- TODO: Add image location data tag -->

  {{ blog.rss_link }}
</head>

<body class="blog-page js-bgpicker-body-image" {% if site.data.body_image %}style="background-image: url('{{ site.data.body_image}}');{% if site.data.body_color %} position: relative;{% endif %}"{% endif %}>
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ site.data.body_image }}" data-bg-color="{{ site.data.body_color }}"></button>{% endif %}
  <div class="background-color js-bgpicker-body-color"{% if site.data.body_color %} style="background-color: {{ site.data.body_color }};{% if site.data.body_image %} opacity: 0.5;{% endif %}"{% endif %}></div>

  <div class="container">
    {% include "header" %}

    <main class="content" role="main">
      <div class="wrap">

        <div class="post-add-btn js-post-add-btn">{% addbutton %}</div>
        {% if tags %}<div class="content-formatted"><h2>{% if tags == empty %}{{ "no_posts_tagged" | lc }}{% else %}{{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.{% endif %}</h2></div>{% endif %}

        <section class="blog">

          <!-- TODO: Replace URL when this feature is added -->
          {% if editmode %}
            <a class="post-add-link post-position js-post-add" href="#">
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

                  <h3 class="post-title">Add a new blog post</h3>
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
  <script>site.initBlogPageEditmode();</script>
</body>
</html>
