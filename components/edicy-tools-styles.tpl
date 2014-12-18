<style>
  {% if fallback_body_image != nil and body_bg.image == nil %}
    .body-background-image {
      background-image: url("{{ fallback_body_image }}");
    }
  {% else %}
    {% if body_bg.image != nil %}
      {% for image_size in body_bg_image_sizes %}
        {% if forloop.first %}
          .body-background-image {
            background-image: url("{{ image_size.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ image_size.width }}px) and (max-height: {{ image_size.height }}px) {
            .body-background-image {
              background-image: url("{{ image_size.url }}");
            }
          }
        {% endif %}
      {% endfor %}

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

  {% if fallback_body_image != nil and body_bg.image == nil %}
    .body-background-color {
      background-color: {{ fallback_body_color }};
    }
  {% else %}
    {% if body_bg.color != nil %}
      .body-background-color {
        background-color: {{ body_bg_color }};
      }
    {% endif %}
  {% endif %}
</style>
