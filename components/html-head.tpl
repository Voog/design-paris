<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="{{ page.keywords }}">
<meta name="description" content="{{ page.description }}">

<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="{{ images_path }}/{{ page.data.touchicon }}"> <!-- TODO: Add image location data tag -->

<script src="{{ javascripts_path }}/modernizr.js?3"></script>

<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic%7COpen+Sans:400italic,700italic,400,700">
{% stylesheet_link "main.css?3" %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.css?3" %}<![endif]-->
<link rel="stylesheet" href="/assets/admin/tools/0.1.3/edicy-tools.css?3">

{% comment %}<!-- SITE TITLE -->{% endcomment %}
{% capture page_title %}{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}{% endcapture %}
<title>{{ page_title }}</title>

{% comment %}<!-- FACEBOOK OPENGRAPH -->{% endcomment %}
<!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
{% comment %}<!-- TODO: Add admin and image editing support after the CMS is going to support it -->{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% if article %}
  {% if article.data.fb_image %}
    <meta property="og:image" content="{{ article.data.fb_image }}">
  {% elsif page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% endif %}
  <meta property="og:description" content="{{ article.excerpt | strip_html | truncate: 200 }}">
  <meta name="description" content="{{ article.excerpt | strip_html | truncate: 200 }}">
{% else %}
  {% if page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% endif %}
  {% unless page.description == nil or page.description == "" %}
    <meta property="og:description" content="{{ page.description }}">
    <meta name="description" content="{{ page.description }}">
  {% endunless %}
{% endif %}
