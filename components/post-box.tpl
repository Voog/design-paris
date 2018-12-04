<article class="post">
  <div class="post-position">
    <a class="post-top" href="{{ article.url }}">
      {% if article.data.post_image.url %}<div class="background-image" style="background-image: url('{{ article.data.post_image.url }}'); background-position: {{ article.data.post_image.left }}px {{ article.data.post_image.top }}px;"></div>{% endif %}
      <header class="post-header">
        <h2 class="post-title">{{ article.title }}</h2>
      </header>
    </a>
  </div>

  <div class="post-bottom">
    <footer class="post-footer">
      {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

      {% if article_year == current_year %}
        {% assign article_date_format = "long_without_year" %}
      {% else %}
        {% assign article_date_format = "long" %}
      {% endif %}

      <time class="post-date{% if show_article_date == false %} hide-article-date{% endif %}{% if article_data_date_defined != true %} site-data{% endif %}" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
    </footer>
  </div>
</article>
