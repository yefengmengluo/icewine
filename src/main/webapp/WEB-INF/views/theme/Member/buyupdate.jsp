<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("summary") != null ? request
			.getParameter("summary") : "";
%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="top" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${ctx}/admin/js/jquery-1.10.2.min.js"></script>
<script src="${ctx}/admin/js/jquery.validate.min.js"></script>

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
				document.forms['purchaseEditForm'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['purchaseEditForm'].submit();
			});
		}
	});
	prettyPrint();
});
      function checkpost(){
    	if(purchaseEditForm.endTime.value==""){
    		alert("请您输入日期！");
    		purchaseEditForm.endTime.focus();
    		return false;
    	} 
     } 
     function doupdate(){
    	
    			// var url = "${ctx }/Purchase/save.html?code="+val;
    			
    			var url = "${ctx }/front/member/buysave.html" ;
    			$("#purchaseEditForm").attr("action",url).submit() ;	
    		
    	}
</script>
<title>修改采购单</title>
</head>
<body>
	<div id="">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		


		<!--BEGIN CONTENT-->
		<div class="" style="">
			<div class="row">
				<div class="col-lg-12" style="padding-left: 0px;">
					<div class="portlet box portlet-yellow">
						<div class="portlet-header">
							<div class="caption">采购单</div>

						</div>
						<div class="portlet-body">
							<form name="purchaseEditForm" id="purchaseEditForm"
								onsubmit="return checkpost();" method="post"
								enctype="multipart/form-data"
								class="form-validate form-horizontal">
								<input type="hidden" name="code"> <input type="hidden"
									name="id" value="${proPurchase.id }">
								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red"> *</span>标题:</label>
									<div class="col-md-5">
										<input type="text" id="title" name="title"
											class="form-control required" value="${proPurchase.title}" />
										<span id="namespan"></span>
									</div>
								</div>

							



								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>采购总量:</label>
									<div class="col-md-2">
										<input type="text" id="purchaseAmount" name="purchaseAmount"
											placeholder="请填写数字" class="form-control required"
											value="${proPurchase.purchaseAmount }" /> <span id="namespan"></span>
									</div>

								</div>
								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>单位:</label>
									<div class="col-md-2">
										<input type="text" id="purchaseAmountUnit" placeholder="吨/件/个"
											name="purchaseAmountUnit" class="form-control required"
											value="${proPurchase.purchaseAmountUnit }" /> <span
											id="namespan"></span>
									</div>

								</div>

								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>目标单价:</label>
									<div class="col-md-2">
										<input type="text" id="unitPrice" name="unitPrice"
											placeholder="请填写数字" class="form-control required"
											value="${proPurchase.unitPrice }" /> <span id="namespan"></span>
									</div>

								</div>

								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>单位:</label>
									<div class="col-md-2">
										<input type="text" id="unitPrice" name="unitPrice"
											placeholder="元/美元" class="form-control required"
											value="${proPurchase.unit}" /> <span id="namespan"></span>
									</div>

								</div>


								<div class="form-group">
									<label class="col-md-2 control-label">收货地址 : </label>
									<div class="col-md-2">
										<select id="sysArea1"
											class="form-control area">
										</select>
									</div>
									<div class="col-md-2">
										<select id="sysArea2"
											class="form-control area">
										</select>
									</div>
									
									<div class="col-md-2">
										<select name="deliveryAddr" id="sysArea3"
											class="form-control">
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label">供应商经营地址: </label>
									<div class="col-md-2">
										<select id="suplyArea1"
											class="form-control area">
										</select>
									</div>
									<div class="col-md-2">
										<select id="suplyArea2"
											class="form-control area">
										</select>
									</div>
									
									<div class="col-md-2">
										<select name="supplierAddr" id="suplyArea3"
											class="form-control">
										</select>
									</div>
								</div>

								<div class="form-group">
									<label for="" class="col-md-2 control-label">联系人:</label>
									<div class="col-md-5">
										<input type="text" id="linkman" name="linkman"
											class="form-control required" value="${proPurchase.linkman}" />
										<span id="urlspan"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-md-2 control-label">联系电话:</label>
									<div class="col-md-5">
										<input type="text" id="tel" name="biref"
											class="form-control required" value="${proPurchase.tel}" /> <span
											id="urlspan"></span>
									</div>
								</div>



								<div class="form-group">
									<label class="col-md-2 control-label"> 报价截止日期: </label>
									<div class="col-md-5">
										<input id="endTime" readonly="readonly" name="endTime"
											class="form-control"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:false})"
											value="${proPurchase.endTime}" />
										<%-- <fmt:formatDate
														value="${proPurchase.endTime}" type="both" /> --%>
									</div>
								</div>


								<div class="form-group">
									<label class="col-md-2  control-label" >发票要求:</label>
									<div class="col-md-5">
										<input type="radio" name="invoiceRequest"
											style="margin-top: 0px;" value="0" checked="checked"
											${proPurchase.invoiceRequest eq "0" ? "checked":"" } />不需要发票
										&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
											name="invoiceRequest" style="margin-top: 0px;" value="1"
											${proPurchase.invoiceRequest eq "1" ? "checked":"" } />普通发票
										&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
											name="invoiceRequest" style="margin-top: 0px;" value="2"
											${proPurchase.invoiceRequest eq "2" ? "checked":"" } />增值税发票
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-2  control-label" >样品要求:</label>
									<div class="col-md-5">
										<input type="radio" name="sampleRequest"
											style="margin-top: 0px;" value="0"
											${proPurchase.sampleRequest eq "0" ? "checked":"" }>不需要样品
										&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
											name="sampleRequest" style="margin-top: 0px;" value="1"
											${proPurchase.sampleRequest eq "1" ? "checked":"" } />需要样品
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-2 control-label">产品说明:</label>
									<div class="col-md-11 ">
										<textarea name="summary" rows="20" class="form-control"
											value="${proPurchase.summary}">${proPurchase.summary}</textarea>
									</div>
								</div>
						
								<div class="form-group">
									<div class="col-md-offset-4 col-md-10">
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
	<script src="${ctx}/admin/js/area.js"></script>
	<script type="text/javascript">
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
	//地址三级联动	
	$(function(){
			var ctx = "${ctx}";
			
			//收货地址
			var currentCode =  ${proPurchase.deliveryAddr}+"";
			loadAreaMes(ctx,currentCode,'sysArea1','sysArea2','sysArea3');
			//供应商地址
			var currentSuplyCode =  ${proPurchase.supplierAddr}+"";
			loadAreaMes(ctx,currentSuplyCode,'suplyArea1','suplyArea2','suplyArea3');
			
	});
	
</script>
</body>
</html>