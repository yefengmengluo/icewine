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
<title>留言回复</title>
<meta name="decorator" content="right" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div id="page-wrapper">
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">留言回复</div>
			</div>
			<ol class="breadcrumb page-breadcrumb">
				<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">当前位置</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li><a href="#">管理中心</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="active">留言管理</li>
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
					<div class="caption">留言回复</div>

				</div>
				<div class="portlet-body">
					<form action="${ctx }/advertise/saveReply.html"   name="advertiseEditForm"  id="advertiseEditForm" method="post"  onsubmit="return checkpost();" enctype="multipart/form-data" class="form-validate form-horizontal">
					    <input type="hidden" name="id" value="${advertises.id }" >
					     <input name="adType" type="hidden" value="message"> 

																							
						
						 <div class="form-group">
									<label class="col-md-1  control-label">回复：</label>
									<div class="col-md-11 ">
										<textarea name="summary" rows="20"  class="form-control"></textarea>
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
</body> 
</html>