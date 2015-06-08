<header class="header">
  <div class="wrap js-header-wrap">
    <div class="header-left js-header-left">
      <div class="header-title content-formatted">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode %}</a>{% endunless %}</div>
      <div class="header-slogan content-formatted">{% xcontent name="slogan" %}</div>

      {% if site.search.enabled %}
        <button class="search-btn search-close-btn js-search-close-btn js-prevent-sideclick">
          <svg width="20px" height="20px" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M19.58, 3.539 C19.58,3.539 12.916,10.216 12.916,10.216 C12.916,10.216 19.456,16.769 19.456,16.769 C20.211,17.526 20.211,18.751 19.457,19.506 C18.702,20.262 17.48,20.263 16.725,19.506 C16.725,19.506 10.185,12.953 10.185,12.953 C10.185,12.953 3.532,19.619 3.532,19.619 C2.767,20.385 1.529,20.384 0.765,19.619 C0.001,18.853 0,17.612 0.765,16.846 C0.765,16.846 7.417,10.18 7.417,10.18 C7.417,10.18 0.868,3.618 0.868,3.618 C0.113,2.861 0.114,1.636 0.868,0.881 C1.622,0.125 2.845,0.124 3.6,0.881 C3.6,0.881 10.149,7.443 10.149,7.443 C10.149,7.443 16.812,0.766 16.812,0.766 C17.577,0 18.816,0 19.58,0.766 C20.344,1.531 20.345,2.773 19.58,3.539 Z"></path>
          </svg>
        </button>

        <button class="search-btn search-open-btn js-search-open-btn js-prevent-sideclick">
          <svg width="20px" height="20px" viewBox="0 0 15 16" xmlns="http://www.w3.org/2000/svg">
            <path d="M14.8, 13.2 C14.8, 13.75 14.7, 14.2 14.3, 14.5 C14, 14.9 13.6, 15 13.1, 15 C12.6, 15 12.2, 14.9 11.9, 14.5 C11.9, 14.5 8.9, 11.5 8.9, 11.5 C8, 12 7.1, 12.2 6.1, 12.2 C2.8, 12.2 0, 9.5 0,6.1 C0, 2.7 2.7, 0 6.1, 0 C9.5, 0 12.2, 2.7 12.2, 6.1 C12.2, 7.2 11.9, 8.2 11.4, 9.1 C11.4, 9.1 14.3, 12.1 14.3, 12.1 C14.7, 12.4 14.8, 12.8 14.8, 13.3 ZM6.1, 1.5 C3.5, 1.5 1.5, 3.5 1.5, 6.1 C1.5, 8.7 3.5, 10.7 6.1, 10.7 C8.7, 10.7 10.7, 8.7 10.7, 6.1 C10.7, 3.5 8.7, 1.5 6.1, 1.5 Z"></path>
          </svg>
        </button>
      {% endif %}

      <button class="menu-btn js-menu-btn js-prevent-sideclick">
        <span class="menu-stripe"></span>
        <span class="menu-stripe"></span>
        <span class="menu-stripe"></span>
      </button>
    </div>

    <div class="header-right js-header-right">
      <div class="header-top">
      {% include "search" %}

        {% if editmode or site.has_many_languages? %}
          <nav class="menu-lang">
            {% include "menu-lang" %}
          </nav>
        {% endif %}
      </div>

      <div class="header-bottom">
        <nav class="menu-main js-menu-main js-popover js-prevent-sideclick">
          {% include "menu-level-1" %}

          {% if editmode or site.has_many_languages? %}
            <div class="menu-lang">
              {% include "menu-lang" %}
            </div>
          {% endif %}
        </nav>
      </div>
    </div>
  </div>
</header>
