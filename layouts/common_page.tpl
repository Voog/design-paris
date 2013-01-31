<!DOCTYPE html>
<html>
<head>
  {% include "SiteHeader" %}
  {{ blog.rss_link }}
</head>
<body>
  {% include "Header" %}
  
  <div class="main-content main-division">
    <div class="content-center-wrapper">
      
      {% include "Mainmenu" %}
      {% include "Submenu" %}
      
      <div class="content-texts content-texts-wrapper cfx">
        {% content %}
      </div><!-- .content-texts -->
      
    </div><!-- .content-center-wrapper -->
  </div><!-- .main-content -->
  
  {% include "Footer" %}
  {% include "JS" %} 
</body>
</html>