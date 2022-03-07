body {
  font-family: var(--main-font-family);
}

.dark-background {
  color: var(--third-color);
}
.dark-background .content-formatted,
.dark-background .content-formatted h1,
.dark-background .content-formatted h2,
.dark-background .content-formatted h3,
.dark-background .content-formatted h4,
.dark-background .content-formatted h5,
.dark-background .content-formatted h6,
.dark-background .content-formatted a,
.dark-background .content-formatted p,
.dark-background .content-formatted ul,
.dark-background .content-formatted ol,
.dark-background .content-formatted dl,
.dark-background .content-formatted pre,
.dark-background .content-formatted table {
  color: var(--third-color);
}
.dark-background .header-title a,
.dark-background .header-title a:hover {
  color: var(--third-color);
}
.dark-background .menu li a {
  color: var(--third-color);
}
.dark-background .menu li .active {
  color: var(--third-color);
}
.dark-background .menu li.selected a {
  color: var(--third-color);
}
.dark-background .lang-title {
  color: var(--third-color);
}
.dark-background .lang-menu.lang-menu-bilingual .lang-title a {
  color: var(--third-color);
}
.dark-background .lang-menu.lang-menu-bilingual .lang-title a.is-active, .dark-background .lang-menu.lang-menu-bilingual .lang-title a:hover {
  color: var(--third-color);
}
.dark-background .lang-menu.lang-menu-bilingual .lang-title a.selected {
  color: var(--third-color);
}

.light-background {
  color: var(--secondary-color);
}
.light-background .content-formatted,
.light-background .content-formatted h1,
.light-background .content-formatted h2,
.light-background .content-formatted h3,
.light-background .content-formatted h4,
.light-background .content-formatted h5,
.light-background .content-formatted h6,
.light-background .content-formatted a,
.light-background .content-formatted p,
.light-background .content-formatted ul,
.light-background .content-formatted ol,
.light-background .content-formatted dl,
.light-background .content-formatted pre,
.light-background .content-formatted table,
.light-background .content-formatted .custom-btn:not(.custom-btn-disabled) {
  color: var(--secondary-color);
}
.light-background .header-title a,
.light-background .header-title a:hover {
  color: var(--secondary-color);
}
.light-background .menu li a {
  color: var(--secondary-color);
}
.light-background .menu li.selected a {
  color: var(--secondary-color);
}
.light-background .lang-title {
  color: var(--secondary-color);
}
.light-background .lang-menu.lang-menu-bilingual .lang-title a {
  color: var(--secondary-color);
}
.light-background .lang-menu.lang-menu-bilingual .lang-title a.is-active, .light-background .lang-menu.lang-menu-bilingual .lang-title a:hover {
  color: var(--secondary-color);
}
.light-background .lang-menu.lang-menu-bilingual .lang-title a.selected {
  color: var(--secondary-color);
}

.blog .post .post-header .post-title {
  text-align: var(--blog-list-alignment);
  left: var(--blog-list-padding);
  right: var(--blog-list-padding);
  font-family: var(--font-main);
  font-size: var(--blog-list-headings-font-size);
  font-style: var(--blog-list-headings-font-style);
  font-weight: var(--blog-list-headings-font-weight);
  line-height: var(--blog-list-headings-line-height);
  -webkit-text-decoration: var(--blog-list-headings-text-decoration);
          text-decoration: var(--blog-list-headings-text-decoration);
  text-transform: var(--blog-list-headings-text-transform);
}
.dark-background .blog .post .post-header .post-title {
  color: var(--third-color);
}
.light-background .blog .post .post-header .post-title {
  color: var(--secondary-color);
}
@media screen and (min-width: 488px) {
  .blog .post .post-header {
    width: var(--blog-list-article-width);
    padding: calc(var(--blog-list-padding) - 5px) var(--blog-list-padding);
  }
}
.blog .post .post-footer {
  text-align: var(--blog-list-date-alignment);
}
.blog .post .post-footer .post-date {
  font-family: var(--font-main);
  font-size: var(--blog-list-date-font-size);
  font-style: var(--blog-list-date-font-style);
  font-weight: var(--blog-list-date-font-weight);
  -webkit-text-decoration: var(--blog-list-date-text-decoration);
          text-decoration: var(--blog-list-date-text-decoration);
  text-transform: var(--blog-list-date-text-transform);
}
@media screen and (min-width: 489px) {
  .blog .post-add-link {
    width: var(--blog-list-article-width);
  }
}

