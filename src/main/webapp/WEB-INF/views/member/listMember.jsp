<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="right"/>
<link rel=stylesheet type=text/css href="${ctx }/admin/css/base.css">
<link rel=stylesheet type=text/css href="${ctx }/admin/css/layout.css">
<title>会员管理</title>
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
		var url = "${ctx}/member/detele.html" ;
		$("#messageInfo").modal("hide");//关闭窗口
		$("#deleteForm").attr("action",url).submit() ;	
	}
} 

	/* 显示列表分页 */
	function page(n, s) {
     $("#pageNo").val(n);
     $("#pageSize").val(s);
     $("#searchForm").attr('action', '${ctx}/member/list.html').submit(); 
     return false;
 }
</script>
</head>
<body>
<div id="page-wrapper">
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">会员管理</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="index.html">当前位置</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li><a href="#">会员管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">会员列表</li>
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
					<form action="${ctx }/member/list.html" method="post">
						<input type="text" class="text w150 fl"  name="account" value="${memberVo.account }" placeholder="请输入用户名" style="margin-left:20px;"/>
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
								href="JavaScript:;">会员展示</a>
								</div>

							</ul>
						</div>
						<div class="panel-body">
                                    <div id="no-more-tables">
                                        <table class="table table-bordered table-striped table-condensed cf">
                                            <thead class="cf">
                                                <tr>
                                                     <th class="numeric"></th>
                                                    <th class="numeric">用户名</th>
                                                    <th class="numeric">公司名称</th>
                                                    <th class="numeric">联系人</th>
                                                    <th class="numeric">移动电话</th>
                                                    <th class="numeric">邮箱</th>
                                                    <th class="numeric">qq</th>
                                                    <th class="numeric">固定电话</th>
                                                    <th class="numeric">联系地址</th>
                                                    <th class="numeric">注册时间</th>
                                                   
                                                    <th class="numeric">操作</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <form id="deleteForm"><input id="id" type="hidden" name="memberId"></form>
                                            
                                            <c:forEach var="memberVo" items="${list}">
                                                <tr>
                                                    <td><input type="checkbox" name="checkbox"/></td>
                                                    <td data-title="Code">${memberVo.account }</td>
                                                    <td data-title="Code">${memberVo.companyname }</td>
                                                    <td data-title="Code">${memberVo.linkMan }</td>
                                                    <c:if test="${memberVo.mobile == null}">
                                                     <td data-title="Code">未填写</td>
                                                    </c:if>
                                                    <c:if test="${memberVo.mobile != null}">
                                                     <td data-title="Code">${memberVo.mobile }</td>
                                                    </c:if>
                                                     <td data-title="Code">${memberVo.email }</td>
                                                     <c:if test="${memberVo.qq == null}">
                                                     <td data-title="Code">未填写</td>
                                                    </c:if>
                                                    <c:if test="${memberVo.qq != null}">
                                                     <td data-title="Code">${memberVo.qq }</td>
                                                    </c:if>
                                                    <c:if test="${memberVo.address == null}">
                                                     <td data-title="Code">未填写</td>
                                                    </c:if>
                                                    <c:if test="${memberVo.address != null}">
                                                     <td data-title="Code">${memberVo.address }</td>
                                                    </c:if>
                                                   <c:if test="${memberVo.telephone == null}">
                                                     <td data-title="Code">未填写</td>
                                                    </c:if>
                                                    <c:if test="${memberVo.telephone != null}">
                                                     <td data-title="Code">${memberVo.telephone }</td>
                                                    </c:if>
                                                    <td data-title="Code">${memberVo.addTime }</td>
                                             	  <%--  <fmt:formatDate value="${memberVo.addTime}" pattern="yyyy-MM-dd" />  --%>
                                                 <td><a class="btn btn-primary btn-sm" href="${ctx }/member/update.html?id=${memberVo.memberId}">重置密码</a>&nbsp;&nbsp; 
                                                 <a data-toggle="modal" onclick="deletenews(${artilceVo.memberId})"  data-target="#messageInfo" class="btn btn-danger btn-sm">删除</a>
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