<footer class="footer js-background-type {{ body_bg_type }}">
  <div class="wrap">
    <div class="horizontal-line"></div>
    <div class="footer-inner">
      <div class="footer-left content-formatted">
        {%- assign footer_content_title = "footer" | lce -%}
        {%- assign footer_content_title_tooltip = "content_tooltip_all_pages_same_language" | lce -%}
        {% xcontent name="footer" title=footer_content_title title_tooltip=footer_content_title_tooltip %}
      </div>
      <div class="footer-right">
        <div class="voog-reference">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
      </div>
    </div>
  </div>
</footer>
