<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="sitemesh"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"/>
<head>
<!-- 首页无引用公共的头和尾 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<sitemesh:head></sitemesh:head>
<title>个人用户卖家后台-首页</title>

 <script type="text/javascript" src="${ctx}/media/Js/jquery-1.8.0.min.js"
	language="javascript"></script> 
<script src="${ctx }/admin/vendors/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/admin/date/WdatePicker.js"></script>
<script src="${ctx}/admin/date/calendar.js"></script>
<link href="${ctx}/admin/date/skin/WdatePicker.css" rel="stylesheet"
	type="text/css"/>
<link type="text/css" rel="stylesheet"
	href="${ctx }/admin/vendors/jquery-ui-1.10.4.custom/css/ui-lightness/jquery-ui-1.10.4.custom.min.css"/>
<link type="text/css" rel="stylesheet"
	href="${ctx }/admin/vendors/font-awesome/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet"
	href="${ctx }/admin/vendors/bootstrap/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet"
	href="${ctx }/admin/vendors/animate.css/animate.css"/>
<link type="text/css" rel="stylesheet"
	href="${ctx }/admin/css/themes/style1/orange-blue.css"
	class="default-style"/>
<link type="text/css" rel="stylesheet"
	href="${ctx }/admin/css/themes/style1/orange-blue.css"
	id="theme-change" class="style-change color-change"/>
<link rel="stylesheet"
	href="${ctx}/admin/kindeditor-master/themes/default/default.css" />
<link rel="stylesheet"
	href="${ctx}/admin/kindeditor-master/plugins/code/prettify.css" />
<script charset="utf-8"
	src="${ctx}/admin/kindeditor-master/kindeditor-all-min.js"></script>
<script charset="utf-8"
	src="${ctx}/admin/kindeditor-master/lang/zh-CN.js"></script>
<script charset="utf-8"
	src="${ctx}/admin/kindeditor-master/plugins/code/prettify.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link href="${ctx}/media/Css/base1.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/media/Css/index-sales.css" type="text/css"
	rel="stylesheet" />

<script type="text/javascript" src="${ctx}/media/Js/jquery.tzSelect.js"></script>
<!--select美化-->
<script type="text/javascript" src="${ctx}/media/Js/base.js"
	language="javascript"></script>
<!--顶部js-->
<script type="text/javascript">
	/*-------------select美化-------------------*/
	$('select.regularSelect').tzSelect();

	$('.k-obtain').hover(function() {
		$(this).parent(".k-coin-bit").css("background", "#ff6a00")
	}, function() {
		$(this).parent(".k-coin-bit").css("background", "#ff8833")
	})
</script>

</head>

<body>
	<div class="dltjh_off"></div>
	<div class="dltjh_on">
		<a href="javascript:void(0);" class="teng_close"></a> <a
			href="javascript:void(0);" class="teng_tanc"></a>
	</div>
	<!--浮动层 start -->
	<div class="popcon" style="display: none">
		<div class="pop_conpo">
			<a href="#" class="clear_btn"><img
				src="../images/clear_indexbtn.png" /></a> <a href="#" class="next_btn"><img
				src="../images/next_indexbtn.png" /></a> <span class="check_btn form"><input
				name="" type="checkbox" value="" class="radio" />不再提示</span>
		</div>
	</div>
	<div class="popbj" style="display: none"></div>
	<!--浮动层 end -->
	<!--登陆后 begin-->
	<div class="top_out disNo- login_h">
		<div class="top-1">
			<div class="top-w1000">
				<div class="top-1-L fl">
					<div class="user">${member.account}</div>
					您好,欢迎登录中国冰酒交易网 <a href="${ctx}/memExit.html" class="regist mL10">[退出]</a>
				</div>
			</div>
		</div>
		<!--搜索框 begin-->
		<div class="top-w1000">
			<div class="fl display-table">
				<table height=100%>
					<tr valign=middle>
						<td><img src="${ctx}/media/Images/logo1.jpg" width="90"
							height="22" alt="" /> <img src="${ctx}/media/Images/logo2.jpg"
							width="200" height="22" alt="" /></td>
					</tr>
				</table>
			</div>

		</div>
		<!--搜索框 end-->
		<div class="header mt10">
			<div class="nav">
				<ul class="menu" style="width: 505px;">
					<li class="on"><a href="#">首页</a></li>
					<li><a href="${ctx}/front/member/buylist.html">采购中心</a></li>
					<li><a href="${ctx}/front/member/memberBasic.html">会员信息</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!--登陆后 end-->
	<!--header end-->

	<div class="cls"></div>
	<div class="wrapper mt158 position">
		<div class="leftCont row">
			<div class="tree">
				<ul>
					<li class="tree-f currS"><p>
							供应管理<span class="arrow_t"></span>
						</p></li>
					<li class="h50"><a href="${ctx }/front/member/supply/add.html" class="m-a" id="add">发布产品</a> 
					<a href="${ctx }/front/member/supply/list.html" class="m-a" id="list">产品列表</a>
						
						</li>
					<li class="tree-f"><p>
							招商管理<span></span>
						</p></li>
					<li class="h50"><a href="${ctx}/front/member/addProInve.html"
						class="m-a">发布招商</a> <a href="${ctx}/front/member/list.html"
						class="m-a">招商列表</a></li>

					<li class="tree-f"><p>
							报价信息<span></span>
						</p></li>
					<li class="h50"><a href="${ctx}/front/member/membuyQuote.html" class="m-a">发出的报价</a> <a
						href="${ctx}/front/member/buyQuote.html" class="m-a">收到的询价</a></li>

				</ul>
				<div class="contant">
					<div class="font18">联系客服</div>
					<div class="tel">
						商务合作热线：<br /> <b class="f_blue">40070-99114</b><br /> 客户服务热线：<br />
						<b class="f_blue">40018-99114</b><br /> 客服：<a
							href="http://wpa.qq.com/msgrd?v=3&uin=1814655217&site=qq&menu=yes"
							target="blank"><img border="0" alt="点击这里给我发消息"
							src="http://wpa.qq.com/pa?p=1:1814655217:4"></a>&nbsp;<a
							href="http://wpa.qq.com/msgrd?v=3&uin=2264141792&site=qq&menu=yes"
							target="blank" class="ml10"><img border="0" alt="点击这里给我发消息"
							src="http://wpa.qq.com/pa?p=1:2264141792:4"></a><br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="position"
							id="weib"> <img src="${ctx }/media/Images/v1/wb_ico.jpg" width="25"
							height="21" />
							<p class="wx_k" id="weib_k">
								<img src="${ctx }/media/Images/v1/weib.png" width="105" height="105" />
							</p>
						</span> <span class="position" id="weix"> <img
							src="${ctx }/media/Images/v1/wx_ico.jpg" width="25" height="21" class="ml5" />
							<p class="wx_k" id="weix_k">
								<img src="${ctx }/media/Images/v1/weix.jpg" width="105" height="105" />
							</p>
						</span> <span class="fl mt10">中国冰酒交易网微信：</span><br /> <img
							src="${ctx}/media/Images/wx.gif" width="105" height="105" />
					</div>
				</div>
			</div>
		</div>
		<div class="rightCont row clearfix">
			<div class="width750">
				<!--第一部分-->


				<sitemesh:body></sitemesh:body>


			</div>
		</div>
	</div>
	<div class="cls h60"></div>
	<div class="footer">
		<p>中国冰酒交易网</p>
	</div>





</body>