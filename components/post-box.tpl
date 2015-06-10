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
      <time class="post-date" datetime="{{ article.created_at | date : '%Y-%m-%d' }}">{{ article.created_at | format_date: 'long' }}</time>
    </footer>
  </div>
</article>
