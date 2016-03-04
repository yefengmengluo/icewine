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
<meta name="decorator" content="right" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${ctx}/admin/js/jquery-1.10.2.min.js"></script>
<script src="${ctx}/admin/js/jquery.validate.min.js"></script>

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

/* <!-- 发布时间的验证，发布日期不能为null --> */

     function checkpost(){
    	if(proInvestmentEditForm.expireTime.value==""){
    		alert("请您输入日期！");
    		proInvestmentEditForm.expireTime.focus();
    		return false;
    	} 
     }
    
     function doupdate(obj){
    	 var obj=document.getElementById('classCode');  
    	
    	 var index=obj.selectedIndex; //序号，取当前选中选项的序号  
    	   
    	 var val = obj.options[index].text; 
    		if(val!=null && val != undefined){
    			
    			$("input[name='alias']").attr("value",val) ;
    			var url = "${ctx }/proInvestment/save.html" ;
    			
    			$("#proInvestmentEditForm").attr("action",url).submit() ;	
    		}
    	}
</script>
<title>修改采购单</title>
</head>
<body>
	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">修改招商</div>
			</div>
			<ol class="breadcrumb page-breadcrumb">
				<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">当前位置</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li><a href="#">管理中心</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="active">招商管理</li>
			</ol>
			<div class="btn btn-blue reportrange hide">
				<i class="fa fa-calendar"></i>&nbsp;<span></span>&nbsp;report&nbsp;<i
					class="fa fa-angle-down"></i> <input type="hidden" name="datestart" />
				<input type="hidden" name="endstart" />
			</div>
			<div class="clearfix"></div>
		</div>


		<!--BEGIN CONTENT-->
		<div class="page-content" style="overflow-x: hidden;">
			<div class="row">
				<div class="col-lg-12">
					<div class="portlet box portlet-yellow">
						<div class="portlet-header">
							<div class="caption">招商信息</div>
						</div>
						<div class="portlet-body">
							<form 
								name="proInvestmentEditForm" id="proInvestmentEditForm"
								method="post" onsubmit="return checkpost();"
								enctype="multipart/form-data"
								class="form-validate form-horizontal">
								<input type="hidden"  id="id" name="id" value="${proInvestment.id}">
								<input type="hidden" name="memberId" id="memberId"  value="${proInvestment.memberId}">
								<input type="hidden"  id="alias" name="alias">
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red"> *</span>标题:</label>
									<div class="col-md-5">
										<input type="text" id="name" name="name"
											class="form-control required" readonly="readonly" value="${proInvestment.name}" />
										<span id="namespan"></span>
									</div>
								</div>
								

								<div class="form-group">
									<label class="col-md-1 control-label"> 所属类别: </label>
									<div class="col-md-5">
										<select name="classCode" id="classCode" class="form-control" >
											<option value=""
												 >请选择所属类别</option>
											<option value="122"
												${proInvestment.classCode == '122' ? 'selected':'' }>强势招商项目</option>

											<option value="123"
												${proInvestment.classCode == '123' ? 'selected':'' }>最新招商</option>
											<option value="124"
												${proInvestment.classCode == '124' ? 'selected':'' }>合作商机
											</option>
											<option value="125"
												${proInvestment.classCode == '125' ? 'selected':'' }>加盟创业
											</option>
											<option value="144"
												${proInvestment.classCode == '144' ? 'selected':'' }>首页招商1</option>
											<option value="145"
												${proInvestment.classCode == '145' ? 'selected':'' }>首页招商2</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-1  control-label">图片:</label>
									<div class="col-md-5 ">
										<input name="files" type="file" class="" readonly="readonly"
											accept="image/gif, image/jpeg,image/png"> <input
											name="pic" value="${proInvestment.pic }" type="hidden" readonly="readonly">
										<p style="color: #ff0000">图片文件大小：不能超过5M</p>
									</div>
								</div> 
								<div class="form-group">
									<label for="" class="col-md-1 control-label">品牌:</label>
									<div class="col-md-5">
										<input type="text" id="brandName" name="brandName" readonly="readonly"
											class="form-control required"
											value="${proInvestment.brandName}" /> <span id="urlspan"></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-1 control-label"> 报价截止日期： </label>
									<div class="col-md-5">
										<input id="expireTime" readonly="readonly" name="expireTime"
											class="form-control"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:false})"
											value="${proInvestment.expireTime}" />
										<%-- <fmt:formatDate
														value="${proInvestment.endTime}" type="both" /> --%>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-1 control-label"> 加盟金额: </label>
									<div class="col-md-5">
										<select id="siteId" name="siteId" class="form-control" >
											<option value="1" ${proInvestment.siteId == '1' ? 'selected':'' } readonly="readonly">1万以下 </option>
											<option value="2" ${proInvestment.siteId == '2' ? 'selected':'' } readonly="readonly">1—3万</option>
											<option value="3" ${proInvestment.siteId == '3' ? 'selected':'' } readonly="readonly">3—10万</option>
											<option value="4" ${proInvestment.siteId == '4' ? 'selected':'' } readonly="readonly">10—30万</option>
											<option value="5" ${proInvestment.siteId == '5' ? 'selected':'' } readonly="readonly">30万以上</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-md-2 control-label">基本投资额(万元):</label>
									<div class="col-md-2">
										<input type="text" id="basicInvestment" name="basicInvestment" readonly="readonly"
											class="form-control required"
											value="${proInvestment.basicInvestment}" /> <span id="urlspan"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-md-2 control-label">保证金额(万元):</label>
									<div class="col-md-2">
										<input type="text" id="guaranteeSum" name="guaranteeSum" readonly="readonly"
											class="form-control required"
											value="${proInvestment.guaranteeSum}" /> <span id="urlspan"></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-1 control-label">区域要求 : </label>
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
										<select name="areaCode" id="sysArea3"
											class="form-control">
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red"> *</span>打回原因:</label>
									<div class="col-md-5">
										<input type="text" id="cause" name="cause" readonly="readonly"
											class="form-control required" value="${proInvestment.cause}" />
										<span id="namespan"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red"> *</span>联系人:</label>
									<div class="col-md-5">
										<input type="text" id="linkMan" name="linkMan" readonly="readonly"
											class="form-control required" value="${member.linkMan}" />
										<span id="namespan"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red"> *</span>手机号码:</label>
									<div class="col-md-5">
										<input type="text" id="mobile" name="mobile" readonly="readonly"
											class="form-control required" value="${member.mobile}" />
										<span id="namespan"></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-1 control-label">产品说明:</label>
									<div class="col-md-11 ">
										<textarea name="summary" rows="20" class="form-control">${proInvestment.summary}</textarea>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-1 control-label">数据状态: </label>
									<div class="col-md-5">
										<select name="status" id="status" class="form-control" >
									 		<option value=""
												 >请选择数据状态</option>
											<%--<option value="1"
												${proInvestment.classCode == '1' ? 'selected':'' }>待审核</option>

											<option value="2"
												${proInvestment.status == '2' ? 'selected':'' }>通过</option>
											<option value="4"
												${proInvestment.status == '4' ? 'selected':'' }>禁用
											</option> --%>
											<option value="8"
												${proInvestment.status == '8' ? 'selected':'' }>推荐
											</option>
											<option value="16"
												${proInvestment.status == '16' ? 'selected':'' }>置顶</option>
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