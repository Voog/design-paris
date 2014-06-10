<header class="header">
  <div class="wrap">
    <section class="header-left">
      <div class="header-title content-formatted">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode %}</a>{% endunless %}</div>
      <div class="header-slogan content-formatted">{% xcontent name="slogan" %}</div>

      <button class="menu-btn js-menu-btn">
        <span class="menu-stripe"></span>
        <span class="menu-stripe"></span>
        <span class="menu-stripe"></span>
      </button>
    </section>

    <section class="header-right">
      <div class="header-top">
      {% include "search" %}

        {% if editmode or site.has_many_languages? %}
          <nav class="menu-lang">
            {% include "menu-lang" %}
          </nav>
        {% endif %}
      </div>

      <div class="header-bottom">
        <nav class="menu-main js-menu-main js-menu-popover">
          {% include "menu-level-1" %}

          {% if editmode or site.has_many_languages? %}
            <div class="menu-lang">
              {% include "menu-lang" %}
            </div>
          {% endif %}
        </nav>
      </div>
    </section>
  </div>
</header>
