<!DOCTYPE html>
<html>
<head>
  {% include "SiteHeader" %}

</head>
<body>
  {% include "Header" %}
  
  <div class="main-content main-division">
    <div class="content-center-wrapper">
      
      {% include "Mainmenu" %}
      {% if site.has_articles? %}
        <div class="article-listing top-line cfx">
          {% for article in site.latest_4_articles %}
            {% include "Article box" %}
          {% endfor %}
        </div><!-- .image-listing -->
      {% endif %}
      
      <div class="texts-listing cfx">
        <div class="text-box top-line">
          {% content %}
        </div><!-- .text-box -->
        <div class="text-box top-line">
          {% content name="second-content" %}
        </div><!-- .text-box -->
      </div><!-- .texts-listing -->
      
    </div><!-- .content-center-wrapper -->
  </div><!-- .main-content -->
  
  {% include "Footer" %}
  {% include "JS" %}
  
  <script type="text/javascript">
    initArticleBoxes();
  </script>
  
</body>
</html>
