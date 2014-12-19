{% if article.tags != empty or editmode %}
  <div class="tags">
    <svg class="ico-tags" width="16px" height="16px" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
      <path d="M15.5,9.1C14.5,8,6.4,0,6.4,0H0v6.4l9.1,9.1c0,0,1.1,1.1,2.1,0l4.3-4.3 C15.5,11.2,16.6,10.2,15.5,9.1 M4.3,4.3c-0.6,0.6-1.6,0.6-2.1,0c-0.6-0.6-0.6-1.6,0-2.1 c0.6-0.6,1.6-0.6,2.1,0C4.9,2.7,4.9,3.7,4.3,4.3"></path>
    </svg>

    {% if editmode %}
      <div class="tags-editor">{% editable article.tags %}</div>
    {% else %}
      <nav class="menu-tags">
        <ul class="menu">
          {% for tag in article.tags %}
            <li class="menu-item"><a class="menu-link" href="{{ site.url }}{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
          {% endfor %}
        </ul>
      </nav>
    {% endif %}
  </div>
{% endif %}
