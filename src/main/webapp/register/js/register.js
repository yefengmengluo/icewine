//楠岃瘉鐮佹槸鍚︽纭�
var isValid=false;

$(function(){
	var T;
	//鍔犺浇鍦板尯閫夋嫨
	$.ajaxSetup({
        cache: false,
        type: "POST"
    });
    T = new DropDownTest(); // 绫诲簱
    T.init();
    S= new Sub();//楠岃瘉
	//涓嶈兘杈撳叆绌烘牸
	$('#account').keydown(function(e){
		if(e.keyCode == 32){
			return false;
		}
	});

	$(".search_bj").click(function(){
		sendMoible($(this));
	});
	
	
	//鍒ゆ柇姝ら〉闈㈡槸鍚︽槸閭€璇锋敞鍐岄〉闈�
	var inviterAccount = $('#inviterAccount').val();
	if(inviterAccount && inviterAccount != 'null'){
		$('#inviteDiv').find('input').val(inviterAccount).end().show();
	}
	
	$("#rcodeimageId").on("click", function () {
	    var timenow = new Date().getTime();
	    document.getElementById("rcodeimageId").src = "/login/getImage?dateout=" + timenow;
	    $("#imgCodeMsg").removeClass('Validform_wrong');
	    $("#imgCodeMsg").removeClass('Validform_right');
	    $("#imgCodeMsg").hide();
	});
});

