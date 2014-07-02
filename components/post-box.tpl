<article class="post">
  <div class="post-position">
    <a class="post-top" href="{{ article.url }}">
      {% if article.data.post_image.url %}<div class="background-image" style="background-image: url('{{ article.data.post_image.url }}'); top: {{ page.data.image.top }}px; left: {{ page.data.image.left }}px;"></div>{% endif %}
      {% if article.data.post_color %}<div class="background-color" style="background-color: {{ article.data.post_color }};{% if article.data.image.url %} opacity: 0.5;{% endif %}"></div>{% endif %}
      <header class="post-header">
        <h2 class="post-title">{{ article.title }}</h2>
      </header>
    </a>
  </div>

  <div class="post-bottom">
    <section class="post-content">
      <div class="post-excerpt content-formatted">{{ article.excerpt }}</div>
    </section>
    <footer class="post-footer">
      <time class="post-date" datetime="{{ article.created_at | date : '%Y-%m-%d' }}">{{ article.created_at | format_date: 'long' }}</time>
    </footer>
  </div>
</article>
