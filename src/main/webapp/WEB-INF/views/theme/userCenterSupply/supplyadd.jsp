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

		<script src="${ctx}/admin/date/WdatePicker.js"></script>
<script src="${ctx}/admin/date/calendar.js"></script>
<link href="${ctx}/admin/date/skin/WdatePicker.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="${ctx }/admin/vendors/jquery-ui-1.10.4.custom/css/ui-lightness/jquery-ui-1.10.4.custom.min.css">
<link type="text/css" rel="stylesheet" href="${ctx }/admin/vendors/font-awesome/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="${ctx }/admin/vendors/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${ctx }/admin/vendors/animate.css/animate.css">
<link type="text/css" rel="stylesheet" href="${ctx }/admin/css/themes/style1/orange-blue.css" class="default-style">
<link type="text/css" rel="stylesheet" href="${ctx }/admin/css/themes/style1/orange-blue.css" id="theme-change" class="style-change color-change">
<link rel="stylesheet" href="${ctx}/admin/kindeditor-master/themes/default/default.css" />
<link rel="stylesheet" href="${ctx}/admin/kindeditor-master/plugins/code/prettify.css" />
<script charset="utf-8" src="${ctx}/admin/kindeditor-master/kindeditor-all-min.js"></script>
<script charset="utf-8" src="${ctx}/admin/kindeditor-master/lang/zh-CN.js"></script>
<script charset="utf-8" src="${ctx}/admin/kindeditor-master/plugins/code/prettify.js"></script>
<script src="${ctx}/admin/js/area.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/media/Css/base1.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/media/Css/index-sales.css" type="text/css" rel="stylesheet" />
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
				document.forms['supplystmentEditForm'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['supplystmentEditForm'].submit();
			});
		}
	});
	prettyPrint();
});
     function checkpost(){
    	if(proInvestmentEditForm.addTime.value==""){
    		alert("请您输入日期！");
    		proInvestmentEditForm.addTime.focus();
    		return false;
    	} 
     }

  
     
</script>
<title>发布采购单</title>
</head>
<body>
	<div id="">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		


		<!--BEGIN CONTENT-->
		<div class="page-content" style="overflow-x: hidden;">
			<div class="row">
				<div class="col-lg-12">
					<div class="portlet box portlet-yellow">
						
						<div class="portlet-body">
							<form action="${ctx }/front/member/supply/save.html" name="supplystmentEditForm" id="supplystmentEditForm" method="post" onclick="checkpost()" enctype="multipart/form-data" class="form-validate form-horizontal">
								  <input type="hidden" name="id" > 
								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>标题名称:</label>
									<div class="col-md-5">
										<input type="text" id="name" name="name"
											class="form-control required" /> <span id="namespan"></span>
									</div>

								</div>
                              
                              <div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>最低价格:</label>
									<div class="col-md-5">
										<input type="text" id="priceMin" name="priceMin"
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
									<label class="col-md-2 control-label"> 添加时间: </label>
									<div class="col-md-5">
										<input id="addTime" readonly="readonly" name="addTime"
											class="form-control"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:false})" />

									</div>
								</div>
								
								<div class="form-group">
									<label for="" class="col-md-2 control-label">计量单位:</label>
									<div class="col-md-5">
										<input type="text" id="unit" name="unit"
											class="form-control required" /> <span
											id="urlspan"></span>
									</div>
								</div>
							    <div class="form-group">
									<label for="" class="col-md-2 control-label">库存:</label>
									<div class="col-md-5">
										<input type="text" id="storeNum" name="storeNum"
											class="form-control required" /> <span
											id="urlspan"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-md-2 control-label">市场价:</label>
									<div class="col-md-5">
										<input type="text" id="promotionType" name="promotionType"
											class="form-control required" /> <span
											id="urlspan"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-md-2 control-label">企业价:</label>
									<div class="col-md-5">
										<input type="text" id="priceInner" name="priceInner"
											class="form-control required" /> <span
											id="urlspan"></span>
									</div>
								</div>

								<div class="form-group">
			                        <label class="col-md-2 control-labe">
							                           所属栏目：
			                        </label>
			                        <div class="col-md-5">
			                        	<select name="classCode" class="form-control">	
										 <c:forEach var="classCode" items="${category}">
													<option ${list.classCode == classCode.code?'selected':""} value="${classCode.code}">${classCode.name}</option>                        			
			                        		</c:forEach> 		             					            
			                        	</select>
			                        </div>
			                    </div> 

								

								
								<div class="form-group">
									<label class="col-md-2 control-label">产品详情:</label>
									<div class="col-md-11 ">
										<textarea name="summary" rows="20" class="form-control"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-offset-3 col-md-10">
										<input class="btn btn-success" type="submit" value="保存">
											
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















