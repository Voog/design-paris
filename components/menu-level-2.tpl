{% for item in site.menuitems %}
  {% if item.selected? and item.children? or editmode %}
    <section class="content-topbar">
      <nav class="menu-sub">
        <ul class="menu">
          {% if editmode or item.children? %}
            {% for subitem in item.visible_children %}
              {% if subitem.layout_title != product_layout and subitem.layout_title != product_list_layout %}
                <li class="menu-item"><a class="menu-link{% if subitem.selected? %} active{% endif %}{% unless subitem.translated? %} untranslated fci-editor-menuadd{% endunless %}" href="{{ subitem.url }}">{{ subitem.title }}</a></li>
              {% endif %}
            {% endfor %}
          {% endif %}

          {% if item.hidden_children.size > 0 %}<li>{% menubtn item.hidden_children %}</li>{% endif %}
          {% if editmode %}<li class="edit-btn">{% menuadd parent="item" %}</li>{% endif %}
        </ul>
      </nav>
    </section>
  {% endif %}
{% endfor %}
