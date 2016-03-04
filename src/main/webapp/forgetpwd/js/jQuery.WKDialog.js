/**
 * 寮瑰嚭灞傛鏋� V1.0 
 * 2015-11-19 14:23:05
 */
;(function($) {
	$.fn.WKDialog = function(options) {
		var $this = $(this),
			_this = this,
			defaultParams = {
			noTitle: false, //鏄惁鏈夋爣棰� 锛岄粯璁ゆ湁
			title: "娑堟伅", //寮规鏍囬
			content: "鎮ㄧ‘璁よ杩欐牱鍋氬悧锛�", //寮规鍐呭涓巋tml鐨勫尯鍒槸浼氭湁榛樿鏍峰紡
			width: '300', //寮规瀹藉害锛岄珮搴︽槸鑷€傚簲鐨�
			html : '', //寮规鍐呭锛氬彲浠ユ槸jquery瀵硅薄鎴栬€卙tml
			ajaxUrl: '', //璁块棶杩滅▼椤甸潰鐨刟jaxUrl
//			drag: false, //鏄惁鎷栧姩 榛樿false
			top: '', //璺濈top鐨勪綅缃�
			left: '', //璺濈left鐨勪綅缃�
			opacity: 0.7, //閬僵 璧嬪€�0-1 
			isShow: false, ///鏄惁鏄剧ず闈㈡澘锛岄粯璁や笉鏄剧ず锛岀粦瀹氬璞″悗浼氱粰瀵硅薄缁戝畾click浜嬩欢鐒跺悗鏄剧ず寮规
			isBtnShow: true, //鏄惁鏄剧ず鎸夐挳
			singleBtn: false, //鏄惁鍙樉绀轰竴涓寜閽� 濡傛灉鏄剧ず涓€涓寜閽紝榛樿鏄剧ず纭畾鎸夐挳
			confirmVal: '纭�	瀹�', //纭畾鎸夐挳鏂囧瓧
			cancelVal:  '鍙�	娑�', //鍙栨秷鎸夐挳鏂囧瓧
			confirm: null, //纭畾鎸夐挳鍥炶皟鏂规硶
			cancel: null //鍙栨秷鎸夐挳鍥炶皟鏂规硶
		},
		dialogMask = null, //閬僵灞�
		dialog = null, //寮瑰嚭灞�
		domScope = window.document, //浣滅敤鍩�
		_win = window; //window瀵硅薄
		this.opts = $.extend(defaultParams, options);
		
		//鍒ゆ柇褰撳墠椤甸潰鏄惁璁剧疆鍚屽煙 濡傝缃垯鍦ㄥ灞傞〉闈㈠脊鍑� 鍙嶄箣鍦╥frame椤甸潰寮瑰嚭
		try {
			domScope = window.parent.document;
			_win = window.parent;
		} catch (e) {
			
		}
	
		/**
		 * 鎷兼帴html
		 */
		function createDialog() {
			var _dialogDiv = $('<div id="WKDialog_Div" style="position:fixed;padding: 10px;width:'+_this.opts.width+'px; border:1px solid #dddede; background-color:#e9e9e9; box-shadow:0px 0px 8px rgba(0, 0, 0, .6); font-family:SimSun; font-weight:bold; overflow:hidden; z-index:999999;"></div>');
			var _dialogMaskDiv = $('<div id="WKDialog_Mask_Div" style="z-index:999998; height:100%; width: 100%; position:fixed; top:0px; left:0px; background-color:#ccc; opacity:'+_this.opts.opacity+';filter:alpha(opacity='+(_this.opts.opacity*100)+');"></div>');
			
			var _dialogTitle = createDialogTitle(),
				_dialogContent = createDialogContent(),
				_dialogBtn = createDialogBtn();

			//娣诲姞閬僵灞�
			dialogMask = _dialogMaskDiv.dblclick(function() {
				_this.closeDialog();
			}).appendTo($(domScope.body)).fadeIn(300);
			
			//娣诲姞寮瑰嚭灞�
			dialog = _dialogDiv.append(_dialogTitle).append(_dialogContent).append(_dialogBtn).appendTo($(domScope.body));
			if (_dialogBtn) {
				dialog.find('#wk_dialog_content').css('border-bottom', '0');
			}
		};
		
		/**
		 * 鐢熸垚寮规鏍囬
		 */
		function createDialogTitle() {
			var _html = '';
			if (!_this.opts.noTitle) {
				_html = '<div id="wk_dialog_title" style="position:relative; height:32px; line-height:32px;font-family:SimSun; font-weight:bold; font-size:14px; color:#020202;"> '
				+ '		<span style="margin-left:10px;">'+_this.opts.title+'</span><i class="cancal_ico" style="position:absolute; top:6px; right:2px;  width:20px; height:20px; background:url(http://wk-static.99114.net//static/member/images/WKDialog_close.png) no-repeat; cursor:pointer;"></i> '
				+ '	</div> ';
			}
			return _html;
		}
		
		/**
		 * 鐢熸垚寮规鍐呭
		 */
		function createDialogContent() {
			var $content = $('<div id="wk_dialog_content" style="border:1px solid #cfcfcf;background-color:#fff;"></div>'),
			_defaultContent = '<p style="margin:10px 0 0; padding:0 5px; +padding-top:8px; font-size:12px;font-family:SimSun; font-weight:bold; color:#ff6600; text-align:center; line-height:24px; min-height:60px; ">'+_this.opts.content+'</p>';
			if (_this.opts.ajaxUrl) {
				$.get(_this.opts.ajaxUrl, function(data){
					$content.html(data);
				});
			} else if (_this.opts.html) {
				if (_this.opts.html instanceof jQuery) { //鍒ゆ柇浼犲叆鐨勬槸鍚query瀵硅薄
					_this.opts.html.clone(true).show().appendTo($content);
				} else {
					$content.html(_this.opts.html);
				}
			} else {
				$content.html(_defaultContent);
			}
			return $content[0];
		}
		
		/**
		 * 鐢熸垚寮规鎸夐挳
		 */
		function createDialogBtn() {
			var _html = '', _mLeft= '';
			if (_this.opts.isBtnShow) {
				_html = '<div id="wk_dialog_btn" style="background-color:#fff; padding:0 5px 5px 5px; border:1px solid #cfcfcf; border-top: 0; font-family:SimSun; font-weight:bold;">';
				if (_this.opts.singleBtn) {
					_mLeft = (_this.opts.width - 85)/2;
					_html +='<a class="confirm_btn" style="margin-left: '+_mLeft+'px; font-size:14px; font-family:SimSun; font-weight:bold; display:inline-block; width:85px; height:28px; color:#fff; border:1px solid #3aade5; background-color:#50b7ed; line-height:28px; text-align:center; cursor:pointer;">'+_this.opts.confirmVal+'</a>';
				} else {
					_mLeft = (_this.opts.width - 85*2)/2;
					_html +='<a class="confirm_btn" style="margin-left: '+_mLeft+'px;font-size:14px; font-family:SimSun; font-weight:bold;display:inline-block; width:85px; height:28px; color:#fff; border:1px solid #3aade5; background-color:#50b7ed; line-height:28px; text-align:center; cursor:pointer;">'+_this.opts.confirmVal+'</a>'
						  + '<a class="cancal_btn" style="font-size:14px; font-family:SimSun; font-weight:bold;margin-left:14px; display:inline-block; width:85px; height:28px; color:#757575;  line-height:28px; text-align:center; cursor:pointer; ">'+_this.opts.cancelVal+'</a>';
				}
				_html += '</div>';
			}
			return _html;
		}
		
		/**
		 * 璋冪敤鏂规硶
		 */
		function callback(methodName) {
			typeof methodName === 'function' ? methodName($this, _this, dialog) : null;
		}
		
		/**
		 * 缁戝畾鎸夐挳浜嬩欢
		 */
		function bindEvent() {
			//纭畾鎸夐挳浜嬩欢
			$('.confirm_btn', domScope).click(function() {
				callback(_this.opts.confirm);
				_this.closeDialog();
				return false;
			}).hover(function() {
				$(this).css('color', '#08b');
			}, function() {
				$(this).css('color', '#fff');
			});
			
			//鍙栨秷鎸夐挳浜嬩欢
			$('.cancal_btn', domScope).click(function() {
				callback(_this.opts.cancel);
				_this.closeDialog();
				return false;
			}).hover(function() {
				$(this).css({
					border: '1px solid #e1e1e1',
					color: '#3c3c3c'
				});
			}, function() {
				$(this).css({
					border: '1px solid #fff',
					color: '#757575'
				});
			});
			
			//鍏抽棴鎸夐挳浜嬩欢
			$('.cancal_ico', domScope).click(function() {
				callback(_this.opts.cancel);
				_this.closeDialog();
				return false;
			}).hover(function() {
				$(this).css('background-position', '0 bottom');
			}, function() {
				$(this).css('background-position', '');
			});
		}
		
		 /**
		  * 璁剧疆寮规鐨勪綅缃�
		  */
        function setPosition(){
            if (!dialog) {
                return false;
            }
            var	lt = calPosition();
            dialog.css({
                left: lt[0],
                top: lt[1]
            });
            dialogMask.height($(domScope).height()).width($(domScope).width());           
        }

        /**
         * 璁＄畻寮规鐨勪綅缃�
         */
        function calPosition(){
            var l = _this.opts.left ? _this.opts.left : ($(domScope).width() - dialog.width()) / 2,
            	t =  _this.opts.top ?  _this.opts.top : ($(_win).height() - dialog.height()) / 2;
            return [l, t];
        }
        
		/**
		 * 鍏抽棴瀵硅瘽妗�
		 */
		 this.closeDialog = function() {
			 if(dialogMask) {
				 dialogMask.remove();
				 dialog.fadeOut(300, function() {
					 dialog.remove();
				 });
				 dialogMask = null;
			 }
			 return false;
		  };
		
		/**
		 * 鏄剧ず瀵硅瘽妗�
		 */
		this.showDialog = function() {
			if (dialogMask) {
				_this.closeDialog();
			}
			//鍔ㄦ€佺敓鎴恉om
			createDialog();
			//閲嶆柊瀹氫綅寮规
			setPosition();
			//缁戝畾dom浜嬩欢
			bindEvent();
		};
		
		//璋冪敤瀵硅薄鏂规硶鏄剧ずconfirm闈㈡澘
		_this.opts.isShow? _this.showDialog() : $this.click(function() {
			_this.showDialog();
			return false;
		});
		
		return this;
	};
})(jQuery);