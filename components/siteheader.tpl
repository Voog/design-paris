<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<!-- Meta info -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="{{ page.keywords }}" />
<meta name="description" content="{{ page.description }}" />
<meta name="copyright" content="{{ site.copyright }}" />
<meta name="author" content="{{ site.author }}" />

<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Favicon -->
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="/favicon.ico" type="image/ico" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

<!-- Styles -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:700,700italic,400,400italic|Montserrat+Alternates:700,400&subset=cyrillic-ext,latin-ext,latin,cyrillic' rel='stylesheet' type='text/css' />

{% if site.search.enabled %}{% stylesheet_link "assets/site_search/3.0/style.css?1" static_host="true" %}{% endif %}
{% stylesheet_link "style.css?paris2" %}
{% if editmode %}{% stylesheet_link "assets/admin/editmode.css" static_host="true" %}{% endif %}
<!--[if lte IE 7]>
    {% stylesheet_link "ie7.css" %}
<![endif]-->

<title>{% if article %}{{ article.title }} | {{page.site_title}}{% else %}{{page.site_title}} | {{ page.title }}{% endif %}</title>