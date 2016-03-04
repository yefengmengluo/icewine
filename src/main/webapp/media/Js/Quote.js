/** 报价弹窗* */
function toquote(id, status) {
	var quoteDialog = art.dialog({
		id:'quote',
		title : "报价基本信息",
		lock : true,
		zIndex : 100000,
		resize : false,
		drag : false
	});
	var toquoteDiv = document.getElementById("toquote");
	quoteDialog.content(toquoteDiv);// 填充对话框内容,在做程序的时候要删掉
	
	/**这里代码在做程序的时候要放开
	$.ajax({
		type : "post",
		url : "/quote/toquote?id=" + id + "&status=" + status,
		dataType : "html",
		success : function(data) {
			quoteDialog.content(data);// 填充对话框内容
		}
	});
	**/
}
/**这个JS在做程序的时候要删掉**/
function toLogin(){
	var quoteDialog = art.dialog({
		id:'quote',
		title : "报价基本信息",
		lock : true,
		zIndex : 100000,
		resize : false,
		drag : false
	});
	var toLoginDiv = document.getElementById("toLogin");
	quoteDialog.content(toLoginDiv);
}
/**
隐藏报价弹窗
**/
function hideQuoteDIV(){
	 art.dialog.get('quote').close();
}
/**验证报价表单**/
function verification(index) {
	var nvoiceRate = document.getElementById("nvoiceRate");
	var linkman = document.getElementById("linkman");
	var tel = document.getElementById("tel");
	var message = document.getElementById("message");
	var vcode = document.getElementById("vcode");
	if (nvoiceRate.value != "") {
		if (isNaN(nvoiceRate.value)) {
			art.dialog({title: '温馨提示',
			    content: "发票税点必须是数字!",
			    lock : true,
			    icon: 'error'});
			nvoiceRate.focus();
			return false;
		} else {
			if (nvoiceRate.value <= 0.00 || nvoiceRate.value >= 99.99) {
				art.dialog({title: '温馨提示',
				    content: "发票税点必须是大于0小于99!",
				    lock : true,
				    icon: 'error'});
				nvoiceRate.focus();
				return false;
			}

		}

	}
	var hasInputPrice=false;
	for ( var i = 0; i < index; i++) {
		var unitPrice = document.getElementById("unitPrice" + i);
		var priceUnit = document.getElementById("priceUnit" + i);
		if (unitPrice.value != "") {
			hasInputPrice=true;
			if (isNaN(unitPrice.value)) {
				art.dialog({title: '温馨提示',
				    content: "单价必须是数字!",
				    lock : true,
				    icon: 'error'});
				unitPrice.focus();
				return false;
			} else {
				if(priceUnit.value==0){
					if (unitPrice.value <= 0.00 || unitPrice.value >= 999999999.99) {
						art.dialog({title: '温馨提示',
						    content: "单价必须是大于0小于10亿!",
						    lock : true,
						    icon: 'error'});
						unitPrice.focus();
						return false;
					}
				}else{
					if (unitPrice.value <= 0.00 || unitPrice.value >= 99999.99) {
						art.dialog({title: '温馨提示',
						    content: "单价必须是大于0小于10亿!",
						    lock : true,
						    icon: 'error'});
						unitPrice.focus();
						return false;
					}
				}
				

			}
			break;
		} 
	}
	if(!hasInputPrice){
		art.dialog({title: '温馨提示',
		    content: "单价不能为空!",
		    lock : true,
		    icon: 'error'});
		unitPrice.focus();
		return false;
	}
	if (linkman.value == null || linkman.value == "") {
		art.dialog({title: '温馨提示',
		    content: "联系人不能为空!",
		    lock : true,
		    icon: 'error'});
		linkman.focus();
		return false;
	} else {
		if (strlen(linkman.value) > 16) {
			art.dialog({title: '温馨提示',
			    content: "联系人不能超过16个字符!",
			    lock : true,
			    icon: 'error'});
			linkman.focus();
			return false;
		}

	}

	if (tel.value == null || tel.value == "") {
		art.dialog({title: '温馨提示',
		    content: "电话不能为空!",
		    lock : true,
		    icon: 'error'});
		tel.focus();
		return false;
	} else {
		if (strlen(tel.value) > 32) {
			art.dialog({title: '温馨提示',
			    content: "电话不能超过32个字符!",
			    lock : true,
			    icon: 'error'});
			tel.focus();
			return false;
		}
	}
	
		if (strlen(message.value) > 800) {
			art.dialog({title: '温馨提示',
			    content: "我的询问不能超过 800个字符!",
			    lock : true,
			    icon: 'error'});
			message.focus();
			return false;
		}

	
	if (vcode.value == null || vcode.value == "") {
		art.dialog({title: '温馨提示',
		    content: "验证码不能为空!",
		    lock : true,
		    icon: 'error'});
		vcode.focus();
		return false;
	} else {
		if (strlen(vcode.value) > 4) {
			art.dialog({title: '温馨提示',
			    content: "验证码不能超过4个字符!",
			    lock : true,
			    icon: 'error'});
			vcode.focus();
			return false;
		}

	}
	if(imageCheck("vcode")){
		var queryStringTmp = $('#quotefrom').serialize();
		queryStringTmp = decodeURIComponent(queryStringTmp,true);
		queryStringTmp=encodeURI(encodeURI(queryStringTmp,"utf-8"));
		$.ajax({
			
			url :'/quote/doquote',
			data : queryStringTmp,
			type : "POST",
			beforeSend : function()
			{
				$("#submitBtn").hide();
			},
			success : function(data)
			{
				if(data=="提交成功!"){
					art.dialog({title: '温馨提示',
					    content: '提交成功!',
					    lock : true,
					    icon: 'succeed'});
					art.dialog({id:'quote'}).close();	
				}else{
					art.dialog({title: '温馨提示',
						 lock : true,
					    content: data,
					    icon: 'error'});
					$("#submitBtn").show();
				}
        		
			}
		});
	}
}
function strlen(str) {
	var len = 0;
	for ( var i = 0; i < str.length; i++) {
		var c = str.charCodeAt(i);
		// 单字节加1
		if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
			len++;
		} else {
			len += 2;
		}
	}
	return len;
}
/* 图片验证码
 **/
function imageCheck(id){
	var bol=false;
	var imageCode=$("#"+id).val();
	if(imageCode!=""&&imageCode.length==4){
		/**程序开发的时候要放开这里
		$.ajax({url:"/vcode/check?vocde="+imageCode,async:false,success:function(data){
			if(data){
				bol= true;
			}else{
				 art.dialog({title: '温馨提示',
					    content: '验证码错误',
					    lock : true,
					    icon: 'error'});
				bol= false
			}
		}});
		**/
		
		//程序开发的时候这里要删掉
		 art.dialog({title: '温馨提示',
					    content: '验证码错误',
					    lock : true,
					    icon: 'error'});
				bol= false
	}else{
		art.dialog({title: '温馨提示',
		    content: '请输入正确验证码',
		    lock : true,
		    icon: 'error'});
		bol= false;
	}
	return bol;	
}

