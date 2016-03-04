<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="right" />
<link rel=stylesheet type=text/css href="${ctx }/admin/css/base.css">
<link rel=stylesheet type=text/css href="${ctx }/admin/css/layout.css">
<script type="text/javascript" src="${ctx}/admin/js/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="${ctx}/admin/js/artDialog/plugins/iframeTools.js"></script> 
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
		var url = "${ctx}/prosupply/deleteSupply" ;
		$("#messageInfo").modal("hide");//关闭窗口
		$("#deleteForm").attr("action",url).submit() ;	
	}
} 



	/*置顶*/	 
	$(document).ready(function(){
		var _this=$(this);
		var _param=_this.attr("param");
		var _parents = _this.parents();
		
		$("input[name='Topbtn']").bind("click",function(){
			$.ajax({
				type:"POST",
				url:"${ctx}/prosupply/update",
				data:{id:_param,status:16},
				success:function(data){
					window.location.href=window.location.href;
				}
			});
			
		});
	});
	
	/*取消推荐*/	 
	$(document).ready(function(){
		var _this=$(this);
		var _param=_this.attr("param");
		var _parents = _this.parents();
		$("input[name='cancelbtn']").bind("click",function(){
			$.ajax({
				type:"POST",
				url:"${ctx}/prosupply/update",
				data:{id:_param,status:1},
				success:function(data){
					window.location.href=window.location.href;
				}
			});
			
		});
	});
	
/* 	 	 
	$(document).ready(function(){
		var _this=$(this);
		var _param=_this.attr("param");
		var _parents = _this.parents();
		$("input[name='tjbtn']").bind("click",function(){
			$.ajax({
				type:"POST",
				url:"${ctx}/prosupply/update",
				data:{id:_param,status:8},
				success:function(data){
					alert("a");
				}
			});
			
		});
	}); */


	/* 显示列表分页 */
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").attr('action', '${ctx}/prosupply/getProSupply')
				.submit();
		return false;
	}
	
	function  up(id){
		window.location.href='${ctx}/prosupply/updateById?id='+id;
	}
	
	function updateById(id){
		var aa='${ctx}/prosupply/updateById?id='+id;
		      art.dialog.open(aa, {
		            id:"wkimgdialog",
		                 title:"修改",
		                 lock:false,
		                 top: '53%',
		                 left:'60%',
		                 zIndex : 20005,
		                 width:650,
		                 height:310,
		                 drag:false,
		                 close:function(){
		                	 
		                	 location.reload();
		                	 setTimeout('location.reload()',1000);
		                 }
		             }); 
	}