.menu-sub {
  background-color: var(--content-submenu-background-color);
}
.menu-sub .menu-link {
  font-size: var(--content-submenu-font-size);
  font-style: var(--content-submenu-font-style);
  font-weight: var(--content-submenu-font-weight);
  -webkit-text-decoration: var(--content-submenu-text-decoration);
          text-decoration: var(--content-submenu-text-decoration);
  text-transform: var(--content-submenu-text-transform);
}
.menu-sub .menu-link:hover {
  font-size: var(--content-submenu-font-size);
  font-style: var(--content-submenu-hover-font-style);
  font-weight: var(--content-submenu-hover-font-weight);
  -webkit-text-decoration: var(--content-submenu-hover-text-decoration);
          text-decoration: var(--content-submenu-hover-text-decoration);
  text-transform: var(--content-submenu-hover-text-transform);
}
.menu-sub .menu-link.active {
  font-size: var(--content-submenu-font-size);
  font-style: var(--content-submenu-active-font-style);
  font-weight: var(--content-submenu-active-font-weight);
  -webkit-text-decoration: var(--content-submenu-active-text-decoration);
          text-decoration: var(--content-submenu-active-text-decoration);
  text-transform: var(--content-submenu-active-text-transform);
}

@media screen and (min-width: 841px) {
  .menu-main .menu-link {
    font-size: var(--menu-main-font-size);
  }
}
.menu-lang .menu .menu-link,
.menu-main .menu-link {
  color: var(--menu-main-color);
  font-style: var(--menu-main-font-style);
  font-weight: var(--menu-main-font-weight);
  -webkit-text-decoration: var(--menu-main-text-decoration);
          text-decoration: var(--menu-main-text-decoration);
  text-transform: var(--menu-main-text-transform);
}
.menu-lang .menu .menu-link.active,
.menu-main .menu-link.active {
  color: var(--menu-main-active-color);
  font-style: var(--menu-main-active-font-style);
  font-weight: var(--menu-main-active-font-weight);
  -webkit-text-decoration: var(--menu-main-active-text-decoration);
          text-decoration: var(--menu-main-active-text-decoration);
  text-transform: var(--menu-main-active-text-transform);
}
.menu-lang .menu .menu-link.active:hover,
.menu-main .menu-link.active:hover {
  font-weight: var(--menu-main-active-font-weight);
}
.menu-lang .menu .menu-link:hover,
.menu-main .menu-link:hover {
  color: var(--menu-main-hover-color);
  font-style: var(--menu-main-hover-font-style);
  font-weight: var(--menu-main-hover-font-weight);
  -webkit-text-decoration: var(--menu-main-hover-text-decoration);
          text-decoration: var(--menu-main-hover-text-decoration);
  text-transform: var(--menu-main-hover-text-transform);
}

/* langmenu */
.lang-menu.lang-menu-bilingual .lang-title a.is-active {
  color: var(--secondary-color);
}
.lang-menu li a {
  color: var(--primary-color);
}
.dark-background .lang-menu a.lang-flag, .light-background .lang-menu a.lang-flag {
  color: var(--secondary-color);
}
.dark-background .lang-menu a.lang-flag:hover, .light-background .lang-menu a.lang-flag:hover {
  color: var(--secondary-color);
}

.lang-menu-btn .lang-title-inner:after {
  border-color: var(--secondary-color) transparent transparent transparent;
}
.dark-background .lang-menu-btn .lang-title-inner:after {
  border-color: var(--third-color) transparent transparent transparent;
}

