<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
%>
<!DOCTYPE html>
<html>
<head>
<title>广告添加</title>
<meta name="decorator" content="right" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx }/media/Js/jquery.validate.min.js"></script>
<script type="text/javascript">
	KindEditor
			.ready(function(K) {
				var editor1 = K
						.create(
								'textarea[name="content"]',
								{
									cssPath : '${ctx}/admin/kindeditor-master/plugins/code/prettify.css',
									uploadJson : '${ctx}/admin/kindeditor-master/jsp/upload_json.jsp',
									fileManagerJson : '${ctx}/admin/kindeditor-master/jsp/file_manager_json.jsp',
									allowFileManager : true,
									afterCreate : function() {
										var self = this;
										K.ctrl(document, 13, function() {
											self.sync();
											document.forms['advertiseEditForm']
													.submit();
										});
										K.ctrl(self.edit.doc, 13, function() {
											self.sync();
											document.forms['advertiseEditForm']
													.submit();
										});
									}
								});
				prettyPrint();
			});
/* 	jQuery(document).ready(function() {
		selectMenu("advertise");
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

</head>
<body>
	<div id="page-wrapper">
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">广告添加</div>
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
					<div class="caption">广告添加</div>

				</div>
				<div class="portlet-body">
					<form action="${ctx }/advertise/save.html"   name="advertiseEditForm"  id="moduleEditForm" method="post"  onsubmit="return check();"  class="form-validate form-horizontal">
					    <input type="hidden" name="id" value="${advertises.id }" >
					    <input name="adType" type="hidden" value="advertise"> 
						<div class="form-group">
							<label for="" class="col-md-1 control-label"><span style="color:red">*</span>标题:</label>
							<div class="col-md-5">
								<input type="text"  id="title" name="title"  class="form-control required" />
								<span style="color: #ff0000" id="arTitle_err"></span>
							</div>							

						</div>
											

						<div class="form-group">
							<label for="" class="col-md-1 control-label">简介:</label>
							<div class="col-md-5">
								<input type="text"  id="biref" name="biref"  class="form-control required" />
								
							</div>
						</div>
																							
						<div class="form-group">
			                        <label class="col-md-1 control-label" style="padding-left: 0px;">
							                            发布时间：
			                        </label>
			                 <div class="col-md-5">
			                            <input id="date" readonly="readonly" name="addTime"   class="form-control"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:false})" />
			                        </div>
			                </div>
						
						 <div class="form-group">
									<label class="col-md-1  control-label">图片：</label>
									<div class="col-md-5 ">
										<input name="files" type="file"  class="form-control" accept="image/gif, image/jpeg,image/png">
										<input name="img" type="hidden" >
										<p style="color: #ff0000">图片文件大小：不能超过5M</p>
								</div>
						    </div>	
						
						<div class="form-group">
							<label for="" class="col-md-1 control-label">图片链接:</label>
							<div class="col-md-5">
								<input type="text"  id="imgUrl" name="imgUrl"  class="form-control required" />
								<span style="color: #ff0000" id="urlspan"></span>
							</div>
						</div>
								
						 <div class="form-group">
									<label class="col-md-1  control-label">内容：</label>
									<div class="col-md-11 ">
										<textarea name="content" rows="20"  class="form-control"></textarea>
									</div>
								
						  </div>
						<div class="form-group">
									<label class="col-md-1 control-label">数据状态： </label>
									<div class="col-md-5">
										<select name="flag" class="form-control">
											<option value="16">置顶</option>
											<option value="8">推荐</option>
											<option value="1">单品通推荐</option>
										</select>
									</div>
						</div>


								<div class="form-group">
							<div class="col-md-offset-3 col-md-10">
							 <input class="btn btn-success"  id="sub" type="submit" value="保存">			
								
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
function check(){
	var flag=true;
	//验证标题
	var arTitle=document.getElementById('title');
	if(arTitle.value==''||arTitle.value==null){
		document.getElementById('arTitle_err').innerHTML='广告名称必填字段';
		flag=false;
	}else if(arTitle.value.length<3){
		document.getElementById('arTitle_err').innerHTML='长度不能小于3';
		flag=false;
	}
 //验证图片链接
	var arDetail=document.getElementById('imgUrl');
	if(arDetail.value==''||arDetail.value==null){
		document.getElementById('urlspan').innerHTML='必填字段';
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
</body> 
</html>