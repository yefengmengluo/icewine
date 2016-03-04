<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 引用公共的头部和底部标签 -->
<meta name="decorator" content="common" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国冰酒交易网</title>
<!--共有样式-->
<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Layout.css"
	rel="stylesheet" />
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>

</head>

<body>
	<!--header begin-->
	<!--未登陆 begin-->


	<div class="wrapper">
		<!-- 当前位置 -->
		<div class="location mt10 mb10">
			<h6>
				您的当前位置：<a href="#">中国冰酒交易网</a> &gt;&gt; <em>企业会员</em>
			</h6>
			<span><a href="#">企业会员</a> 单品通企业推荐 金牌供应商 最新加入企业</span>
		</div>
		<!-- 当前位置 -->
	</div>
	<div class="wrapper">
		<div class="qiye">
			<div class="left-756 floatL">
				<div class="qyzt_top">
					 <c:forEach var="advertises" items="${advs}" begin="8" end="13">
						<a href="${advertises.imgUrl}" class="f_l" title="${advertises.title }"><img
								src="${ctx}/${advertises.img}" /></a>
					</c:forEach>
				</div>
				<div class="Corp-list mT10">
					<div class="title">
						<h3>企业会员</h3>
						<div>
							<a class="add" href="${ctx}/member/addmember">我要成为会员</a><a class="more"
								href="list.html" target="_blank">更多&gt;&gt;</a>
						</div>
					</div>
					<div class="border-xian">

						<c:forEach var="cor" items="${qiyehuiyuan }">
							<div class="gold">
								<div class="pic">
									<a href="#" target="_blank"> <c:if
											test="${cor.localPic == true}">
											<img src="${ctx }/${cor.pictureUrl}" alt="" width="100px" height="100px"/>
										</c:if> 
										<c:if test="${cor.localPic == false}">
											<img src="http://img4.99114.com/${cor.imgUrl}" width="100px" height="100px"
												alt="" />
										</c:if>
									</a>
								</div>
								<div class="summry">
									<ul class="summryTit">
										<H3>
											<a href="" target="_blank" title="${cor.corporationName}">${
												cor.corporationName}<img src="${ctx}/media/Images/v1/iMage12.gif" />
											</a>
										</H3>
									</ul>
									<div class="h54">${cor.summary }</div>
									<div class="h18">
										<!-- <strong>经营地址：</strong> --> <span></span>
									</div>
								</div>
								<div class="attribute">

									<div class="contact">
										<div style='display: none;'>
											<label name="FpsSmallIconUser" id="FpsSmallIconUser"
												userid="1294998535373" showname="false"
												onlineimg="http://im.99114.com/cimls/UIManage/icon/icon_online.gif"
												offlineimg="http://im.99114.com/cimls/UIManage/icon/icon_offline.gif"></label>
										</div>
										<a href="${ctx}/message.html?resourceType=message"
											class="wkLY" target="_blank" title="点此给卖家发布报价信息">我要留言</a> <a
											href="http://ghsc.cn.99114.com/ContactUS.shtml" class="wkLX"
											target="_blank" title="点此查看卖家电话、传真、地址等具体联系方式。">联系方式</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!--左侧部分-->
			<div class="right-232 floatR">
				<c:if test="${empty memberId}">
			<div class="surbuy-pub">
				<a target="_blank" class="s-login mR10" href="${ctx}/tologin">会员登录</a><a
					target="_blank" class="s-register" href="${ctx}/member/addmember">会员注册</a>
			</div></c:if>
			<!--登录前 end-->
			<!--登录后 begin-->
			<c:if test="${not empty memberId}">
			<div class="adminBtnLogin">
			<a href="${ctx}/front/member/memberCenter.html">进入会员中心</a>
			<a href="#">发布采购</a>
			<a href="#">发布供应</a>
			<a href="#">进入店铺</a>
			</div>
			<!--登录后 end-->
			</c:if>
				<div class="Corp-Rlist mT10">
					<div class="title">
						<h3>推荐供应商</h3>
						<div>
							<a class="more" href="list.html" target="_blank">更多>></a>
						</div>
					</div>
					<div class="border-xian h230">
						<ul>
						<c:forEach var="tuijian" items="${tuijian}" >
							<li><a href="#">${tuijian.corporationName}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!--金牌供应商-->
				<div class="Corp-Rlist mT10">
					<div class="title">
						<h3>金牌供应商</h3>
						<div>
							<a class="more" target="_blank" href="list.html">更多>></a>
						</div>
					</div>
					<div class="border-xian h230">
						<ul>
						<c:forEach var="jinpaigongyingshang" items="${jinpai }" begin="0" end="7">
							<li><a href="#">${jinpaigongyingshang.corporationName }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!--推荐企业榜-->
				<div class="Corp-Rlist mT10">
					<div class="title">
						<h3>最新加入企业</h3>
						<div>
							<a class="more" target="_blank" href="list.html">更多>></a>
						</div>
					</div>
					<div class="border-xian h230">
						<ul>
						<c:forEach var="jiaru" items="${jiaru}" begin="0" end="7">
							<li><a href="#">${ jiaru.corporationName}</a></li>
						</c:forEach>
						</ul>
					</div>
				</div>
				<!--推荐企业榜-->
				<div class="ad23065">
					<a href="#"><img src="../Temp/vad05.jpg" alt="" /></a> <a href="#"><img
						src="../Temp/vad05.jpg" alt="" /></a>
				</div>
			</div>
			<!--右侧部分-->
			<div class="cls"></div>
		</div>
	</div>
	<!--版权信息 begin-->

	<!--版权结束-->
	<script type="text/javascript" src="${ctx }/media/Js/jquery.js"></script>
	<script type="text/javascript" src="${ctx }/media/Js/index.js"></script>
<script type="text/javascript">
	$("#menu li").each(function() {
		$(this).mouseover(function() {
			$(this).addClass("focus")

		})
		$(this).mouseout(function() {
			$(this).removeClass("focus")

		})
	})
	/*鼠标划过显示离开隐藏*/

	$(function() {
		$("#Nav ul li:first .fenlei_t").hover(function() {

			$(this).children("#menuNav").show()
			//alert("")
		}, function() {
			$(this).children("#menuNav").hide()
		})
	})
</script>
</body>
</html>