@media screen and (min-width: 641px) {
  .search {
    border-color: var(--menu-main-color);
  }

  .search-input {
    color: var(--menu-main-color);
  }
  .search-input::-webkit-input-placeholder {
    opacity: 0.5;
    color: var(--menu-main-color);
  }
  .search-input:-moz-placeholder {
    opacity: 0.5;
    color: var(--menu-main-color);
  }
  .search-input::-moz-placeholder {
    opacity: 0.5;
    color: var(--menu-main-color);
  }
  .search-input:-ms-input-placeholder {
    opacity: 0.5;
    color: var(--menu-main-color);
  }

  .search-submit {
    color: var(--menu-main-color);
  }
  .search-submit svg {
    opacity: 0.5;
    fill: var(--menu-main-color);
  }
}
.footer.dark-background .voog-reference a {
  color: var(--third-color);
}
.footer.light-background .voog-reference a {
  color: var(--secondary-color);
}

.header {
  background-color: var(--header-background-color);
}

.content-formatted {
  font-size: var(--content-body-font-size);
  line-height: var(--content-body-line-height);
  color: var(--primary-color);
}
.content .content-formatted {
  text-align: var(--content-body-alignment);
}
.dark-background .content-formatted {
  color: var(--third-color);
}
.site-footer .dark-background .content-formatted {
  color: var(--third-color);
}
.content-formatted.footer-left {
  font-size: var(--footer-body-font-size);
  font-style: var(--footer-body-font-style);
  font-weight: var(--footer-body-font-weight);
  -webkit-text-decoration: var(--footer-body-text-decoration);
          text-decoration: var(--footer-body-text-decoration);
  text-transform: var(--footer-body-text-transform);
}
.content-formatted.footer-left a {
  font-weight: var(--footer-body-font-weight);
}
.header .wrap .header-left .content-formatted.header-title,
.header .wrap .header-left .content-formatted.header-title a,
.header .wrap .header-left .content-formatted.header-title a:hover {
  font-size: var(--header-body-font-size);
  color: var(--header-body-color);
}
.header .wrap .header-left .content-formatted.header-slogan,
.header .wrap .header-left .content-formatted.header-slogan a,
.header .wrap .header-left .content-formatted.header-slogan a:hover {
  color: var(--header-subheading-color);
  font-size: var(--header-subheading-font-size);
  font-family: var(--secondary-font-family);
  font-style: var(--header-subheading-font-style);
  font-weight: var(--header-subheading-font-weight);
  -webkit-text-decoration: var(--header-subheading-text-decoration);
          text-decoration: var(--header-subheading-text-decoration);
  text-transform: var(--header-subheading-text-transform);
  line-height: var(--header-subheading-line-height);
}
.header .wrap .header-left .content-formatted.header-title,
.header .wrap .header-left .content-formatted.header-title a,
.header .wrap .header-left .content-formatted.header-title a:hover {
  font-family: var(--secondary-font-family);
  font-style: var(--header-body-font-style);
  font-weight: var(--header-body-font-weight);
  -webkit-text-decoration: var(--header-body-text-decoration);
          text-decoration: var(--header-body-text-decoration);
  text-transform: var(--header-body-text-transform);
}
.dark-background .content-formatted h1,
.dark-background .content-formatted h2,
.dark-background .content-formatted h3,
.dark-background .content-formatted h4,
.dark-background .content-formatted h5,
.dark-background .content-formatted h6,
.dark-background .content-formatted p,
.dark-background .content-formatted ul,
.dark-background .content-formatted ol,
.dark-background .content-formatted pre,
.dark-background .content-formatted code,
.dark-background .content-formatted table {
  color: var(--third-color);
}
.content-formatted h1,
.content-formatted h2,
.content-formatted h3,
.content-formatted h4,
.content-formatted h5,
.content-formatted h6 {
  color: var(--secondary-color);
}
.content-formatted h1 a,
.content-formatted h2 a,
.content-formatted h3 a,
.content-formatted h4 a,
.content-formatted h5 a,
.content-formatted h6 a {
  color: var(--secondary-color);
}
.content-formatted p,
.content-formatted ul,
.content-formatted ol,
.content-formatted dl {
  font-size: var(--content-body-font-size);
}
.site-footer .content-formatted p,
.site-footer .content-formatted ul,
.site-footer .content-formatted ol,
.site-footer .content-formatted dl {
  color: var(--primary-color);
}
.site-footer .dark-background .content-formatted p,
.site-footer .dark-background .content-formatted ul,
.site-footer .dark-background .content-formatted ol,
.site-footer .dark-background .content-formatted dl {
  color: var(--third-color);
}
.content-formatted h1,
.content-formatted h1 a,
.content-formatted h1 a:hover {
  text-align: var(--headings-title-text-alignment);
  line-height: var(--headings-title-line-height);
  font-size: var(--headings-title-font-size);
  font-weight: var(--headings-title-font-weight);
  font-style: var(--headings-title-font-style);
  -webkit-text-decoration: var(--headings-title-text-decoration);
          text-decoration: var(--headings-title-text-decoration);
  text-transform: var(--headings-title-text-transform);
}
.content-formatted h2,
.content-formatted h2 a,
.content-formatted h2 a:hover {
  text-align: var(--headings-heading-text-alignment);
  line-height: var(--headings-heading-line-height);
  font-size: var(--headings-heading-font-size);
  font-weight: var(--headings-heading-font-weight);
  font-style: var(--headings-heading-font-style);
  -webkit-text-decoration: var(--headings-heading-text-decoration);
          text-decoration: var(--headings-heading-text-decoration);
  text-transform: var(--headings-heading-text-transform);
}
.content-formatted h3,
.content-formatted h3 a,
.content-formatted h3 a:hover,
.content-formatted h4,
.content-formatted h4 a,
.content-formatted h4 a:hover,
.content-formatted h5,
.content-formatted h5 a,
.content-formatted h5 a:hover,
.content-formatted h6,
.content-formatted h6 a,
.content-formatted h6 a:hover {
  text-align: var(--headings-subheading-text-alignment);
  line-height: var(--headings-subheading-line-height);
  font-size: var(--headings-subheading-font-size);
  font-weight: var(--headings-subheading-font-weight);
  font-style: var(--headings-subheading-font-style);
  -webkit-text-decoration: var(--headings-subheading-text-decoration);
          text-decoration: var(--headings-subheading-text-decoration);
  text-transform: var(--headings-subheading-text-transform);
}
.post-page .post .post-header .post-title,
.post-page .post .post-header .post-title a,
.post-page .post .post-header .post-title a:hover {
  text-align: var(--headings-title-text-alignment);
  line-height: var(--headings-title-line-height);
  font-size: var(--headings-title-font-size);
  font-weight: var(--headings-title-font-weight);
  font-style: var(--headings-title-font-style);
  -webkit-text-decoration: var(--headings-title-text-decoration);
          text-decoration: var(--headings-title-text-decoration);
  text-transform: var(--headings-title-text-transform);
}

