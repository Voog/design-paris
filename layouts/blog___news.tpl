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
      <div class="article-listing top-line cfx js-article-boxes-wrapper">
        {% if editmode %}
          <div class="add-article-wrapper">{% addbutton class="add-article" %}</div>
        {% endif %}
        
      </div>
      <div id="loader-wrap"></div>
      
    </div><!-- .content-center-wrapper -->
  </div><!-- .main-content -->
  
  {% include "Footer" %}
  {% include "JS" %} 
  
  <script type="text/html" id="article-box-template">
    <div class="article-box">
      <div class="image-cropper">
          <div class="title">[[title]]</div>
        </div>
      <div class="date">[[date]]</div>
    </div>
  </script>
  
  <script type="text/javascript">
    initBlogPage();
  </script>
</body>
</html>