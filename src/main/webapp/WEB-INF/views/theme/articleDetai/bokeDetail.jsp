<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<head>
<!-- 引用公共的头部和底部标签 -->
<meta name="decorator" content="common"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="">
<title>中国冰酒交易网-${article.title }</title>

<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Layout.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>
<script language="javascript" src="${ctx}/media/Js/jquery-1.10.2.min.js"></script><!--搜索-->
<script type="text/javascript" src="${ctx}/media/Js/baidu_share.js"></script>
<script type="text/javascript">
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
</head>

<body>
<div class="wrapper">
<!-- 当前位置 -->
      <div class="location mt10 mb10">
          <h6>您的当前位置：<a href="${ctx}/index.html">中国冰酒交易网</a> &gt;&gt; <a href="${ctx}/front/article/list.html"><em>冰酒资讯</em></a> &gt;&gt; <em>冰酒博客</em></h6>
      </div>
    <!-- 当前位置 -->   
</div>
<div class="wrapper">
    <div class="newsLeft">
	   <div class="title"><h3>企业动态</h3></div>
	   <div class="detail2">
	      <div class="artTxt">


					<!-- 文章标头 -->
					<h1 class="h1">${article.title }</h1>
					<h2 class="h2">${article.addTime }</h2>
					<!-- 核心提示 -->
					<!-- 文章详细内容 -->
					<div id="txtAll">
						${articleDetail.articleDetail }
					</div>
           
        <!-- 文章按钮 -->
        <ul class="txtBt">
          <li><!-- JiaThis Button BEGIN -->
				<div class="jiathis_style">
					<a class="jiathis_button_tsina">新浪微博</a>
					<a class="jiathis_button_tqq">腾讯微博</a>
					<a class="jiathis_button_weixin">微信</a>
					<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>
					<a class="jiathis_counter_style"></a>
				</div>
				<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
				<!-- JiaThis Button END -->
          </li>
        </ul>
        <div class="cls"></div>
        
        <!-- 相关文章 -->
        <div class="about">
          <div class="tit1"><h3>相关文章：</h3></div>
          <ul>
           <c:forEach var="articleListVo" items="${bokeList }" begin="0" end="11">
           
           <li><a href="${ctx }/newDetial/bokeDe.html?id=${articleListVo.id}" target="_blank">${articleListVo.title }</a></li>
           
           </c:forEach>
            
          </ul>
          <div class="cls"></div>
        </div>
      
        
        <!-- 我要评论 --></div>
      </div>
    </div>
	 <div id="rightCommon">
	
	</div> 
	<div class="cls"></div>
</div>
</body>