.post-author {
  opacity: 0.6;
}
.dark-background .post-author {
  color: var(--third-color);
}
.light-background .post-author {
  color: var(--secondary-color);
}

.post-date {
  opacity: 0.6;
}
.dark-background .post-date {
  color: var(--third-color);
}
.light-background .post-date {
  color: var(--secondary-color);
}

.front-page .content-formatted h1,
.front-page .content-formatted h1 a,
.front-page .content-formatted h1 a:hover {
  text-align: var(--headings-front-title-text-alignment);
  line-height: var(--headings-front-title-line-height);
  font-size: var(--headings-front-title-font-size);
  font-weight: var(--headings-front-title-font-weight);
  font-style: var(--headings-front-title-font-style);
  -webkit-text-decoration: var(--headings-front-title-text-decoration);
          text-decoration: var(--headings-front-title-text-decoration);
  text-transform: var(--headings-front-title-text-transform);
}
.front-page .content-formatted h2,
.front-page .content-formatted h2 a,
.front-page .content-formatted h2 a:hover {
  text-align: var(--headings-front-heading-text-alignment);
  line-height: var(--headings-front-heading-line-height);
  font-size: var(--headings-front-heading-font-size);
  font-weight: var(--headings-front-heading-font-weight);
  font-style: var(--headings-front-heading-font-style);
  -webkit-text-decoration: var(--headings-front-heading-text-decoration);
          text-decoration: var(--headings-front-heading-text-decoration);
  text-transform: var(--headings-front-heading-text-transform);
}
.front-page .content-formatted h3,
.front-page .content-formatted h3 a,
.front-page .content-formatted h3 a:hover,
.front-page .content-formatted h4,
.front-page .content-formatted h4 a,
.front-page .content-formatted h4 a:hover,
.front-page .content-formatted h5,
.front-page .content-formatted h5 a,
.front-page .content-formatted h5 a:hover,
.front-page .content-formatted h6,
.front-page .content-formatted h6 a,
.front-page .content-formatted h6 a:hover {
  text-align: var(--headings-front-subheading-text-alignment);
  line-height: var(--headings-front-subheading-line-height);
  font-size: var(--headings-front-subheading-font-size);
  font-weight: var(--headings-front-subheading-font-weight);
  font-style: var(--headings-front-subheading-font-style);
  -webkit-text-decoration: var(--headings-front-subheading-text-decoration);
          text-decoration: var(--headings-front-subheading-text-decoration);
  text-transform: var(--headings-front-subheading-text-transform);
}
.content-formatted a {
  font-style: var(--content-link-font-style);
  font-weight: var(--content-link-font-weight);
  color: var(--secondary-color);
  -webkit-text-decoration: var(--content-link-text-decoration);
          text-decoration: var(--content-link-text-decoration);
  text-transform: var(--content-link-text-transform);
}
.content-formatted a:hover {
  font-style: var(--content-link-hover-font-style);
  font-weight: var(--content-link-hover-font-weight);
  -webkit-text-decoration: var(--content-link-hover-text-decoration);
          text-decoration: var(--content-link-hover-text-decoration);
  text-transform: var(--content-link-hover-text-transform);
}
.dark-background .content-formatted a {
  color: var(--third-color);
}
.content-formatted .form_submit input,
.content-formatted .custom-btn,
.content-formatted .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn {
  padding: var(--button-padding) calc(var(--button-padding) + 8px);
  font-size: var(--button-font-size);
  font-style: var(--button-font-style);
  font-weight: var(--button-font-weight);
  -webkit-text-decoration: var(--button-text-decoration);
          text-decoration: var(--button-text-decoration);
  text-transform: var(--button-text-transform);
}
.dark-background .content-formatted .form_submit input, .dark-background .content-formatted .form_submit input:hover,
.dark-background .content-formatted .custom-btn,
.dark-background .content-formatted .custom-btn:hover,
.dark-background .content-formatted .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn,
.dark-background .content-formatted .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn:hover {
  border-color: var(--third-color);
  color: var(--third-color);
}
.light-background .content-formatted .form_submit input, .light-background .content-formatted .form_submit input:hover,
.light-background .content-formatted .custom-btn,
.light-background .content-formatted .custom-btn:hover,
.light-background .content-formatted .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn,
.light-background .content-formatted .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn:hover {
  border-color: var(--secondary-color);
  color: var(--secondary-color);
}
.content-formatted table tr:first-child td, .dark-background .content-formatted table tr:first-child td, .light-background .content-formatted table tr:first-child td {
  border-top-style: var(--table-border-style);
}
.content-formatted table th, .content-formatted table td, .dark-background .content-formatted table th, .dark-background .content-formatted table td, .light-background .content-formatted table th, .light-background .content-formatted table td {
  padding: calc(var(--table-padding) - 4px) var(--table-padding);
  font-size: var(--table-font-size);
  border-bottom-style: var(--table-border-style);
  border-bottom-style: var(--table-border-style);
}
.content-formatted table tr:first-child td, .content-formatted table th, .content-formatted table td, .dark-background .content-formatted table tr:first-child td, .dark-background .content-formatted table th, .dark-background .content-formatted table td {
  border-color: var(--third-color);
}
.light-background .content-formatted table tr:first-child td, .light-background .content-formatted table th, .light-background .content-formatted table td {
  border-color: var(--secondary-color);
}
.content-formatted table th {
  color: var(--third-color);
  background-color: var(--secondary-color);
}
.contacts .content-formatted table tr td {
  color: var(--primary-color);
}

