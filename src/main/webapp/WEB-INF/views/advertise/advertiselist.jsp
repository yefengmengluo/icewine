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
<title>广告管理</title>
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
		var url = "${ctx}/advertise/detele.html" ;
		$("#messageInfo").modal("hide");//关闭窗口
		$("#deleteForm").attr("action",url).submit() ;	
	}
} 

	/* 显示列表分页 */
	function page(n, s) {
     $("#pageNo").val(n);
     $("#pageSize").val(s);
     $("#searchForm").attr('action', '${ctx}/advertise/list.html?resourceType=advertise').submit(); 
     return false;
 }
</script>
</head>
<body>
<div id="page-wrapper">
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">广告管理</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="index.html">当前位置</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li><a href="#">广告管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">广告列表</li>
                    </ol>
                    <!-- <div class="btn btn-blue reportrange hide"><i class="fa fa-calendar"></i>&nbsp;<span></span>&nbsp;report&nbsp;<i class="fa fa-angle-down"></i>
                        <input type="hidden" name="datestart" />
                        <input type="hidden" name="endstart" />
                    </div> -->
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
					<form action="${ctx }/advertise/list.html" method="post">
						<input type="text" class="text w150 fl" id="title" name="title" value="${advertise.title }" placeholder="请输入标题" style="margin-left:20px;"/>
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
                                <li class="active"><a class="btn btn-primary btn-rounded" href="${ctx }/advertise/add.html?resourceType=advertise" >添加广告</a></li>
                                </div>
                                <div class="panel-body">
                                    <div id="no-more-tables">
                                        <table class="table table-bordered table-striped table-condensed cf">
                                            <thead class="cf">
                                                <tr>
                                                    <th>标题</th>
                                                    <th>简介</th>
                                                    <th class="numeric">添加时间</th>
                                                    <th class="numeric">图片</th>
                                                    <th class="numeric">图片链接</th>
                                                    <th class="numeric">内容</th> 
                                                    <th class="numeric">数据状态</th>                             
                                                    <th class="numeric">操作</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <form id="deleteForm"><input id="id" type="hidden" name="id"><input type="hidden" name="resourceType" value="advertise"></form>
                                            <c:forEach var="advertiseVo" items="${page.list}">
                                                <tr>
                                                    <td data-title="Code">${advertiseVo.title }</td>
                                                    <td data-title="Company">${advertiseVo.biref}</td>
                                                    
                                                    <td data-title="Price" class="numeric">${advertiseVo.addTime}</td>
                                                    <td class="img_">
		                  		                    <img class="img_" alt="" src="${ctx }/${advertiseVo.img }">
		                  		                    </td>
		                  		                    <td data-title="Price" class="numeric">${advertiseVo.imgUrl}</td>
                                                    <td data-title="Change" class="numeric">${advertiseVo.content }</td>
                                                      <c:if test="${ advertiseVo.flag eq  '8' }">
                                                      <td data-title="Change" class="numeric">推荐</td>
                                                      </c:if>
                                                       <c:if test="${ advertiseVo.flag eq '16'}">
                                                      <td data-title="Change" class="numeric">置顶</td>
                                                      </c:if>
                                                      <c:if test="${ advertiseVo.flag eq '1'}">
                                                      <td data-title="Change" class="numeric">单品通推荐</td>
                                                      </c:if>
                                                    <td><a class="btn btn-primary btn-sm" href="${ctx }/advertise/update.html?id=${advertiseVo.id}&resourceType=${advertiseVo.adType}">编辑</a>&nbsp;&nbsp;
                                                    <a data-toggle="modal" onclick="deletenews(${advertiseVo.id})"  data-target="#messageInfo" class="btn btn-danger btn-sm">删除</a></td>&nbsp;&nbsp;                                                   

                                                   
                                                </tr>
                                            </c:forEach>   
                                            </tbody>
                                        </table>
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
</body>
</html>