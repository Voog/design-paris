<div class="main-footer main-division cfx">
  <div class="content-center-wrapper footer-inner top-line">
    <div class="right edicy-link">
      {% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}
    </div><!-- .right -->
    <div class="footer-content">{% xcontent name="footer" %}</div>
  </div><!-- .content-center-wrapper -->
</div><!-- .main-footer -->