<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>中国冰酒交易网</title>
<meta name="decorator" content="common"/>
<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Layout.css" rel="stylesheet" />
<link href="${ctx}/media/Css/Copyright.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>
</head>
<body>
<div class="wrapper">
<!-- 当前位置 -->
      <div class="location">
          <h6>您的当前位置：<a href="${ctx}/index.html">中国冰酒交易网</a>&gt;&gt;<span>招聘信息<span/></h6>
      </div>
    <!-- 当前位置 -->   
</div>
<div class="wrapper">
		<div class="copyright_left mr10 floatl">
        	<div class="copyright_left_title"><img src="${ctx}/media/Images/Copyright/menu_top.gif" width="207" height="10" alt="" /></div>
             <div class="copyright_left_center">
            	<span class="floatl"><img src="${ctx}/media/Images/Copyright/menu_left.gif" width="2" height="440" alt="" /></span>
                <div class="copyright_menu floatl">
                	<ul class="copymenu ml10">
                    <li class="litit">关于我们</li>
                    	<li><a href="${ctx }/contact.html">关于冰酒交易网</a><span>About Us</span></li>
                        <li class="menudown"><a href="${ctx}/about.html">联系我们</a><span>Contact Us</span></li>
                        <li><a href="${ctx }/message.html?resourceType=message">客户留言板</a><span>Message Board</span></li>
                        <li><a href="Job.html">诚聘英才</a><span>Job</span></li>
                        <li><a href="${ctx}/privacy.html">隐私条款</a><span>Privacy Policy</span></li>
                        <li class="litit">商务合作</li>
                        <li><a href="Ad.html">广告招商</a><span>Advertising</span></li>
                         <li><a href="Link.html">友情链接</a><span>Links</span></li>
                    </ul> 
                </div>
                <span class="floatr"><img src="${ctx}/media/Images/Copyright/menu_right.gif" width="2" height="440" alt="" /></span>
                <div class="cls"></div>
            </div>
        </div>
      <div class="copyright_right floatr">
       	<div class="copyright_right_title ">
		 	<h1>联系我们</h1>
		
		</div>
        <div class="copyright_xian">
        <p><img  src="${ctx}/media/Images/Copyright/top.jpg" alt="" /></p>
        <p class="bj">
        地    址：甘肃省兰州市安宁区九州通西路70号孵化大厦26楼 <br />
        联系电话：0931-7602051<br />
        传    真：0931-7602051<br />
        邮    箱：lanzhou@99114.com</p>
      </div>
      </div>
    
	<div class="cls"></div>
	
</div>


</body>
</html>