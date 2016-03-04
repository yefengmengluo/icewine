<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 引用公共的头部和底部标签 -->
<meta name="decorator" content="common" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国冰酒交易网</title>
<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Layout.css"
	rel="stylesheet" />
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>
<style type="text/css">
.wrapper {
	width: 1000px;
	margin: 0 auto;
}

.artle-title {
	height: 48px;
	line-height: 48px;
	clear: both;
	overflow: hidden;
}

.artle-title h4 {
	font-size: 14px;
	color: #dfa86c;
	height: 48px;
}

.artle-title h5 {
	width: 87px;
	height: 27px;
	padding: 0;
	line-height: 27px;
	text-align: center;
	float: left;
	font-size: 14px;
	background: url(${ctx}/media/Images/iMage39.jpg);
	margin: 10px 15px 0 20px;
	color: #fff;
}

.artle-title h5 a {
	color: #fff;
	cursor: pointer;
}
</style>
</head>

<body>
	<div class="wrapper">
		<!-- 当前位置 -->
		<div class="location mt10 mb10">
			<h6>
				您的当前位置：<a href="${ctx}/index.html">中国冰酒交易网</a> &gt;&gt; <em>行业资讯</em>
			</h6>
			<!-- 当前位置 -->

		</div>
		<div class="wrapper">
			<div class="artle-title">
				<h4 class="floatL">在中国冰酒交易网分享您的冰酒品味，学识，期待您的参与</h4>
				<h5>
					<a href="${ctx }/message.html?resourceType=message">我要供稿</a>
				</h5>
			</div>
		</div>
		<div class="wrapper">
			<div class="wtag">
				<div class="left-756 floatL">
					<div class="Article1-pre">
						<div class="title">
							<h3>行业资讯</h3>
							<div>
								<a class="more" href="${ctx}/more/articleList.html"
									target="_blank">更多>></a>
							</div>

						</div>
						<div class="Arit-cen border-xian h226">
							<div class="art-picAd floatL">
								<a href="${ctx }/newDetial/new.html?id=${article.id}"
									target="_blank"> <c:if test="${article.localPic == true}">
										<img src="${ctx }/${article.pictureUrl}" alt="" />
									</c:if> <c:if test="${article.localPic == false}">
										<img src="http://img4.99114.com/${imgImages.imgPath}" alt="" />
									</c:if>
								</a>
							</div>
							<div class="art-hotnews floatR">
								<dl>
									<dt>
										<a href="${ctx }/newDetial/new.html?id=${article.id}">${article.title}</a>
									</dt>
									<dd>
										${fn:substring(article.summary,0,92)}<a
											href="${ctx }/newDetial/new.html?id=${article.id}"
											class="font_12_red">[阅读详细]</a>
									</dd>
								</dl>
								<ul class="Article1-ul03 w180">
									<c:forEach var="artilceVo" items="${articleList}" begin="0"
										end="3">
										<input type="hidden" value="artilceVo.id" />
										<li><a
											href="${ctx }/newDetial/detail.html?id=${artilceVo.id}"
											target="_blank">${artilceVo.title}</a></li>

									</c:forEach>

								</ul>
							</div>
							<div class="cls"></div>
						</div>
					</div>
				</div>
				<div class="right-232 floatR">
					<div class="Arit-exhibit">
						<div class="title">
							<h3>酿制工艺</h3>
							<div>
								<a class="more" href="${ctx}/more/makeList.html" target="_blank">更多>></a>
							</div>
						</div>
						<div class="border-xian h246">
							<ul class="Article1-ul w230">
								<c:forEach var="makeWineMoresVo" items="${makeWineMores}"
									begin="0" end="7">
									<li><a
										href="${ctx }/newDetial/makeDetail.html?id=${makeWineMoresVo.id}"
										target="_blank">${fn:substring(makeWineMoresVo.title,0,14)}</a></li>
								</c:forEach>

							</ul>
						</div>
					</div>
				</div>
				<div class="cls"></div>
			</div>
			<div class="h200 mT10">
				<div class="title">
					<h3>冰酒品牌</h3>
					<div>
						<a class="more" href="${ctx}/more/brandList.html" target="_blank">更多>></a>
					</div>
				</div>
				<div class="Aritpic-cen h160 border-xian">
					<div id="marquee1" class="detother">
						<ul>
							<c:forEach var="wineBrandVo" items="${wineBrands }" begin="0"
								end="4">
								<li><c:if test="${wineBrandVo.localPic == true}">
										<img src="${ctx }/${wineBrandVo.pictureUrl}" alt="" />
									</c:if> <c:if test="${wineBrandVo.localPic == false}">
										<img src="http://img4.99114.com/${wineBrandVo.imgUrl}" alt="" />
									</c:if> <span><a
										href="${ctx }/newDetial/brandDe.html?id=${wineBrandVo.id}">${fn:substring(wineBrandVo.title,0,10)}</a></span>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="ad960 mT10">
				<a href="#"><img src="${ctx}/media/Temp/index1.jpg" alt=""
					target="_blank" /></a>
			</div>
			<div class="wtag mT10">
				<div class="Arit3-1 w320 floatL mR10">
					<div class="title">
						<h3>国际动态</h3>
						<div>
							<a class="more" href="${ctx}/more/nterList.html" target="_blank">更多>></a>
						</div>
					</div>
					<div class="border-xian h273">
						<ul class="Article1-ul01">
							<c:forEach var="nternationalNewsVo" items="${nternationalNews }"
								begin="0" end="9">
								<li><a
									href="${ctx }/newDetial/nterDe.html?id=${nternationalNewsVo.id}"
									target="_blank">${fn:substring(nternationalNewsVo.title,0,20)}</a></li>

							</c:forEach>

						</ul>
					</div>
				</div>
				<div class="Arit3-1 w320 floatL mR10">
					<div class="title">
						<h3>行情价格</h3>
						<div>
							<a class="more" href="${ctx}/more/pricesList.html"
								target="_blank">更多>></a>
						</div>
					</div>
					<div class="border-xian h273">
						<ul class="Article1-ul01">
							<c:forEach var="pricesNewsVo" items="${pricesNews }" begin="0"
								end="9">
								<li><a
									href="${ctx }/newDetial/pricesDe.html?id=${pricesNewsVo.id}"
									target="_blank">${fn:substring(pricesNewsVo.title,0,20)}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="Arit3-1 w320 floatR">
					<div class="title">
						<h3>名企访谈</h3>
						<div>
							<a class="more" href="${ctx}/more/superList.html" target="_blank">更多>></a>
						</div>
					</div>
					<div class="border-xian h273">
						<c:forEach var="superNewsVo" items="${superNews}" varStatus="i"
							begin="0" end="1">
							<c:if test="${i.index==0 }">
								<dl class="arit3-1-dl">
							</c:if>
							<c:if test="${i.index==1 }">
								<dl class="arit3-1-dl no ">
							</c:if>
							<dt>
								<a href="${ctx }/newDetial/supplyDe.html?id=${superNewsVo.id}"
									target="_blank"> <c:if
										test="${superNewsVo.localPic == true}">
										<img src="${ctx }/${superNewsVo.pictureUrl}" alt=""
											width="100" height="75" /></a>
								</c:if>
								<c:if test="${superNewsVo.localPic == false}">
									<img src="http://img4.99114.com/${superNewsVo.imgUrl}" alt=""
										width="100" height="75" />
									</a>
								</c:if>



							</dt>
							<dd class="h24">
								<span>${fn:substring(superNewsVo.title,0,9)}</span>
							</dd>
							<dd class="h72">
								${fn:substring(superNewsVo.summary,0,28)}<a
									href="${ctx }/newDetial/supplyDe.html?id=${superNewsVo.id}">[详细]</a>
							</dd>
							</dl>



						</c:forEach>

					</div>
				</div>
				<div class="cls"></div>
			</div>
			<div class="ad960 mT10">
				<a href="#" target="_blank"><img
					src="${ctx}/media/Temp/index2.jpg" alt="" /></a>
			</div>
			<div class="wtag mT10">
				<div class="Arit3-1 w320 floatL mR10">
					<div class="title">
						<h3>原料供应</h3>
						<div>
							<a class="more" href="${ctx}/more/supplysList.html"
								target="_blank">更多>></a>
						</div>
					</div>
					<div class="border-xian h273">
						<ul class="Article1-ul01">
							<c:forEach var="supplysVo" items="${supplys }" begin="0" end="9">

								<li><a
									href="${ctx }/newDetial/supplyDe.html?id=${supplysVo.id}"
									target="_blank">${fn:substring(supplysVo.title,0,19)}</a></li>

							</c:forEach>

						</ul>
					</div>
				</div>
				<div class="Arit3-1 w320 floatL mR10">
					<div class="title">
						<h3>冰酒常识</h3>
						<div>
							<a class="more" href="${ctx}/more/commonsList.html"
								target="_blank">更多>></a>
						</div>
					</div>
					<div class="border-xian h273">
						<ul class="Arit3-1-ulimg">

							<c:forEach var="commonsVo" items="${commons }" begin="0" end="3">
								<li><a
									href="${ctx }/newDetial/commonDe.html?id=${commonsVo.id}"
									target="_blank"> <c:if test="${commonsVo.localPic == true}">
											<img src="${ctx }/${commonsVo.pictureUrl}" alt="" />
										</c:if> <c:if test="${commonsVo.localPic == false}">
											<img src="http://img4.99114.com/${commonsVo.imgUrl}" alt="" />
										</c:if> <a href="${ctx }/newDetial/commonDe.html?id=${commonsVo.id}"></a><span>${fn:substring(commonsVo.title,0,9)}</span></a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="Arit3-1 w320 floatR">
					<div class="title">
						<h3>冰酒博客</h3>
						<div>
							<a class="more" href="${ctx}/more/bokesList.html" target="_blank">更多>></a>
						</div>
					</div>
					<div class="border-xian h273">
						<ul class="Article1-ul02">
							<c:forEach var="bokesVo" items="${bokes }" begin="0" end="9">
								<li><a
									href="${ctx }/newDetial/bokeDe.html?id=${bokesVo.id}"
									target="_blank">${fn:substring(bokesVo.title,0,19)}</a></li>

							</c:forEach>

						</ul>
					</div>
				</div>
				<div class="cls"></div>
			</div>
		</div>
	</div>
</body>


</html>
