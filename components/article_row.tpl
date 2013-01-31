<div class="article-row" style="" onclick="document.location = '{{ article.url }}'">
  <span class="date">{{article.created_at | format_date:"short"}}, {{article.created_at | format_date:"%Y"}}</span>
  <span class="title"><a href="{{ article.url }}">{{ article.title }}</a></span> &nbsp;&nbsp;
</div>