</script>


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
		<div class="page-content">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-yellow">
						<div class="panel-heading">
								<a href="${ctx}/prosupply/toadd"><input type="button"
								class="btn btn-primary" value="发布供应"></a> 
								 <a href="${ctx}/prosupply/getProSupply?status=1"><input type="button"
								class="btn btn-primary" value="待审"></a>
								<a href="${ctx}/prosupply/getProSupply?status=4"><input type="button"
								class="btn btn-primary" value="禁用"></a>
								<a href="${ctx}/prosupply/getProSupply?status=32"><input type="button"
								class="btn btn-primary" value="删除"></a>
								<a href="${ctx}/prosupply/getProSupply?status=64"><input type="button"
								class="btn btn-primary" value="已过期"></a>
								<a href="${ctx}/prosupply/getProSupply?status=256"><input type="button"
								class="btn btn-primary" value="未通过"></a>
								<a href="${ctx}/prosupply/getProSupply?status=2"><input type="button"
								class="btn btn-primary" value="待选"></a>
								 
								<a href="${ctx}/prosupply/getProSupply?status=8"><input type="button"
								class="btn btn-primary" value="推荐 "></a>
								<a href="${ctx}/prosupply/getProSupply?status=16"><input type="button"
								class="btn btn-primary" value="置顶"></a>
								
						</div>						
					 <div class="portlet-body">
			<div id="no-more-tables">
				<table class="table table-bordered table-striped table-condensed cf">
					<thead class="cf">
						<tr>
							<th class="numeric">标题</th>
							<th class="numeric">发布公司</th>
							<th class="numeric">上架状态</th>
							<th class="numeric">发送时间</th>
							<th class="numeric">更改时间</th>
							<th class="numeric">操作</th>
							 
							 
						</tr>
					</thead>
					<tbody>
						<form id="deleteForm">
							<input id="id" type="hidden" name="id">
						</form>
						<c:forEach var="list" items="${list}">
							<tr>
								<td data-title="name">${fn:substring(list.name,0,30)}</td>
								<td data-title="coporationName">${list.corporationName}</td>
								<td data-title="status">
								<c:if test="${list.status==1}">未审核</c:if>
								<c:if test="${list.status==2}">已审核</c:if>
								<c:if test="${list.status==8}">已审核</c:if>
								<c:if test="${list.status==16}">已审核</c:if>
								<c:if test="${list.status==32}">已删除</c:if>
								<c:if test="${list.status==64}">已过期</c:if>
								<c:if test="${list.status==4}">禁用</c:if>
								<c:if test="${list.status==256}">未通过</c:if>
								</td>
								<td data-title="addtime"><fmt:formatDate
										value="${list.addTime}" pattern="yyyy-MM-dd H:m:s" /></td>
								<td data-title="modifytime"><fmt:formatDate
										value="${list.modifyTime}" pattern="yyyy-MM-dd H:m:s" /></td>
								<input type="hidden" name="id" id="id" value="${list.id}" />
							
								<td data-title="modifytime">
								 <input type="button" class="btn btn-primary btn-sm" value="编辑" onclick="up('${list.id}');" class="input_find">
								  <a data-toggle="modal" onclick="deletenews(${list.id})"  data-target="#messageInfo" class="btn btn-danger btn-sm">删除</a>
								<%-- <c:if test="${list.status==1}">
								<input type="button"  name="passbtn" value="通过" param="${list.id}"> 
								<input type="button"  name="failedbtn"  value="未通过" param="${list.id}">
								<input type="button"  name="stopbtn"  value="禁用" param="${list.id}">
								</c:if>
								<c:if test="${list.status==2}">
								<input type="button"  name="tjbtn" value="推荐"   onclick="updateById('${list.id}')"> 
								<input type="button"  name="Topbtn"  value="置顶" param="${list.id}">
								</c:if>
								
								<c:if test="${list.status==4}">
								<input type="button"  name="Recoverybtn" value="恢复" param="${list.id}"> 
								<input type="button"  name="Deletebtn"  value="删除" param="${list.id}">
								</c:if>
								<c:if test="${list.status==8}">
								<input type="button"  name="cancelbtn" value="取消推荐" param="${list.id}"> 
								<input type="button"  name="Topbtn"  value="改为置顶" param="${list.id}">
								</c:if> --%>
								</td>
								
								 
								
							</tr>



						</c:forEach>
					</tbody>
				</table>
				<!-- 分页的添加 -->
				<div align="right">
					<form action="" id="searchForm" method="post">
						<input type="hidden" id="pageNo" name="pageNo" value="">
					</form>
					${page}
				</div>

			</div>

		</div>
		
		  <!-- 弹出框 -->
	     <div class="modal fade" id="messageInfo" data-backdrop="false" tabindex="-1" role="dialog" aria-hidden="true">
	      <div class="modal-dialog-tc">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                <h4 class="modal-title" id="messageInfoLabel">确认删除</h4>
	            </div>
	            <div class="modal-body">
	               	您确定要删除吗？
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	                <button type="button" onclick="doDelete();" class="btn btn-primary">确认</button>
	            </div>
	
	        </div>
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
	<!-- 弹出框 -->
	<script type="text/javascript">
		//分页
		function page(n, s) {
			$("#pageNo").prop("value", n);
			$("#searchForm").attr('action', '${ctx}/prosupply/getProSupply')
					.submit();
			return false;
		}
	</script>
	 
</body>
</html>