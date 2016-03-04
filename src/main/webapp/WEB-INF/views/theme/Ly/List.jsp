<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国冰酒交易网</title>
<meta name="decorator" content="common" />
<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Layout.css" rel="stylesheet" />
<script language="javascript" type="text/javascript" src="${ctx}/media/Js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>
<script type="text/javascript">
//分页
function page(n, s) {
	$("#pageNo").prop("value", n);
	$("#searchForm").prop('action', "${ctx }/detail.html?resourceType=message")
			.submit();
	return false;
}

</script>
</head>

<body>

<div class="wrapper">
<!-- 当前位置 -->
      <div class="location mt10 mb10">
          <h6>您的当前位置：<a href="${ctx }/index.html">中国冰酒交易网</a> &gt;&gt;<em><a href="${ctx }/message.html"> 我要留言</em></a></h6>
      </div>
    <!-- 当前位置 -->   
</div>
<div class="wrapper">
<div class="left-756 liuyanList floatL ">
    <div class="title02" id="titwb">
		<h3>最新留言</h3><h5><a href="${ctx }/message.html?resourceType=message">我要留言</a></h5>
    </div>
    
    <c:forEach var="page" items="${page.list }" > 
      <div class="huifuborder">
              <dl>
                <dt><span class="date">${fn:substring(page.addTime,0,10)}</span><a name="a1" id="#1" href="#">会员：</a><a href="#">${page.title }</a><span>(${page.img })</span></dt>
                
                
                <dd><span class="lySupply">${page.content }</span></dd>
              </dl>
              <div class="huifu">    
                  <span class="huifu2">
                        <b class="colorF">回复：${page.summary }</b> 
                  </span>
                  <!-- 回复时间未加 -->
                  <span class="date2">${fn:substring(page.replyTime,0,10)}</span> 
                  <div class="cls"></div>
              </div>
          </div>
          </c:forEach>
          
          
          
       <div class="page-java">
                <form action="" id="searchForm" method="post">
									<input type="hidden" id="pageNo" name="pageNo" value="">
					</form>
					
					${page }
                </div>
  </div>
<div class="right-232 liuyanR floatR">
        	<div class="lyWyly"><a href="?resourceType=message">我要留言</a></div>
            <div class="listly mT10">
              <div class="title02">
                <h3>热销排行榜</h3>
              </div>
              <ul>
                <li><a href="../Supply/Detail.html">东北公司+基地模式，出售5009品</a></li>
                <li><a href="#">东北公司+基地模式，出售5009品东北公司+基地模式，出售5009品</a></li>
                <li><a href="#">东北公司+基地模式，出售5009品</a></li>
                <li><a href="#">东北公司+基地模式，出售5009品</a></li>
                <li><a href="#">东北公司+基地模式，出售5009品</a></li>
                <li><a href="#">东北公司+基地模式，出售5009品</a></li>
                <li><a href="#">东北公司+基地模式，出售5009品</a></li>
                <li><a href="#">东北公司+基地模式，出售5009品</a></li>
              </ul>
        </div>
        
        <div class="articleTop10">
			<div class="title"><h3>金牌供应商</h3><h4><a href="#">更多>></a></h4></div>
			<div class="detail1">
				<ul>
				     <c:forEach var="goldVo" items="${jinpai }"  begin="0"   end="7"> 
				
	            <li><a href="javascript:;" target="_blank">${goldVo. corporationName }</a></li> 
	               
                 </c:forEach> 
				</ul>
			</div>
		</div>
           
  </div>
 <div class="cls"></div>
</div>
</html>
