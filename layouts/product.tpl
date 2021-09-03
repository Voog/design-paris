<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include 'edicy-tools-variables' %}
    {% include 'html-head' %}
    {% include 'edicy-tools-styles' %}
  </head>

  <body class="common-page body-background-image js-body{% if fallback_state %} bgpicker-fallback{% endif %}{% if site.search.enabled %} search-enabled{% endif %}{% unless show_menu_btn or editmode %} menu-btn-hidden{% endunless %}">
    {% if body_bg_color != '' or editmode %}<div class="body-background-color js-body-background-color"></div>{% endif %}

    <div class="container js-container">
      {% include "header" %}
      {% if editmode %}<button class="vg-bg-picker-btn js-bgpicker-body-settings" {% unless body_bg_image == '' %}data-bg-image="{{ body_bg_image }}"{% endunless %} {% unless body_bg_image_sizes == '' %}data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}"{% endunless %} {% unless body_bg_color == nil or body_bg_color == 'rgba(255,255,255,0)' %}data-bg-color="{{ body_bg_color }}"{% endunless %} {% unless body_bg_color_data == nil %}data-bg-color-data="{{ body_bg_color_data_str | escape }}"{% endunless %}></button>{% endif %}

      <main class="content js-background-type {{ body_bg_type }}" role="main">
        <div class="wrap">
          {% include "menu-level-2" %}
          {% include 'menu-breadcrumbs' %}
          <div class="flex_row flex_row-2 reverse-col-tablet mar_0-32-neg" data-search-indexing-allowed="true">
            <div class="flex_row-2--item-50">
              <div class="mar_0-32 p-rel js-product-page-image-wrap">
                {%- load buy_button to "buy_button" q.content.parent_id=page.id q.content.parent_type="page"
                q.content.name="body" s="content.position" -%}
                {% if buy_button.product != blank %}
                  {%- assign buyButtonImage = buy_button.product.image -%}
                {% endif %}

                {%- if page.data.item_image != blank -%}
                  {%- assign productImage = page.data.item_image -%}
                  {%- assign isProductImage = false -%}
                {%- elsif buyButtonImage != blank -%}
                  {%- assign productImage = buyButtonImage -%}
                  {%- assign isProductImage = true -%}
                {%- else -%}
                  {%- assign productImage = page.image -%}
                  {%- assign isProductImage = false -%}
                {%- endif -%}

                {%- if productImage != blank or editmode -%}
                  <div class="js-product-page-image mar_b-32">
                    {% include 'content-item', _isProductImage: isProductImage, _imageData: productImage, _entityData:
                    page, _itemType: 'page', _id: page.id, _targetWidth: '1280' %}
                  </div>
                {%- endif -%}
              </div>
              <section class="content-body content-formatted mar_0-32" data-search-indexing-allowed="true">
                {% content name="gallery" %}
              </section>
            </div>

            <div class="flex_row-2--item-50">
              <div class="mar_0-32 flex_col t-sticky">
                <section class="content-body content-formatted js-buy-btn-content"
                  data-search-indexing-allowed="true">
                  {% contentblock %}{{ "write_product_description_here" | lc: editor_locale }}{% endcontentblock %}
                </section>
              </div>
            </div>
          </div>
        </div>
      </main>

      {% include "footer" %}
    </div>

    {% include "site-signout" %}
    {% include "javascripts" %}
    {% include "edicy-tools" %}
  </body>
</html>
