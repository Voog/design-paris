<div class="main-header main-division cfx">
  <div class="content-center-wrapper">
    
    <div class="right dont-wrap">
      {% include "Search" %}
      {% include "Langmenu" %}
    </div><!-- .right -->
    
    <div class="header-slogan">
      <h1 class="cfx">{% editable site.header %}</h1>
      {% content name="slogan" %}
    </div><!-- .header-slogan -->
    
  </div><!-- .content-center-wrapper -->
</div><!-- .main-header -->