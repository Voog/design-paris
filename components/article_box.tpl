<div class="article-box" style="" onclick="document.location = '{{ article.url }}'">
  <div class="image-cropper">
    <div class="title">{{ article.title }}</div>
  </div>
  <div class="date">{{article.created_at | format_date:"short"}}, {{article.created_at | format_date:"%Y"}}</div>
  <div class="hidden js-article-box-excerpt">{{ article.excerpt }}</div>
</div>