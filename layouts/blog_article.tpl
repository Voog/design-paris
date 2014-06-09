<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}

  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ page.description }}">
  <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}"><!-- TODO: Add image location data tag -->
</head>

<body class="post-page js-bgpicker-body-image"{% if site.data.body_image %} style="background-image: url('{{ site.data.body_image}}');"{% endif %}>
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ site.data.body_image }}" data-bg-color="{{ site.data.body_color }}"></button>{% endif %}
  <div class="background-color js-bgpicker-body-color"{% if site.data.body_color %} style="background-color: {{ site.data.body_color }};{% if site.data.body_image %} opacity: 0.5;{% endif %}"{% endif %}></div>

  <div class="container">
    {% include "header" %}

    <main class="content" role="main">
      <div class="wrap">
        <section class="post">
          {% if editmode %}
            <aside class="post-cover">
              <div class="post-cover-inner js-post-cover-inner" data-image="{{ article.data.image.url }}" data-dimensions="{{ article.data.image.width }},{{ article.data.image.height }}" data-position="{{ article.data.image.top }},{{ article.data.image.left }}"></div>
            </aside>
          {% endif %}

          <article class="post-inner">
            <header class="post-header">
              <h1 class="post-title">{% editable article.title %}</h1>
              <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%b %d, %Y" }}</time>
            </header>

            <div class="post-content">
              <div class="post-excerpt content-formatted">{% editable article.excerpt %}</div>
              <div class="post-body content-formatted">{% editable article.body %}</div>
            </div>

            {% include "tags-post" %}

            <section class="comments">
              {% include "comment-form" %}

              {% if article.comments_count > 0 %}
                <h2 class="comments-title">{{ "comments_for_count" | lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h2>

                <section class="comments-messages">
                  {% for comment in article.comments %}
                    <div class="comment-message">
                      <span class="comment-author">{{ comment.author }}</span>
                      <span class="comment-separator">—</span>
                      <span class="comment-body">{{ comment.body_html }}</span>
                      <span class="comment-date">{{ comment.created_at | date : "%b %d, %Y" }}</span>
                    </div>
                  {% endfor %}
                </section>
              {% endif %}
            </section>
          </article>
        </section>
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}
  <script src="{{ javascripts_path }}/autogrow.js"></script>
  <script>$('.form_field_textarea').autogrow();</script>

  {% unless article.new_record? %}
    {% editorjsblock %}
    <script src='/assets/admin/tools/0.1.2/edicy-tools.js'></script>
    <script>
      (function($) {
        var articleData = new Edicy.CustomData({
          type: "article",
          id: {{ article.id }}
        });

        var pictureDropArea = new Edicy.ImgDropArea($('.js-post-cover-inner'), {
          positionable: true,
          change: function(data) {
            articleData.set({
              'image': data
            });
          }
        });
      })(Edicy.jQuery);
    </script>
    {% endeditorjsblock %}
  {% endunless %}
</body>
</html>
