<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page import="com.wangku.dpw.util.ArticleStatus"%> --%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="right" />
<link rel=stylesheet type=text/css href="${ctx }/css/base.css">
<link rel=stylesheet type=text/css href="${ctx }/css/layout.css">
<script src="${ctx }/js/ui.js"></script>
<link rel=stylesheet type=text/css
	href="${ctx }/css/jquery-auto-css/jquery.autocomplete.css">
<script src="${ctx }/js/jquery-auto-js/jquery.autocomplete.min.js"></script>
<script src="${ctx }/js/jquery-auto-js/jquery-auto.js"></script>
<script src="${ctx }/js/common-jsfun.js"></script>
<title>资讯类别列表</title>
<style type="text/css">
.modal-dialog-tc {
	width: 600px;
	margin: 200px auto;
}
</style>
<script type="text/javascript">
var ctx="${ctx}";
/* 删除确认 */
function deletenews(id){
	$("#id").attr("value",id) ;
}
/* 确认删除 */
function doDelete(){
	var id = $("#id").val() ;
	if(id!=null && id != undefined){
		var url = "${ctx}/articleCategory/delete.html " ;
		$("#messageInfo").modal("hide");//关闭窗口
		$("#deleteForm").attr("action",url).submit() ;	
	}
}
</script>
</head>
<body>
	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">资讯类别</div>
			</div>
			<ol class="breadcrumb page-breadcrumb">
				<li><i class="fa fa-home"></i>&nbsp;当前位置&nbsp;<i
					class="fa fa-angle-right"></i></li>
				<li><a href="${ctx }/articleCategory/list.html">资讯类别管理</a>&nbsp;<i
					class="fa fa-angle-right"></i></li>
				<li>资讯类别列表&nbsp;<i class="fa fa-angle-right"></i></li>
			</ol>
			<div class="clearfix"></div>
		</div>
		<table cellspacing="0" cellpadding="0" class="mana_table">
		</table>
		<!--BEGIN CONTENT-->
		<div class="page-content">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-yellow">
						 <div class="panel panel-heading" style="color: #EC7F24;"> 
						 <li><a class="btn btn-primary btn-sm" href="${ctx }/articleCategory/add.html">添加资讯类别</a></li>
							
						</div> 
						<div class="panel-body">
							<div id="no-more-tables">
								<table
									class="table table-bordered table-striped table-condensed cf">
									<thead class="cf">
										<tr>
											<th>ID</th>
											<th>类别名称</th>
											<th class="numeric">所属站点</th>
											<th class="numeric">类别code</th>
											<th class="numeric">操作</th>
										</tr>
									</thead>
									<tbody>
										<form id="deleteForm">
											<input id="id" type="hidden" name="id">
										</form>
										<c:forEach var="list" items="${pages.list}">
										      <tr>
												<td data-title="Code">${list.id }</td>
												<td data-title="Company">${list.name}</td>
												<td data-title="Company">冰酒站</td>
												<td data-title="Code">${list.code }</td>
                                                <td><a class="btn btn-primary btn-sm" href="${ctx }/articleCategory/update.html?id=${list.id}">编辑</a>&nbsp;&nbsp;
                                                <a data-toggle="modal" onclick="deletenews(${list.id})"  data-target="#messageInfo" class="btn btn-danger btn-sm">删除</a></td>&nbsp;&nbsp;                                                   

                                                   
                                                </tr>	
												
											
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div align="center">
								<form action="" id="searchForm" method="post">
									<input type="hidden" id="pageNo" name="pageNo" value="">
								</form>
								${pages }
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--END CONTENT-->
	</div>
	<!-- 弹出框 -->
	<div class="modal fade" id="messageInfo" data-backdrop="false"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog-tc">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="messageInfoLabel">确认删除</h4>
				</div>
				<div class="modal-body">您确定要删除吗？</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" onclick="doDelete();" class="btn btn-primary">确认</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 弹出框 end -->
	<script type="text/javascript">
	//分页
	function page(n, s) {
    $("#pageNo").prop("value",n);
    $("#searchForm").prop('action', "${ctx }/articleCategory/list.html").submit(); 
    return false;
   }
	
		
</script>
</body>
</html>