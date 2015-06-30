<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include 'edicy-tools-variables' with 'article' %}
  {% include 'html-head' %}
  {% include 'edicy-tools-styles' with 'article' %}
</head>

<body class="post-page body-background-image js-body{% if site.search.enabled %} search-enabled{% endif %}">
  {% if body_bg_color != '' or editmode %}<div class="body-background-color js-body-background-color"></div>{% endif %}

  <div class="container js-container">
    {% include "header" %}
    {% if editmode %}<button class="vg-bg-picker-btn js-bgpicker-body-settings" {% unless body_bg_image == '' %}data-bg-image="{{ body_bg_image }}"{% endunless %} {% unless body_bg_image_sizes == '' %}data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}"{% endunless %} {% unless body_bg_color == nil or body_bg_color == 'rgba(255,255,255,0)' %}data-bg-color="{{ body_bg_color }}"{% endunless %} {% unless body_bg_color_data == nil %}data-bg-color-data="{{ body_bg_color_data_str | escape }}"{% endunless %}></button>{% endif %}

    <main class="content js-background-type {{ body_bg_type }}" role="main">
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
                <span class="post-author" data-search-indexing-allowed="true"> – {{ article.author.name }}</span>
              </div>
            </header>

            <div class="post-content" data-search-indexing-allowed="true">
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
  {% include "edicy-tools" with 'article' %}
</body>
</html>
