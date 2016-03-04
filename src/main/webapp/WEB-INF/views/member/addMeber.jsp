<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%-- <%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("articleDetail") != null ? request.getParameter("articleDetail") : "";
%> --%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="right" />
<title>会员注册</title>
<link href="${ctx}/admin/js/validation/style.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${ctx}/admin/js/validation/Validform_v5.3.2_common.js"
	language="javascript"></script>	


<script type="text/javascript">
function codeImage(){
	document.getElementById("rcodeimageId").src="${ctx}/validateCodeServlet?avc="+new Date();
}
</script>

<script type="text/javascript">
var rankForm;
$(function(){
 rankForm = $("#memberAdverForm").Validform({
	btnSubmit:"#confirm", 
	tiptype:3, 
	showAllError:false,
	 ajax:true,
	postonce:true,
	callback:function(data){
		//返回数据data是json对象，{"info":"demo info","status":"y"}
		//info: 输出提示信息;
		//status: 返回提交数据的状态,是否提交成功。如可以用"y"表示提交成功，"n"表示提交失败，在ajax_post.php文件返回数据里自定字符，主要用在callback函数里根据该值执行相应的回调操作;
		//你也可以在ajax_post.php文件返回更多信息在这里获取，进行相应操作；
		//ajax遇到服务端错误时也会执行回调，这时的data是{ status:**, statusText:**, readyState:**, responseText:** }；
 
		//这里执行回调操作;
		//注意：如果不是ajax方式提交表单，传入callback，这时data参数是当前表单对象，回调函数会在表单验证全部通过后执行，然后判断是否提交表单，如果callback里明确return false，则表单不会提交，如果return true或没有return，则会提交表单。
	}

});
});
</script>
</head>
<body>
	<div id="page-wrapper">
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">会员注册</div>
			</div>
			<ol class="breadcrumb page-breadcrumb">
				<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">当前位置</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li><a href="#">会员系统</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="active">会员注册</li>
			</ol>
			<div class="btn btn-blue reportrange hide">
				<i class="fa fa-calendar"></i>&nbsp;<span></span>&nbsp;report&nbsp;<i
					class="fa fa-angle-down"></i> <input type="hidden" name="datestart" />
				<input type="hidden" name="endstart" />
			</div>
			<div class="clearfix"></div>
		</div>


		<div class="page-content" style="overflow-x: hidden;">
			<div class="row">
				<div class="col-lg-12">
			<div class="portlet box portlet-yellow">
				<div class="portlet-header">
					<div class="caption">会员注册</div>

				</div>
				 <div class="portlet-body">
				 
				 <form id="memberAdverForm"  action="${ctx}/register" method="post"  class="form-validate form-horizontal" >
					 
					   
					    
						 
 						<div class="form-group">
							<label for="" class="col-md-1 control-label"><span style="color:red">*</span>会员名:</label>
							<div class="col-md-5">
								<input type="text"  id="account" name="account" ajaxurl="${ctx}/member/sAccount"   datatype="/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/" errormsg="用户名为英文加数字的组合" class="form-control required" />
							 
							</div>							

						</div>
						 
					 
						
						
						<div class="form-group">
							<label for="" class="col-md-1 control-label"><span style="color:red">*</span>密码:</label>
							<div class="col-md-5">
								<input type="password"  id="password" name="password" datatype="*6-15" errormsg="密码范围在6~15位之间！"  class="form-control required" />
								<span id="namespan"></span>
							</div>							
						</div>
						
						
						<div class="form-group">
							<label for="" class="col-md-1 control-label"><span style="color:red">*</span>确认密码:</label>
							<div class="col-md-5">
								<input type="password"  id="double_pass" name="double_pass"   datatype="*" recheck="password" errormsg="您两次输入的账号密码不一致！" class="form-control required" />
								<span id="double_pass"></span>
							</div>							
						</div>
                             
 

								
						 <div class="form-group">
									<label class="col-md-1  control-label">公司名称：</label>
									<div class="col-md-5 ">
											<input type="text"  id="corporationName" name="corporationName" datatype="*"  class="form-control required" />
									 	<span id="corporationName"></span>
								</div>
						</div>
						    
						  <div class="form-group">
							<label for="" class="col-md-1 control-label"><span style="color:red">*</span>联系人姓名:</label>
							<div class="col-md-5">
								<input type="text"  id="linkMan" name="linkMan"  datatype="*"  class="form-control required" />
								<span id="linkMan"></span>
							</div>							
						</div>
						
						 <div class="form-group">
							<label for="" class="col-md-1 control-label"><span style="color:red">*</span>手机:</label>
							<div class="col-md-5">
								<input type="text"  id="mobile" name="mobile" datatype="m" class="form-control required" />
								<span id="namespan"></span>
							</div>							
 						</div>
 						
						 <div class="form-group">
						 <label for="" class="col-md-1 control-label"><span style="color:red">*</span>验证码：</label> 
						 
							 <div class="col-md-5">
						 	 <input id="vcode" name="vcode" class="text yzm" tabindex="2" type="text" value="" size="25" autocomplete="off"/> 
							<img id="rcodeimageId"
							onclick="codeImage()" src="${ctx}/validateCodeServlet" width="60"
							height="25" class="ml6" /> <a href="javascript:void(0);"
							onclick="codeImage()" class="yzm_blue ml6">换一张？</a>	
							</div>
						</div>
					 
						
						 	
						<div class="form-group">
							<div class="col-md-offset-3 col-md-10">
							 <input class="btn btn-success" type="submit" value="保存">			
								
								&nbsp;
								<a href="javascript:history.go(-1)"><button type="button" class="btn btn-default">返回</button></a>
							</div>
						</div>
					</form>
				</div>
			</div>
			</div></div>
		</div>
	</div>
	<!-- <script type="text/javascript">
	function check()
	{
		var str = document.getElementById("moName").value;
		var namespan = document.getElementById("namespan");
		reg = /^([\u4e00-\u9fa5]|[a-z]|[A-Z]|\d){2,12}$/;
		if(!str.match(reg)|| str=="" || str=="请您输入您的模块名称")
		{
			namespan.innerHTML="(模块名称只能输入2~12中文,英文,数字)";
			return false;
		}else{
			namespan.innerHTML="";
		}
		str = document.getElementById("moUrl").value;
		var urlspan = document.getElementById("urlspan");
		reg = /^[\S\\.\\-~!@#$%^&*+?:_/=<>{}]{5,}$/;
		if(!str.match(reg) || str=="" || str=="请您输入模块地址"){
			urlspan.innerHTML="(地址不能包含特殊字符请重新输入)";
			return false;
		}else{
			urlspan.innerHTML="";
		}
		
		str = document.getElementById("moSort").value;
		var sortspan = document.getElementById("sortspan");
		var reg = /[0-9]+/;
		if(!str.match(reg))
		{
			sortspan.innerHTML="(排序字段必须为数字)";
			return false;
		}else{
			sortspan.innerHTML="";
		}
		
		document.getElementById("moduleEditForm").submit();
	}

</script> -->
  <script type="text/javascript">
	KindEditor
			.ready(function(K) {
				var editor1 = K
						.create(
								'textarea[name="articleDetail"]',
								{
									cssPath : '${ctx}/admin/kindeditor-master/plugins/code/prettify.css',
									uploadJson : '${ctx}/admin/kindeditor-master/jsp/upload_json.jsp',
									fileManagerJson : '${ctx}/admin/kindeditor-master/jsp/file_manager_json.jsp',
									allowFileManager : true,
									afterCreate : function() {
										var self = this;
										K.ctrl(document, 13, function() {
											self.sync();
											document.forms['articleEditForm']
													.submit();
										});
										K.ctrl(self.edit.doc, 13, function() {
											self.sync();
											document.forms['articleEditForm']
													.submit();
										});
									}
								});
				prettyPrint();
			});
	/* jQuery(document).ready(function() {
		selectMenu("articles");
	}); */

	/*  发布时间的验证，发布日期不能为null */
	function checkpost() {
		if (advertiseEditForm.addTime.value == "") {
			alert("请您输入日期！");
			advertiseEditForm.addTime.focus();
			return false;
		}
	}
</script>
</body> 
</html>