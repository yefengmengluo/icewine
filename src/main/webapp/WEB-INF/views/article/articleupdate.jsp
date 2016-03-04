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
<title>资讯编辑</title>
<meta name="decorator" content="right" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 添加验证的 js --> 
<script type="text/javascript" src="${ctx }/media/Js/jquery.validate.min.js"></script>
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
				<div class="page-title">资讯编辑</div>
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
					<div class="caption">资讯编辑</div>

				</div>
				<div class="portlet-body">
					<form action="${ctx }/article/addUpdate.html" name="articleEditForm"  id="articleEditForm" method="post"  onsubmit="return check();" enctype="multipart/form-data" class="form-validate form-horizontal">
					    <input type="hidden" name="id" value="${articles.id }" >
					    <input type="hidden" name="id" value="${articleDetails.articleId }" >
					    <input type="hidden" name="status" value="${articles.status }" >
					     <input type="hidden" name="times" value="${articles.times }" >
					   <%--   <input type="hidden" name="id" value="${articleCategorys.id }" > --%>
								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>标题名称:</label>
									<div class="col-md-5">
										<input type="text"  id="title" name="title"  value="${articles.title}" class="form-control required" />
								         <span style="color: #ff0000"  id="arTitle_err"></span>
									</div>

								</div>
								<div class="form-group">
									<label class="col-md-1 control-label"> 来源类型： </label>
									<div class="col-md-5">
										<select name="originType" class="form-control">
											<option ${articles.originType == 'yc'?'selected':""}
												value="yc">原创</option>
											<option ${articles.originType == 'zz'?'selected':""}
												value="zz">转载</option>
										</select>
									</div>
								</div>
								
								 	<div class="form-group">
			                        <label class="col-md-1 control-label">
							                           所属类别：
			                        </label>
			                        <div class="col-md-5">
			                        	<select name="classCode" class="form-control">	
										 <c:forEach var="classCodeVo" items="${categorys }">
													<option ${articles.classCode == classCodeVo.code?'selected':""} value="${classCodeVo.code }">${classCodeVo.name }</option>                        			
			                        		</c:forEach> 		             					            
			                        	</select>
			                        </div>
			                    </div>


								<div class="form-group">
									<label class="col-md-1  control-label">资讯图片：</label>
									<div class="col-md-5 ">
										<input name="files" type="file" class="form-control"
											accept="image/gif, image/jpeg,image/png"> <input
											name="pictureUrl" value="${articles.pictureUrl }"
											type="hidden">
										<p style="color: #ff0000">图片文件大小：不能超过5M</p>
									</div>
								</div>

								


								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>作者名称:</label>
									<div class="col-md-5">
										<input type="text" id="author" name="author"
											value="${articles.author }" class="form-control required" />
										<span id="namespan"></span>
									</div>

								</div>

								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>关键词:</label>
									<div class="col-md-5">
										<input type="text" id="keywords" name="keywords"
											value="${articles.keywords }" class="form-control required" />
										<span id="namespan"></span>
									</div>

								</div>

								<div class="form-group">
									<label for="" class="col-md-1 control-label"><span
										style="color: red">*</span>标签:</label>
									<div class="col-md-5">
										<input type="text" id="tag" name="tag"  value="${articles.tag}" class="form-control required" /> 
										<span  style="color: #ff0000" id="tag_error"></span>
									</div>

								</div>

								<div class="form-group">
									<label class="col-md-1  control-label">核心摘要：</label>
									<div class="col-md-11 ">
										<textarea name="summary" value="" rows="8"
											class="form-control">${articles.summary }</textarea>
									</div>

								</div>



								<div class="form-group">
									<label class="col-md-1  control-label">详细信息：</label>
									<div class="col-md-11 ">
										<textarea name="articleDetail"  id="articleDetail" rows="20" value="${articleDetails.articleDetail }" class="form-control">${articleDetails.articleDetail }</textarea>
										<span  style="color: #ff0000" id="arDetail_err"></span>
									</div>
								
						      </div>	
						      
						        <div class="form-group">
			                        <label class="col-md-1 control-label">
							                           数据状态：
			                        </label>
			                        <div class="col-md-5">
			                        	<select name="dataStatus" class="form-control">	
			                        	<option  ${articles.dataStatus == '2'?'selected':"" } value="2">已通过</option>
										<option  ${articles.dataStatus == '16'?'selected':"" } value="16">置顶</option>
									    <option  ${articles.dataStatus == '8'?'selected':"" } value="8">推荐</option>
									    <option  ${articles.dataStatus == 'not'?'selected':"" } value="8">取消置顶</option>
									    <option  ${articles.dataStatus == 'noj'?'selected':"" } value="16">取消推荐</option>		
			                        	</select>
			                        </div>
			                    </div>								
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
function check(){
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
	//验证资讯内容长度
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

}
</script>
</body> 
</html>