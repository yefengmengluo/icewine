<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${ctx }/admin/js/jquery-1.10.2.min.js"></script>

<meta name="decorator" content="top" /> 
<link rel=stylesheet type=text/css href="${ctx}/admin/css/layout.css">
<title>模块管理</title>
<style type="text/css">
.modal-dialog-tc {
	width: 600px;
	margin: 200px auto;
}
</style>
<script type="text/javascript">

/* 删除确认 */
function deletenews(id){
	 $("#id").attr("value",id) ;
}
/* 确认删除 */
function doDelete(){
	var id = $("#id").val() ;
	if(id!=null && id != undefined){
		var url = "${ctx}/front/member/buydetele.html" ;
		$("#messageInfo").modal("hide");//关闭窗口
		$("#deleteForm").attr("action",url).submit() ;	
	}
}
function show(noj){
	 $(".summary1").text(noj);  
	
}

</script>
</head>
<body>
	<div id="">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<!--BEGIN CONTENT-->
		<div class="page-content">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-gray" >
						<div class="peomes_h2 yahei" style="border-bottom-color: #F8F8F8">
							<a href="${ctx}/front/member/buyadd.html"><input type="button"
								class="btn btn-default btn-outlined" value="发布求购单"></a> <a
								href="${ctx}/front/member/buylist.html"><input type="button"
								class="btn btn-default btn-outlined" value="求购列表"></a>
								<a href="${ctx}/front/member/buycheck.html?status=8"><input
								type="button" class="btn btn-default btn-outlined" value="已推荐"></a> <a
								href="${ctx}/front/member/buycheck.html?status=16"><input
								type="button" class="btn btn-default btn-outlined" value="已置顶"></a> 
						</div>
						<div class="panel-body">
							<div id="no-more-tables">
								<table
									class="table table-hover table-bordered">
									<thead class="cf">
										<tr>
											
											<th>标题</th>
											<th class="numeric">发布时间</th>
											<th class="numeric">报价截止日期</th>
											<th class="numeric">操作</th>
										</tr>
									</thead>
									<tbody>
										<form id="deleteForm">
											<input id="id" type="hidden" name="id">
										</form>
										<c:forEach var="proPurVo" items="${page.list}">
											<tr>
												<td data-title="Code">${proPurVo.title }</td>
											
													<td data-title="Price" class="numeric">${proPurVo.addTime}</td>
												<td data-title="Price" class="numeric">${proPurVo.endTime}</td>
												<%-- <td data-title="Price" class="numeric">${proPurVo.modifyTime}</td> --%>

												<td data-title="Open" class="numeric">
													<a
													class="btn btn-primary btn-sm"
													href="${ctx}/front/member/buydetail.html?id=${proPurVo.id}">查看/修改</a>&nbsp;&nbsp;
													<a data-toggle="modal" onclick="deletenews(${proPurVo.id})" data-target="#messageInfo" class="btn btn-danger btn-sm">删除</a>&nbsp;&nbsp;
													<!--  <input type="button" value="禁用"> --></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div align="right">
								<form action="" id="searchForm" method="post">
									<input type="hidden" id="pageNo" name="pageNo" value="">
								</form>
								${page}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--END CONTENT-->
	</div>
	<!-- 弹出框 -->
	<div class="modal fade" id="messageInfo" data-backdrop="false"	tabindex="-1" role="dialog" aria-hidden="true">
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
$("#searchForm").prop('action', "${ctx }/front/member/buylist.html").submit(); 
return false;
}
</script>
</body>
</html>