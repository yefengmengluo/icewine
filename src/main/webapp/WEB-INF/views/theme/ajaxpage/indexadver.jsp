<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="sitemesh"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<div class="module3-h219 mT10">
			<div class="title">
				<h3>单品通推荐</h3>
				<h5>

				</h5>
			</div>
			<div class="corCon">
				<ul>
				<c:forEach var="skuVo" items="${skulist }" begin="0" end="10">
				<li><a href="${skuVo.imgUrl }">${fn:substring(skuVo.title,0,15)}</a></li>
				
				</c:forEach>
					
				</ul>
			</div>
		</div>
