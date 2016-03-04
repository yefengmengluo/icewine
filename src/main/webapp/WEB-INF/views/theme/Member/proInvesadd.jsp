<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("summary") != null ? request
			.getParameter("summary") : "";
%>
<!DOCTYPE html>
<html>
<head>
<script src="${ctx }/admin/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${ctx}/media/Js/jquery-1.8.0.min.js"
	language="javascript"></script>
<script src="${ctx}/admin/date/WdatePicker.js"></script>
<script src="${ctx}/admin/date/calendar.js"></script>
<link href="${ctx}/admin/date/skin/WdatePicker.css" rel="stylesheet"
	type="text/css">
<link type="text/css" rel="stylesheet"
	href="${ctx }/admin/vendors/jquery-ui-1.10.4.custom/css/ui-lightness/jquery-ui-1.10.4.custom.min.css">
<link type="text/css" rel="stylesheet"
	href="${ctx }/admin/vendors/font-awesome/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet"
	href="${ctx }/admin/vendors/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="${ctx }/admin/vendors/animate.css/animate.css">
<link type="text/css" rel="stylesheet"
	href="${ctx }/admin/css/themes/style1/orange-blue.css"
	class="default-style">
<link type="text/css" rel="stylesheet"
	href="${ctx }/admin/css/themes/style1/orange-blue.css"
	id="theme-change" class="style-change color-change">
<link rel="stylesheet"
	href="${ctx}/admin/kindeditor-master/themes/default/default.css" />
<link rel="stylesheet"
	href="${ctx}/admin/kindeditor-master/plugins/code/prettify.css" />
<script charset="utf-8"
	src="${ctx}/admin/kindeditor-master/kindeditor-all-min.js"></script>
<script charset="utf-8"
	src="${ctx}/admin/kindeditor-master/lang/zh-CN.js"></script>
<script charset="utf-8"
	src="${ctx}/admin/kindeditor-master/plugins/code/prettify.js"></script>
<script src="${ctx}/admin/js/area.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/media/Css/base1.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/media/Css/index-sales.css" type="text/css"
	rel="stylesheet" />
<meta name="decorator" content="top" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 发布时间的验证，发布日期不能为null -->
<script type="text/javascript">
KindEditor.ready(function(K) {
	var editor1 = K.create('textarea[name="summary"]', {
		cssPath : '${ctx}/admin/kindeditor-master/plugins/code/prettify.css',
		uploadJson : '${ctx}/admin/kindeditor-master/jsp/upload_json.jsp',
		fileManagerJson : '${ctx}/admin/kindeditor-master/jsp/file_manager_json.jsp',
		allowFileManager : true,
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['proInvestmentEditForm'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['proInvestmentEditForm'].submit();
			});
		}
	});
	prettyPrint();
});
/* jQuery(document).ready(function() {
	selectMenu("advertises") ;
}); */
     function checkpost(){
		if(proInvestmentEditForm.name.value==""){
			alert("请您输入标题！");
			proInvestmentEditForm.name.focus();
			return false;
		} 
    	if(proInvestmentEditForm.expireTime.value==""){
    		alert("请您输入日期！");
    		proInvestmentEditForm.expireTime.focus();
    		return false;
    	} 
    	
     }
function choose(obj){
	 var index = obj.selectedIndex;
	alert(obj.children[index].options);
	//假如每个option中有值，可以使用obj.children[index].innerHTML取得
	}
function doupdate(){
			var url = "${ctx}/front/member/proInvsave.html" ;
			$("#proInvestmentEditForm").attr("action",url).submit() ;	
		
	}
</script>
<title>发布采购单</title>
</head>
<body>
	<div id="">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<!--BEGIN CONTENT-->
		<div class="page-content" style="overflow-x: hidden;">
			<div class="">
				<div class="col-lg-12">
					<div class="portlet box portlet-yellow">

						<div class="portlet-body">
							<form action="" name="proInvestmentEditForm"
								id="proInvestmentEditForm" method="post"
								onsubmit="return checkpost();" enctype="multipart/form-data"
								class="form-validate form-horizontal">
								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>标题名称:</label>
									<div class="col-md-5">
										<input type="text" id="name" name="name"
											class="form-control required" /> <span id="namespan"></span>
									</div>

								</div>



								<div class="form-group">
									<label class="col-md-2  control-label">图片:</label>
									<div class="col-md-5 ">
										<input name="files" type="file" class=""
											accept="image/gif, image/jpeg,image/png"> <input
											name="pic" type="hidden">
										<p style="color: #ff0000">图片文件大小：不能超过5M</p>
									</div>
								</div>

								<div class="form-group">
									<label for="" class="col-md-2 control-label">品牌:</label>
									<div class="col-md-5">
										<input type="text" id="brandName" name="brandName"
											class="form-control required" /> <span id="urlspan"></span>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-2 control-label"> 报价截止日期: </label>
									<div class="col-md-5">
										<input id="expireTime" readonly="readonly" name="expireTime"
											class="form-control"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:false})" />

									</div>
								</div>

								<div class="form-group">
									<label for="" class="col-md-2 control-label">基本投资额(万元):</label>
									<div class="col-md-2">
										<input type="text" id="basicInvestment" name="basicInvestment"
											class="form-control required" /> <span id="urlspan"></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 加盟金额: </label>
									<div class="col-md-5">
										<select id="siteId" name="siteId" class="form-control">
											<option value="1">1万以下</option>
											<option value="2">1—3万</option>
											<option value="3">3—10万</option>
											<option value="4">10—30万</option>
											<option value="5">30万以上</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label for="" class="col-md-2 control-label">保证金额(万元):</label>
									<div class="col-md-2">
										<input type="text" id="guaranteeSum" name="guaranteeSum"
											class="form-control required" /> <span id="urlspan"></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">区域要求 : </label>
									<div class="col-md-2">
										<select id="sysArea1" class="form-control area">
										</select>
									</div>
									<div class="col-md-2">
										<select id="sysArea2" class="form-control area">
										</select>
									</div>

									<div class="col-md-2">
										<select name="areaCode" id="sysArea3" class="form-control">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">产品说明:</label>
									<div class="col-md-11 ">
										<textarea name="summary" rows="20" class="form-control"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-offset-3 col-md-10">
										<input class="btn btn-success" type="button" value="保存"
											onclick="doupdate()">
										<!-- <a href="javascript::" onclick="check()" class="btn btn-success" style="display:inline-block;">保存</a> -->
										&nbsp; <a href="javascript:history.go(-1)"><button
												type="button" class="btn btn-default">返回</button></a>
									</div>
								</div>


							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
	$(function(){
		var ctx = "${ctx}";
		
		//收货地址
		var currentCode = ${proInvestment.areaCode}+"";
		loadAreaMes(ctx,currentCode,'sysArea1','sysArea2','sysArea3');
		
		
});
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

</script>
</body>
</html>