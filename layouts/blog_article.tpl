<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include 'bg-picker-variables' with 'article' %}
</head>

<body class="post-page js-body js-bgpicker-body-image"{{ body_image_style }}>
  {% if body_color != '' or editmode %}<div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>{% endif %}

  <div class="container">
    {% include "header" %}
    {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}

    <main class="content js-background-style {{ body_color_class }}" role="main">
      <div class="wrap">
        <section class="post">
          {% if editmode %}
            <aside class="post-cover">
              <div class="post-cover-inner js-post-cover-inner" data-image="{{ article.data.post_image.url }}" data-dimensions="{{ article.data.post_image.width }},{{ article.data.post_image.height }}" data-position="{{ article.data.post_image.top }},{{ article.data.post_image.left }}"></div>
            </aside>
          {% endif %}

          <article class="post-inner">
            <header class="post-header">
              <h1 class="post-title content-formatted">{% editable article.title %}</h1>
              <div class="post-header-bottom">
                <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | format_date: 'long' }}</time>
                <span class="post-author"> – {{ article.author.name }}</span>
              </div>
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
                    <div class="comment edy-site-blog-comment">
                      <span class="comment-author">{{ comment.author }}</span>
                      <span class="comment-separator">—</span>
                      <span class="comment-body">{{ comment.body_html }}</span>
                      <span class="comment-date">{{ comment.created_at | date : "%b %d, %Y" }}</span>
                      {% removebutton %}
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
</body>
</html>
