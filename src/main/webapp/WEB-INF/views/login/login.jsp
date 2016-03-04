<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="text/css" rel="stylesheet" href="http://static.99114.com/static/login/css/style0426.css">
<title>登录</title>
<script src="http://static.99114.com/static/login/js/jquery.min.js" type="text/javascript"></script>	
<script src="${ctx }/admin/js/bootstrap.min.js"></script>
<link href="${ctx }/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">

<link href="${ctx }/admin/css/animate.css" rel="stylesheet">
<link href="${ctx }/admin/css/style.css" rel="stylesheet">
<script type="text/javascript">
function codeImage(){
	document.getElementById("rcodeimageId").src="${ctx}/validateCodeServlet?avc="+new Date();
}

$(document).ready(function(){
	
	$(document).keyup(function(event){
		  if(event.keyCode ==13){
			  //回车键绑定查询方法
			  checksubmit();
		  }
	});
	
	$("#account").bind("blur",function(){
		$("#account").removeClass("redBoreder");
	});
	$("#password").bind("blur",function(){
		$("#password").removeClass("redBoreder");
	});
	$("#vcode").bind("blur",function(){
		$("#vcode").removeClass("redBoreder");
	});
	
	var tt = '${errorMsg}';
	if(tt != null && tt != ''){
		if(tt == '1'){
			$("#account").val('${account}');
			$("#password").val('${password}');
			$("#vcode").addClass("redBoreder");
			$("#vcode").focus();
		}
		if(tt == '2'){
			$("#account").addClass("account");
			$("#account").focus();
		}
		if(tt == '3'){
			$("#account").val('${account}');
			$("#password").addClass("redBoreder");
			$("#password").focus();
		}
	}
});

 
function checksubmit(){
	var username = $("#account").val();
	if(username=='请输入用户名'){
		//$("#username").addClass("redBoreder");
		$("#account").focus();
		return;
	}
	
	var password = $("#password").val();
	if(password=='++++++'){
		//$("#password").addClass("redBoreder");
		$("#password").focus();
		return;
	}
	
	var vcode = $("#vcode").val();
	if(vcode==''){
		$("#vcode").focus();
		return;
	}
	$("#loginForm").submit();
}

</script>
</head>
<body class="blue-bg">

	<div class="middle-box text-center loginscreen animated fadeInDown">
		<div>
			<div>

				<h1 class="logo-name"></h1>

			</div>
			<h3>用户登录</h3>
			<p></p>
			<!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->

			<!-- <p>中国网库</p> -->
			<form class="m-t" role="form" action="${ctx}/login.html" method="post" id="loginForm">
			<input type="hidden" value="LT-308411-pIBc7QcqslModZLVFj5ETenWvjy9re" name="lt">
					<input type="hidden" value="e1s1" name="execution">
					<input type="hidden" value="submit" name="_eventId">
			   <div class="form-group">
			
				<input type="text" name="account" class="form-control" placeholder="用户名"  id="account" onmouseover="this.style.borderColor='#41d6d6'" onmouseout="this.style.borderColor='#ccc'" onchange="" onfocus="if(this.value == '请输入用户名') {this.value=''};this.style.borderColor='#41d6d6';" onblur="this.style.borderColor='#ccc';if(this.value=='') {this.value='请输入用户名';this.style.color = '#ccc'};" onkeydown="this.style.color='black';" >
				</div>
				<div class="form-group">
					<input type="password"  name="password" autocomplete="off" size="25" id="password"  tabindex="2"  class="form-control"  placeholder="密码"	   onmouseover="this.style.borderColor='#41d6d6'" onmouseout="this.style.borderColor='ccc'" onchange="" onfocus="if(this.value == '++++++') {this.value=''};this.style.borderColor='#41d6d6';" onblur="this.style.borderColor='#ccc';if(this.value=='') {this.value='++++++';this.style.color = '#ccc'};"onkeydown="this.style.color='black';">
				</div>
				<div class="form-group" style="position: relative;">
					
				    <input type="text" autocomplete="false"  placeholder="验证码" size="8" value="" tabindex="3" class="form-control-code" name="vcode" id="vcode" onmouseover="this.style.borderColor='#41d6d6'" onmouseout="this.style.borderColor=''">
					
					<img id="rcodeimageId" onclick="codeImage()" src="${ctx}/validateCodeServlet" width="85" height="34" />
					<a onclick="codeImage()" href="javascript:void(0);"><i style="position: absolute; padding-left: 114px;top: 20px; color: white">换一张</i></a>
				</div>
				<button type="submit" class="btn btn-primary block full-width m-b">登录</button>


			</form>
			<p class="m-t">
				<small>中国冰酒交易网 &copy;
					2015</small>
			</p>
		</div>
	</div>

	<!-- Mainly scripts -->

<script src="http://static.99114.com/static/login/js/jquery.min.js" type="text/javascript"></script>	       
<script type="text/javascript">
    $(".login_btn").click(function(){
		$("#butlogin").removeClass("login_btn");
		$("#butlogin").addClass("login_btn_on");
	})
  
  var bg_img = $('.login_con'),bgArr = [],p_bgPic = ['bg_login.jpg','bg_login1.jpg','bg_login2.jpg','bg_login3.jpg','bg_login4.jpg','bg_login5.jpg'];
	for(var i = 0,len = p_bgPic.length;i &lt; len;i++){
		bgArr.push(p_bgPic[i]);
		}
	var bg_Data = bgArr[Math.floor(Math.random() * (bgArr.length))];
	 bg_img.css("background-image","url(http://static.99114.com/static/login/images/"+bg_Data+")").css("background-position","center top");
		

var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?f160a8c6f9e75fcc0c45d38950c1b318";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</body>

</html>
