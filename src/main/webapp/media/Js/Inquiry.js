function openDialogInfo(productId,toMemberId) {
		var inquiryDialog = art.dialog({
			id:'inquiry',
			title : "询盘基本信息",
			lock : true,
			zIndex : 100000,
			width : 600,
			resize : false,
			drag : false
		});
		/**程序开发时要删掉**/
		var inquiryDiv = document.getElementById("inquiryDiv");
		inquiryDialog.content(inquiryDiv);// 填充对话框内容
		/**
		**程序开发时要放开
		$.ajax({
			type : "get",
			url : "/inquiry?productId="+productId+"&toMemberId="+toMemberId,
			success : function(data) {
				inquiryDialog.content(data);// 填充对话框内容
			}
		});
		**/
	}
function openDialog(productId,toMemberId) {
		var inquiryDialog = art.dialog({
			id:'inquiry',
			title : "询盘基本信息",
			lock : true,
			zIndex : 100000,
			width : 600,
			resize : false,
			drag : false
		});
		$.ajax({
			type : "get",
			url : "/inquiry?productId="+productId+"&toMemberId="+toMemberId,
			success : function(data) {
				inquiryDialog.content(data);// 填充对话框内容
			}
		});
	}

//询盘提及验证
function doinquiry(productId,toMemberId,type){
	var title=$("textarea[name=title]").val();
	var corpName=$("input[name=corpName]").val();
	var email=$("input[name=email]").val();
	var tel=$("input[name=tel]").val();
	var mobile=tel;
	var linkMan=$("input[name=linkMan]").val();
	if(corpName==""||corpName.indexOf("如：北京昌隆电气设备有限公司")>=0){
		 art.dialog({title: '温馨提示',
			 	lock : true,
			    content: '请输入公司名称',
			    icon: 'error'});
		return;
	}
	if(linkMan==""||linkMan.indexOf("如：张三")>=0){
		 art.dialog({title: '温馨提示',
			    content: '请输入联系人',
			    lock : true,
			    icon: 'error'});
		return;
	}
	if(tel==""||tel.indexOf("如：固定电话或手机号")>=0){
		 art.dialog({title: '温馨提示',
			    content: '请输入联系方式',
			    lock : true,
			    icon: 'error'});
		return;
	}
	if(imageCheck("shop_product_inquiry_image")){
		var submitUrl="/doinquiry";
		
		var content="";
		$.post(submitUrl,{"toMemberId":toMemberId,"productId":productId,"title":title,"corpName":corpName,"email":email,"tel":tel,"mobile":mobile,"linkMan":linkMan},function(result){
			if(result=="sameUser"){
				art.dialog({title: '温馨提示',
				    content: '不能对自己发布的信息询盘',
				    lock : true,
				    icon: 'error'});
			}else if(result=="isLogin"){
				content=$("#shop_product_inquiry_login_success").html();
				openProductInquiry(content);
				art.dialog({id:'inquiry'}).close();	
			}else if(result=="notLogin"){
				content=$("#shop_product_inquiry_success").html();
				openProductInquiry(content);
				art.dialog({id:'inquiry'}).close();	
			}else{
				art.dialog({title: '温馨提示',
				    content: '出现异常，询盘失败',
				    lock : true,
				    icon: 'error'});
			}
			
		});	
	}else{
		codeImage('/vcode/image');
	}
	
}
/*打开提示框
 **/
function openProductInquiry(content){
	art.dialog({
		id:"shop_product_inquiry",
		title : "温馨提示",
		lock : true,
		border : false,
		resize : false,
		drag : false,
		width:600,
		content:content
	});
}
/*提示框中弹框关闭
 */
$(".btn_inquiry_cancel").live("click",function(){
	 art.dialog.get('shop_product_inquiry').close();
});

//验证码切换
function codeImage(url) {
	document.getElementById("rcodeimage").src =  url+"?timestamp="+new Date();
}

/* 图片验证码
 **/
function imageCheck(id){
	var bol=false;
	var imageCode=$("#"+id).val();
	if(imageCode!=""&&imageCode.length==4){
		$.ajax({url:"/vcode/check?vocde="+imageCode,async:false,success:function(data){
			if(data){
				bol= true;
			}else{
				 art.dialog({title: '温馨提示', content: '验证码错误',lock : true, icon: 'error'});
				bol= false
			}
		}});
	}else{
		art.dialog({title: '温馨提示',content: '请输入正确验证码',lock : true, icon: 'error'});
		bol= false;
	}
	return bol;	
}
/**程序开发时要删掉，询盘成功时未登录**/
function openDialogInfoOfLogin(type) {
		var shop_product_inquiry_success;
		if(type==0){
			 shop_product_inquiry_success = document.getElementById("shop_product_inquiry_success");
		}else{
			 shop_product_inquiry_success = document.getElementById("shop_product_inquiry_login_success");
		}
		
		openProductInquiry(shop_product_inquiry_success);// 填充对话框内容
		
	}