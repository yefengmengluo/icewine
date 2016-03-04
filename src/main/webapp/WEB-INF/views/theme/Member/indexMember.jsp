<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 首页无引用公共的头和尾 -->
<meta name="decorator" content="top"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人用户卖家后台-首页</title>

</head>
<body>
	
		<div class="rightCont row clearfix">
			<div class="width750">
				<!--第一部分-->
				<div class="seller_k1">
					<div class="seller position">
						<div class="tx_fl">
							<p>
					<c:if test="${memberBasic.localPic == true}">
					<img src="${ctx}/${memberBasic.logo}" alt="" width="134px" height="134px"/>
				</c:if>
				<c:if test="${memberBasic.localPic == false}"> 
					<img src="http://img4.99114.com/${memberBasic.imgUrl}" alt=""  width="134px" height="134px"/>
				 </c:if>  <b
									class="set_off" id="set_tx"></b>
							</p>
							<ul>
								<li><span class="email_on"></span>已认证</li>
								<li><span class="tel_on"></span>已认证</li>
								<li class="nobr"><span class="tx_on"></span>已认证</li>
							</ul>
						</div>
						<div class="gs_fr">
							<h2>${memberBasic.corporationName}</h2>
							
							<ul class="gs_fr_bot">
								<li><span>我的供应：</span><a href="#">已审核</a> <a href="#">待审核
								</a> <a href="#">未通过审核</a><a href="#">已过期 </a> <a href="#">已禁用 </a></li>
								<li><span>潜在生意：</span><a href="${ctx}/front/member/buyQuote.html" target="_black">已收到的询价</a><a href="${ctx}front/member/membuyQuote.html" target="_black">已发出的报价
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
