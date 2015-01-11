<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="{{ site.static_asset_host }}/libs/picturefill/latest/picturefill.min.js"></script>
{% comment %} Configure site search if enabled from settings {% endcomment %}
{% if site.search.enabled %}
  <script type="text/javascript">
      var edys_site_search_options = {
          texts: { noresults: "{{ "search_noresults"|lc }}" },
          default_stylesheet_enabled: false
      };
  </script>
  <script type="text/javascript" src="{{ site.static_asset_host }}/assets/site_search/3.0/site_search.js"></script>
{% endif %}
<script type="text/javascript">
    var page_id = {{ page.id }};
</script>
<script type="text/javascript" src="{{ javascripts_path }}/application.js?2"></script>
{% unless editmode %}{{ site.analytics }}{% endunless %}