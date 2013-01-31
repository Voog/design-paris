{% comment %}Draws submenu block with active firstlevel page if the page has children or in editmode for adding children{% endcomment %}
{% for level1 in site.menuitems_with_hidden %}
  {% if level1.selected? %}
  
    {% if level1.visible_children.size > 0 or editmode %}
      <ul class="second-menu">
        <li{% if level1.current? %} class="active"{% endif %}>
          <a href="{{level1.url}}"{% if level1.current? %} class="active"{% endif %} {% unless level1.translated? %} class="fci-editor-menuadd"{% endunless %}>{{ level1.title }}</a>
        </li>
    {% endif %}
    
    {% for item in level1.visible_children %}
      <li{% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="untranslated"{% endunless %}>
        <a href="{{item.url}}"{% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="fci-editor-menuadd"{% endunless %}>{{item.title}}</a>
      </li>
    {% endfor %}
    
    {% if editmode %}
      {% if level1.hidden_children.size > 0 %}
        <li>{% menubtn level1.hidden_children %}</li>
      {% endif %}
      <li>{% menuadd parent="level1" %}</li>
    {% endif %}
    
    {% if level1.visible_children.size > 0 or editmode %}
      </ul>
    {% endif %}
    
  {% endif %}
{% endfor %}