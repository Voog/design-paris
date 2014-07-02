{% if site.search.enabled %}
  <div class="search js-search js-modal-overlay">
    <div class="search-inner js-modal">
      <form id="search" class="search-form js-search-form" method="get" action="#">
        <input id="onpage_search" class="search-input js-search-input js-input-dynamic" type="text" name="">
        <input class="search-submit js-search-submit" type="submit" value="" name="">
      </form>

      <div class="voog-search-modal">
        <div class="voog-search-modal-inner js-voog-search-modal-inner"></div>
      </div>
    </div>
  </div>
{% endif %}
