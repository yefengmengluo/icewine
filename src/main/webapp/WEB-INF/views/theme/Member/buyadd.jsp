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
<meta name="decorator" content="top" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<%-- <script type="text/javascript" src="${ctx}/media/Js/jquery-1.10.2.min.js"
	language="javascript"></script> --%>
<script type="text/javascript" src="${ctx}/media/Js/jquery.validate.min.js"></script>
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
				document.forms['PurchaseEditForm'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['PurchaseEditForm'].submit();
			});
		}
	});
	prettyPrint();
});
     function checkpost(){
    	
    	if(PurchaseEditForm.title.value==""){
    		alert("请您输入标题！");
    		PurchaseEditForm.title.focus();
    		return false;
    	}
    	if(PurchaseEditForm.endTime.value==""){
    		alert("请您输入日期！");
    		PurchaseEditForm.endTime.focus();
    		return false;
    	} 
    	if(PurchaseEditForm.tel.value==""){
    		alert("请您输入手机号码！");
    		PurchaseEditForm.tel.focus();
    		return false;
    	} 
    	//校验手机号码：必须以数字开头，除数字外，可含有“-”
     }
        
     function doupdate(){
    			var url ="${ctx}/front/member/buysave.html" ;
    			$("#PurchaseEditForm").attr("action",url).submit() ;	
    	}
</script>
<title>发布采购单</title>
</head>
<body>
	
	<div class="page-content" style="overflow-x: hidden;">
			<div class="">
				<div class="col-lg-12">
					<div class="peomes_h2 yahei ">
						<div class="portlet-header">
							<div class="caption">求购单添加</div>

						</div>
						<div class="portlet-body" style="margin-top: 30px;">
							<form  name="PurchaseEditForm"
								id="PurchaseEditForm" method="post"
								onsubmit="return checkpost();" enctype="multipart/form-data"
								class="form-validate form-horizontal">
								<input type="hidden" name="code" >
								
								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>标题:</label>
									<div class="col-md-5">
										<input type="text" id="title" name="title"
											class="form-control required" /> <span id="namespan"></span>
									</div>

								</div>
								
					
								
								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>采购总量:</label>
									<div class="col-md-2">
										<input type="text" id="purchaseAmount" name="purchaseAmount"
											class="form-control required" /> <span id="namespan"></span>
									</div>

								</div>
								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>单位:</label>
									<div class="col-md-2">
										<input type="text" id="purchaseAmountUnit" placeholder="吨/件/个" name="purchaseAmountUnit"
											class="form-control required" /> <span id="namespan"></span>
									</div>

								</div>
								
								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>目标单价:</label>
									<div class="col-md-2">
										<input type="text" id="unitPrice" name="unitPrice"
											class="form-control required" /> <span id="namespan"></span>
									</div>

								</div>
								
								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>单位:</label>
									<div class="col-md-2">
										<input type="text" id="unit" name="unit" placeholder="元/万元"
											class="form-control required" /> <span id="namespan"></span>
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
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>联系人:</label>
									<div class="col-md-5">
										<input type="text" id="linkman" name="linkman"
											class="form-control required" /> <span id="namespan"></span>
									</div>

								</div>
								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>联系电话:</label>
									<div class="col-md-5">
										<input type="text" id="tel" name="tel"
											class="form-control required" /> <span id="namespan"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-md-2 control-label"
										>报价截止时间: </label>
									<div class="col-md-5">
										<input id="endTime"  name="endTime"
											class="form-control"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:false})" />
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-md-2  control-label" >发票要求:</label>
									<div class="col-md-5">
										<input type="radio" name="invoiceRequest"
											style="margin-top: 0px;" value="0" checked="checked" />不需要发票
										&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
											name="invoiceRequest" style="margin-top: 0px;" value="1" />普通发票
										&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
											name="invoiceRequest" style="margin-top: 0px;" value="2" />增值税发票
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-2  control-label" >样品要求:</label>
									<div class="col-md-5">
										<input type="radio" name="sampleRequest"
											style="margin-top: 0;" value="0">不需要样品
										&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
											name="sampleRequest" style="margin-top: 0px;" value="1" />需要样品
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
										<input class="btn btn-success" type="button" value="保存" onclick="doupdate()">

									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
		</div></div>
	
		<script src="${ctx}/admin/js/area.js"></script>
	<script type="text/javascript">
	//地址三级联动	
	$(function(){
			var ctx = "${ctx}";
			
			//收货地址
			var currentCode =  ${proPurchase.deliveryAddr}+"";
			loadAreaMes(ctx,currentCode,'sysArea1','sysArea2','sysArea3');
			//供应商地址
			var currentSuplyCode =  ${proPurchase.supplierAddr}+"";
			loadAreaMes(ctx,currentSuplyCode,'suplyArea1','suplyArea2','suplyArea3');
			
	})
	

</script>

</body>
</html>