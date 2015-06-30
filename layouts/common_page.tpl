<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include 'edicy-tools-variables' %}
  {% include 'html-head' %}
  {% include 'edicy-tools-styles' %}
</head>

<body class="common-page body-background-image js-body{% if fallback_state %} bgpicker-fallback{% endif %}{% if site.search.enabled %} search-enabled{% endif %}">
  {% if body_bg_color != '' or editmode %}<div class="body-background-color js-body-background-color"></div>{% endif %}

  <div class="container js-container">
    {% include "header" %}
    {% if editmode %}<button class="vg-bg-picker-btn js-bgpicker-body-settings" {% unless body_bg_image == '' %}data-bg-image="{{ body_bg_image }}"{% endunless %} {% unless body_bg_image_sizes == '' %}data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}"{% endunless %} {% unless body_bg_color == nil or body_bg_color == 'rgba(255,255,255,0)' %}data-bg-color="{{ body_bg_color }}"{% endunless %} {% unless body_bg_color_data == nil %}data-bg-color-data="{{ body_bg_color_data_str | escape }}"{% endunless %}></button>{% endif %}

    <main class="content js-background-type {{ body_bg_type }}" role="main">
      <div class="wrap">
        {% include "menu-level-2" %}
        <section class="wrap-inner content-formatted" data-search-indexing-allowed="true">{% content %}</section>
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" %}
</body>
</html>