.content-formatted .form_field .form_field_label,
.content-formatted .form_field .edy-fe-label {
  font-size: var(--form-label-font-size);
}
.content-formatted .form_field_textfield,
.content-formatted .form_field_textarea,
.content-formatted label:not(.form_field_label) {
  font-style: var(--form-field-font-style);
  font-weight: var(--form-field-font-weight);
  font-size: var(--form-field-font-size);
  -webkit-text-decoration: var(--form-field-text-decoration);
          text-decoration: var(--form-field-text-decoration);
  text-transform: var(--form-field-text-transform);
}
.comments-title {
  font-size: var(--form-blog-title-font-size);
}

.comment-form .comment-form-label {
  font-size: var(--form-blog-label-font-size);
}

.comment-form .form_field_textarea, .comment-form .form_field_textfield {
  font-size: var(--form-blog-field-font-size);
}

.comment-form .comments-title, .comment-form .comment-form-label, .comment-form .form_field_textarea, .comment-form .form_field_textfield {
  font-style: var(--form-blog-field-font-style);
  font-weight: var(--form-blog-field-font-weight);
  -webkit-text-decoration: var(--form-blog-field-text-decoration);
          text-decoration: var(--form-blog-field-text-decoration);
  text-transform: var(--form-blog-field-text-transform);
}
.comment-form .comments-title::-webkit-input-placeholder, .comment-form .comment-form-label::-webkit-input-placeholder, .comment-form .form_field_textarea::-webkit-input-placeholder, .comment-form .form_field_textfield::-webkit-input-placeholder {
  opacity: 0.6;
  -webkit-text-decoration: var(--form-blog-field-text-decoration);
          text-decoration: var(--form-blog-field-text-decoration);
}
.comment-form .comments-title:-moz-placeholder, .comment-form .comment-form-label:-moz-placeholder, .comment-form .form_field_textarea:-moz-placeholder, .comment-form .form_field_textfield:-moz-placeholder {
  opacity: 0.6;
  text-decoration: var(--form-blog-field-text-decoration);
}
.comment-form .comments-title::-moz-placeholder, .comment-form .comment-form-label::-moz-placeholder, .comment-form .form_field_textarea::-moz-placeholder, .comment-form .form_field_textfield::-moz-placeholder {
  opacity: 0.6;
  text-decoration: var(--form-blog-field-text-decoration);
}
.comment-form .comments-title:-ms-input-placeholder, .comment-form .comment-form-label:-ms-input-placeholder, .comment-form .form_field_textarea:-ms-input-placeholder, .comment-form .form_field_textfield:-ms-input-placeholder {
  opacity: 0.6;
  text-decoration: var(--form-blog-field-text-decoration);
}
.dark-background .comment-form .comments-title, .dark-background .comment-form .comment-form-label, .dark-background .comment-form .form_field_textarea, .dark-background .comment-form .form_field_textfield {
  color: var(--third-color);
}
.dark-background .comment-form .comments-title::-webkit-input-placeholder, .dark-background .comment-form .comment-form-label::-webkit-input-placeholder, .dark-background .comment-form .form_field_textarea::-webkit-input-placeholder, .dark-background .comment-form .form_field_textfield::-webkit-input-placeholder {
  color: var(--third-color);
}
.dark-background .comment-form .comments-title:-moz-placeholder, .dark-background .comment-form .comment-form-label:-moz-placeholder, .dark-background .comment-form .form_field_textarea:-moz-placeholder, .dark-background .comment-form .form_field_textfield:-moz-placeholder {
  color: var(--third-color);
}
.dark-background .comment-form .comments-title::-moz-placeholder, .dark-background .comment-form .comment-form-label::-moz-placeholder, .dark-background .comment-form .form_field_textarea::-moz-placeholder, .dark-background .comment-form .form_field_textfield::-moz-placeholder {
  color: var(--third-color);
}
.dark-background .comment-form .comments-title:-ms-input-placeholder, .dark-background .comment-form .comment-form-label:-ms-input-placeholder, .dark-background .comment-form .form_field_textarea:-ms-input-placeholder, .dark-background .comment-form .form_field_textfield:-ms-input-placeholder {
  color: var(--third-color);
}
.light-background .comment-form .comments-title, .light-background .comment-form .comment-form-label, .light-background .comment-form .form_field_textarea, .light-background .comment-form .form_field_textfield {
  color: var(--secondary-color);
}
.light-background .comment-form .comments-title::-webkit-input-placeholder, .light-background .comment-form .comment-form-label::-webkit-input-placeholder, .light-background .comment-form .form_field_textarea::-webkit-input-placeholder, .light-background .comment-form .form_field_textfield::-webkit-input-placeholder {
  color: var(--secondary-color);
}
.light-background .comment-form .comments-title:-moz-placeholder, .light-background .comment-form .comment-form-label:-moz-placeholder, .light-background .comment-form .form_field_textarea:-moz-placeholder, .light-background .comment-form .form_field_textfield:-moz-placeholder {
  color: var(--secondary-color);
}
.light-background .comment-form .comments-title::-moz-placeholder, .light-background .comment-form .comment-form-label::-moz-placeholder, .light-background .comment-form .form_field_textarea::-moz-placeholder, .light-background .comment-form .form_field_textfield::-moz-placeholder {
  color: var(--secondary-color);
}
.light-background .comment-form .comments-title:-ms-input-placeholder, .light-background .comment-form .comment-form-label:-ms-input-placeholder, .light-background .comment-form .form_field_textarea:-ms-input-placeholder, .light-background .comment-form .form_field_textfield:-ms-input-placeholder {
  color: var(--secondary-color);
}

