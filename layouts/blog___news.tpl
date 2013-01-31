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
      <div class="article-listing top-line cfx">
        {% if editmode %}
          <div class="add-article-wrapper">{% addbutton class="add-article" %}</div>
        {% endif %}
        {% for article in articles %}
          {% if forloop.index < 17 %}
            {% include "Article box" %}
          {% else %}
            {% if forloop.index == 17 %}
              </div>
              <div class="article-more-listing">
              <h2>{{ "older_news" | lc }}</h2>
            {% endif %}
              {% include "Article row" %}
          {% endif %}
        {% endfor %}
        
      </div>
      
    </div><!-- .content-center-wrapper -->
  </div><!-- .main-content -->
  
  {% include "Footer" %}
  {% include "JS" %} 
</body>
</html>