//鍦板尯鑱斿姩
function DropDownTest() {
    this.init = function () {
        var ad = [];
        ad = getData("area", "");//鑾峰彇鍦板尯绗竴绾�
        this.dv_root = new DropMenu("dvroot", 126, 200, true, ad, 0, "area");
    };
}
//楠岃瘉
function Sub(){
	//涔板娉ㄥ唽楠岃瘉
	$("#enterpriseRegister").Validform({
		btnSubmit:"#enterpriseSubmit",
		tiptype:3,
		showAllError:false,
		postonce:true,
		datatype:{
			"zh1-6":/^\w+$/,
			"nozh6-16": /^[a-zA-Z0-9][a-zA-Z0-9_]{5,16}$/,
			"account":/^[a-zA-Z_]+[a-zA-Z0-9_]{3,15}$/,
			"pwd":/^[a-zA-Z0-9_.@-]{6,32}$/,
			"lkz2-20":/^[A-Za-z\u4e00-\u9fa5]{2,20}$/,
			"lkz2-60":/^[A-Za-z\u4e00-\u9fa5\(\)\锛圽锛塢{2,60}$/,
			"tel":/^[0-9]{3,4}-[0-9]{7,16}$/,
			"qq":/^\d{5,11}$/,
			"num2-32":/^[0-9]{2,60}$/,
			"num16":/^[a-zA-Z0-9]{16}$/,
			"cdKey":/^[a-zA-Z]{6}$/,
			"mobile":/^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|170{9}$|18[0-9]{9}$/,
			"m123":/^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|17[0-9]{9}$|18[0-9]{9}$/
		},
		beforeSubmit:function(curform){

			//鏍￠獙鍦板尯鏄惁鍏ㄩ儴閫夋嫨
			var detailAddresses = $("#ipt_dvroot").val();
			if(detailAddresses==""){
			$(".hhh").append("<span class=\"Validform_wrong\">璇烽€夋嫨鍦板尯锛�</span>");
				return false;
			}
			var detailAddressesArr = detailAddresses.split(",");
			var detailAddresses = detailAddressesArr[detailAddressesArr.length-1];
			var areaCode=detailAddresses.split("|");
			if(areaCode[0].length <12){
				$(".hhh").append("<span class=\"Validform_wrong\">璇烽€夋嫨鍦板尯鍒版渶鍚庝竴绾э紒</span>");
				return false;
			}
			$("#areaCode").val(areaCode[0]);
			
			checkImgCode($("#imgCheckCode"));
			//鏍￠獙鎵嬫満楠岃瘉鐮佹槸鍚﹂獙璇侀€氳繃
			var valueCode = $("#mobileCode").val();
			if(!isValid || valueCode==null || valueCode ==""){
				$("#mobileRightMsg").hide();
				$("#mobileErrorMsg").show();
				$("#mobileCode").addClass("Validform_error");
				return false;
			}
			$("#code").val(valueCode);
		}
	});
}

/**
 * desc:鍊掕鏃�
 * @author qiyasen
 */
var wait = 60, t;
function times(SpanId){
	//鍒ゆ柇鏄惁杩囦簡60绉�
	if (wait == 0) {
		wait = 60;
//		$(".search_bj").attr("disabled",false);
		$(".search_bj").unbind();
		$(".search_bj").click(function(){
			sendMoible(this);
		});
		$(SpanId).find("em").text("閲嶆柊鍙戦€侀獙璇佺爜");
		$("#idSpan").addClass("hide");
	} else {
		wait--;
		$("#idSpan").removeClass("hide");
//		$(".search_bj").attr("disabled",true);
		$("#idSpan").html("宸插悜鎮ㄧ殑鎵嬫満鍙戦€佷簡鍏嶈垂鐨勯獙璇佺爜鐭俊锛岃鏌ユ敹銆傛垨绛夊緟"+wait+"绉掑悗閲嶈瘯銆�");
		setTimeout(function(){times(SpanId)}, 1000);
	}
}

function await(){
	alert("宸插悜鎮ㄧ殑鎵嬫満鍙戦€佷簡鍏嶈垂鐨勯獙璇佺爜鐭俊锛岃鏌ユ敹銆傛垨绛夊緟"+wait+"绉掑悗閲嶈瘯銆�");
}

/**
 * desc:鍙戦€佹墜鏈虹煭淇�
 * @author qiyasen
 */
function sendMoible(SpanId){
	$(".prompt").addClass('hide');
	var proPath=$("#proPath").val();
	var mobile=$("#mobile").val();
	var account=$("#account").val();
	var siteId=$("#siteId").val();
	//鍙戦€佹墜鏈轰箣鍓嶅垽鏂敤鎴峰悕鏄惁杈撳叆	
	var bool=$("#account").eq(0).hasClass('Validform_error');
	if(bool){
		$("#accountCheck").removeClass("hide");
		$("#account").focus();
		return;
	}else{
		$("#accountCheck").addClass("hide");
	}
	//濡傛灉涓嶇瓑浜�60绉掍笉鑳藉啀娆″崟鍑�
	if(wait!=60){
		return;
	}
	if(!isMobile(mobile)){
		$("#mobile").focus();
		return;
	}
	
	checkImgCode($("#imgCheckCode"));
	if(!isValid){
		$("#imgCheckCode").focus();
		return;
	}

	$.post(proPath+"/login/sendMessageReg/"+mobile, {
		mobile : mobile,
		account :account,
		siteId:siteId
	}, function(data) {
	   if("-1"==data){
		   $("#mobileSendLimit").removeClass("hide");
		   wait=60;
	   }else if(data=="-2"){
		   $("#accountCheck").removeClass("hide");
	   }else{
		   $("#mobileSendLimit").addClass("hide");
		   times(SpanId);
		   wait=59;
		   $(".search_bj").unbind();
		   $(".search_bj").click(function(){
			   await();
		   });
	   }
	});
}

/**
 * 楠岃瘉鎵嬫満
 * @param value
 * @returns {Boolean}
 */
function isMobile(value){
	var re= /^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|17[0-9]{9}$|18[0-9]{9}$/;
    return (re.test(value));
}

var bool=false;
/**
 * 楠岃瘉鎵嬫満
 * @returns {Boolean}
 */
function checkMobile(){
	var mobile=$("#pMobile").val();
	if(mobile==null||mobile==""){
		$("#sapnWrong4").text("涓嶈兘涓虹┖");
		$("#sapnWrong4").attr("class","Validform_checktip2 Validform_wrong2");
		$("#sapnWrong4").show();
		return false;
	}
	if(!isMobile(mobile)){
		$("#sapnWrong4").text("璇疯緭鍏ユ纭殑鎵嬫満鏍煎紡");
		$("#sapnWrong4").attr("class","Validform_checktip2 Validform_wrong2");
		$("#sapnWrong4").show();
		return false;
	}
	 $("#sapnWrong4").attr("class","Validform_checktip2 Validform_right2");
	   $("#sapnWrong4").text("");
	   $("#sapnWrong4").show();
	   bool= true;
}

/**
 * 鎵撳紑鏂伴〉闈�
 * @param url
 */
function openPage(url){
	window.open(url);
}

/**
 * 楠岃瘉鎵嬫満楠岃瘉鐮�
 * @param content
 * @param codeId
 */
function checkCode(content,codeId){
	$(".prompt").addClass('hide');
	isValid=false;
	var codeTypeValue=$("#"+content).val();
	if(!isMobile(codeTypeValue)){
//		  $("#"+content+"RightMsg").hide();
		  $("#"+codeId).addClass("Validform_error");
		  $("#"+content+"ErrorMsg").removeClass('hide');
		  return ;
	}
	var codeValue=$("#"+codeId).val();
	if(codeValue=="" || codeValue ==null || codeValue.length!=6){
//		 $("#"+content+"RightMsg").hide();
		 $("#"+codeId).addClass("Validform_error");
		  $("#"+content+"ErrorMsg").removeClass('hide');
		  return ;
	}
	 var proPath=$("#proPath").val();
	   $.post(proPath+"/login/checkCode", {code:codeValue,codeType:codeTypeValue}, function(data) {
		   if(data=="1"){
			   //姝ｇ‘
			   $("#"+content+"RightMsg").removeClass('hide');
//			   $("#"+content+"ErrorMsg").hide();
			   $("#"+codeId).removeClass("Validform_error");
			   isValid=true;
		   }else{
//			   $("#"+content+"RightMsg").hide();
			   $("#"+content+"ErrorMsg").removeClass('hide');
			   $("#"+codeId).addClass("Validform_error");
		   }
		});
}

/**
 * 楠岃瘉鐮侀獙璇�
 * @param obj
 */
function checkImgCode(obj){
	isValid = false;
	$("#imgCodeMsg").html('');
	$("#imgCodeMsg").removeClass('Validform_wrong');
	$("#imgCodeMsg").removeClass('Validform_right');
	$("#imgCodeMsg").hide();
	var codeValue = $(obj).val();
	if(codeValue=="" || codeValue ==null){
		$("#imgCodeMsg").addClass('Validform_wrong');
		$("#imgCodeMsg").html('楠岃瘉鐮佷笉鑳戒负绌猴紝璇疯緭鍏�');
		$("#imgCodeMsg").show();
		return ;
	}
   var proPath=$("#proPath").val();
	   $.ajax({  
	       type : "post",  
	        url : proPath+"/login/checkAccountCode",  
	        data : {param:codeValue},  
	        async : false,
	        dataType : "json",
	        success : function(data){  
	        	if(data.status=="y"){
	     		   //姝ｇ‘
	     			$("#imgCodeMsg").addClass('Validform_right');
	     			$("#imgCodeMsg").show();
	     		    isValid = true;
	     	   }else{
	     			$("#imgCodeMsg").addClass('Validform_wrong');
	     			$("#imgCodeMsg").html('楠岃瘉鐮佷笉姝ｇ‘锛岃閲嶆柊杈撳叆');
	     			$("#imgCodeMsg").show();
	     	   }
	        }  
	   });
}


function banInputSapce(e) {
	var keynum;
	if (window.event) // IE
	{
		keynum = e.keyCode
	} else if (e.which) // Netscape/Firefox/Opera
	{
		keynum = e.which
	}
	if (keynum == 32) {
		return false;
	}
	return true;
}

	