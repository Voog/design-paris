{% comment %}IE SETTINGS{% endcomment %}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{% comment %}META INFO{% endcomment %}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

{% comment %}FAV ICON{% endcomment %}
{% if site.has_favicon? %}
  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/ico">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% endif %}
{% comment %}TODO: Add functionality after the CMS is going to support it{% endcomment %}
{% if site.data.touch_icon %}<link rel="apple-touch-icon" href="{{ site.data.touch_icon }}">{% endif %}

{% comment %}STYLESHEETS{% endcomment %}
{% stylesheet_link "main.min.css" %}
{% if editmode %}
  {% stylesheet_link "editmode.min.css" %}
  <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">
{% endif %}

{% comment %}Google fonts for Design Editor{% endcomment %}
<link href="https://fonts.googleapis.com/css?family=Anonymous+Pro:400,400i,700,700i|Arvo:400,400i,700,700i|Cousine:400,400i,700,700i|Crimson+Text:400,400i,700,700i|Fira+Sans:400,400i,700,700i|Lato:400,400i,700,700i|Lora:400,400i,700,700i|Montserrat:400,400i,700,700i|Noto+Serif:400,400i,700,700i|Open+Sans:400,400i,700,700i|PT+Sans:400,400i,700,700i|PT+Serif:400,400i,700,700i|Playfair+Display:400,400i,700,700i|Raleway:400,400i,700,700i|Roboto+Mono:400,400i,700,700i|Roboto+Slab:400,700|Roboto:400,400i,700,700i|Source+Sans+Pro:400,400i,700,700i|Ubuntu+Mono:400,400i,700,700i|Ubuntu:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,hebrew,latin-ext,vietnamese" rel="stylesheet">

{% customstyle %}
  {% include "template-cs-main-styles" %}
  {% include "template-cs-header" %}

  {% if front_page %}
    {% include "template-cs-headings-front" %}
  {% else %}
    {% include "template-cs-headings" %}
  {% endif %}

  {% if front_page or blog_listing_page %}
    {% include "template-cs-blog-list" %}
  {% endif %}

  {% include "template-cs-product-list" %}
  {% include "template-cs-content" %}
  {% include "template-cs-button" %}
  {% include "template-cs-table" %}

  {% if blog_article_page %}
    {% include "template-cs-form-blog" %}
  {% else %}
    {% include "template-cs-form" %}
  {% endif %}

  {% include "template-cs-footer" %}

  {% include "template-cs-style-rules" %}
{% endcustomstyle %}

{% comment %}MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC{% endcomment %}
<script src="{{ javascripts_path }}/modernizr-custom.min.js"></script>

{% comment %}SITE TITLE{% endcomment %}
<title>{% title %}</title>

{% comment %}MISC{% endcomment %}
{% include "template-meta" %}

{% comment %}BREADCRUMBS{% endcomment %}
{% sd_breadcrumbs %}

{% comment %}MISCELLANEOUS{% endcomment %}
{% if blog %}{{ blog.rss_link }}{% endif %}
{{ site.stats_header }}
