/*! http://mths.be/placeholder v2.0.7 by @mathias */
;(function(f,h,$){var a='placeholder' in h.createElement('input'),d='placeholder' in h.createElement('textarea'),i=$.fn,c=$.valHooks,k,j;if(a&&d){j=i.placeholder=function(){return this};j.input=j.textarea=true}else{j=i.placeholder=function(){var l=this;l.filter((a?'textarea':':input')+'[placeholder]').not('.placeholder').bind({'focus.placeholder':b,'blur.placeholder':e}).data('placeholder-enabled',true).trigger('blur.placeholder');return l};j.input=a;j.textarea=d;k={get:function(m){var l=$(m);return l.data('placeholder-enabled')&&l.hasClass('placeholder')?'':m.value},set:function(m,n){var l=$(m);if(!l.data('placeholder-enabled')){return m.value=n}if(n==''){m.value=n;if(m!=h.activeElement){e.call(m)}}else{if(l.hasClass('placeholder')){b.call(m,true,n)||(m.value=n)}else{m.value=n}}return l}};a||(c.input=k);d||(c.textarea=k);$(function(){$(h).delegate('form','submit.placeholder',function(){var l=$('.placeholder',this).each(b);setTimeout(function(){l.each(e)},10)})});$(f).bind('beforeunload.placeholder',function(){$('.placeholder').each(function(){this.value=''})})}function g(m){var l={},n=/^jQuery\d+$/;$.each(m.attributes,function(p,o){if(o.specified&&!n.test(o.name)){l[o.name]=o.value}});return l}function b(m,n){var l=this,o=$(l);if(l.value==o.attr('placeholder')&&o.hasClass('placeholder')){if(o.data('placeholder-password')){o=o.hide().next().show().attr('id',o.removeAttr('id').data('placeholder-id'));if(m===true){return o[0].value=n}o.focus()}else{l.value='';o.removeClass('placeholder');l==h.activeElement&&l.select()}}}function e(){var q,l=this,p=$(l),m=p,o=this.id;if(l.value==''){if(l.type=='password'){if(!p.data('placeholder-textinput')){try{q=p.clone().attr({type:'text'})}catch(n){q=$('<input>').attr($.extend(g(this),{type:'text'}))}q.removeAttr('name').data({'placeholder-password':true,'placeholder-id':o}).bind('focus.placeholder',b);p.data({'placeholder-textinput':q,'placeholder-id':o}).before(q)}p=p.removeAttr('id').hide().prev().attr('id',o).show()}p.addClass('placeholder');p[0].value=p.attr('placeholder')}else{p.removeClass('placeholder')}}}(this,document,jQuery));

/*
    jQuery Autosize v1.16.3
	(c) 2013 Jack Moore - jacklmoore.com
	updated: 2013-01-23
	license: http://www.opensource.org/licenses/mit-license.php
*/
;(function(e){var t,o={className:"autosizejs",append:"",callback:!1},i="hidden",n="border-box",s="lineHeight",a='<textarea tabindex="-1" style="position:absolute; top:-9999px; left:-9999px; right:auto; bottom:auto; border:0; -moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden;"/>',r=["fontFamily","fontSize","fontWeight","fontStyle","letterSpacing","textTransform","wordSpacing","textIndent"],l="oninput",c="onpropertychange",h=e(a).data("autosize",!0)[0];h.style.lineHeight="99px","99px"===e(h).css(s)&&r.push(s),h.style.lineHeight="",e.fn.autosize=function(s){return s=e.extend({},o,s||{}),h.parentNode!==document.body&&e(document.body).append(h),this.each(function(){function o(){t=b,h.className=s.className,e.each(r,function(e,t){h.style[t]=x.css(t)})}function a(){var e,n,a;if(t!==b&&o(),!d){d=!0,h.value=b.value+s.append,h.style.overflowY=b.style.overflowY,a=parseInt(b.style.height,10),h.style.width=Math.max(x.width(),0)+"px",h.scrollTop=0,h.scrollTop=9e4,e=h.scrollTop;var r=parseInt(x.css("maxHeight"),10);r=r&&r>0?r:9e4,e>r?(e=r,n="scroll"):p>e&&(e=p),e+=g,b.style.overflowY=n||i,a!==e&&(b.style.height=e+"px",w&&s.callback.call(b)),setTimeout(function(){d=!1},1)}}var p,d,u,b=this,x=e(b),g=0,w=e.isFunction(s.callback);x.data("autosize")||((x.css("box-sizing")===n||x.css("-moz-box-sizing")===n||x.css("-webkit-box-sizing")===n)&&(g=x.outerHeight()-x.height()),p=Math.max(parseInt(x.css("minHeight"),10)-g,x.height()),u="none"===x.css("resize")||"vertical"===x.css("resize")?"none":"horizontal",x.css({overflow:i,overflowY:i,wordWrap:"break-word",resize:u}).data("autosize",!0),c in b?l in b?b[l]=b.onkeyup=a:b[c]=a:b[l]=a,e(window).resize(a),x.bind("autosize",a),a())})}})(window.jQuery||window.Zepto);

;(function($){
    $(document).ready(function() {
        $('.article-box').each(function() {
            var data = null;
            try {
                data = jQuery.parseJSON($(this).find('.js-article-box-excerpt .js-thumb-saver-data').attr('data-thumb-info'));
            } catch (err) {
                data = null;
            }
            if (data) {
                var w = 220,
                    h = 300,
                    moveHeight = (w / h >= data.width / data.height),
                    $img = $('<img/>', {'src': data.src, 'class':"inner-image"});
                
                if (moveHeight) {
                    $img.css({
                        'width': w + 'px',
                        'top': data.top
                    });
                } else {
                    $img.css({
                        'height': h + 'px',
                        'left': data.left
                    });
                }
                $(this).addClass('has-image').find('.image-cropper').prepend($img);
            }
        });
        $('input, textarea').placeholder();
        $('textarea.js-autogrow-textarea').autosize();
        
        if ($('.form_error, .form_notice, .comment-row-error').length > 0) {
            var top = $('.form_error, .form_notice, .comment-row-error').eq(0).offset().top - 50;
            if (top < 0) { top = 0; }
            $('html, body').scrollTop(top);
        }
    });
    
})(jQuery);