.dark-background .content-formatted .form_field_textfield,
.dark-background .content-formatted .form_field_textarea {
  color: var(--third-color);
}
.dark-background .content-formatted .form_field_textfield::-webkit-input-placeholder,
.dark-background .content-formatted .form_field_textarea::-webkit-input-placeholder {
  color: var(--third-color);
}
.dark-background .content-formatted .form_field_textfield::-moz-placeholder,
.dark-background .content-formatted .form_field_textarea::-moz-placeholder {
  color: var(--third-color);
}
.dark-background .content-formatted .form_field_textfield:-moz-placeholder,
.dark-background .content-formatted .form_field_textarea:-moz-placeholder {
  color: var(--third-color);
}
.dark-background .content-formatted .form_field_textfield:-ms-input-placeholder,
.dark-background .content-formatted .form_field_textarea:-ms-input-placeholder {
  color: var(--third-color);
}
.light-background .content-formatted .form_field_textfield,
.light-background .content-formatted .form_field_textarea,
.light-background .content-formatted .form_field_select {
  color: var(--primary-color);
}
.light-background .content-formatted .form_field_textfield::-webkit-input-placeholder,
.light-background .content-formatted .form_field_textarea::-webkit-input-placeholder,
.light-background .content-formatted .form_field_select::-webkit-input-placeholder {
  color: var(--primary-color);
}
.light-background .content-formatted .form_field_textfield::-moz-placeholder,
.light-background .content-formatted .form_field_textarea::-moz-placeholder,
.light-background .content-formatted .form_field_select::-moz-placeholder {
  color: var(--primary-color);
}
.light-background .content-formatted .form_field_textfield:-moz-placeholder,
.light-background .content-formatted .form_field_textarea:-moz-placeholder,
.light-background .content-formatted .form_field_select:-moz-placeholder {
  color: var(--primary-color);
}
.light-background .content-formatted .form_field_textfield:-ms-input-placeholder,
.light-background .content-formatted .form_field_textarea:-ms-input-placeholder,
.light-background .content-formatted .form_field_select:-ms-input-placeholder {
  color: var(--primary-color);
}
.comment-form .form_field {
  border: 0;
}
.comment-form .form_field:before {
  content: "";
  border-top: 1px solid;
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  opacity: 0.1;
}
.dark-background .comment-form .form_field:before {
  border-color: var(--third-color);
}
.light-background .comment-form .form_field:before {
  border-color: var(--secondary-color);
}

