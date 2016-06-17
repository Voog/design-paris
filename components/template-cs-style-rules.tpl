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
.dark-background .voog-reference svg path {
  fill: var(--third-color);
}
.dark-background .site-options .search-btn svg path {
  fill: var(--third-color);
}
@media screen and (max-width: 999px) {
  .search-open .dark-background .site-options .search-btn svg path {
    fill: var(--primary-color);
  }
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
.light-background .content-formatted table {
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
.light-background .voog-reference svg path {
  fill: var(--secondary-color);
}
.light-background .site-options .search-btn svg path {
  fill: var(--secondary-color);
}
@media screen and (max-width: 999px) {
  .search-open .light-background .site-options .search-btn svg path {
    fill: var(--secondary-color);
  }
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
  text-decoration: var(--blog-list-headings-text-decoration);
  text-transform: var(--blog-list-headings-text-transform);
}
.dark-background .blog .post .post-header .post-title {
  color: var(--third-color);
}
.light-background .blog .post .post-header .post-title {
  color: var(--secondary-color);
}
@media screen and (min-width: 481px) {
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
  text-decoration: var(--blog-list-date-text-decoration);
  text-transform: var(--blog-list-date-text-transform);
}

.menu-sub {
  background-color: var(--content-submenu-background-color);
}
.menu-sub .menu-link {
  font-size: var(--content-submenu-font-size);
  font-style: var(--content-submenu-font-style);
  font-weight: var(--content-submenu-font-weight);
  text-decoration: var(--content-submenu-text-decoration);
  text-transform: var(--content-submenu-text-transform);
}
.menu-sub .menu-link:hover {
  font-size: var(--content-submenu-font-size);
  font-style: var(--content-submenu-hover-font-style);
  font-weight: var(--content-submenu-hover-font-weight);
  text-decoration: var(--content-submenu-hover-text-decoration);
  text-transform: var(--content-submenu-hover-text-transform);
}
.menu-sub .menu-link.active {
  font-size: var(--content-submenu-font-size);
  font-style: var(--content-submenu-active-font-style);
  font-weight: var(--content-submenu-active-font-weight);
  text-decoration: var(--content-submenu-active-text-decoration);
  text-transform: var(--content-submenu-active-text-transform);
}

@media screen and (min-width: 841px) {
  .menu-main .menu-link {
    font-size: var(--menu-main-font-size);
  }
}
.menu-lang .menu-link,
.menu-main .menu-link {
  color: var(--menu-main-color);
  font-style: var(--menu-main-font-style);
  font-weight: var(--menu-main-font-weight);
  text-decoration: var(--menu-main-text-decoration);
  text-transform: var(--menu-main-text-transform);
}
.menu-lang .menu-link.active,
.menu-main .menu-link.active {
  color: var(--menu-main-active-color);
  font-style: var(--menu-main-active-font-style);
  font-weight: var(--menu-main-active-font-weight);
  text-decoration: var(--menu-main-active-text-decoration);
  text-transform: var(--menu-main-active-text-transform);
}
.menu-lang .menu-link.active:hover,
.menu-main .menu-link.active:hover {
  font-weight: var(--menu-main-active-font-weight);
}
.menu-lang .menu-link:hover,
.menu-main .menu-link:hover {
  color: var(--menu-main-hover-color);
  font-style: var(--menu-main-hover-font-style);
  font-weight: var(--menu-main-hover-font-weight);
  text-decoration: var(--menu-main-hover-text-decoration);
  text-transform: var(--menu-main-hover-text-transform);
}

.search-form .search-input {
  color: var(--menu-main-color);
}
.search-form .search-input::-webkit-input-placeholder {
  color: var(--menu-main-color);
}
.search-form .search-input:-moz-placeholder {
  color: var(--menu-main-color);
}
.search-form .search-input::-moz-placeholder {
  color: var(--menu-main-color);
}
.search-form .search-input:-ms-input-placeholder {
  color: var(--menu-main-color);
}
.search-form svg {
  fill: var(--menu-main-color);
  opacity: .5;
}

@media screen and (max-width: 1048px) {
  .mobile-menu-toggler span, .mobile-menu-toggler span:before, .mobile-menu-toggler span:after {
    background-color: var(--secondary-color);
  }
  .dark-background .mobile-menu-toggler span, .dark-background .mobile-menu-toggler span:before, .dark-background .mobile-menu-toggler span:after {
    background-color: var(--third-color);
  }
  .mobile-menu-toggler span.flags-disabled .lang-menu-btn .lang-title, .mobile-menu-toggler span:before.flags-disabled .lang-menu-btn .lang-title, .mobile-menu-toggler span:after.flags-disabled .lang-menu-btn .lang-title {
    color: var(--third-color);
  }

  #mobile-menu .search-open-btn svg {
    fill: var(--secondary-color);
  }
  #mobile-menu ul a {
    color: var(--primary-color);
  }
  #mobile-menu .navigation-menu > ul > li > a {
    font-style: var(--menu-main-font-style);
    font-weight: var(--menu-main-font-weight);
    text-decoration: var(--menu-main-text-decoration);
    text-transform: var(--menu-main-text-transform);
  }
  #mobile-menu .navigation-menu > ul > li > a:hover {
    font-style: var(--menu-main-hover-font-style);
    font-weight: var(--menu-main-hover-font-weight);
    text-decoration: var(--menu-main-hover-text-decoration);
    text-transform: var(--menu-main-hover-text-transform);
  }
  #mobile-menu .navigation-menu > ul > li > a.selected, #mobile-menu .navigation-menu > ul > li > a.current {
    font-style: var(--menu-main-active-font-style);
    font-weight: var(--menu-main-active-font-weight);
    text-decoration: var(--menu-main-active-text-decoration);
    text-transform: var(--menu-main-active-text-transform);
  }
  #mobile-menu .navigation-menu ul a.selected {
    color: var(--secondary-color);
  }
  #mobile-menu .navigation-menu .sub-menu a {
    font-style: var(--menu-sub-font-style);
    font-weight: var(--menu-sub-font-weight);
    text-decoration: var(--menu-sub-text-decoration);
    text-transform: var(--menu-sub-text-transform);
  }
  #mobile-menu .navigation-menu .sub-menu a:hover {
    font-style: var(--menu-sub-hover-font-style);
    font-weight: var(--menu-sub-hover-font-weight);
    text-decoration: var(--menu-sub-hover-text-decoration);
    text-transform: var(--menu-sub-hover-text-transform);
  }
  #mobile-menu .navigation-menu .sub-menu a.selected, #mobile-menu .navigation-menu .sub-menu a.current {
    font-style: var(--menu-sub-active-font-style);
    font-weight: var(--menu-sub-active-font-weight);
    text-decoration: var(--menu-sub-active-text-decoration);
    text-transform: var(--menu-sub-active-text-transform);
  }
  #mobile-menu .lang-menu ul li a.is-active {
    color: var(--secondary-color);
  }
}
.lang-flag:before {
  background-color: var(--secondary-color);
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

.site-sidebar .sidebar-title a {
  color: var(--secondary-color);
}
.dark-background .site-sidebar .sidebar-title a {
  color: var(--third-color);
}
.site-sidebar .submenu a {
  font-weight: var(--menu-sub-font-weight);
  font-style: var(--menu-sub-font-style);
  text-decoration: var(--menu-sub-text-decoration);
  text-transform: var(--menu-sub-text-transform);
  color: var(--secondary-color);
}
.site-sidebar .submenu a:hover {
  font-weight: var(--menu-sub-hover-font-weight);
  font-style: var(--menu-sub-hover-font-style);
  text-decoration: var(--menu-sub-hover-text-decoration);
  text-transform: var(--menu-sub-hover-text-transform);
}
.dark-background .site-sidebar .submenu a {
  color: var(--third-color);
}
.site-sidebar .submenu .selected,
.site-sidebar .submenu .selected a,
.site-sidebar .submenu .current,
.site-sidebar .submenu .current a {
  font-weight: var(--menu-sub-active-font-weight);
  font-style: var(--menu-sub-active-font-style);
  text-decoration: var(--menu-sub-active-text-decoration);
  text-transform: var(--menu-sub-active-text-transform);
}
.site-sidebar .submenu .selected {
  color: var(--secondary-color);
}
.dark-background .site-sidebar .submenu .selected {
  color: var(--third-color);
}
.site-sidebar .submenu .submenu-lvl2 a {
  color: var(--secondary-color);
}
.dark-background .site-sidebar .submenu .submenu-lvl2 a {
  color: var(--third-color);
}
.dark-background .site-sidebar .submenu .submenu-lvl2 .selected {
  color: var(--third-color);
}

.footer .dark-background .content-formatted a {
  color: var(--third-color);
}
.footer .voog-reference {
  color: var(--secondary-color);
}
.footer .blog-article-nav .article-nav-direction {
  color: var(--secondary-color);
}
.footer .blog-article-nav .article-nav-title {
  color: var(--secondary-color);
}
.footer .blog-article-nav.dark-background .article-nav-title {
  color: var(--third-color);
}
.footer .blog-article-nav.dark-background .article-nav-direction {
  color: var(--third-color);
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
  color: var(--primary-color);
}
.header .wrap .header-left .content-formatted.header-title,
.header .wrap .header-left .content-formatted.header-title a,
.header .wrap .header-left .content-formatted.header-title a:hover, .header .wrap .header-left .content-formatted.header-slogan,
.header .wrap .header-left .content-formatted.header-slogan a,
.header .wrap .header-left .content-formatted.header-slogan a:hover {
  font-family: var(--secondary-font-family);
  font-style: var(--header-body-font-style);
  font-weight: var(--header-body-font-weight);
  text-decoration: var(--header-body-text-decoration);
  text-transform: var(--header-body-text-transform);
}
.dark-background .content-formatted h1, .dark-background
.content-formatted h2, .dark-background
.content-formatted h3, .dark-background
.content-formatted h4, .dark-background
.content-formatted h5, .dark-background
.content-formatted h6, .dark-background
.content-formatted p, .dark-background
.content-formatted ul, .dark-background
.content-formatted ol, .dark-background
.content-formatted pre, .dark-background
.content-formatted code, .dark-background
.content-formatted table {
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
.site-footer .content-formatted p, .site-footer
.content-formatted ul, .site-footer
.content-formatted ol, .site-footer
.content-formatted dl {
  color: var(--primary-color);
}
.site-footer .dark-background .content-formatted p, .site-footer .dark-background
.content-formatted ul, .site-footer .dark-background
.content-formatted ol, .site-footer .dark-background
.content-formatted dl {
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
  text-decoration: var(--headings-title-text-decoration);
  text-transform: var(--headings-title-text-transform);
}
.post-header-bottom {
  opacity: .6;
}
.dark-background .post-header-bottom {
  color: var(--third-color);
}
.light-background .post-header-bottom {
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
  text-decoration: var(--headings-front-subheading-text-decoration);
  text-transform: var(--headings-front-subheading-text-transform);
}
.content-formatted a {
  font-style: var(--content-link-font-style);
  font-weight: var(--content-link-font-weight);
  color: var(--secondary-color);
  text-decoration: var(--content-link-text-decoration);
  text-transform: var(--content-link-text-transform);
}
.content-formatted a:hover {
  font-style: var(--content-link-hover-font-style);
  font-weight: var(--content-link-hover-font-weight);
  text-decoration: var(--content-link-hover-text-decoration);
  text-transform: var(--content-link-hover-text-transform);
}
.dark-background .content-formatted a {
  color: var(--third-color);
}
.content-formatted a.custom-btn {
  padding: var(--button-padding) calc(var(--button-padding) + 8px);
  font-size: var(--button-font-size);
  font-style: var(--button-font-style);
  font-weight: var(--button-font-weight);
  text-decoration: var(--button-text-decoration);
  text-transform: var(--button-text-transform);
}
.dark-background .content-formatted a.custom-btn, .dark-background .content-formatted a.custom-btn:hover {
  border-color: var(--third-color);
  color: var(--third-color);
}
.light-background .content-formatted a.custom-btn, .light-background .content-formatted a.custom-btn:hover {
  border-color: var(--secondary-color);
  color: var(--secondary-color);
}
.content-formatted table tr:first-child td {
  border-top-style: var(--table-border-style);
}
.content-formatted table th, .content-formatted table td {
  padding: calc(var(--table-padding) - 4px) var(--table-padding);
  font-size: var(--table-font-size);
  border-bottom-style: var(--table-border-style);
  border-bottom-style: var(--table-border-style);
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
  text-decoration: var(--form-blog-field-text-decoration);
  text-transform: var(--form-blog-field-text-transform);
}
.comment-form .comments-title::-webkit-input-placeholder, .comment-form .comment-form-label::-webkit-input-placeholder, .comment-form .form_field_textarea::-webkit-input-placeholder, .comment-form .form_field_textfield::-webkit-input-placeholder {
  opacity: .6;
  text-decoration: var(--form-blog-field-text-decoration);
}
.comment-form .comments-title:-moz-placeholder, .comment-form .comment-form-label:-moz-placeholder, .comment-form .form_field_textarea:-moz-placeholder, .comment-form .form_field_textfield:-moz-placeholder {
  opacity: .6;
  text-decoration: var(--form-blog-field-text-decoration);
}
.comment-form .comments-title::-moz-placeholder, .comment-form .comment-form-label::-moz-placeholder, .comment-form .form_field_textarea::-moz-placeholder, .comment-form .form_field_textfield::-moz-placeholder {
  opacity: .6;
  text-decoration: var(--form-blog-field-text-decoration);
}
.comment-form .comments-title:-ms-input-placeholder, .comment-form .comment-form-label:-ms-input-placeholder, .comment-form .form_field_textarea:-ms-input-placeholder, .comment-form .form_field_textfield:-ms-input-placeholder {
  opacity: .6;
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
.dark-background .content-formatted .form_field_textarea,
.dark-background .content-formatted .form_field_select {
  color: var(--third-color);
}
.dark-background .content-formatted .form_field_textfield::-webkit-input-placeholder,
.dark-background .content-formatted .form_field_textarea::-webkit-input-placeholder,
.dark-background .content-formatted .form_field_select::-webkit-input-placeholder {
  color: var(--third-color);
}
.dark-background .content-formatted .form_field_textfield::-moz-placeholder,
.dark-background .content-formatted .form_field_textarea::-moz-placeholder,
.dark-background .content-formatted .form_field_select::-moz-placeholder {
  color: var(--third-color);
}
.dark-background .content-formatted .form_field_textfield:-moz-placeholder,
.dark-background .content-formatted .form_field_textarea:-moz-placeholder,
.dark-background .content-formatted .form_field_select:-moz-placeholder {
  color: var(--third-color);
}
.dark-background .content-formatted .form_field_textfield:-ms-input-placeholder,
.dark-background .content-formatted .form_field_textarea:-ms-input-placeholder,
.dark-background .content-formatted .form_field_select:-ms-input-placeholder {
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
.comment-form .form_submit input {
  padding: calc(var(--form-blog-button-padding) - 12px) var(--form-blog-button-padding);
  font-size: var(--form-blog-button-font-size);
  font-style: var(--form-blog-button-font-style);
  font-weight: var(--form-blog-button-font-weight);
  color: var(--form-blog-button-color);
  text-decoration: var(--form-blog-button-text-decoration);
  text-transform: var(--form-blog-button-text-transform);
  background-color: var(--form-blog-button-background-color);
  border-color: var(--form-blog-button-color);
}
.comment-form .form_submit input:hover {
  font-style: var(--form-blog-button-hover-font-style);
  font-weight: var(--form-blog-button-hover-font-weight);
  color: var(--form-blog-button-hover-color);
  text-decoration: var(--form-blog-button-hover-text-decoration);
  text-transform: var(--form-blog-button-hover-text-transform);
  background-color: var(--form-blog-button-hover-background-color);
  border-color: var(--form-blog-button-hover-color);
}
