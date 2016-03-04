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
<meta name="decorator" content="right" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx }/media/Js/jquery.validate.min.js"></script>
<!-- 发布时间的验证，发布日期不能为null -->
<style type="text/css">
.error{
color: red;
}
</style>
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
    	if(PurchaseEditForm.endTime.value==""){
    		alert("请您输入日期！");
    		PurchaseEditForm.endTime.focus();
    		return false;
    	} 
     }
     function doupdate(){
    	 var obj=document.getElementById('categoryCode');  

    	 var index=obj.selectedIndex; //序号，取当前选中选项的序号  
    	   
    	 var val = obj.options[index].text; 
    	
    	
    		if(val!=null && val != undefined){
    			// var url = "${ctx }/Purchase/save.html?code="+val;
    			$("input[name='code']").attr("value",val) ;
    			var url = "${ctx }/Purchase/save.html" ;
    			$("#PurchaseEditForm").attr("action",url).submit() ;	
    		}
    	}
</script>
<title>发布采购单</title>
</head>
<body>
	<div id="page-wrapper">
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">发布求购单</div>
			</div>
			<ol class="breadcrumb page-breadcrumb">
				<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">当前位置</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li><a href="#">管理中心</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="active">广告管理</li>
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
							<div class="caption">求购单添加</div>
						</div>
						<div class="portlet-body">
							<form  name="PurchaseEditForm"
								id="PurchaseEditForm" method="post"
								onsubmit="return checkpost();" enctype="multipart/form-data"
								class="form-validate form-horizontal">
								<input type="hidden" name="code" >
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>标题:</label>
									<div class="col-md-5">
										<input type="text" id="title" name="title"
											class="form-control required" /> <span id="namespan"></span>
									</div>

								</div>
								
								<div class="form-group">
									<label class="col-md-1 control-label"> 所属类别: </label>
									<div class="col-md-5">
										<select name="categoryCode" class="form-control" id="categoryCode">
											<option value=""
												 >请选择所属类别</option>
											<option value="116"
												${proPurchase.categoryCode == '116' ? 'selected':'' }>采购专场</option>

											<option value="117"
												${proPurchase.categoryCode == '117' ? 'selected':'' }>紧急求购</option>
											<option value="118"
												${proPurchase.categoryCode == '118' ? 'selected':'' }>当日求购</option>
											<option value="119"
												${proPurchase.categoryCode == '119' ? 'selected':'' }>大宗采购</option>
											<option value="120"
												${proPurchase.categoryCode == '120' ? 'selected':'' }>冰酒预购</option>
											<option value="121"
												${proPurchase.categoryCode == '121' ? 'selected':'' }>首页求购</option>
										</select>
									</div>
								</div>
								<!-- <div class="form-group">
									<label class="col-md-1  control-label">图片:</label>
									<div class="col-md-5 ">
										<input name="files" type="file" class="form-control"
											accept="image/gif, image/jpeg,image/png"> <input
											name="picture" type="hidden">
										<p style="color: #ff0000">图片文件大小：不能超过5M</p>
									</div>
								</div> -->
								
								<div class="form-group">
									<label for="" class="col-md-2 control-label"><span
										style="color: red">*</span>采购总量:</label>
									<div class="col-md-2">
										<input type="text" id="purchaseAmount" name="purchaseAmount"
											class="form-control required number" /> <span id="namespan"></span>
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
											class="form-control number" /> <span id="namespan"></span>
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
									<label class="col-md-1 control-label">收货地址 : </label>
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
									<label class="col-md-1 control-label">供应商经营地址: </label>
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
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>联系人:</label>
									<div class="col-md-5">
										<input type="text" id="linkman" name="linkman"
											class="form-control required" /> <span id="namespan"></span>
									</div>

								</div>
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>联系电话:</label>
									<div class="col-md-5">
										<input type="text" id="tel" name="tel"
											class="form-control required" /> <span id="namespan"></span>
									</div>

								</div>
								

								
								<div class="form-group">
									<label class="col-md-1 control-label"
										style="padding-left: 0px;"> 报价截止时间: </label>
									<div class="col-md-5">
										<input id="endTime" readonly="readonly" name="endTime"
											class="form-control"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:false})" />
									</div>
								</div>



								<div class="form-group">
									<label class="col-md-1  control-label" style="width: 95px;">发票要求:</label>
									<div class="col-md-5">
										<input type="radio" name="invoiceRequest"
											style="margin-top: 10px;" value="0" checked="checked" />不需要发票
										&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
											name="invoiceRequest" style="margin-top: 10px;" value="1" />普通发票
										&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
											name="invoiceRequest" style="margin-top: 10px;" value="2" />增值税发票
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-1  control-label" style="width: 95px;">样品要求:</label>
									<div class="col-md-5">
										<input type="radio" name="sampleRequest"
											style="margin-top: 10px;" value="0">不需要样品
										&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
											name="sampleRequest" style="margin-top: 10px;" value="1" />需要样品
									</div>
								</div>


								<div class="form-group">
									<label class="col-md-1 control-label">产品说明:</label>
									<div class="col-md-11 ">
										<textarea name="summary" rows="20" class="form-control"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-1 control-label"> 数据状态: </label>
									<div class="col-md-5">
										<select name="status" id="status" class="form-control" >
									 		<option value="0"
												 >请选择数据状态</option>
												 <option value="-1"
												 >取消推荐</option>
												  <option value="-2"
												 >取消置顶</option>
											<%--<option value="1"
												${proInvestment.classCode == '1' ? 'selected':'' }>待审核</option>

											<option value="2"
												${proInvestment.status == '2' ? 'selected':'' }>通过</option>
											<option value="4"
												${proInvestment.status == '4' ? 'selected':'' }>禁用
											</option> --%>
											<option value="8"
												${proPurchase.status == '8' ? 'selected':'' }>推荐
											</option>
											<option value="16"
												${proPurchase.status == '16' ? 'selected':'' }>置顶</option>
											<%-- <option value="32"
												${proInvestment.status == '32' ? 'selected':'' }>删除</option>
												<option value=64
												${proInvestment.status == '64' ? 'selected':'' }>过期
											</option>
											<option value=128
												${proInvestment.status == '128' ? 'selected':'' }>启用
											</option>
											<option value="256"
												${proInvestment.status == '256' ? 'selected':'' }>未通过</option> --%>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-offset-3 col-md-10">
										<input class="btn btn-success" type="button" value="保存" onclick="doupdate()">

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
<script type="text/javascript">
		//确定按钮单击事件
		/*  $("#bc").click(function(){
			$("#signupForm").submit();
		}); */
		//$(document).ready(function(){
		//修改默认验证规则  
		jQuery.extend(jQuery.validator.messages, {
			required : "请填写本字段",
			remote : "验证失败",
			email : "请输入正确的电子邮件",
			url : "请输入正确的网址",
			date : "请输入正确的日期",
			dateISO : "请输入正确的日期 (ISO).",
			number : "请输入正确的数字",
			digits : "请输入正确的整数",
			creditcard : "请输入正确的信用卡号",
			equalTo : "请再次输入相同的值",
			accept : "请输入指定的后缀名的字符串",
			tel:"请填写正确的手机号码",
			maxlength : jQuery.validator.format("允许的最大长度为 {0} 个字符"),
			minlength : jQuery.validator.format("允许的最小长度为 {0} 个字符"),
			rangelength : jQuery.validator.format("允许的长度为{0}和{1}之间"),
			range : jQuery.validator.format("请输入介于 {0} 和 {1} 之间的值"),
			max : jQuery.validator.format("请输入一个最大为 {0} 的值"),
			min : jQuery.validator.format("请输入一个最小为 {0} 的值")
		});

		jQuery.validator
				.addMethod(
						"ismobile",
						function(value, element) {
							var length = value.length;
							var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1}))+\d{8})$/;
							return (length == 11 && mobile.exec(value)) ? true
									: false;
						}, "请正确填写您的手机号码");
		jQuery.validator.addMethod("tel", function(value, element) {
			var tel = /((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/;
			return (value == 11 || tel.exec(value)) ? true : false;
		}, "请正确填写您的电话号码");
		jQuery.validator.addMethod("isfax", function(value, element) {
			var fax = /^0\d{2,3}-\d{7,8}$/;
			return (value == "" || fax.exec(value)) ? true : false;
		}, "请正确填写您的传真号码");

		// validate signup form on keyup and submit
		$("#PurchaseEditForm").validate({
			rules : {
				title : {// 站点名称
					required : true,
					rangelength : [ 2, 64 ]
				},
				siAlias : {// 别名
					required : true,
					maxlength : 16

				},
				siUrl : {// url
					required : true,
					maxlength : 64,
					url : true
				},
				siIcp : {// icp
					required : true,
					maxlength : 32
				},
				tel : {// 固话
					tel : true
				},
				siPostcode : {// 邮编
					number : true,
					maxlength : 6
				},
				siMobile : {// 移动电话
					ismobile : true
				},
				siFax : {// 传真
					isfax : true
				},
				siEmail : {
					email : true
				},
				siLinkman : {// 联系人
					maxlength : 8
				},
				siAddress : {// 详细地址
					maxlength : 30
				},
				siAnalysisCode : {// 流量统计
					maxlength : 500
				},
				siAreaCode : {// 地区code
					required : true,
					maxlength : 16
				}
			},
			messages : {
				title : {
					required : "请输入采购标题",
					rangelength : "标题长度要在2-64个字符之间"
				},
				siAlias : {
					required : "请输入站点别名",
					maxlength : "找点别名长度不能超过16个字符"
				},
				siUrl : {// url
					required : "站点域名不能为空",
					maxlength : "站点域名长度不能超过64个字符",
					url : "请输入合法的url地址"
				},
				siIcp : {// icp
					required : "icp号码不能为空",
					maxlength : "icp号码长度不能超过32个字符"
				},
				tel : {// 固话
					tel : "请正确填写您的电话号码"
				},
				siPostcode : {// 邮编
					number : "邮编只能是数字",
					maxlength : "邮编长度不能超过6个数字"
				},
				siMobile : {// 移动电话
					ismobile : "请正确填写您的手机号码"
				},
				siFax : {// 传真
					isfax : "请正确填写您的传真号码"
				},
				siEmail : {
					email : "请输入正确的email格式"
				},
				siLinkman : {// 联系人
					maxlength : "联系人长度不能超过8个字符"
				},
				siAddress : {// 详细地址
					maxlength : "详细地址长度不能超过30个字符"
				},
				siAnalysisCode : {// 流量统计
					maxlength : "流量统计长度不能超过500个字符"
				},
				siAreaCode : {// 地区code
					required : "请输入地区code",
					maxlength : "地区code长度不能超过16个字符"
				}
			}
		});
		//});
	</script>
</body>
</html>















