<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="sitemesh"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理后台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="Thu, 19 Nov 1900 08:52:00 GMT">
<script src="${ctx }/admin/js/jquery-1.10.2.min.js"></script>
<script src="${ctx}/admin/date/WdatePicker.js"></script>
<script src="${ctx}/admin/date/calendar.js"></script>
<link href="${ctx}/admin/date/skin/WdatePicker.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="${ctx }/admin/vendors/jquery-ui-1.10.4.custom/css/ui-lightness/jquery-ui-1.10.4.custom.min.css">
<link type="text/css" rel="stylesheet" href="${ctx }/admin/vendors/font-awesome/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="${ctx }/admin/vendors/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${ctx }/admin/vendors/animate.css/animate.css">
<link type="text/css" rel="stylesheet" href="${ctx }/admin/css/themes/style1/orange-blue.css" class="default-style">
<link type="text/css" rel="stylesheet" href="${ctx }/admin/css/themes/style1/orange-blue.css" id="theme-change" class="style-change color-change">
<link rel="stylesheet" href="${ctx}/admin/kindeditor-master/themes/default/default.css" />
<link rel="stylesheet" href="${ctx}/admin/kindeditor-master/plugins/code/prettify.css" />
<script charset="utf-8" src="${ctx}/admin/kindeditor-master/kindeditor-all-min.js"></script>
<script charset="utf-8" src="${ctx}/admin/kindeditor-master/lang/zh-CN.js"></script>
<script charset="utf-8" src="${ctx}/admin/kindeditor-master/plugins/code/prettify.js"></script>
<sitemesh:head></sitemesh:head>
</head>
<body>
	<div>
		<a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
		<div id="header-topbar-option-demo" class="page-header-topbar">
			<nav id="topbar" role="navigation"
				style="margin-bottom: 0; z-index: 2;"
				class="navbar navbar-default navbar-static-top">
			<div class="navbar-header">
				<button type="button" data-toggle="collapse"
					data-target=".sidebar-collapse" class="navbar-toggle">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a id="logo" href="index.html" class="navbar-brand"><span
					class="fa fa-rocket"></span><span class="logo-text">中国网库</span></a>
			</div>
			<div class="topbar-main">
				<a id="menu-toggle" href="#" class="hidden-xs"><i
					class="fa fa-bars"></i></a>


				<ul class="nav navbar navbar-top-links navbar-right mbn">
					<li class="dropdown topbar-user"><a data-hover="dropdown"
						href="#" class="dropdown-toggle">&nbsp;<span class="hidden-xs">当前用户:admin</span>&nbsp;<span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu dropdown-user pull-right">
							<li><a href="extra-profile.html"><i class="fa fa-user"></i>My
									Profile</a></li>
							<li><a href="page-calendar.html"><i
									class="fa fa-calendar"></i>My Calendar</a></li>
							<li><a href="email-inbox.html"><i class="fa fa-envelope"></i>My
									Inbox<span class="badge badge-danger">3</span></a></li>
							<li><a href="#"><i class="fa fa-tasks"></i>My Tasks<span
									class="badge badge-success">7</span></a></li>
							<li class="divider"></li>
							<li><a href="extra-lock-screen.html"><i
									class="fa fa-lock"></i>Lock Screen</a></li>
							<li><a href="extra-signin.html"><i class="fa fa-key"></i>Log
									Out</a></li>
						</ul></li>
					<li class="dropdown topbar-user"><a data-hover="dropdown"
						href="#" class="dropdown-toggle">&nbsp; <span
							class="hidden-xs">中国网库</span>
					</a></li>
				</ul>
			</div>
			</nav>
		</div>
		<!--END TOPBAR-->
		<div id="wrapper">
			<!--BEGIN SIDEBAR MENU-->
			<nav id="sidebar" role="navigation"
				class="navbar-default navbar-static-side">
			<div class="sidebar-collapse menu-scroll">
				<ul id="side-menu" class="nav">
					<li class="user-panel">
						<div class="thumb">
							<img src="${ctx }/admin/img/a5.jpg" alt="" class="img-circle" />
						</div>
						<div class="info">
							<p>管理员</p>
						</div>
						<div class="clearfix"></div>
					</li>
					<li><a href="${ctx }/advertise/list.html?resourceType=advertise"><i
							class="fa fa-tachometer fa-fw"><div class="icon-bg bg-orange"></div></i><span
							class="menu-title">广告管理</span></a> 
                    </li>
                    <li><a href="${ctx }/advertise/messagelist.html?resourceType=message"><i
							class="fa fa-tachometer fa-fw"><div class="icon-bg bg-orange"></div></i><span
							class="menu-title">留言管理</span></a> 
                    </li>
                    <li><a href="${ctx }/article/list.html"><i
							class="fa fa-bullhorn fa-fw"><div class="icon-bg bg-pink"></div></i><span
							class="menu-title">资讯管理</span></a> 
                    </li>
                     <li><a href="${ctx }/articleCategory/list.html"><i
							class="fa fa-bullhorn fa-fw"><div class="icon-bg bg-pink"></div></i><span
							class="menu-title">资讯类别管理</span></a> 
                     </li>
                      <li><a href="${ctx }/member/list.html"><i
							class=""><div class="fa fa-hand-o-up"></div></i><span
							class="menu-title">会员管理</span></a> 
                     </li>
                     <li><a href="${ctx}/prosupply/getProSupply"><i
							class="fa fa-bullhorn fa-fw"><div class="icon-bg bg-pink"></div></i><span
							class="menu-title">供应管理</span></a> 
                     </li>
                    
					  <li ><a href="#"><i class="fa fa-send-o fa-fw"><div
									class="icon-bg bg-green"></div></i><span class="menu-title">供采交</span><span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							
							<li><a href="${ctx }/Purchase/list.html"><i
				
				
									class="fa fa-instagram"></i><span class="submenu-title">采购管理</span></a>
							</li>
							<li><a href="${ctx }/proInvestment/list.html"><i class="fa fa-hand-o-up"></i><span
									class="submenu-title">招商管理</span></a></li>
						</ul></li>
				</ul>
			</div>
			</nav>

			<sitemesh:body></sitemesh:body>

			
			<div id="footer">
				<div class="copyright">2015 © &mu;中国网库 - Responsive
					Multi-Style Admin Template</div>
			</div>
			<!--END FOOTER-->
			<!--END PAGE WRAPPER-->
		</div>
	</div>

	<script src="${ctx }/admin/js/jquery-migrate-1.2.1.min.js"></script>

	<script src="${ctx }/admin/vendors/bootstrap/js/bootstrap.min.js"></script>
	<script src="${ctx }/admin/vendors/bootstrap-hover-dropdown/bootstrap-hover-dropdown.js"></script>
	<script src="${ctx }/admin/js/html5shiv.js"></script>
	<script src="${ctx }/admin/js/respond.min.js"></script>
	<script src="${ctx }/admin/vendors/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx }/admin/vendors/slimScroll/jquery.slimscroll.js"></script>
	<!--设置宽频 -->
	<script src="${ctx }/admin/vendors/jquery-cookie/jquery.cookie.js"></script>


	<script src="${ctx }/admin/js/jquery.menu.js"></script>

	<!--CORE JAVASCRIPT-->
	<script src="${ctx }/admin/js/main.js"></script>
</body>
</html>