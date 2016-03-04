<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="/WEB-INF/views/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="right" />
<link rel=stylesheet type=text/css href="${ctx }/admin/css/base.css">
<link rel=stylesheet type=text/css href="${ctx }/admin/css/layout.css">
<!-- 添加验证的 js --> 
<script type="text/javascript" src="${ctx }/media/Js/jquery.validate.min.js"></script>
<script type="text/javascript">
KindEditor.ready(function(K) {
	var editor1 = K.create('textarea[name="content"]', {
		cssPath : '${ctx}/admin/kindeditor-master/plugins/code/prettify.css',
		uploadJson : '${ctx}/admin/kindeditor-master/jsp/upload_json.jsp',
		fileManagerJson : '${ctx}/admin/kindeditor-master/jsp/file_manager_json.jsp',
		allowFileManager : true,
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['toaddEditForm'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['toaddEditForm'].submit();
			});
		}
	});
	prettyPrint();
});
/* jQuery(document).ready(function() {
	selectMenu("advertises") ;
}); */

/* <!-- 发布时间的验证，发布日期不能为null --> */

     

</script>
<title>模块管理</title>
<style type="text/css">
.modal-dialog-tc {
	width: 600px;
	margin: 200px auto;
}
</style>

</head>
<body>

	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">供应管理</div>
			</div>
			<ol class="breadcrumb page-breadcrumb">
				<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">当前位置</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li><a href="#"></a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="active">发布供应</li>
			</ol>
			<!-- <div class="btn btn-blue reportrange hide"><i class="fa fa-calendar"></i>&nbsp;<span></span>&nbsp;report&nbsp;<i class="fa fa-angle-down"></i>
                        <input type="hidden" name="datestart" />
                        <input type="hidden" name="endstart" />
                    </div> -->
			<div class="clearfix"></div>
		</div>
		<div class="page-content" style="overflow-x: hidden;">
			<div class="row">
				<div class="col-lg-12">
			<div class="portlet box portlet-yellow">
				<div class="portlet-header">
					<div class="caption">发布产品</div>

				</div>
				 <div class="portlet-body">
					<form action="${ctx }/prosupply/update.html" name="toaddEditForm"  id="toaddEditForm" method="post"  onsubmit="return check();" enctype="multipart/form-data" class="form-validate form-horizontal">
					 
					    
						<div class="form-group">
							<label for="" class="col-md-1 control-label"><span style="color:red">*</span>信息标题:</label>
							<div class="col-md-5">
								<input type="text"  id="name" name="name"  class="form-control required" />
								<span  style="color:#ff0000" id="name_error"></span>
							</div>							

						</div>
						<div class="form-group">
							<label for="" class="col-md-1 control-label"><span style="color:red">*</span>关键字:</label>
							<div class="col-md-5">
								<input type="text"  id="keyword" name="keyword"  class="form-control required" />
								<span id="namespan"></span>
							</div>							

						</div>
						<div class="form-group">
							<label for="" class="col-md-1 control-label"><span style="color:red">*</span>最低价格:</label>
							<div class="col-md-5">
								<input type="text"  id="priceMin" name="priceMin"  class="form-control required" />
								<span  style="color:#ff0000" id="priceMin_error"></span>
							</div>							

						</div>
						
						<div class="form-group">
									<label class="col-md-1  control-label">产品图片：</label>
									<div class="col-md-5 ">
										<input name="files" type="file"  class="form-control" accept="image/gif, image/jpeg,image/png">
										<input name="pictureUrl" type="hidden" >
										<p style="color: #ff0000">图片文件大小：不能超过5M</p>
								</div>
						    </div>
						    
					 	<div class="form-group">
							<label for="" class="col-md-1 control-label"><span style="color:red">*</span>计量单位:</label>
							<div class="col-md-5">
								<input type="text"  id="unit" name="unit"  placeholder="/瓶/箱"class="form-control required" />
								<span id="namespan"></span>
							</div>							

						</div>
						
						<div class="form-group">
							<label for="" class="col-md-1 control-label"><span style="color:red">*</span>库存:</label>
							<div class="col-md-5">
								<input type="text"  id="storeNum" name="storeNum"  class="form-control required" />瓶
								<span  style="color:#ff0000" id="storeNum_error"></span>
							</div>							
 						</div>
 						
 						<div class="form-group">
							<label for="" class="col-md-1 control-label"><span style="color:red">*</span>市场指导价:</label>
							<div class="col-md-5">
								<input type="text"  id="promotionType" name="promotionType"  class="form-control required" />元
								<span id="namespan"></span>
							</div>							
 						</div>
 						
 								<div class="form-group">
							<label for="" class="col-md-1 control-label"><span style="color:red"></span>企业内部价:</label>
							<div class="col-md-5">
								<input type="text"  id="priceInner" name="priceInner"  class="form-control required" />元
								<span id="namespan"></span>
							</div>							
 						</div>
 							    
						  
						
					 
							 
						  

							
										
	 				  <div class="form-group">
									<label class="col-md-1  control-label">详细信息：</label>
									<div class="col-md-11 ">
										<div class="col-md-11 ">
										<textarea name="summary"  id="content" rows="20" class="form-control"></textarea>
										<span  style="color:#ff0000" id="content_error"></span>
									</div>
									</div>
								
						  </div>		
								
						  </div>				
						<div class="form-group">
							<div class="col-md-offset-3 col-md-10">
							 <input class="btn btn-success" id="sub"  type="submit" value="保存">			
								
								&nbsp;
								<a href="javascript:history.go(-1)"><button type="button" class="btn btn-default">返回</button></a>
							</div>
						</div>
					</form>
				</div>
			</div>
			</div></div>
		</div>
		
		
		
		<div class="page-content">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-yellow">

						<div class="portlet-body">
							<div id="no-more-tables">
								
								<!-- 分页的添加 -->


							</div>

						</div>


					</div>
				</div>
			</div>
		</div>
		<!--END TITLE & BREADCRUMB PAGE-->


		<!--BEGIN CONTENT-->

		<!--END CONTENT-->
	</div>


	<!--BEGIN CONTENT-->

	<!--END CONTENT-->
	</div>
	<!-- 弹出框 -->
