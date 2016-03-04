/**
 * 娉ㄥ唽椤甸潰鍏敤浜嬩欢缁戝畾绫�
 * @date 2015-4-2 17:31:08
 * @author zlb
 */
$(function(){
	
	//鍒濆鍖栨敞鍐屽け璐ュ悗鐨勯敊璇彁绀�
	errorResult();
	//椤甸潰鍔犲叆鏍￠獙淇℃伅
	bindvalidForm();
	//鍚屾剰鍗忚缁х画娉ㄥ唽鏂规硶
	$('#iAgreeEnterprise').click(function(){
		$('#submitdd').toggleClass('gray_agreeRegist').attr('disabled', !$(this).attr("checked"));
	});
	
	//涓嬫媺鑿滃崟
	$(".select").click(function(){
		$(this).toggleClass("position").find(".slt-option").toggle();
		$(this).find(".requ_lz").toggle().css("z-index","22222");;		
	});

	$(".slt-option ul li").click(function(){
		var $obj = $(this).parent().parent().parent();
		$obj.find("input").val($(this).find("a").text());
		$obj.find(".requ_lz").css("z-index","-10000000");
	});

	//input鑾峰彇鐒︾偣鏃惰竟妗嗗彉鑹�
	$('.text').focus(function(){
	  $(this).addClass("greenBd").parent().find(".focus").show();
	}).blur(function(){
	  $(this).removeClass("greenBd").parent().find(".focus").hide();
	});
});

//validform鎻愮ず鏁堟灉
function bindvalidForm(){
	var getInfoObj = function() {
		return $(this).parent().children("label");
	};
	$("[datatype]").focusin(function() {
		$(this).removeClass("Validform_error");
		$(this).addClass("text greenBD greenBd");
		if (this.timeout) {
			clearTimeout(this.timeout);
		}
		var infoObj = getInfoObj.call(this);
		infoObj.css('display','inline').siblings('span').css('display', 'none');
	}).focusout(
			function() {
				var cls = $(this).parent().children('span').attr("class");
				if(cls.indexOf("Validform_wrong")>0){
					$(this).addClass("text Validform_error");
				}else{
					$(this).addClass("text greenBD greenBd");
				}
				var infoObj = getInfoObj.call(this);
				this.timeout = setTimeout(function() {
					infoObj.css('display','none').siblings('span').css('display', 'inline');
				}, 100);
			}
	);
}

/**
 * @desc:閿欒缁撴灉淇℃伅
 */
function errorResult(){
	var msgGlobal=$("#msgGlobal").val();
	var errorMsg=$("#errorMsg").val();
	//鍒ゆ柇鍚︿负绌�
	if(msgGlobal!=null&&msgGlobal!=""){
		//鍒ゆ柇鏄摢涓被鍒�
		msgGlobal=parseInt(msgGlobal);
			switch (msgGlobal) {
			case 1000:
				$("#account").attr("class","input1 txt1 Validform_error");
				$("#account").siblings("span.Validform_checktip").attr("class","Validform_checktip Validform_wrong").text("甯愬彿宸茬粡瀛樺湪");
				break;
			case 1001:
				$("#account").attr("class","input1 txt1 Validform_error");
				$("#account").siblings("span.Validform_checktip").attr("class","Validform_checktip Validform_wrong").text("甯愬彿涓嶈兘涓虹┖");
				break;
			case 1002:
				$("#password2").attr("class","input1 txt1 Validform_error");
				$("#password2").siblings("span.Validform_checktip").attr("class","Validform_checktip Validform_wrong").text("瀵嗙爜涓嶈兘涓虹┖");
				break;
			case 1003:
				$("#mobileCode").attr("class","input4 txt1 Validform_error");
				$("#mobileCode").siblings("span.Validform_checktip").attr("class","Validform_checktip Validform_wrong").text("楠岃瘉鐮侀敊璇�");
				break;
			default:
				$("#mobileCode").attr("class","input4 txt1 Validform_error");
				$("#mobileCode").siblings("span.Validform_checktip").attr("class","Validform_checktip Validform_wrong").text("娉ㄥ唽澶辫触");
				break;
			}
			
	}
}