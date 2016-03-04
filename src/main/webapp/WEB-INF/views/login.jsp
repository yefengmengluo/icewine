<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="http://static.99114.com/static/login/css/style0426.css">
<title>登录页</title>
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
<body>
<iframe frameborder="0" src="http://member.99114.com/common/header_iframe.jsp?siteId=10046" scrolling="no" style="width:100%;height:103px!important; height:106px\9; +height:103px; border:none; " framewidth="0" allowtransparency="true"> </iframe>
 
	<input type="hidden" value="http://checkin.99114.com:80/" id="proPath">
		<div class="all">   
			<div class="login_con" style="background-image: url(&quot;http://static.99114.com/static/login/images/bg_login.jpg&quot;); background-position: center top;">
				<div class="area">
				<div class="cont_l">
					<i class="ty"> 
					<!-- <img width="96"
						height="25" src="http://static.99114.com/static/login/images/ty.png" /> -->
					</i>
					
					<!--2015-5-6　添加单品通试用入口-->
					<a target="_blank" href="http://zhuanti.99114.com/dptsj/page.html" alt="推广 得商机 促交易 7200元单品通－限时试用" title="推广 得商机 促交易 7200元单品通－限时试用">
						<img style="margin-top:-88px" class="txt pngimg" title="推广 得商机 促交易 7200元单品通－限时试用" alt="推广 得商机 促交易 7200元单品通－限时试用" src="http://static.99114.com/static/login/images/login-dptgg.png">
					</a>
					<!--2015-5-6　添加单品通试用入口　end-->
					
				</div>

				<form method="post" action="${ctx}/login/check" class="formbox" id="loginForm">
			        <input type="hidden" value="LT-308411-pIBc7QcqslModZLVFj5ETenWvjy9re" name="lt">
					<input type="hidden" value="e1s1" name="execution">
					<input type="hidden" value="submit" name="_eventId">
				<div class="login pngimg">
					<div style="padding:0 20px;">
						<h3>用户登录</h3>
						
						<dl>
							<dt>账 户：</dt>
							<dd>
							<input type="text" autocomplete="false" size="25" value="" accesskey="n" tabindex="1" class="input w248" name="account" id="account"  value="请输入用户名" onmouseover="this.style.borderColor='#41d6d6'" onmouseout="this.style.borderColor='#ccc'" onchange="" onfocus="if(this.value == '请输入用户名') {this.value=''};this.style.borderColor='#41d6d6';" onblur="this.style.borderColor='#ccc';if(this.value=='') {this.value='请输入用户名';this.style.color = '#ccc'};" onkeydown="this.style.color='black';">
							</dd>
						</dl>
						<dl>
							<dt>密 码：</dt>
							<dd>
							<input type="password" autocomplete="off" size="25" value="" tabindex="2" class="input w248" name="password" id="password"  onmouseover="this.style.borderColor='#41d6d6'" onmouseout="this.style.borderColor='ccc'" onchange="" onfocus="if(this.value == '++++++') {this.value=''};this.style.borderColor='#41d6d6';" onblur="this.style.borderColor='#ccc';if(this.value=='') {this.value='++++++';this.style.color = '#ccc'};"onkeydown="this.style.color='black';">
							</dd>
						</dl>
						<dl class="verify">
							<dt>验证码：</dt>
							<dd>
							<input type="text" autocomplete="false" size="8" value="" tabindex="3" class="input input01" name="vcode" id="vcode" onmouseover="this.style.borderColor='#41d6d6'" onmouseout="this.style.borderColor=''">
                        	
                        	<img id="rcodeimageId" onclick="codeImage()" src="${ctx}/validateCodeServlet" width="85" height="34" />
							<a onclick="codeImage()" href="javascript:void(0);"><i>换一张</i></a>
							</dd>
							
						</dl>
						<p>
						 <a href="${ctx}/register.html" class="register">免费注册</a>
						</p>
						<p>
		     <input type="button" onclick="checksubmit();" class="login_btn" />
		      <a href="${ctx}/forget.html">忘记密码了？</a>
						</p>
					</div>
						
					</div>
					</form>
				</div>
			</div>
	 
	 <div class="fram_footer">
		
<iframe width="100%" height="auto" frameborder="0" src="http://member.99114.com/common/bottom_iframe.jsp?siteId=10046" framewidth="0" allowtransparency="true" scrolling="no"></iframe>
	</div>
 </div>
	       
   
                    
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
    


</body></html>