<script type="text/javascript">
function check(){
	var flag=true;
	//验证标题
	var arTitle=document.getElementById('name');
	if(arTitle.value==''||arTitle.value==null){
		document.getElementById('name_error').innerHTML='必填字段';
		flag=false;
	}else if(arTitle.value.length<3){
		document.getElementById('name_error').innerHTML='长度不能小于3';
		flag=false;
	}
	//验证最低价格为数字
	 var re = /^[0-9]+.?[0-9]*$/;
     var priceMin=document.getElementById('priceMin');
	 if(priceMin.value==''||priceMin.value==null){
			document.getElementById('priceMin_error').innerHTML='必填字段';
			flag=false;
		 }/* else if(!re.test(priceMin)){
			document.getElementById('priceMin_error').innerHTML='必需为数字';
			flag=false;	 
		}  */
	 //验证库存数量
	  var ren = /^[0-9]+.?[0-9]*$/;
	   var storeNum=document.getElementById('storeNum');
		if(storeNum.value==''||storeNum.value==null){
			document.getElementById('storeNum_error').innerHTML='必填字段';
			flag=false;
	 }/*  else if(!ren.test(storeNum)){
			document.getElementById('storeNum_error').innerHTML='必需为数字';
			flag=false; 
		}  */
	 //验证资讯内容长度
	var content=document.getElementById('content');
	if(content.value==''||content.value==null){
		document.getElementById('content_error').innerHTML='必填字段';
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
	<!-- 弹出框 end -->
	<script type="text/javascript">
		//分页
		function page(n, s) {
			$("#pageNo").prop("value", n);
			$("#searchForm").prop('action', "${ctx }/Purchase/list.html")
					.submit();
			return false;
		}
	</script>
</body>
</html>