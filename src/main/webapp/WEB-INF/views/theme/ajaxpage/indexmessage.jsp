<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="sitemesh"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<div class="module3-h285">
			<div class="title">
				<h3>最新留言</h3>
				<h4>
					<a href="${ctx}/detail.html?resourceType=message">更多&gt;&gt;</a>
				</h4>
				<h5>
			
					<a href="${ctx}/message.html?resourceType=message">我要留言</a>
				</h5>
			</div>
			<div class="lyCon">
			   <c:forEach var="messageVo" items="${page.list }" begin="0" end="2">
			 
				<dl>
					<dt>     
						<span>${fn:substring(messageVo.addTime,0,10)}</span>会员：${messageVo.title }
					</dt>
					<dd>                       
						<span>${fn:substring(messageVo.content,0,13)}<span>
						<br />
					</dd>
				</dl>
				
				  </c:forEach>
			</div>
		</div>