.comment-form .form_submit input {
  padding: calc(var(--form-blog-button-padding) - 12px) var(--form-blog-button-padding);
  font-size: var(--form-blog-button-font-size);
  font-style: var(--form-blog-button-font-style);
  font-weight: var(--form-blog-button-font-weight);
  color: var(--form-blog-button-color);
  -webkit-text-decoration: var(--form-blog-button-text-decoration);
          text-decoration: var(--form-blog-button-text-decoration);
  text-transform: var(--form-blog-button-text-transform);
  background-color: var(--form-blog-button-background-color);
  border-color: var(--form-blog-button-color);
}
.comment-form .form_submit input:hover {
  font-style: var(--form-blog-button-hover-font-style);
  font-weight: var(--form-blog-button-hover-font-weight);
  color: var(--form-blog-button-hover-color);
  -webkit-text-decoration: var(--form-blog-button-hover-text-decoration);
          text-decoration: var(--form-blog-button-hover-text-decoration);
  text-transform: var(--form-blog-button-hover-text-transform);
  background-color: var(--form-blog-button-hover-background-color);
  border-color: var(--form-blog-button-hover-color);
}

.horizontal-line {
  background-color: var(--third-color);
  opacity: 0.25;
}
.dark-background .horizontal-line {
  background-color: var(--third-color);
}
.light-background .horizontal-line {
  background-color: var(--secondary-color);
}

