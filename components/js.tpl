<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

{% comment %} Configure site search if enabled from settings {% endcomment %}
{% if site.search.enabled %}
  <script type="text/javascript">
      var edys_site_search_options = {
          texts: { noresults: "{{ "search_noresults"|lc }}" },
          default_stylesheet_enabled: false
      };
  </script>
  <script type="text/javascript" src="http://static.edicy.com/assets/site_search/3.0/site_search.js?1"></script>
{% endif %}

<script type="text/javascript" src="{{ javascripts_path }}/application.js"></script>
{% unless editmode %}{{ site.analytics }}{% endunless %}