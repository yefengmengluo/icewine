<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("articleDetail") != null ? request.getParameter("articleDetail") : "";
%>
<!DOCTYPE html>
<html>
<head>
<title>会员编辑</title>
<meta name="decorator" content="right" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 添加验证的 js --> 
<link href="${ctx}/admin/js/validation/style.css" type="text/css" rel="stylesheet" /> 
<script type="text/javascript" src="${ctx}/admin/js/validation/Validform_v5.3.2_common.js" language="javascript"></script>	
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
				<div class="page-title">会员编辑</div>
			</div>
			<ol class="breadcrumb page-breadcrumb">
				<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">当前位置</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li><a href="#">管理中心</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="active">会员管理</li>
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
							<div class="caption">会员编辑</div>

						</div>
						<div class="portlet-body">
							<form action="${ctx}/member/save.html" name="memberEditForm"
								id="memberAdverForm"  method="post" enctype="multipart/form-data"
								class="form-validate form-horizontal">
								<input type="hidden" name="memberId" value="${member.memberId }">
								<input type="hidden" name="memberId"
									value="${memberBasic.memberId }"> <input type="hidden"
									name="times" value="${member.times }"> <input
									type="hidden" name="times" value="${memberBasic.times }">
									
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>密码:</label>
									<div class="col-md-5">
									<!-- <input type="password" class="form-control required"  id="password2" name="password" datatype="*6-15" maxlength="16" nullmsg="请设置密码！" errormsg="请输入6-16个字母、数字，区分大小写"/>
									<span style="color: #ff0000" id="arTitle_err"></span> -->
									<input type="password"  id="password" name="password" datatype="*6-15" errormsg="密码范围在6~15位之间！"  class="form-control required" />
								    <span id="namespan"></span>
									 <!--  <i class="i_pass" id="namespan"></i> -->
									</div>






								</div>
								
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>确认密码:</label>
									<div class="col-md-5">
										<input type="password" class="form-control required" id="double_pass"
											name="double_pass" datatype="*" recheck="password"
											maxlength="16" nullmsg="请再输入一次密码" errormsg="您两次输入的账号密码不一致"  /> <span
											style="color: #ff0000" id="arTitle_err"></span>
									</div>
                                       <i class="i_pass" id="double_pass"></i>
								</div>
								
								


					<%-- <div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>公司名称:</label>
									<div class="col-md-5">
										<input type="text"  id="corporationName" name="corporationName"  value="${memberBasic.corporationName}" class="form-control required" />
								         <span style="color: #ff0000"  id="arTitle_err"></span>
									</div>

								</div>
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>邮箱:</label>
									<div class="col-md-5">
										<input type="text" id="email" name="email"
											value="${member.email }" class="form-control required" />
										<span id="namespan"></span>
									</div>

								</div>
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>QQ:</label>
									<div class="col-md-5">
										<input type="text"  id="qq" name="qq"  value="${member.qq}" class="form-control required" />
								         <span style="color: #ff0000"  id="arTitle_err"></span>
                       			</div>

								</div>
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>邮箱:</label>
									<div class="col-md-5">
										<input type="text"  id="account" name="account"  value="${member.account}" class="form-control required" />
								         <span style="color: #ff0000"  id="arTitle_err"></span>
									</div>

								</div>
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>移动电话:</label>
									<div class="col-md-5">
										<input type="text"  id="mobile" name="mobile"  value="${member.mobile}" class="form-control required" />
								         <span style="color: #ff0000"  id="arTitle_err"></span>
									</div>

								</div>
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>固定电话:</label>
									<div class="col-md-5">
										<input type="text"  id="telephone" name="telephone"  value="${member.telephone}" class="form-control required" />
								         <span style="color: #ff0000"  id="arTitle_err"></span>
									</div>

								</div> --%>
								 	
														
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
	<script type="text/javascript">
       /*   function check(){
	var flag=true;
	//验证标题
	var arTitle=document.getElementById('title');
	if(arTitle.value==''||arTitle.value==null){
		document.getElementById('arTitle_err').innerHTML='必填字段';
		flag=false;
	}else if(arTitle.value.length<3){
		document.getElementById('arTitle_err').innerHTML='长度不能小于3';
		flag=false;
	}
	//验证会员内容长度
	var arDetail=document.getElementById('articleDetail');
	if(arDetail.value==''||arDetail.value==null){
		document.getElementById('arDetail_err').innerHTML='必填字段';
		flag=false;
	}
	//验证标签长度
	var arTag=document.getElementById('tag');
	if(arTag.value==''||arTag.value==null){
		document.getElementById('tag_error').innerHTML='必填字段';
		flag=false;
	}
	
	if(flag == true){
		        //正确,可以提交
		        return true;   
		    }else{
		        return false;   
		    }

} */
</script>
</body> 
</html>