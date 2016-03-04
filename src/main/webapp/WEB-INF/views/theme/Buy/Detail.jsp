<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 引用公共的头部和底部标签 -->
<meta name="decorator" content="common" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国冰酒交易网</title>
<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Detail.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/media/Css/Quote.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/media/Css/Style0426.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/media/Js/ArtDialog/skins/green.css" />

<script type="text/javascript" src="${ctx}/media/Js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/media/Js/Index.js"></script>
<script type="text/javascript"
	src="${ctx}/media/Js/ArtDialog/ArtDialog.source.js?skin=green"></script>
<script type="text/javascript" src="${ctx}/media/Js/Quote.js"></script>
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>
</head>

<body>

	<div class="wrapper">
		<!-- 当前位置 -->
		<div class="location mt10 mb10">
			<h6>
				您的当前位置：<a href="${ctx}/index.html">中国冰酒交易网</a> &gt;&gt; <em>产品求购</em>
			</h6>
			<span><a href="${ctx}/front/proPurchase/list.html?categoryCode=116">采购专场</a>
			<a href="${ctx}/front/proPurchase/list.html?categoryCode=117"> 紧急求购</a> 
			<a href="${ctx}/front/proPurchase/list.html?categoryCode=118">当日求购</a> 
				</span>
		</div>
		<!-- 当前位置 -->
	</div>
	<!--main-->
	<div class="wrapper">
		<div class="b-d-h52">
			<p>供应商报价</p>
			<img src="${ctx}/media/Images/iMage28.jpg" />
			<p>采购商筛选供应商</p>
			<img src="${ctx}/media/Images/iMage28.jpg" />
			<p>供应商入围</p>
			<img src="${ctx}/media/Images/iMage28.jpg" />
			<p>双方协商达成交易</p>
		</div>
	</div>
	<div class="wrapper ">
		<div class="left-756 b-DetailL floatL mT10">
			<div class="b-DetailLTit">
				<span>${proPurchase.title}</span>
			</div>
			<div class="b-D-w716">
				<div class="b-D-apply floatL">
					<div class="b-D-threeBtn">
						<c:choose>
							<c:when test="${days >0 }">
								<strong class="b-D-countDown">报名倒计时：剩余<span>${days}</span>天
								</strong>
								<a class="b-D-offer s-allPrice showbox"
									href="javascript:toquote('${proPurchase.id}','${proPurchase.memberId}');">立即报价</a>

							</c:when>

							<c:otherwise>
								<strong class="b-D-countDown">报名倒计时： 已过期 </strong>
								<strong class="b-D-end">报价已截止</strong>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="cls"></div>
					<p>
						已有 <span>${proPurchase.quoteTimes}</span> 人报价<br />
						交货地址：${proPurchase.deliveryAddr}
					</p>
					<dl>
						<dt>供应商符合以下条件优先</dt>
						<dd>期望供应商所在地：区域不限</dd>

					</dl>
				</div>
				<%-- <div class="b-D-download floatR mT20">
					<span class="imgSpan"><a href="#"><img
							src="${ctx}/media/Temp/vad27.jpg"/></a></span>
					<p>
						<a href="#">下载附件</a>
					</p>
				</div> --%>
				<div class="cls"></div>
			</div>
			<div class="cls"></div>
			<div class="w716">
				<div class="art2L_details_wblgjc_title mT20">采购产品详情</div>
				<ul class="b-D-detail">
					<li class="b-d-detailH40"><h3>采购物品</h3>
						<h3>采购数量</h3>
						<h3>目标单价</h3></li>
					<li><p>${proPurchase.title}</p>
						<p>${proPurchase.purchaseAmount}${proPurchase.purchaseAmountUnit
							}</p>
						<p>${proPurchase.unitPrice}${ proPurchase.unit}</p></li>

				</ul>
			</div>
			<div class="w716">
				<div class="b-D-Tit mT20">采购产品详情</div>
				<p class="b-D-detailTxt">${proPurchase.summary}</p>
			</div>
			<div class="w716">
				<div class="art2L_details_wblgjc_title mT20">已报名的企业</div>

				<div class="scrollBox">
					<ul class="b-D-applyBusiness">
						<c:forEach var="ProPurVo" items="${queryListqu}">
							<li><div>
									<p>
										<c:if test="${empty  ProPurVo.memberBasic.corporationName }">
										暂无公司名称
									</c:if>
										<c:if test="${not empty ProPurVo.memberBasic.corporationName}">
										${ProPurVo.memberBasic.corporationName}
									</c:if>

									</p>

									<span>${ProPurVo.addTime}</span>报名
								</div></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="cls"></div>
			<div class="w716">
				<div class="art2L_details_wblgjc_title mT20">相关采购单推荐</div>

				<c:forEach var="quote" items="${proPurchaseQuotes}" varStatus="i">
					<c:if test="${i.index==0}">
						<div class="b-D-w223 floatL mR20">
							<div class="b-D-w221">
								<h3>${quote.proPurchase.title}</h3>
								<dl>
									<dt>采购量：</dt>
									<dd>${quote.proPurchase.
										purchaseAmount}${quote.proPurchase. purchaseAmountUnit}</dd>
									<dt>企业：</dt>
									<dd>
										<p>
											来自 <span>${quote.proPurchase.supplierAddr}</span> 的采购商
										</p>
										<img src="${ctx}/media/Images/v1/iMage61.gif" />
									</dd>
									<dt>截至日期：</dt>
									<dd class="b-d-w137">${quote.proPurchase.endTime }</dd>
								</dl>
								<p class="b-d-peopleNum">
									已有<span> ${quote.proPurchase.quoteTimes }</span> 人报价
								</p>
								<div class="b-D-w221Btn">
									<a
										href="javascript:toquote('${proPurchase.id}','${proPurchase.memberId}');"
										class="showbox">立即报价</a>
								</div>
							</div>
							<div>
								<img src="${ctx}/media/Images/v1/iMage029.jpg" />
							</div>
						</div>
					</c:if>
					<c:if test="${i.index==1}">
						<div class="b-D-w223 floatL mR20">
							<div class="b-D-w221">
								<h3>${quote.proPurchase.title}</h3>
								<dl>
									<dt>采购量：</dt>
									<dd>${quote.proPurchase.
										purchaseAmount}${quote.proPurchase. purchaseAmountUnit}</dd>
									<dt>企业：</dt>
									<dd>
										<p>
											来自 <span>${quote.proPurchase.supplierAddr}</span> 的采购商
										</p>
										<img src="${ctx}/media/Images/v1/iMage61.gif" />
									</dd>
									<dt>截至日期：</dt>
									<dd class="b-d-w137">${quote.proPurchase.endTime }</dd>
								</dl>
								<p class="b-d-peopleNum">
									已有<span> ${quote.proPurchase.quoteTimes }</span> 人报价
								</p>
								<div class="b-D-w221Btn">
									<a
										href="javascript:toquote('${proPurchase.id}','${proPurchase.memberId}');"
										class="showbox">立即报价</a>
								</div>
							</div>
							<div>
								<img src="${ctx}/media/Images/v1/iMage029.jpg" />
							</div>
						</div>
					</c:if>
					<c:if test="${i.index==2}">
						<div class="b-D-w223 floatL mR20">
							<div class="b-D-w221">
								<h3>${quote.proPurchase.title}</h3>
								<dl>
									<dt>采购量：</dt>
									<dd>${quote.proPurchase.
										purchaseAmount}${quote.proPurchase. purchaseAmountUnit}</dd>
									<dt>企业：</dt>
									<dd>
										<p>
											来自 <span>${quote.proPurchase.supplierAddr}</span> 的采购商
										</p>
										<img src="${ctx}/media/Images/v1/iMage61.gif" />
									</dd>
									<dt>截至日期：</dt>
									<dd class="b-d-w137">${quote.proPurchase.endTime }</dd>
								</dl>
								<p class="b-d-peopleNum">
									已有<span> ${quote.proPurchase.quoteTimes }</span> 人报价
								</p>
								<div class="b-D-w221Btn">
									<a
										href="javascript:toquote('${proPurchase.id}','${proPurchase.memberId}');"
										class="showbox">立即报价</a>
								</div>
							</div>
							<div>
								<img src="${ctx}/media/Images/v1/iMage029.jpg" />
							</div>
						</div>
					</c:if>
				</c:forEach>

			</div>
		</div>
		<div class="right-232 floatR mT10">
			<div class="b-D-w228dl">
				<dl>
					<dt>采购商信息</dt>
					<dd>来自：${proPurchase.supplierAddr }</dd>
					<dd>
						企业认证：<img src="${ctx}/media/Images/v1/iMage61.gif" />
						<!--（身份认证、资质认证等）-->
					</dd>
				</dl>
				<dl>
					<dt>公司详情</dt>
					<dd>公司名称：${proPurchase.memberBasic.corporationName}</dd>
					<dd>主营行业：葡萄酒/酒</dd>
					<dd>企业类型：个企</dd>
					<dd>
						成立日期：
						<fmt:formatDate value="${proPurchase.memberBasic.addTime}"
							type="both" />
					</dd>
				</dl>
				<dl>
					<dt>采购商动态信息</dt>
					<dd>发布采购单数： ${number}</dd>
				</dl>
				<dl>
					<dt>联系方式</dt>
					<dd>${proPurchase.member.mobile}</dd>
					<!--登陆后的状态                <dd>
                	联系人：张三<br>
					电话：010-1234567
                </dd>  -->
				</dl>
			</div>

			<div class="w228BtmDl">
				<h3>该公司还采购过</h3>

				<c:forEach var="Quotes" items="${proPurchaseQuotes2 }">
					<div class="b-DetailBtmDl">
						<h5>${Quotes.proPurchase.title }</h5>
						<dl>
							<dt>采购产品</dt>
							<dd>
								数量：${Quotes.proPurchase.purchaseAmount}<span>${Quotes.proPurchase.purchaseAmountUnit
									}</span> 等
							</dd>
							<dt>截至日期：</dt>
							<dd>${Quotes.proPurchase.endTime}"</dd>
						</dl>
						<div class="cls"></div>
						<!-- <div class="b-D-btmBtn">
						<p>
							已有<span>10</span>人报价
						</p>
						<a href="#">立即报价</a>
					</div> -->
					</div>
				</c:forEach>


			</div>
		</div>
		<div class="cls"></div>
	</div>
	<div class="cls"></div>
	<!--版权信息 begin-->

	<!--报价弹出层 start-->
	<div class="b-priceTable" style="display: none; top: 0;" id="toquote">
		<form id="quotefrom" action="${ctx}/front/proPurchase/toquote.html"
			method="post">
			<input type="hidden" id="purId" name="purId"
				value="${proPurchase.id }" />
				
				 <input type="hidden" id="toMemberId"
				name="toMemberId" value="${proPurchase.memberId }" />
			<div class='auoted_pop'>
				<div class='auoted_popcon2 form'>
					<div class='auoted_popt'>
						<div class='clearfix line30 auoted_line auoted_popt_even mB10'>
							<span class='auoted_228 fl auoted_mt12'>产品名称:${proPurchase.title
								}</span> <input type="hidden" name="id0" value="0" /> <span
								class='auoted_mt14 fl'>单价：</span> <input type='text'
								id="perPrice" name="perPrice"
								class='text text-w110 fl auoted_mt14 auoted_mt4 text_h26'
								value="" /><input type='text' placeholder="元/万元" id="unit"
								name="unit"
								class='text text-w110 fl auoted_mt14 auoted_mt4 text_h26'
								value="" />
						</div>
					</div>
					<div class='auoted_popbot'>
						<p>
							<span class='auotedyh-add_92'>发票税点：</span> <input type='text'
								id='nvoiceRate' name='nvoiceRate'
								class='text text-w237 input1 price_ipt' /> %
						</p>
						<p>
							<span class='auotedyh-add_92'>总报价价格：</span> <input type='text'
								id='totalPrice' name='totalPrice'
								class='text text-w237 input1 price_ipt' /> 
						</p>
						<p>
							<span class='auotedyh-add_92'><i class='yh-red cf_red'>*</i>联系人：</span>
							<input type='text' id='linkman' name='linkman'
								class='text text-w296 input1 price_ipt' value='' />
							<div id="telTip" style="width: 280px"></div>
						</p>
						
						<p>
							<span class='auotedyh-add_92'><i class='yh-red cf_red'>*</i>电话：</span>
							<input type='text' id='tel' name='tel'
								class='text text-w296 input1 price_ipt' value='如：固定电话或手机号'
								onblur="if(this.value=='') this.value='如：固定电话或手机号';this.style.color='#B3B3B3';"
								onclick="if(this.value == '如：固定电话或手机号') this.value='';this.style.color='black';" />
						</p>
						<p>
							<span class='auotedyh-add_92 fl'>留言：</span>
							<textarea class='textarea_w393' id='message' name="message"></textarea>
						</p>
						<!-- <p>
							<span class='auotedyh-add_92'>验证码：</span> <input type="text"
								id="vcode" name="vcode" value="" class="input1 price_ipt" /> <img
								src="../vcode/image" width="86" height="28" id="rcodeimage"
								name="rcodeimage" /> <a href="javascript:void(0);"
								onclick="codeImage('../vcode/image')">看不清，换一张</a>
						</p> -->
					</div>
				</div>
				<div class="" style="padding-left: 160px;">
					<input class="b-priceTableBtn1" type="submit" value="确定"
						id="submitBtn"
						style="width: 100px; height: 38px; line-height: 38px; background: url(${ctx}/media/Images/v1/iMage007.gif) left top no-repeat; cursor: pointer; border: none; color: #fff; font-weight: bold; font-size: 14px; vertical-align: middle; display: inline-block; margin: 20px 0 0 60px;" />
				</div>
			</div>
		</form>
	</div>
	<div id="toLogin" style="display: none;">
		<div class="pop">
			<table width="300" border="0">
				<tr>
					<td><img src="../Images/v1/iMage49.gif" width="106"
						height="91" /></td>
					<td>验证消息</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" class="btn01" value="确定"
						onclick="hideQuoteDIV();"
						style="width: 100px; height: 38px; line-height: 38px; background: url(${ctx}/media/Images/v1/iMage007.gif) left top no-repeat; cursor: pointer; border: none; color: #fff; font-weight: bold; font-size: 14px; vertical-align: middle; display: inline-block; margin: 20px 0 0 60px;" />

					</td>
				</tr>
			</table>
		</div>
	</div>
	<!--弹出层 end-->

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
