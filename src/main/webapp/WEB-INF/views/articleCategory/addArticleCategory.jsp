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
<title>资讯类添加</title>
<meta name="decorator" content="right" />
<!-- 添加验证的 js --> 
<script type="text/javascript" src="${ctx }/media/Js/jquery.validate.min.js"></script>
</head>
<body>
	<div id="page-wrapper">
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">资讯类添加</div>
			</div>
			<ol class="breadcrumb page-breadcrumb">
				<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">当前位置</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li><a href="#">管理中心</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="active">资讯管理</li>
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
					<div class="caption">资讯类添加</div>

				</div>
				 <div class="portlet-body">
					<form action="${ctx }/articleCategory/save.html" name="articleEditForm"  id="articleEditForm" method="post"  onsubmit="return check();" enctype="multipart/form-data" class="form-validate form-horizontal">
					    <input type="hidden" name="id" >

								<!-- <div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>分类编码:</label>
									<div class="col-md-5">
										<input type="text" id="code" name="code"
											class="form-control required" /> <span id="namespan"></span>
									</div>

								</div> -->

								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>分类名称:</label>
									<div class="col-md-5">
										<input type="text" id="name" name="name" class="form-control required" /> 
										<span style="color:#ff0000" id="namespan"></span>
									</div>

								</div>



								<div class="form-group">
									<div class="col-md-offset-3 col-md-10">
										<input class="btn btn-success" id="sub" type="submit" value="保存">

										&nbsp; <a href="javascript:history.go(-1)"><button
												type="button" class="btn btn-default">返回</button></a>
									</div>
								</div>
							</form>
				</div>
			</div>
			</div></div>
		</div>
	</div>
	<script type="text/javascript">
function check(){
	var flag=true;
	//验证标题
	var arTitle=document.getElementById('name');
	if(arTitle.value==''||arTitle.value==null){
		document.getElementById('namespan').innerHTML='必填字段';
		flag=false;
	}else if(arTitle.value.length<3){
		document.getElementById('namespan').innerHTML='长度不能小于3';
		flag=false;
	}
	
	
	if(flag == true){
		        //正确,可以提交
		        return true;   
		    }else{
		        return false;   
		    }

}
</script>
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