<nav class="menu-tags">
  {% if editmode %}
    {% editable article.tags %}
  {% else %}
    {% if site.has_language_tags? %}
      <ul class="menu">
        <li><a href="/{{ site.blogs.first.page.path }}">{% case page.language_code %}{% when 'et' %}Kõik teemad{% else %}All topics{% endcase %}</a></li>
        {% for tag in article.tags %}
          <li><a href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}</li>
        {% endfor %}
      </ul>
    {% endif %}
  {% endif %}
</nav>
