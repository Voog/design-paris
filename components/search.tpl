{% if site.search.enabled %}
  <div class="search js-search js-modal-overlay js-prevent-sideclick">
    <div class="search-inner js-modal">
      <form id="search" class="search-form js-search-form" method="get" action="#">
        <input id="onpage_search" class="search-input js-search-input js-input-dynamic" type="text" placeholder="{{ 'search_this_site' | lc }}">
        <button class="search-btn search-submit">
          <svg width="15px" height="16px" viewBox="0 0 15 16" xmlns="http://www.w3.org/2000/svg">
            <path d="M14.8, 13.2 C14.8, 13.75 14.7, 14.2 14.3, 14.5 C14, 14.9 13.6, 15 13.1, 15 C12.6, 15 12.2, 14.9 11.9, 14.5 C11.9, 14.5 8.9, 11.5 8.9, 11.5 C8, 12 7.1, 12.2 6.1, 12.2 C2.8, 12.2 0, 9.5 0,6.1 C0, 2.7 2.7, 0 6.1, 0 C9.5, 0 12.2, 2.7 12.2, 6.1 C12.2, 7.2 11.9, 8.2 11.4, 9.1 C11.4, 9.1 14.3, 12.1 14.3, 12.1 C14.7, 12.4 14.8, 12.8 14.8, 13.3 ZM6.1, 1.5 C3.5, 1.5 1.5, 3.5 1.5, 6.1 C1.5, 8.7 3.5, 10.7 6.1, 10.7 C8.7, 10.7 10.7, 8.7 10.7, 6.1 C10.7, 3.5 8.7, 1.5 6.1, 1.5 Z"></path>
          </svg>
        </button>
      </form>

      <div class="voog-search-modal">
        <div class="voog-search-modal-inner js-voog-search-modal-inner"></div>
      </div>
    </div>
  </div>
{% endif %}
