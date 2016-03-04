<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 引用公共的头部和底部标签 -->
<meta name="decorator" content="common"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国冰酒交易网</title>
<link type="text/css" href="${ctx}/media/Css/Layout.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/media/Js/jquery.js"></script><!--搜索-->
<script type="text/javascript">
	//分页
	function page(n, s) {
		$("#pageNo").prop("value", n);
		$("#searchForm").prop('action', "${ctx }/more/bokesList.html")
				.submit();
		return false;
	}
	
	$(document).ready(function(){
		$.ajax({
			url:'${ctx}/common/right.html', // 
			type:'post',
			success:function(data){
				$("#rightCommon").html(data) ;
			}
		}) ;
	}) ; 
	

</script>
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script> 
</head>
<body>
<!--header begin-->

<!--头部结束-->

<div class="wrapper">
<!-- 当前位置 -->
      <div class="location mt10 mb10">
          <h6>您的当前位置：<a href="${ctx }/index.html">中国冰酒交易网</a> &gt;&gt; <em>冰酒博客</em></h6>
      </div>
    <!-- 当前位置 -->   
</div>
<div class="wrapper">
    <div class="newsLeft h1309">
	   <div class="title"><h3>冰酒博客</h3></div>
	   <div class="detail2 articleList">
	   
	    <c:forEach var="articleVo" items="${page.list }" >
	   
	   
	      <dl>                                                     
		      <dt><a href="${ctx }/newDetial/bokeDe.html?id=${articleVo.id}">${articleVo.title}</a><span >${fn:substring(articleVo.addTime,0,10)}</span></dt>
			  <dd>${fn:substring(articleVo.summary,0,80)}...</dd>
		  </dl>
		 </c:forEach>
		  
		

				<div class="page-java">
				<!-- <ul> -->
					<form action="" id="searchForm" method="post">
									<input type="hidden" id="pageNo" name="pageNo" value="">
					</form>
					
					${page }
					
            <!--   </ul> -->
				</div>
			</div>
	    
	</div>
	 <div id="rightCommon">
	
	</div> 
	
<div class="cls"></div>
</div>

</body>
</html>
