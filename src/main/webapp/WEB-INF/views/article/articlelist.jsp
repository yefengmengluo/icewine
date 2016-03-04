<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="right"/>
<link rel=stylesheet type=text/css href="${ctx }/admin/css/base.css">
<link rel=stylesheet type=text/css href="${ctx }/admin/css/layout.css">
<title>资讯管理</title>
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
		var url = "${ctx}/article/detele.html" ;
		$("#messageInfo").modal("hide");//关闭窗口
		$("#deleteForm").attr("action",url).submit() ;	
	}
} 

	/* 显示列表分页 */
	function page(n, s) {
     $("#pageNo").val(n);
     $("#pageSize").val(s);
     $("#searchForm").attr('action', '${ctx}/article/list.html').submit(); 
     return false;
 }
</script>
</head>
<body>
<div id="page-wrapper">
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">资讯管理</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="index.html">当前位置</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li><a href="#">资讯管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">资讯列表</li>
                    </ol>                
                    <div class="clearfix"></div>
                </div>
                <!--END TITLE & BREADCRUMB PAGE-->
                
                <table cellspacing="0" cellpadding="0" class="mana_table">
				<tr>			
					<td width="100">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="form" style="margin-top:12px;">
					<form action="${ctx }/article/list.html" method="post">
						<input type="text" class="text w150 fl" id="title" name="title" value="${article.title }" placeholder="请输入标题" style="margin-left:20px;"/>
						<%-- <input type="hidden" class="text w150 ml5 fl" name="siName"  value="${site.siName }"/> --%>
						&nbsp;&nbsp;<input type="submit" value="搜索" class="btn btn-primary">&nbsp;
						
					</form>
					</td>
				</tr>
			</table>
                
               
                                
                                
                             <!--BEGIN CONTENT-->
                <div class="page-content">
                    <div class="row">
                        <div class="col-lg-12"> 
                            <div class="panel panel-yellow">
						<div class="panel-heading">
							<li class="active"></li>
							<ul class="nav nav-tabs">
								<div class="panel-heading">
								<a class="btn btn-primary btn-sm"
								href="${ctx }/article/add.html">添加资讯</a>
									<a href="${ctx}/article/list.html?dataStatus=1"><input
										type="button" class="btn btn-primary" value="未审核"></a> <a
										href="${ctx}/article/list.html?dataStatus=2 "><input
										type="button" class="btn btn-primary" value="已审核"></a> <a
										href="${ctx}/article/list.html?dataStatus=256 "><input
										type="button" class="btn btn-primary" value="未通过"></a> <a
										href="${ctx}/article/list.html?dataStatus=64"><input
										type="button" class="btn btn-primary" value="已过期 "></a> <a
										href="${ctx}/article/list.html?dataStatus=4"><input
										type="button" class="btn btn-primary" value="禁用"></a>
                                <a href="${ctx}/article/list.html?dataStatus=8"><input
										type="button" class="btn btn-primary" value="推荐"></a>

                                   <a href="${ctx}/article/list.html?dataStatus=16"><input
										type="button" class="btn btn-primary" value="置顶"></a>

								</div>

							</ul>
						</div>
						<div class="panel-body">
                                    <div id="no-more-tables">
                                        <table class="table table-bordered table-striped table-condensed cf">
                                            <thead class="cf">
                                                <tr>
                                                     <th class="numeric"></th>
                                                    <th class="numeric">标题名称</th>
                                                    <th class="numeric">所属类别</th>
                                                    <th class="numeric">来源类型</th>
                                                    <th class="numeric">创建时间</th>
                                                    <!-- <th class="numeric">详情</th> -->
                                                <!--<th class="numeric">资讯图片</th>
                                                    <th class="numeric">作者</th>
                                                    <th class="numeric">来源</th>
                                                    <th class="numeric">核心摘要</th>                               
                                                   
                                                    <th class="numeric">关键词</th>                                          
                                                    <th class="numeric">标签</th>-->                                                                                                
                                                    <th class="numeric">操作</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <form id="deleteForm"><input id="id" type="hidden" name="id"></form>
                                            
                                            <c:forEach var="artilceVo" items="${page.list}">
                                                <tr>
                                                    <td><input type="checkbox" name="checkbox"/></td>
                                                    <td data-title="Code">${artilceVo.title }</td>
                                                    
                                                    <c:if test="${artilceVo.classCode eq '101101' }">
                                                    <td data-title="Price" class="numeric">新闻资讯</td>
                                                    </c:if>
                                                    <c:if test="${artilceVo.classCode eq '101102' }">
                                                    <td data-title="Price" class="numeric">酿制工艺</td>
                                                    </c:if>
                                                     <c:if test="${artilceVo.classCode eq '101103' }">
                                                    <td data-title="Price" class="numeric">冰酒品牌</td>
                                                    </c:if>
                                                     <c:if test="${artilceVo.classCode eq '101104' }">
                                                    <td data-title="Price" class="numeric">国际动态</td>
                                                    </c:if>
                                                     <c:if test="${artilceVo.classCode eq '101105' }">
                                                    <td data-title="Price" class="numeric">行情价格</td>
                                                    </c:if>
                                                     <c:if test="${artilceVo.classCode eq '101106' }">
                                                    <td data-title="Price" class="numeric">名企访谈</td>
                                                    </c:if>
                                                     <c:if test="${artilceVo.classCode eq '101107' }">
                                                    <td data-title="Price" class="numeric">原料供应</td>
                                                    </c:if>
                                                     <c:if test="${artilceVo.classCode eq '101108' }">
                                                    <td data-title="Price" class="numeric">冰酒常识</td>
                                                    </c:if>
                                                     <c:if test="${artilceVo.classCode eq '101109' }">
                                                    <td data-title="Price" class="numeric">冰酒博客</td>
                                                    </c:if>
                                                     <c:if test="${artilceVo.classCode eq '101110' }">
                                                    <td data-title="Price" class="numeric">首页冰酒商讯</td>
                                                    </c:if>
                                                     <c:if test="${artilceVo.classCode eq '101111' }">
                                                    <td data-title="Price" class="numeric">加盟答疑</td>
                                                    </c:if>
                                                      <c:if test="${artilceVo.classCode eq '101112' }">
                                                    <td data-title="Price" class="numeric">创业故事</td>
                                                    </c:if>
                                                      <c:if test="${artilceVo.classCode eq '101113' }">
                                                    <td data-title="Price" class="numeric">新闻资讯2</td>
                                                    </c:if>
                                                     <c:if test="${artilceVo.originType eq 'yc'}">
													 <td data-title="Price" class="numeric">原创</td>
												     </c:if>
												     <c:if test="${artilceVo.originType eq 'zz'}">
													 <td data-title="Price" class="numeric">转载</td>
												     </c:if>
                                                   <%--  <td data-title="Price" class="numeric">${artilceVo.originType}</td> --%>
                                                    <td data-title="Price" class="numeric">${artilceVo.addTime}</td>
                                                   <%--  <td data-title="Change" class="numeric">${artilceVo.articleDetail }</td> --%>
                                                   <%--  <td class="img_"><img class="img_" alt="" src="${ctx }/${artilceVo.pictureUrl }"></td> 
                                                    <td data-title="Price" class="numeric">${artilceVo.author}</td>              
                                                    <td data-title="Price" class="numeric">${artilceVo.origin}</td>
                                                    
                                                    <td data-title="Price" class="numeric">${artilceVo.summary}</td> --%>
                                                    <%--  --%>
                                                   <%--  <td data-title="Change" class="numeric">${artilceVo.keywords }</td> --%>
                                                   <%--  <td data-title="Change" class="numeric">${artilceVo.tag }</td> --%>
                                                    <td><a class="btn btn-primary btn-sm" href="${ctx }/article/update.html?id=${artilceVo.id}">编辑</a>&nbsp;&nbsp;
                                                 <a data-toggle="modal" onclick="deletenews(${artilceVo.id})"  data-target="#messageInfo" class="btn btn-danger btn-sm">删除</a>
                                                 </td>&nbsp;&nbsp;                                                   

                                                   
                                                </tr>
                                            </c:forEach>   
                                            </tbody>
                                             
                                        </table>
                                        <input type="checkbox" id="all" />全选
                                        <!-- 分页的添加 -->
								 <div align="right">
									<form action="" id="searchForm" method="post">
										<input type="hidden" id="pageNo" name="pageNo" value="">
									</form>
									${page }
								</div>

							</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--END CONTENT-->
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
<!-- 弹出框 end -->
 <script type="text/javascript">

			        $(function () {

			            $("#all").click(function () {

			                var checked_status = this.checked;

			                $("input[name=checkbox]").each(function () {

			                    this.checked = checked_status;

			                });

			            });
			        });

			    </script>
</body>
 
</html>