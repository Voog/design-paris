<style>
  {% comment %}/* Body background image */{% endcomment %}
  {% if fallback_body_image != nil and body_bg.image == nil %}
    .body-background-image {
      background-image: url("{{ fallback_body_image }}");
    }
  {% else %}
    {% if body_bg.imageSizes != nil %}
      {% if body_bg.imageSizes == "" %}
        .body-background-image {
          background-image: none;
        }
      {% else %}
        {% for imageSize in body_bg.imageSizes %}
          {% if forloop.first %}
            .body-background-image {
              background-image: url("{{ imageSize.url }}");
            }
          {% else %}
            @media screen and (max-width: {{ imageSize.width }}px) {
              .body-background-image {
                background-image: url("{{ imageSize.url }}");
              }
            }
          {% endif %}
        {% endfor %}
      {% endif %}

    {% else %}
      {% assign bg_image_prefix = images_path | append: "/body-bg" %}

      .body-background-image {
        background-image: url("{{ bg_image_prefix }}.jpg");
      }

      @media screen and (max-width: 600px) and (max-height: 600px) {
        .body-background-image {
          background-image: url("{{ bg_image_prefix }}_block.jpg");
        }
      }
    {% endif %}
  {% endif %}

  {% comment %}/* Body Background color */{% endcomment %}
  {% if fallback_body_color != nil and body_bg.color == nil %}
    .body-background-color {
      background-color: {{ fallback_body_color }};
    }
  {% else %}
    .body-background-color {
      background-color: {{ body_bg_color }};
    }
  {% endif %}
</style>
