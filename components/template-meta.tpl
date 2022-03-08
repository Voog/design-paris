{% comment %}MISC{% endcomment %}
{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}

{%- if article -%}
  {%- assign og_obj = article -%}
{%- elsif product -%}
  {%- assign og_obj = product -%}
{%- else -%}
  {%- assign og_obj = page -%}
{%- endif -%}

<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{{ og_obj.url | remove_first:'/' }}">
<meta property="og:title" content="{% title %}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% comment %}Open Graph image{% endcomment %}
{% if article %}
  {% if article.image == nil %}
    {% if article.data.post_image != blank %}
      {% assign og_image = article.data.post_image %}
    {% elsif fallback_body_image != blank and body_bg_image_sizes == nil %}
      {% assign og_image = fallback_body_image %}
    {% elsif body_bg_image_sizes != blank %}
      {% for size in body_bg_image_sizes reversed %}
        {% if size.width <= 1280 %}
          {% assign og_image = size %}
        {% else %}
          {% break %}
        {% endif %}
      {% endfor %}
    {% endif %}
  {% else %}
    {% assign og_image = article.image.for-width-1200 %}
  {% endif %}
{% else %}
  {% if og_obj.image == nil %}
    {% if fallback_body_image != blank and body_bg_image_sizes == nil %}
      {% assign og_image = fallback_body_image %}
    {% elsif body_bg_image_sizes != blank %}
      {% for size in body_bg_image_sizes reversed %}
        {% if size.width <= 1280 %}
          {% assign og_image = size %}
        {% else %}
          {% break %}
        {% endif %}
      {% endfor %}
    {% endif %}
  {% else %}
    {% assign og_image = og_obj.image.for-width-1200 %}
  {% endif %}
{% endif %}

{% if og_image %}
  {% comment %}"http:" and "https:" strings are removed and readded to ensure that older bg-picker images will have protocol.{% endcomment %}
  {% if og_image.url %}<meta property="og:image" content="{{ og_image.url | replace_first: "http:", "" | replace_first: "https:", "" | prepend: "https:" }}">{% endif %}
  {% if og_image.content_type %}<meta property="og:image:type" content="{{ og_image.content_type }}">{% endif %}
  {% if og_image.width %}<meta property="og:image:width" content="{{ og_image.width }}">{% endif %}
  {% if og_image.height %}<meta property="og:image:height" content="{{ og_image.height }}">{% endif %}
{% endif %}

{% comment %}Open Graph description{% endcomment %}
{%- if og_obj.description != blank -%}
  <meta property="og:description" content="{{ og_obj.description | strip_html | escape_once }}">
  <meta name="description" content="{{ og_obj.description | strip_html | escape_once }}">
{%- endif -%}

{% comment %}SEO pagination for blog articles.{% endcomment %}
{% if article %}
  {% if article.older %}
    <link rel="prev" href="{{ article.older.url }}">
  {% endif %}

  {% if article.newer %}
    <link rel="next" href="{{ article.newer.url }}">
  {% endif %}
{% endif %}
