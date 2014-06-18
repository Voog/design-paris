<script src="{{ javascripts_path }}/jquery.js?3"></script>
<script src="{{ javascripts_path }}/main.js?3"></script>
<script src="{{ javascripts_path }}/overthrow.js?3"></script>

{% if site.search.enabled %}
<script src="http://static.voog.com/libs/edicy-search/1.0.0/edicy-search.js?2"></script>
<script>
  var search = new VoogSearch($('.js-search-form').get(0), {
    per_page: 2,
    lang: '{{ page.language_code }}'
  });
</script>
{% endif %}

{% unless editmode %}{{ site.analytics }}{% endunless %}
