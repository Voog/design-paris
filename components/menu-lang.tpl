<ul class="menu">
  {% for language in site.languages %}
    <li class="menu-item"><a class="menu-link{% if language.selected? %} active{% endif %}" href="{{ language.url }}">{{ language.title }}</a></li>
  {% endfor %}
  {% if editmode %}<li class="edit-btn" {{ edy_intro_add_lang }}>{% languageadd %}</li>{% endif %}
</ul>
