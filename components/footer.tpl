<footer class="footer js-background-type {{ body_bg_type }}">
  <div class="wrap">
    <div class="horizontal-line"></div>
    <div class="footer-inner">
      <div class="footer-left content-formatted">{% xcontent name="footer" %}</div>
      <div class="footer-right content-formatted">
        <div class="voog-reference">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
      </div>
    </div>
  </div>
</footer>
