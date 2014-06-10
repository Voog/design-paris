<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ article.excerpt | strip_html | truncate: 120 }}">
  {% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
  {% unless article.data.fb_image == nil or article.data.fb_image == "" %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ article.data.fb_image }}">{% endunless %}{% comment %}<!-- TODO: Add image location data tag -->{% endcomment %}

  {% include 'bg-picker-variables' with 'article' %}

  {{ site.stats_header }}
</head>

<body class="post-page js-body js-bgpicker-body-image"{{ body_image_style }}>
  {% if body_color != '' or editmode %}<div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>{% endif %}

  <div class="container">
    {% include "header" %}
    {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}

    <main class="content" role="main">
      <div class="wrap">
        <section class="post">
          {% if editmode %}
            <aside class="post-cover">
              <div class="post-cover-inner js-post-cover-inner" data-image="{{ article.data.post_image.url }}" data-dimensions="{{ article.data.post_image.width }},{{ article.data.post_image.height }}" data-position="{{ article.data.post_image.top }},{{ article.data.post_image.left }}"></div>
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
  {% include "bg-picker" with 'article' %}
  <script src="{{ javascripts_path }}/autogrow.js"></script>
  <script>$('.form_field_textarea').autogrow();</script>
</body>
</html>
