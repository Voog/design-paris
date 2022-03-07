<!DOCTYPE html>
{%- assign product_page = true -%}
{%- include "template-settings" -%}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "edicy-tools-variables" %}
    {% include "html-head" %}
    {% include "edicy-tools-styles" %}
  </head>

  <body class="common-page item-page product-page body-background-image js-body{% if fallback_state %} bgpicker-fallback{% endif %}{% if site.search.enabled %} search-enabled{% endif %}{% unless show_menu_btn or editmode %} menu-btn-hidden{% endunless %}">
    {%- if product.image == blank -%}
      {%- assign product_image_state = "without-image" -%}
    {%- else -%}
      {%- assign product_image_state = "with-image" -%}
    {%- endif -%}

    {%- capture bottom_content_html -%}
      {%- unless editmode -%}
        {%- content bind=product name="content" -%}
      {%- endunless -%}
    {%- endcapture -%}

    {%- assign bottom_content_size = bottom_content_html | strip | size -%}

    {%- capture gallery_content_html -%}
      {%- unless editmode -%}
        {%- content bind=product name="gallery" -%}
      {%- endunless -%}
    {%- endcapture -%}

    {%- assign gallery_content_size = gallery_content_html | strip | size -%}

    {% if body_bg_color != "" or editmode %}<div class="body-background-color js-body-background-color"></div>{% endif %}

    <div class="container js-container">
      {% include "header" %}
      {% if editmode %}<button class="vg-bg-picker-btn js-bgpicker-body-settings" {% unless body_bg_image == "" %}data-bg-image="{{ body_bg_image }}"{% endunless %} {% unless body_bg_image_sizes == "" %}data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}"{% endunless %} {% unless body_bg_color == nil or body_bg_color == "rgba(255,255,255,0)" %}data-bg-color="{{ body_bg_color }}"{% endunless %} {% unless body_bg_color_data == nil %}data-bg-color-data="{{ body_bg_color_data_str | escape }}"{% endunless %}></button>{% endif %}

      <main class="content product-content js-background-type {{ body_bg_type }}" role="main">
        <div class="wrap">
          {% include "menu-level-2" %}
          {% include "menu-breadcrumbs-sd" %}
          <div class="flex_row flex_row-2 mar_0-32-neg" data-search-indexing-allowed="true">
            <div class="flex_row-2--item-50">
              <div class="mar_0-32 p-rel js-product-page-image-wrap">

                <div class="content-illustrations">
                  <div class="content-item-box {{ product_image_state }} mar_b-32 js-content-item-box" data-item-type="page">
                    <div class="item-top product-image">
                      {%- if product.image != blank- %}
                        <div class="top-inner aspect-ratio-inner">
                          {%- assign image_class = "item-image not-cropped" -%}
                          {% image product.image target_width: "1280" class: image_class loading: "lazy" %}
                        </div>
                      {%- endif -%}
                    </div>
                  </div>
                  {%- if gallery_content_size > 0 or editmode -%}
                    <section class="content-formatted js-product-gallery mar_t-16" data-search-indexing-allowed="true">
                      {% content bind=product name="gallery" %}
                    </section>
                  {%- endif -%}
                </div>
              </div>
            </div>

            <div class="flex_row-2--item-50">
              <div class="mar_0-32 flex_col t-sticky js-product-content-right">
                <header class="content-header">
                  <div class="content-formatted content-item-title" data-search-indexing-allowed="true">
                    <h1>{%- editable product.name -%}</h1>
                  </div>
                </header>
                <div class="product-price">
                  {%- if product.price_max_with_tax != product.price_min_with_tax -%}
                    {{ product.price_min_with_tax | money_with_currency: product.currency -}}
                    <span class="product-price-divider">–</span>
                  {%- endif -%}
                  {{ product.price_max_with_tax | money_with_currency: product.currency -}}
                </div>
                <section class="content-formatted" data-search-indexing-allowed="true">
                  {%- if editmode or product.description != blank -%}
                    <div class="content-product-description">
                      {%- editable product.description -%}
                    </div>
                  {%- endif -%}

                  <div class="buy-btn-content js-buy-btn-content">
                    {% include "buy-button" %}
                  </div>
                  {% content bind=product %}
                </section>
              </div>
            </div>
          </div>
          {%- if bottom_content_size > 0 or editmode -%}
            <section
              class="content-product-wide content-formatted"
              data-search-indexing-allowed="true">
              {% content bind=product name="content" %}
            </section>
          {%- endif -%}
        </div>
      </main>

      {% include "footer" %}
    </div>

    {% include "site-signout" %}
    {% include "javascripts" %}
    {% include "edicy-tools" product_page: true %}

    <script>
      if (site) {
        site.handleProductPageContent();

        {%- if product and editmode -%}
          site.handleProductImageClick({{ product.id }});
        {% endif %}
      }
    </script>
  </body>
</html>
