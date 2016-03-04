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
		var url = "${ctx}/Purchase/detele.html" ;
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
	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<div class="page-header pull-left">
				<div class="page-title">模块管理</div>
			</div>
			<ol class="breadcrumb page-breadcrumb">
				<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">当前位置</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li><a href="#">模块管理</a>&nbsp;&nbsp;<i
					class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
				<li class="active">采购管理</li>
			</ol>

			<div class="clearfix"></div>
		</div>


		<table cellspacing="0" cellpadding="0" class="mana_table">

			<tr>
				<td colspan="2" class="form" style="margin-top: 12px;">
					<form action="${ctx}/Purchase/list.html" method="post">
						<input  type="text" class="text w150 fl" id="title" name="title" placeholder="请输入标题"  value="${proInvestment.title }"
							value="请输入模块名称" style="margin-left: 20px;" />
						<%-- <input type="hidden" class="text w150 ml5 fl" name="siName"  value="${site.siName }"/> --%>
						&nbsp;&nbsp;<input type="submit" value="搜索"
							class="btn btn-primary">&nbsp; 
					</form>
				</td>
				<td style="width: 918px;">
					<div class="btn-group">
						<button type="button" data-toggle="dropdown"
							class="btn btn-default btn-sm dropdown-toggle">
							<i class="fa fa-sitemap fa-fw"></i>&nbsp; 请选择类别 &nbsp; <span
								class="caret"></span>
						</button>
						<ul class="dropdown-menu pull-right">
							<li><a href="${ctx}/Purchase/check.html?categoryCode=121"><i
									class="fa fa-gift fa-fw"></i>&nbsp; 首页求购</a></li>
							<li><a href="${ctx}/Purchase/check.html?categoryCode=120"><i
									class="fa fa-gift fa-fw"></i>&nbsp; 冰酒预购</a></li>
							<li><a href="${ctx}/Purchase/check.html?categoryCode=119"><i
									class="fa fa-gift fa-fw"></i>&nbsp; 大宗采购</a></li>
							<li><a href="${ctx}/Purchase/check.html?categoryCode=118"><i
									class="fa fa-gift fa-fw"></i>&nbsp; 当日求购</a></li>
							<li><a href="${ctx}/Purchase/check.html?categoryCode=117"><i
									class="fa fa-gift fa-fw"></i>&nbsp;紧急求购</a></li>
							<li><a href="${ctx}/Purchase/check.html?categoryCode=116"><i
									class="fa fa-gift fa-fw"></i>&nbsp; 采购专场</a></li>


						</ul>
					</div>
				</td>
			</tr>

		</table>

		<!--BEGIN CONTENT-->
		<div class="page-content">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<a href="${ctx}/Purchase/add.html"><input type="button"
								class="btn btn-primary" value="添加求购单"></a> <a
								href="${ctx}/Purchase/list.html"><input type="button"
								class="btn btn-primary" value="求购列表"></a>
								<a href="${ctx}/Purchase/check.html?status=8"><input
								type="button" class="btn btn-primary" value="已推荐"></a> <a
								href="${ctx}/Purchase/check.html?status=16"><input
								type="button" class="btn btn-primary" value="已置顶"></a> <%-- <a
								href="${ctx}/Purchase/check.html?status=1"><input
								type="button" class="btn btn-primary" value="未审核"></a> <a
								href="${ctx}/Purchase/check.html?status=2 "><input
								type="button" class="btn btn-primary" value="已审核"></a> <a
								href="${ctx}/Purchase/check.html?status=256 "><input
								type="button" class="btn btn-primary" value="未通过"></a> <a
								href="${ctx}/Purchase/check.html?status=64"><input
								type="button" class="btn btn-primary" value="已过期 "></a> <a
								href="${ctx}/Purchase/check.html?status=4"><input
								type="button" class="btn btn-primary" value="禁用"></a> --%>
						</div>
						<div class="panel-body">
							<div id="no-more-tables">
								<table
									class="table table-bordered table-striped table-condensed cf">
									<thead class="cf">
										<tr>
											<th width="30">&nbsp</th>
											<th>标题</th>
											<th>采购详情</th>
											<th class="numeric">联系人</th>
											<th class="numeric">联系电话</th>
											<th class="numeric">报价次数</th>
											<!-- <th class="numeric">图片</th> -->
											<!-- <th class="numeric">所属类别</th> -->
											<th class="numeric">收货地址</th>
											<th class="numeric">供应商地址</th>
											<th class="numeric">报价截止日期</th>
											<!-- <th class="numeric">修改时间</th> -->
											<th class="numeric">操作</th>
										</tr>
									</thead>
									<tbody>
										<form id="deleteForm">
											<input id="id" type="hidden" name="id">
										</form>
										<c:forEach var="proPurVo" items="${page.list}">

											<tr>
											   <td><input type="checkbox" name="checkbox" value="${proPurVo.id}"/></td>
												<td data-title="Code">${proPurVo.title }</td>
												<td data-title="Company"><a data-toggle="modal"
													onclick="show(this.title)" id="summary" data-target="#messageInfo1"
													style="cursor: pointer;" title="${proPurVo.summary}"> 
													<c:set
															var="testStr" value="${proPurVo.summary}" /> <c:choose>
															<c:when test="${fn:length(testStr)> 10}">
																<c:out value="${fn:substring(testStr, 0,9)}..." />
															</c:when>
															<c:otherwise>
																<c:out value="${testStr}" />
															</c:otherwise>
														</c:choose>
												</a></td>

												<td data-title="Price" class="numeric">${proPurVo.linkman
													}</td>
												<td data-title="Change" class="numeric">${proPurVo.tel
													}</td>

												<td data-title="Change" class="numeric">${proPurVo.quoteTimes
													}</td>
													<%-- <td class="img_">
		                  		                    <img class="img_" alt="" src="${ctx}/${proPurVo.picture}">
		                  		                    </td> --%>


												<%-- <td data-title="Company">${proPurVo.code}</td> --%>
												<td data-title="Company">${proPurVo.deliveryAddr}</td>
												<td data-title="Company">${proPurVo.supplierAddr}</td>
												<td data-title="Price" class="numeric">${proPurVo.endTime}</td>
												<%-- <td data-title="Price" class="numeric">${proPurVo.modifyTime}</td> --%>

												<td data-title="Open" class="numeric"><a
													class="btn btn-primary btn-sm"
													href="${ctx}/Purchase/toEdit.html?id=${proPurVo.id}">编辑</a>&nbsp;&nbsp;
													<a
													class="btn btn-primary btn-sm"
													href="${ctx}/Purchase/detail.html?id=${proPurVo.id}">查看</a>&nbsp;&nbsp;
													<a data-toggle="modal" onclick="deletenews(${proPurVo.id})"
													data-target="#messageInfo" class="btn btn-danger btn-sm">删除</a>&nbsp;&nbsp;
													<!--  <input type="button" value="禁用"> --></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
                               <input type="checkbox" id="all" /> &nbsp;
                               <input type="button" value="推荐" onclick="checkedNode(8)"> 
								<input type="button" value="置顶" onclick="checkedNode(16)"> 
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
	<script>

			        $(function () {

			            $("#all").click(function () {

			                var checked_status = this.checked;

			                $("input[name=checkbox]").each(function () {

			                    this.checked = checked_status;

			                });

			            });
			        });

			    </script>
			     <script type="text/javascript">
		function checkedNode(param){
			var flag = false ;
			//var checkItems = $("input[type=checkbox]:checked") ;
			// 获取勾选的数据 
			var checkItems = $("input[name=checkbox]:checked") ;
			var ids = "" ;
			for(var i=0 ; i < checkItems.length ;i++){
				//获取到具体的id 
				ids += $(checkItems[i]).attr("value")  + "," ;
				
			}
			ids = ids.substring(0,ids.length-1) ;
			if(ids=="" || ids==null){
				alert("请勾选，在进行相关操作！ ");
			}else{
			// ids 
			$.ajax({
				data:{ids:ids,status:param},
				url:"${ctx }/Purchase/checkboxAll.html",
				type:"POST" ,
				async:false ,
				success:function(data){
					if(data.success==true){
						alert("请勾选，在进行相关操作！  ")
					}else{
						// 刷新当前页面 
						window.location.reload() ;
					}
				},
				// AJAX 请求发生错误时执行函数。它是一个 Ajax 事件 
				error:function(){
					window.location.reload() ;
				}
			});
			}
		}
</script>	
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
	<div class="modal fade" id="messageInfo1" data-backdrop="false"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog-tc">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="messageInfoLabel"></h4>
				</div>
				<div class="modal-body" class="">
					<div class="summary1"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 弹出框 end -->
	<script type="text/javascript">
//分页
function page(n, s) {
$("#pageNo").prop("value",n);
$("#searchForm").prop('action', "${ctx }/Purchase/list.html").submit(); 
return false;
}
</script>
</body>
</html>