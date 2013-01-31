<div class="comments-holder">
  <div class="comments" id="comments">
    
    
    {% comment %} Article commenting form {% endcomment %}
    <div class="comments-add">
      <h2>{{"add_a_comment"|lc}}</h2>
      {% commentform %}
      
        {% assign comment_name_error = false %}
        {% assign comment_email_error = false %}
        {% assign comment_body_error = false %}
        {% unless comment.valid? %}
            {% for error in comment.errors %}
                {% if error == "comment_author_blank" %}{% assign comment_name_error = true %}{% endif %}
                {% if error == "comment_email_blank" %}{% assign comment_email_error = true %}{% endif %}
                {% if error == "comment_body_blank" %}{% assign comment_body_error = true %}{% endif %}
            {%endfor %}
        {% endunless %}
      
        <p class="comments-add-row">
          <label for="commentform-name">{{ "name" | lc }}</label>
          {% if comment_name_error %}<span class="comment-row-error">{{ "comment_author_blank" | lc }}</span>{% endif %}
          <input type="text" class="textbox bold blog-form-large" name="comment[author]" id="commentform-name" placeholder='{{ "forms.template.your_name" | lc }}' value="{{ comment.author }}" /></td>
        </p>
        <p class="comments-add-row">
          <label for="commentform-email">{{"email" | lc }}</label>
          {% if comment_email_error %}<span class="comment-row-error">{{ "comment_email_blank" | lc }}</span>{% endif %}
          <input type="text" class="textbox bold blog-form-large" id="commentform-email" placeholder='{{ "forms.template.your_email" | lc }}' name="comment[author_email]" value="{{comment.author_email}}" />
        </p>
        <p class="comments-add-row">
          <label for="commentform-body">{{ "comment" | lc }}</label>
          {% if comment_body_error %}<span class="comment-row-error">{{ "comment_body_blank" | lc }}</span>{% endif %}
          <textarea cols="7" rows="1" class="textbox blog-form-large js-autogrow-textarea" id="commentform-body" placeholder='{{ "forms.template.comments" | lc }}' name="comment[body]">{{ comment.body }}</textarea>
        </p>
        <p class="comments-add-submit-row">
           <input type="submit" value="{{ 'submit' | lc }}" class="submit" />
        </p>
      {% endcommentform %}
    </div>
  </div>
</div>  

 
{% comment %} Article comments list {% endcomment %}
{% if article.comments.size > 0 %}
    <div class="comments-holder">
      <div class="comments">   
          <h2>{{ article.comments.size }} {{ "comments_for_count" | lc}}</h2>
          {% comment %} Article comments list {% endcomment %}
          <div class="comments-list">
          {% for comment in article.comments %}
            <div class="edy-site-blog-comment">
              <span class="author">{{ comment.author }}</span> <span class="comment-body-line">_</span>
              <span class="comment-body">{{ comment.body_html }}</span>
              &nbsp; <span class="date">{{ comment.created_at | date:"%b %d, %Y" }}</span>
              {% removebutton %}
              
            </div>    
          {% endfor %}
          </div>
      </div>
    </div>
{% endif %}
