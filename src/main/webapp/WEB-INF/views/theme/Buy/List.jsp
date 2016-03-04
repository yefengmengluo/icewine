<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 引用公共的头部和底部标签 -->
<meta name="decorator" content="common" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国冰酒交易网</title>
<%-- <link rel=stylesheet type=text/css href="${ctx }/admin/css/base.css">
	<link rel=stylesheet type=text/css href="${ctx }/admin/css/layout.css"> --%>

<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/List.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/media/Css/Quote.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/media/Css/Style0426.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/media/Js/ArtDialog/skins/green.css" />
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>
<script type="text/javascript" src="${ctx}/media/Js/jquery.js"></script>
</head>

<body>
	<!--header begin-->
	<!--未登陆 begin-->

	<div class="wrapper ">
		<div class="w800 floatL">
			<div class="location-java mT10">
				<!--  <div class="sL-list floatL">查看所有分类</div> -->
				<h6>
					您现在的位置：<a href="../Index.html">冰酒采购</a> >> <a href="Index.html">采购中心
					</a> >> <span>冰酒</span>
				</h6>
				<!--  <p>共找到<span>1288</span>条符合<span>"钢铁"</span>的查询结果</p> -->
			</div>

			<div class="s-l-contentL mT10">
				<div class="s-leftCon">
					<!-- <div class="s-paixu bg1">
						<ul>
							<li class="s-acq add_bor"><a href="#">默认排序</a></li>

							<li>
								<div class="select">
									<input type="text" class="slt-input w_80" value="所有报价情况" /><a
										href="#nogo" class="add_pricebtm2box"><em
										class="add_pricebtm2"></em></a>
									<div class="slt-option clearfix ">
										<ul class="w48">
											<li><a href="javascript:void(0);" class="w_80">所有报价情况</a></li>
											<li><a href="javascript:void(0);" class="w_80">有报价</a></li>
											<li><a href="javascript:void(0);" class="w_80">无报价</a></li>

										</ul>
									</div>
								</div>
							</li>
							<li class="w150"><font>是否属采购清单</font>
								<div class="select fl">
									<input type="text" class="slt-input w_25" value="不限" /><a
										href="#nogo" class="add_pricebtm2box"><em
										class="add_pricebtm2"></em></a>
									<div class="slt-option clearfix">
										<ul class="w_37">
											<li><a href="javascript:void(0);" class="w_27">不限</a></li>
											<li><a href="javascript:void(0);" class="w_27">是</a></li>
											<li><a href="javascript:void(0);" class="w_27">否</a></li>
										</ul>
									</div>
								</div></li>
							<li class="w100"><font>是否认证</font>
								<div class="select fl">
									<input type="text" class="slt-input w_25" value="不限" /><a
										href="#nogo" class="add_pricebtm2box"><em
										class="add_pricebtm2"></em></a>
									<div class="slt-option clearfix">
										<ul class="w_37">
											<li><a href="javascript:void(0);" class="w_27">不限</a></li>
											<li><a href="javascript:void(0);" class="w_27">是</a></li>
											<li><a href="javascript:void(0);" class="w_27">否</a></li>
										</ul>
									</div>
								</div></li>
							<li class="w121"><span class="s-date">报价截至时间</span><a
								href="#nogo" class="m_downicon"><em class="m_downicon2"></em></a><a
								href="#nogo" class="m_upicon"><em class="m_upicon1"></em></a></li>
						</ul>
					</div> -->
					<p class="cls"></p>
					<c:forEach var="proPurchaseVO" items="${pro}">
						<div class="s-list-h118">
							<dl class="s-list-w250">
								<dt>
									<a
										href="${ctx}/front/proPurchase/dateil.html?id=${proPurchaseVO.id}">${proPurchaseVO.title}</a>
								</dt>
								<dd>
									<span> <c:set var="testStr"
											value="${proPurchaseVO.modifyTime}" /> <c:choose>
											<c:when test="${fn:length(testStr)> 10}">
												<c:out value="${fn:substring(testStr, 0,10)}" />
											</c:when>
											<c:otherwise>
												<c:out value="${testStr}" />
											</c:otherwise>
										</c:choose>
									</span>来自：<a href="#">中国冰酒交易网</a>
								</dd>
								<dd>
									<%-- <a href="#" target="_blank"><img
										src="${ctx}/media/Images/v1/iMage12.gif"></a><a href="#"
										target="_blank" class="ml5"><img
										src="${ctx}/media/Images/v1/iMage20.gif"></a> <a href="#"
										target="_blank" class="ml5"> --%>
									<img src="${ctx}/media/Images/v1/iMage64.gif"></a>
								</dd>
							</dl>
							<ul class="s-listL-ul2">
								<li>收货地址：${proPurchaseVO.deliveryAddr}</li>
								<li>供应商地址：${proPurchaseVO.supplierAddr}</li>
							</ul>
							<ul class="s-list-w115">
								<li class="s-list-weight">采购量：<font class="s-list-red">${fn:split(proPurchaseVO.purchaseAmount,".")[0]}
								</font> ${proPurchaseVO.purchaseAmountUnit}
								</li>
								<li>已有 <font class="s-list-red">${proPurchaseVO.quoteTimes}</font>
									人报价
								</li>

							</ul>
							<ul class="s-list-w150">
								<li>截至日期：${fn:split(proPurchaseVO.endTime," ")[0]}</li>
								<li></li>
							</ul>
							<div class="s-list-btn s-list-btnEnd">
								<!-- 	<span></span> -->

								<p>
									<font color="#fff"><a
										class="b-D-offer s-allPrice showbox"
										href="${ctx}/front/proPurchase/dateil.html?id=${proPurchaseVO.id}">查看详情</a></font>
								</p>
							</div>

						</div>
					</c:forEach>
					<%-- <div class="page-java">
						<ul>
							<form action="" id="searchForm" method="post">
								<input type="hidden" id="pageNo" name="pageNo" value="" />
							</form>
							${page}
						</ul>
					</div> --%>

				</div>

			</div>
		</div>
		<div class="w190 floatR">
			<div class="mT10">
				<div class="s-tit">
					<h3>黄金供应商</h3>
				</div>
				<ul class="s-list-ul2">
				<c:forEach var="jinpai" items="${jinpai}" begin="0" end="4">
					<li><a class="s-list-ul2Pic" href="#"><c:if test="${jinpai.localPic ==true}">
								<img src="${ctx }/${jinpai.pictureUrl}" alt="" width="100px" height="100px"/>
										</c:if> 
										<c:if test="${jinpai.localPic == false}">
											<img src="http://img4.99114.com/${jinpai.imgUrl}" width="100px" height="100px"
												alt="" />
										</c:if></a>
						</li>
					</c:forEach>
				</ul>
			</div>
			
		</div>
		<div class="cls"></div>
	</div>

	<div class="cls"></div>


	<!--eng footer-->
	<!--报价弹出层 start-->
	<div class="b-priceTable" style="display: none; top: 0;" id="toquote">
		<form id="quotefrom">
			<input type="hidden" id="purId" name="purId" value="1" /> <input
				type="hidden" id="status" name="status" value="1" />
			<div class='auoted_pop'>
				<div class='auoted_popcon2 form'>
					<div class='auoted_popt'>
						<div class='clearfix line30 auoted_line auoted_popt_even mB10'>
							<span class='auoted_228 fl auoted_mt12'>产品名称:报价产品 </span> <input
								type="hidden" name="id0" value="0" /> <span
								class='auoted_mt14 fl'>单价：</span> <input type='text'
								id='unitPrice0' name='unitPrice0'
								class='text text-w110 fl auoted_mt14 auoted_mt4 text_h26'
								value="" /> <select class='fl auoted_popw57 auoted_mt4 '
								id="priceUnit0" name="priceUnit0">
								<option value="0">元</option>
								<option value="1">万元</option>
							</select>

						</div>
					</div>
					<div class='auoted_popbot'>
						<p>
							<span class='auotedyh-add_92'>发票税点：</span> <input type='text'
								id='nvoiceRate' name='nvoiceRate'
								class='text text-w237 input1 price_ipt' /> %
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
						style="width: 100px; height: 38px; line-height: 38px; background: url(../Images/v1/iMage007.gif) left top no-repeat; cursor: pointer; border: none; color: #fff; font-weight: bold; font-size: 14px; vertical-align: middle; display: inline-block; margin: 20px 0 0 60px;" />

					</td>
				</tr>
			</table>
		</div>
	</div>
	<!--弹出层 end-->
	<%-- <Script type="text/javascript" src="${ctx}/media/Js/jquery.js"></script> --%>
	<script type="text/javascript" src="${ctx}/media/Js/Index.js"></script>
	<script type="text/javascript"
		src="${ctx}/media/Js/ArtDialog/ArtDialog.source.js?skin=green"></script>
	<script type="text/javascript" src="${ctx}/media/Js/Quote.js"></script>
	<!-- <script type="text/javascript">
		$(function() {
			$(".s-leftCon .s-list-w115 li.s-list-weight").mouseover(function() {
				$(this).children(".b-List-show").show()
			}).mouseout(function() {
				$(this).children(".b-List-show").hide()
			})
		})
	</script> -->
	<script type="text/javascript">
		/* $("#menu li").each(function() {
			$(this).mouseover(function() {
				$(this).addClass("focus")

			})
			$(this).mouseout(function() {
				$(this).removeClass("focus")

			})
		}) 
		 */

		/* $(function() {
			$("#Nav ul li:first .fenlei_t").hover(function() {

				$(this).children("#menuNav").show()
				//alert("")
			}, function() {
				$(this).children("#menuNav").hide()
			})
		}) */
	</script>
	<script type="text/javascript">
		//分页
		function page(n, s) {
			$("#pageNo").prop("value", n);
			$("#searchForm").prop('action',
					"${ctx }/front/proPurchase/list.html").submit();
			return false;
		}
	</script>
</body>

</html>
