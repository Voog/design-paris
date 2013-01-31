$(document).ready(function(){
    (function($) {
        
        var ImgDropper = function(options) {
            if (options && options.element && options.saveTo) {
                this.$el = $(options.element);
                this.$saveEl = $(options.saveTo);
                this.data = null;
                this.init();
            }
        };
        
        ImgDropper.prototype = {
            init: function() {
                this.data = this.getData();
                this.$el.droppable({scope: 'thumb', tolerance: 'pointer'}).on({
                    'dropover': $.proxy(this.handleDropover, this),
                    'dropout': $.proxy(this.handleDropout, this),
                    'drop': $.proxy(this.handleDrop, this),
                    'mousedown': $.proxy(this.handleMouseDown, this)
                });
                this.$el.parent().find('.delete-btn').on('click', $.proxy(this.handleDelete, this));
                if (this.data) {
                    this.changeImage();
                }
            },

            handleDrop: function(event, ui) {
                this.$el.removeClass('over');
                if (ui.draggable && ui.draggable.edicyThumb() && ui.draggable.data('edicyThumbData')) {
                    var data = $.extend({}, ui.draggable.data('edicyThumbData'));
                    if (data.type == 'image') {
                        if (data.large_thumbnail_src && data.large_thumbnail_src != "") {
                            data.src = data.large_thumbnail_src;
                        }
                        this.data = data;
                        this.changeImage(); 
                    }
                }
            },
            
            handleDropover: function() {
                this.$el.addClass('over');
            },
            
            handleDropout: function() {
                this.$el.removeClass('over');
            },
            
            handleMouseDown: function(event) {
                event.preventDefault();
                if (this.$el.find('.inner-image').length > 0) {
                    var imgtop = parseInt(this.$el.find('.inner-image').css('top'), 10) || 0,
                        imgleft = parseInt(this.$el.find('.inner-image').css('left'), 10) || 0,
                        w = this.$el.width(),
                        h = this.$el.height(),
                        moveHeight = (w / h >= this.data.width / this.data.height);
                                            
                    this.startPos = {
                        x: event.pageX,
                        y: event.pageY,
                        bgx: (moveHeight) ? 0 : imgleft,
                        bgy: (!moveHeight) ? 0 : imgtop
                    };
                    this.bindImgMoveEvents();
                }
            },
            
            handleMouseMove: function(event) {
                event.preventDefault();
                var pos = {x: event.pageX, y: event.pageY};
                this.changeImgPos(pos);
            },
            
            handleMouseOut: function(event) {
                var pos = {x: event.pageX, y: event.pageY};
                this.changeImgPos(pos);
                this.endImgReposition();
            },
            
            handleMouseUp: function(event) {
                var pos = {x: event.pageX, y: event.pageY};
                this.changeImgPos(pos);
                this.endImgReposition();
            },
            
            handleDelete: function() {
                this.$el.find('.inner-image').remove();
                this.$saveEl.find('.js-thumb-saver-data').remove();
                this.$el.removeClass('active').parent().removeClass('active');
            },
            
            endImgReposition: function() {
                this.unbindImgMoveEvents();
                this.setData();
            },
            
            bindImgMoveEvents: function() {
                this.$el.on({
                    'mousemove': $.proxy(this.handleMouseMove, this),
                    'mouseout': $.proxy(this.handleMouseOut, this),
                    'mouseup': $.proxy(this.handleMouseUp, this)
                });
            },
            
            unbindImgMoveEvents: function() {
                this.$el.off('mousemove');
                this.$el.off('mouseout');
                this.$el.off('mouseup');
            },
            
            changeImgPos: function(pos) {
                var $img = this.$el.find('.inner-image'),
                    movex = pos.x - this.startPos.x,
                    movey = pos.y - this.startPos.y,
                    w = this.$el.width(),
                    h = this.$el.height(),
                    moveHeight = (w / h >= this.data.width / this.data.height),
                    virth, virtw,
                    nx, ny;
                    
                    
                if (moveHeight) {
                    virth = (w / this.data.width) * this.data.height;
                    ny = this.startPos.bgy + movey;
                    if (ny < -1 * (virth - h)) { ny = -1 * (virth - h); }
                    if (ny > 0) { ny = 0; }
                    $img.css({'top': ny +"px"});
                } else {
                    virtw = (h / this.data.height) * this.data.width;
                    nx = this.startPos.bgx + movex;
                    if (nx < -1 * (virtw - w)) { nx = -1 * (virtw - w); }
                    if (nx > 0) { nx = 0; }
                    $img.css({'left': nx +"px"});
                }
            },
            
            changeImage: function() {
                var $img = $('<img/>', {'src': this.data.src, 'class':"inner-image"}),
                    w = this.$el.width(),
                    h = this.$el.height(),
                    moveHeight = (w / h >= this.data.width / this.data.height);
                
                this.$el.addClass('active').parent().addClass('active');
                if (this.$el.find('.inner-image').length > 0) {
                    this.$el.find('.inner-image').remove();
                }
                
                this.$el.prepend($img);
                
                if ( moveHeight ) {
                    $img.css({
                        'width': w + 'px',
                        'height': '',
                        'top': this.data.top || 0,
                        'left': 0
                    });
                } else {
                    $img.css({
                        'height': h + 'px',
                        'width': '',
                        'left': this.data.left || 0,
                        'top': 0
                    });
                }
                this.setData();
            },
            
            getData: function() {
                var data = null;
                if (this.$saveEl.find('.js-thumb-saver-data').length > 0) {
                    try {
                        data = $.parseJSON(this.$saveEl.find('.js-thumb-saver-data').attr('data-thumb-info'));
                    } catch(err) {
                       data = null;
                    }
                }
                return data;
            },
            
            setData: function() {
                this.$saveEl.html('');
                var $img =  $('<img>', {'class': 'js-thumb-saver-data'}).appendTo(this.$saveEl),
                    imgtop = this.$el.find('.inner-image').css('top') || 0,
                    imgleft = this.$el.find('.inner-image').css('left') || 0;
                
                $img.attr({
                    'src': this.data.src,
                    'data-thumb-info': '{"src":"' + this.data.src + '", "width": "' + this.data.width + '", "height": "' + this.data.height + '", "top": "' + imgtop + '", "left": "' + imgleft + '"}'
                });
            }
        };
        
        // configure and init 
        var thumbEditor = new ImgDropper({
            "element": $(".js-thumb-editor").eq(0),
            "saveTo": $(".js-thumb-data .fci-editor").eq(0)
        });
        
    })(Edicy.jQuery);
});
