<!DOCTYPE html>
{% include "blog-article-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_article_page = true %}
  {% include 'edicy-tools-variables' with 'article' %}
  {% include "blog-settings-variables" %}
  {% include 'html-head' %}
  {% include 'edicy-tools-styles' with 'article' %}
</head>

<body class="post-page body-background-image js-body{% if site.search.enabled %} search-enabled{% endif %}{% unless show_menu_btn or editmode %} menu-btn-hidden{% endunless %}">
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
                {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

                {% if article_year == current_year %}
                  {% assign article_date_format = "long_without_year" %}
                {% else %}
                  {% assign article_date_format = "long" %}
                {% endif %}

                <time class="post-date{% if show_article_date == false %} hide-article-date{% endif %}" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
                <span class="date-separator{% if show_article_date == false %} hide-separator{% endif %}"> – </span>
                <span class="post-author{% if show_article_author == false %} hide-article-author{% endif %}" data-search-indexing-allowed="true">{{ article.author.name }}</span>
                {% if editmode %}
                  {% include "article-settings-editor" %}
                {% endif %}
              </div>
            </header>

            <div class="post-content" data-search-indexing-allowed="true">
              <div class="post-excerpt content-formatted" {{ edy_intro_edit_text }}>{% editable article.excerpt %}</div>
              <div class="post-body content-formatted">{% editable article.body %}</div>
              <div class="post-body content-formatted">{% content name="additional_body" bind="Article" %}</div>
            </div>

            {% include "tags-post" %}

            {% if article.older or article.newer %}
              <div class="post-nav">
                <div class="post-nav-inner">
                  {% if article.older %}
                    <a class="post-nav-link post-nav-link-older" href="{{ article.older.url }}">
                      <div class="post-nav-link-inner">
                        <div class="post-nav-direction">{{ "previous" | lc }}</div>
                        <div class="post-nav-title">{{ article.older.title }}</div>
                      </div>
                    </a>
                  {% endif %}

                  {% if article.newer %}
                    <a class="post-nav-link post-nav-link-newer" href="{{ article.newer.url }}">
                      <div class="post-nav-link-inner">
                        <div class="post-nav-direction">{{ "next" | lc }}</div>
                        <div class="post-nav-title">{{ article.newer.title }}</div>
                      </div>
                    </a>
                  {% endif %}
                </div>
              </div>
            {% endif %}

            <section class="comments{% if show_article_comments == false %} hide-article-comments{% endif %}">
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

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" with 'article' %}
</body>
</html>