.product-page .content-header h1 {
  font-size: var(--product-title-size);
  font-weight: var(--product-title-font-weight);
  font-style: var(--product-title-font-style);
  -webkit-text-decoration: var(--product-title-font-text-decoration);
          text-decoration: var(--product-title-font-text-decoration);
  color: var(--product-title-color);
  text-align: var(--product-title-alignment);
}

.product-page .content-formatted .content-product-description {
  color: var(--product-description-color);
  font-size: var(--product-description-size);
  font-weight: var(--product-description-font-weight);
  font-style: var(--product-description-font-style);
  -webkit-text-decoration: var(--product-description-font-text-decoration);
          text-decoration: var(--product-description-font-text-decoration);
}

.product-page .product-price {
  color: var(--product-price-color);
  font-size: var(--product-price-size);
  font-weight: var(--product-price-font-weight);
  font-style: var(--product-price-font-style);
  -webkit-text-decoration: var(--product-price-font-text-decoration);
          text-decoration: var(--product-price-font-text-decoration);
}

.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-title,
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-link {
  color: var(--third-color);
}
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-price,
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-description {
  color: var(--third-color);
  opacity: 0.7;
}
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-top-outer .edy-product-widget-item-top.edy-product-widget-item-without-image {
  border: 1px solid var(--third-color);
  opacity: 0.5;
}
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-flex-wrap .edy-product-widget-item-out-of-stock,
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-flex-wrap .edy-product-widget-item-btn {
  color: var(--third-color);
}
.dark-background .edy-product-widget-grid .edy-product-widget-item:hover .edy-product-widget-item-price {
  opacity: 0;
}

.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-header .edy-product-widget-item-title .edy-product-widget-item-link {
  color: var(--third-color);
}
.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-header .edy-product-widget-item-price {
  color: var(--third-color);
  opacity: 0.7;
}
.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-header .edy-product-widget-item-out-of-stock {
  color: var(--third-color);
}
.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-description {
  color: var(--third-color);
}
.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-without-image {
  border: 1px solid var(--third-color);
  opacity: 0.5;
}

.edy-product-widget-filter-sort option {
  color: var(--primary-color);
}

.dark-background .edy-product-widget-filter-name,
.dark-background .edy-product-widget-filter-sort,
.dark-background .edy-product-widget-filter-label,
.dark-background .edy-product-widget-filter-search-input {
  color: var(--third-color);
}