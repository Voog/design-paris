{% capture dont_render %}
  <!-- Sets body color lightness class -->
  {% if page.data.body_lightness == nil or page.data.body_lightness <= 0.5 %}
    {% assign body_color_class = 'dark-background' %}
  {% else %}
    {% assign body_color_class = 'light-background' %}
  {% endif %}5

  <!-- Sets the body image and color variables -->
  {% if bg-picker-variables == "article" %}
    {% assign body_image = article.data.body_image %}
    {% assign body_color = article.data.body_color %}
  {% else %}
    {% assign body_image = page.data.body_image %}
    {% assign body_color = page.data.body_color %}
  {% endif %}

  <!-- Sets the body background image value -->
  {% if body_image == nil %}
    {% assign body_image = images_path | append: '/body-bg.jpg' %}
  {% endif %}

  <!-- Sets the body background color -->
  {% if body_color == nil %}
    {% assign body_color = '' %}
  {% endif %}

  <!-- Builds style tag for background image -->
  {% assign body_image_style = ' style="background-image: ' %}
  {% if body_image == '' %}
    {% assign body_image_style = body_image_style | append: 'none' %}
  {% else %}
    {% assign body_image_style = body_image_style | append: "url('" | append: body_image | append: "')" %}
  {% endif %}
  {% assign body_image_style = body_image_style | append: ';"' %}

  <!-- Builds style tag for background color -->
  {% assign body_color_style = ' style="background-color: ' %}
  {% if body_color == '' %}
    {% assign body_color_style = body_color_style | append: 'none' %}
  {% else %}
    {% assign body_color_style = body_color_style | append: body_color %}
  {% endif %}
  {% assign body_color_style = body_color_style | append: ';"' %}
{% endcapture %}
