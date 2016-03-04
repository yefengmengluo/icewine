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
<link type="text/css" href="${ctx}/media/Css/List.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/media/Css/Inquiry.css" />

<script type="text/javascript"
	src="${ctx}/media/Js/ArtDialog/ArtDialog.source.js?skin=green"></script>
<script type="text/javascript" src="${ctx}/media/Js/Inquiry.js"></script>
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>

</head>

<body>
	<!--header begin-->
	<!--未登陆 begin-->

	<div class="wrapper ">
		<div class="w800 floatL">
			<div class="location-java mT10">
				<div class="sL-list floatL">查看所有分类</div>
				<h6>
					您现在的位置：<a href="${ctx}/index.html">首页</a> >> <a
						href="proindex.html">会员加盟</a> >> <span>冰酒</span>
				</h6>
				<!-- <p>
					共找到<span>1288</span>条符合<span>"钢铁"</span>的查询结果
				</p> -->
			</div>

			<div class="cls"></div>
			<div class="s-l-contentL">
				<div class="s-l-contentLTit">
					<h3>所有产品</h3>
					<div class="floatR">
						<a class="s-listing" href="#">列表</a>
					</div>
				</div>
				<div class="s-leftCon">
					<c:forEach var="proInVO" items="${page.list}">
						<div class="s-list-h148">
							<div class="s-list-w100">
								<span><a
									href="${ctx}/front/proinvestment/dateil.html?id=${proInVO.id}"><c:if
											test="${proInVO.localPic == true}">
											<img src="${ctx }/${proInVO.pic}" alt="" />
										</c:if> <c:if test="${proInVO.localPic == false}">
											<img src="http://img4.99114.com/${proInVO.imgUrl}" alt="" />
										</c:if></a></span>
							</div>
							<dl class="s-listL-dl">
								<dt>
									<a
										href="${ctx}/front/proinvestment/dateil.html?id=${proInVO.id}">${proInVO.name}</a>
								</dt>
								<dd>
									品牌：${proInVO.brandName} | 基本投资额： <font class="s-list-red2">
										<c:if test="${empty basicInvestment}">
										</c:if> <c:if test="${not empty basicInvestment}"> ${proInVO.basicInvestment }万元</c:if>
									</font> | 加盟金额： <font class="s-list-red2"> <c:if
											test="${proInVO.siteId eq '1' }">
                                                    1万以下
                                                    </c:if> <c:if
											test="${proInVO.siteId eq '2' }">
                                                   1—3万
                                                    </c:if> <c:if
											test="${proInVO.siteId eq '3' }">
                                                    3—10万 
                                                    </c:if> <c:if
											test="${proInVO.siteId eq '4' }">
                                                   10—30万 
                                                    </c:if> <c:if
											test="${proInVO.siteId eq '5' }">
                                                    30万以上
                                                    </c:if>
									</font>
								</dd>
								<dd>发展模式：线下加盟</dd>

								<dd>${proInVO.modifyTime}</dd>
							</dl>
							<div class="s-list-w157">
								<div class="s-list-inquiry2">
									<%-- <a href="javascript:openDialogInfo('${l.id!}','${l.member_id!}');" class="showbox2">询盘</a> --%>
								</div>
							</div>
							<div class="s-list-w210">
								<p>
									<a href="#">${proInVO.memberBasic.corporationName }</a>
								</p>
								<p class="s-list-huise">销售部：${proInVO.member.linkMan }</p>
								<p class="s-list-huise">${ proInVO.member.telephone}</p>
								<p>
									<a href="#" target="_blank"><img
										src="${ctx}/media/Images/v1/iMage12.gif"></a> <a href="#"
										target="_blank" class="ml5"> <img
										src="${ctx}/media/Images/v1/iMage20.gif"></a><a href="#"
										target="_blank" class="ml5"> <img
										src="${ctx}/media/Images/v1/iMage64.gif"></a>
								</p>
								<p>
									来自：<a href="#">中国冰酒交易网</a>
								</p>

							</div>
						</div>
					</c:forEach>




					<div class="page-java">
						<ul>
							<ul>
								<form action="" id="searchForm" method="post">
									<input type="hidden" id="pageNo" name="pageNo" value="" />
								</form>
								${page}
							</ul>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="w190 floatR">
			<div class="mT10">
				<div class="s-tit">
					<h3>热销排行</h3>
				</div>
				<ul class="s-list-ul">
				<c:forEach var="HotList" items="${HotList }" begin="0" end="9">
					<li><a href="#">${HotList.name }</a></li>
				</c:forEach>
				</ul>
			</div>
			<div class="mT10">
				<div class="s-tit">
					<h3>黄金供应商</h3>
				</div>
				<ul class="s-list-ul2">
					<c:forEach var="jinpai" items="${jinpai }" begin="0" end="4">
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
			<!-- <div class="mT10 border-line">
				<a href="#"><img src="../Temp/vad24.jpg"></a>
			</div>
			<div class="mT10 border-line">
				<a href="#"><img src="../Temp/vad24.jpg"></a>
			</div>
			<div class="mT10 border-line">
				<a href="#"><img src="../Temp/vad24.jpg"></a>
			</div> -->
		</div>
		<div class="cls"></div>
	</div>

	<div class="cls"></div>
	<!--版权信息 begin-->

	<!--询盘弹出层 start-->

	<div class="w600" id="inquiryDiv" style="display: none;">
		<div class="Ma-list mT10">
			<form>
				<table width="100%" cellspacing="2">
					<tr>
						<td width="17%" align="right">我的询问：</td>
						<td width="55%" align="left"><textarea name="title"
								style="resize: none;" class="Ma-asked"
								onblur="if(this.value=='') this.value='说出你向卖家提出的问题，如：我想采购20吨钢管，给我报个价吧！如：我想要样品，可以发过来吗？';this.style.color='#B3B3B3';"
								onclick="if(this.value == '说出你向卖家提出的问题，如：我想采购20吨钢管，给我报个价吧！如：我想要样品，可以发过来吗？') this.value='';this.style.color='black';">说出你向卖家提出的问题，如：我想采购20吨钢管，给我报个价吧！如：我想要样品，可以发过来吗？</textarea>
						</td>
						<td width="28%" align="left" class="Ma-hui"><p
								style="line-height: 20px;">描述越详细，越有利于找到合适供应商。</p></td>
					</tr>
					<tr>
						<td width="17%" align="right"><font class="Ma-red">*</font>
							公司名称：</td>
						<td width="55%" align="left"><input name="corpName"
							type="text" class="input1" value="如：北京昌隆电气设备有限公司"
							onblur="if(this.value=='') this.value='如：北京昌隆电气设备有限公司';this.style.color='#B3B3B3';"
							onclick="if(this.value == '如：北京昌隆电气设备有限公司') this.value='';this.style.color='black';" />
						</td>
						<td width="28%" align="left">&nbsp;</td>
					</tr>
					<tr>
						<td width="17%" align="right"><font class="Ma-red">*</font>
							联系人：</td>
						<td width="55%" align="left"><input name="linkMan"
							type="text" class="input1" value="如：张三"
							onblur="if(this.value=='') this.value='如：张三';this.style.color='#B3B3B3';"
							onclick="if(this.value == '如：张三') this.value='';this.style.color='black';" />
						</td>
						<td width="28%" align="left">&nbsp;</td>
					</tr>
					<tr>
						<td width="17%" align="right"><font class="Ma-red">*</font>
							联系电话：</td>
						<td width="55%" align="left"><input name="tel" type="text"
							class="input1" value="如：固定电话或手机号"
							onblur="if(this.value=='') this.value='如：固定电话或手机号';this.style.color='#B3B3B3';"
							onclick="if(this.value == '如：固定电话或手机号') this.value='';this.style.color='black';" />
						</td>
						<td width="28%" align="left" class="Ma-hui"><p
								style="line-height: 20px;">正确联系方式帮助您快速联系到供应商</p></td>
					</tr>
					<tr>
						<td width="17%" align="right">联系邮箱：</td>
						<td width="55%" align="left"><input name="email" type="text"
							class="input1" value="jszc@99114.com"
							onblur="if(this.value=='') this.value='jszc@99114.com';this.style.color='#B3B3B3';"
							onclick="if(this.value == 'jszc@99114.com') this.value='';this.style.color='black';" />
						</td>

						<td width="28%" align="left">&nbsp;</td>
					</tr>
					<tr>
						<td width="17%" align="right">验证码：</td>
						<td colspan="2"><input id="shop_product_inquiry_image"
							name="vocde" class="input1" maxlength="4"
							style="width: 80px; color: black;" /> <%-- 	<img id="rcodeimage" src="${webRoot!}vcode/image" /> --%>
							<!-- <a href="javascript:void(0);" onclick="codeImage(/vcode/image')">看不清，换一张</a> -->
						</td>
					</tr>
					<tr>

						<td height="53" colspan="3" align="center">
							<%-- <input name="Submit"  type="button"  value="发送询盘"  id="inquiry_submit"
                	 class="btn" style="cursor:pointer;" onclick="doinquiry('${productId!}','${toMemberId!}',2)" /> --%>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 	---------------------------------------页面弹框提示--------------------------------------- -->

	<!-- 提交成功提示框(未登录) -->
	<div class="tck_out" id="shop_product_inquiry_success"
		style="display: none;">
		<div class="tck_main">
			<div class="tck_main_tle">
				<p>
					<img src="../Images/v1/iMage15.gif" /> <span
						style="font-size: 14px; font-weight: bold; line-height: 32px;">恭喜！您的询盘已经送成功！</span>
				</p>
				<p>供应商会尽快与您联系！&nbsp;&nbsp;</p>
			</div>
			<div class="tck_tishi clearfix">
				<p class="fl ts_con">登录或注册成为中国网库会员，将帮您更好的管理信息，找到更多高质量供应商。</p>
			</div>
			<div class="btn_out clearfix">
				<%-- <a class="tck_btn" href="${loginUrl!}">我要登录</a>
        	<a class="tck_btn mrZero" href="${registerUrl!}">我要注册</a> --%>
			</div>
		</div>
	</div>
	<!-- 提交成功提示框(已登录) -->
	<div class="tck_out" id="shop_product_inquiry_login_success"
		style="display: none;">
		<div class="tck_main">
			<div class="tck_main_tle">
				<p>
					<img src="../Images/v1/iMage15.gif" /> <span
						style="font-size: 14px; font-weight: bold; line-height: 32px;">恭喜！您的询盘已经送成功！</span>
				</p>
				<p>供应商会尽快与您联系！&nbsp;&nbsp;</p>
			</div>
			<div class="btn_out">
				<a class="tck_btn btn_inquiry_cancel">确定</a>
			</div>
		</div>
	</div>
	<!--询盘弹出层 end-->


	<script type="text/javascript">
		//分页
		function page(n, s) {
			$("#pageNo").prop("value", n);
			$("#searchForm").prop('action',
					"${ctx }/front/proinvestment/list.html").submit();
			return false;
		}
	</script>
</body>
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

</html>
