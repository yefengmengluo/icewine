<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="sitemesh"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<div class="newsRight">
		<div class="articleTop10">
			<div class="title"><h3>金牌供应商</h3><h4><a href="/icewine/font/supply/more/SpList">更多>></a></h4></div>
			<div class="detail1">
				<ul>
				    <c:forEach var="goldVo" items="${jinpai }"  begin="0"   end="7"> 
				
	             <li><a href="javascript:;" target="_blank">${goldVo. corporationName }</a></li>
                    </c:forEach>
				</ul>
			</div>
		</div>
		<div class="cls"></div>
		<div class="articleTop10 mT10">
			<div class="title"><h3>最新求购</h3><h4><a href="${ctx}/front/proPurchase/list.html">更多>></a></h4></div>
			<div class="detail1">
				<ul>
				 <c:forEach var="newqiugousVo" items="${newqiugous }" begin="0" end="7">
				   <li><a href="${ctx}/front/proPurchase/dateil.html?id=${newqiugousVo.id}" target="_blank">${fn:substring(newqiugousVo.title,0,15)}</a></li>
				 </c:forEach>				
				</ul>
			</div>
		</div>
        <div class="cls"></div>
<!-- 频道精选 -->
		<div class="selected mT10">
			<div class="title"><h3>频道精选</h3></div>
            <div class="detail1">
            
            
			<ul class="selectedPic">
			 <c:forEach var="articlesVo" items="${articles }" begin="0" end="5">			
				<li><a href="${ctx }/newDetial/new.html?id=${articlesVo.id}" target="_blank">
				 <c:if test="${articlesVo.localPic == true}">
					<img src="${ctx }/${articlesVo.pictureUrl}" alt="" />
				</c:if>
				<c:if test="${articlesVo.localPic == false}"> 
					<img src="http://img4.99114.com/${articlesVo.imgUrl}" alt="" />
				 </c:if> 
				</a>
				<span><a href="${ctx }/newDetial/new.html?id=${articlesVo.id}" target="_blank">${fn:substring(articlesVo.title,0,10)}</a></span></li>
			</c:forEach> 
			</ul>
            <div class="cls"></div>
            <ul class="selectedTxt">
            <c:forEach var="articlesVo" items="${articles }" begin="6" end="11">

				 <li><a href="${ctx }/newDetial/new.html?id=${articlesVo.id}" target="_blank">${fn:substring(articlesVo.title,0,10)}</a></li>
			</c:forEach> 
             
            </ul>
            
            
            </div>
		</div>  
	</div>
