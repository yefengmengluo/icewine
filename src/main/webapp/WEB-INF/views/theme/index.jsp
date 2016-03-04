<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 首页无引用公共的头和尾 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国冰酒交易网</title>
<link href="${ctx}/media/Css/Base.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/media/Css/Index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="${ctx}/media/Js/jquery.js"></script>
<script type="text/javascript">
	/* 最新留言 获取*/
	$(document).ready(function(){
		$.ajax({
			url:'${ctx}/indexmessage.html?resourceType=message', // 
			type:'post',
			success:function(data){
				$("#rightCommon").html(data) ;
			}
		}) ;
	}) ; 
	
	$(document).ready(function(){
		$.ajax({
			url:'${ctx}/indexsku.html?resourceType=advertise', // 
			type:'post',
			success:function(data){
				$("#skuCommon").html(data) ;
			}
		}) ;
	}) ; 
</script>
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>
</head>
<body>
	<!--header begin-->
	<!--未登陆 begin-->
	<c:if test="${empty memberId}">
 	<div class="top_out login_q">
		<div class="top-1">
			<div class="top-1-L fl">
				欢迎访问中国冰酒交易网 <a href="${ctx}/tologin" class="login mr5 mL10" id="t_login">登陆</a>| <a
					href="${ctx}/register.html" class="regist">注册</a>
			</div>
			<ul class="top-1-R fr topMenu">
				<li>
					<div class="snMenu topMuneList">
						<a href="#" class="topTwoBorder"><span class="buy_order_icon"></span><span
							class="spanB">我的进货单</span><b></b></a>
						<!-- 我的进货单 start -->
						<div class="shoppingList topMuneListCon ">
							<div class="shoppingListCon">
								<p>
									<a href="#">恰恰牌原味香瓜籽</a>
								</p>
								<span class="num"><a class="btn_jian">-</a><input
									id="numVal" type="text" value="1" max="50" min="1"
									class="text_input" /><a class="btn_jia">+</a></span>
								<div class="end"></div>
							</div>
							<div class="shoppingListCon">
								<p>恰恰牌原味香瓜籽</p>
								<span class="num"><a class="btn_jian">-</a><input
									id="numVal" type="text" value="1" max="50" min="1"
									class="text_input" /><a class="btn_jia">+</a></span>
								<div class="end"></div>
							</div>
							<div class="shoppingListCon">
								<p>恰恰牌原味香瓜籽</p>
								<span class="num"><a class="btn_jian">-</a><input
									id="numVal" type="text" value="1" max="50" min="1"
									class="text_input" /><a class="btn_jia">+</a></span>
								<div class="end"></div>
							</div>
							<div class="toSet">
								<a href="#">去结算</a>
							</div>
						</div>
					<!-- 	我的进货单  end
						进货单中暂未添加任何货品 start -->
						<div class="shoppingListno topMuneListCon show1">
							<p>进货单中暂未添加任何货品</p>
							<a href="#">查看进货单</a>
						</div>
					<!-- 	进货单中暂未添加任何货品 end -->
					</div>
				</li>
				<li>
					<div class="snMenu topMuneList">
						<a href="#" class="topTwoBorder"><span class="spanB">会员中心</span><b></b></a>
					<!-- 	会员中心1 start -->
						<div class="topBuyCno topMuneListCon show1 ">
							<div class="fl topbuycon">
								<p>卖家</p>
								<ul>
									<li><a href="#">发布供应</a></li>
									<li><a href="#">已卖出的商品</a></li>
									<li><a href="#">店铺管理</a></li>
								</ul>
							</div>
							<div class="fl topbuycon">
								<p>买家</p>
								<ul>
									<li><a href="#">发布采购</a></li>
									<li><a href="#">已买到的商品</a></li>
								</ul>
							</div>
						</div>
						<!-- 会员中心1 end
						会员中心2 start -->
						<div class="topBuyC topMuneListCon ">
							<a href="#">订单管理</a>
						</div>
						<!-- 会员中心2 end -->
					</div>
				</li>
				<li>
					<div class="snMenu topMuneList">
						<a href="#" class="topTwoBorder"><span class="spanB">服务中心</span><b></b></a>
						<div class="topBuyC topMuneListCon show1">
							<a href="#">单品通</a> <a href="#">行业通</a>
						</div>
					</div>
				</li>
				<li class="topWeibo">
				<iframe width="103" height="24" frameborder="0" src="http://widget.weibo.com/relationship/followbutton.php?language=zh_cn&amp;width=136&amp;height=24&amp;uid=3956076947&amp;style=2&amp;btn=red&amp;dpc=1" border="0" marginheight="0" marginwidth="0" allowtransparency="true" scrolling="no"></iframe>
</li>
			</ul>
		</div>
	</div></c:if>
	<!-- 未登陆 end
	登陆后 begin -->
	<c:if test="${not empty memberId }">
	<div class="top_out disNo login_h">

		<div class="top-1">
			<div class="top-1-L fl">
				您好,欢迎登录中国冰酒交易网<a href="${ctx}/memExit.html" class="regist mL10">[退出]</a>
				<div class="loginTs">
					<div class="loginTsCon">
						<div class="tsCls"></div>
						<p>
							尊敬的冰酒交易网会员，您已成功登录本站<br /> <a href="${ctx}/front/member/memberCenter.html">快速进入会员中心</a>
						</p>
					</div>
					<div class="loginTsIcon"></div>
				</div>
			</div>
			<ul class="top-1-R fr topMenu">
				<li>
					<div class="snMenu topMuneList">
						<a href="#" class="topTwoBorder"><span class="buy_order_icon"></span><span
							class="spanB">我的进货单</span><b></b></a>
						<!-- 我的进货单 start -->
						<div class="shoppingList topMuneListCon show1">
							<div class="shoppingListCon">
								<p>
									<a href="#">恰恰牌原味香瓜籽</a>
								</p>
								<span class="num"><a class="btn_jian">-</a><input
									id="numVal" type="text" value="1" max="50" min="1"
									class="text_input" /><a class="btn_jia">+</a></span>
								<div class="end"></div>
							</div>
							<div class="shoppingListCon">
								<p>恰恰牌原味香瓜籽</p>
								<span class="num"><a class="btn_jian">-</a><input
									id="numVal" type="text" value="1" max="50" min="1"
									class="text_input" /><a class="btn_jia">+</a></span>
								<div class="end"></div>
							</div>
							<div class="shoppingListCon">
								<p>恰恰牌原味香瓜籽</p>
								<span class="num"><a class="btn_jian">-</a><input
									id="numVal" type="text" value="1" max="50" min="1"
									class="text_input" /><a class="btn_jia">+</a></span>
								<div class="end"></div>
							</div>
							<div class="toSet">
								<a href="#">去结算</a>
							</div>
						</div>
						<!-- 我的进货单  end
						进货单中暂未添加任何货品 start -->
						<div class="shoppingListno topMuneListCon show2">
							<p>进货单中暂未添加任何货品</p>
							<a href="#">查看进货单</a>
						</div>
						<!-- 进货单中暂未添加任何货品 end -->
					</div>
				</li>
				<li>
					<div class="snMenu topMuneList">
						<a href="#" class="topTwoBorder"><span class="spanB">会员中心</span><b></b></a>
						<!-- 会员中心1 start -->
						<div class="topBuyCno topMuneListCon show2">
							<div class="fl topbuycon">
								<p>卖家</p>
								<ul>
									<li><a href="#">发布供应</a></li>
									<li><a href="#">已卖出的商品</a></li>
									<li><a href="#">店铺管理</a></li>
								</ul>
							</div>
							<div class="fl topbuycon">
								<p>买家</p>
								<ul>
									<li><a href="#">发布采购</a></li>
									<li><a href="#">已买到的商品</a></li>
								</ul>
							</div>
						</div>
						<!-- 会员中心1 end
						会员中心2 start -->
						<div class="topBuyC topMuneListCon show1">
							<a href="#">订单管理</a>
						</div>
					<!-- 	会员中心2 end -->
					</div>
				</li>
				<li class="li_height"><a href="#">消息中心（<span
						class="fontOrange">5条未读</span>）
				</a></li>
				<li>
					<div class="snMenu topMuneList">
						<a href="#" class="topTwoBorder"><span class="spanB">服务中心</span><b></b></a>
						<div class="topBuyC topMuneListCon show2">
							<a href="#">单品通</a> <a href="#">行业通</a>
						</div>
					</div>
				</li>
				<li class="topWeibo"><iframe width="103" height="24" frameborder="0" src="http://widget.weibo.com/relationship/followbutton.php?language=zh_cn&amp;width=136&amp;height=24&amp;uid=3956076947&amp;style=2&amp;btn=red&amp;dpc=1" border="0" marginheight="0" marginwidth="0" allowtransparency="true" scrolling="no"></iframe>
</li>
			</ul>
		</div>
	</div></c:if>
	<!--登陆后 end-->
	<div class="cls"></div>
	<!--头部开始-->
	<div id="top">
		<div class="wrapper">
			<div class="top-2">
				<div class="logo floatL">
					<a href="#"><img src="${ctx}/media/Temp/logo.jpg" alt="" /></a>
				</div>
				<div class="search floatL tags">
					<div class="sear_box">
						<div class="tabTitleSecach search-tabTitle">
							<ul id="tabul">
								<li class="on"><a href="javascript://"
									onclick="javaScript:loadSearch.setIndex(0,'on');">供应</a></li>
								<li class="on"><a href="javascript://"
									onclick="javaScript:loadSearch.setIndex(1,'on');">求购</a></li>
								<li class=""><a href="javascript://"
									onclick="javaScript:loadSearch.setIndex(2,'on');">公司</a></li>
								<li class=""><a href="javascript://"
									onclick="javaScript:loadSearch.setIndex(3,'on');">招商</a></li>
								<li class=""><a href="javascript://"
									onclick="javaScript:loadSearch.setIndex(4,'on');">资讯</a></li>
							</ul>
						</div>
						<div class="tabBody search-tabBody">
							<div style="display: block;" class="none block">
								<div class="so">
									<%-- <form action="${ctx }/searchPage.html" method="post"> --%>
										<input id="title" name="title" class="searchWord floatl"
											value="请输入您感兴趣的内容"
											onblur="if(this.value=='') this.value='请输入您感兴趣的内容';"
											onclick="if(this.value == '请输入您感兴趣的内容') this.value='';"
											type="text" /> <input id="btnSearch" name=""
											class="searchBut floatl ml10" value="找供应" type="submit" />
									<!-- </form> -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					var loadSearch = new loadTopSearch("loadSearch");
					loadSearch.txtObj = $d("txtSearchKey");
					loadSearch.btnObj = $d("btnSearch");
					loadSearch.tabDiv = $d("tabul");
					loadSearch.isTabSearch = true;
					loadSearch.createHTML("on");
					loadSearch.initEvents();// 控件添加事件
				</script>
				<div class="tell floatR">
					<div class="tellText">400-651-5888</div>

				</div>
			</div>
		</div>
	</div>
	<div class="nav">
		<div class="w1000" id="Nav">
			<ul class="Navbg">
				<li class="PtCategories" id="all_goods"><div class="fenlei_t">
						<h3>冰酒分类</h3>
						<div class="menuNav" id="menuNav" style="display: block;">
							<dl>
								<dt>
									<label>品牌：</label><a href="#"></a>
								</dt>

								<dd>
									<a href="">祁连</a><a href="#">果园</a><a
										href="#">诚润</a> <a href="#">酒之家</a><a href="#">通化恒通</a><a
										href="#">松阳</a><a href="#">晟通</a>
								</dd>
							</dl>
							<dl>
								<dt>
									<label>产地：</label><a href="#"></a>
								</dt>
								<dd>
									<a href="">黑龙江</a><a href="#">河北</a><a
										href="#">河南</a> <a href="">吉林</a><a href="#">湖南</a><a
										href="#">湖北</a><a href="#">广东</a><a href="#">深圳</a><a href="#">上海</a><a
										href="#">大连</a><a href="#">重庆</a><a href="#">南京</a><a href="#">其他</a>
								</dd>
							</dl>
							<dl>
								<dt>
									<label>品种：</label><a href="#"></a>
								</dt>

								<dd>
									<a href="">赛美容</a><a href="#">美乐</a><a
										href="#" 蛇龙珠></a><a href="#" 贵人香></a><a href="#">赤霞珠</a><a
										href="#">梅鹿辄</a><a href="#">西拉</a> <a
										href="Supply/Detail.html">其它</a>
								</dd>
							</dl>
							<dl>
								<dt>
									<label>价格：</label><a href="#"></a>
								</dt>
								<dd>
									<a href="">40-100元</a><a href="#">100-200元</a>
								</dd>
							</dl>
						</div>
					</div></li>
				<li><a href="${ctx}/index.html">首 页</a></li>
				<li><a href="${ctx}/font/supply/supplyIndex.html">冰酒批发</a></li>
				<li><a href="${ctx}/front/proPurchase/buyindex.html">冰酒求购</a></li>
				<li><a href="${ctx}/front/proinvestment/proindex.html">冰酒加盟</a></li>
				<li><a href="${ctx}/front/corporation/corIndex.html">冰酒厂家</a></li>
				<li><a href="${ctx}/front/article/list.html">冰酒资讯</a>
					<div class="new"></div></li>


			</ul>
		</div>
	</div>
	<!--头部结束 -->
	<div class="wrapper clearfix">
		<!-- 代码 开始 -->
		<div class="module2-h326">
			<div class="slider_box" id="slider_name">
				<ul class="silder_con">
					<c:forEach var="advertises" items="${advertises}" begin="0" end="5">
						<li class="silder_panel clearfix"><a href="#" class="f_l"><img
								src="${ctx}/${advertises.img}" /></a></li>
					</c:forEach>
				</ul>
				<ul class="silder_nav clearfix">
					<c:forEach var="advertises" items="${advertises}" begin="0" end="5"
						varStatus="i">

						<li><a href="${advertises.imgUrl}"><img
								src="${ctx}/${advertises.img}" /></a><span class="topImg disNo1"><img
								src="${ctx}/media/Images/top.gif" /> </span></li>
					</c:forEach>

				</ul>
			</div>
		</div>
		<!-- 代码 结束 -->
		<div class="module3-h326">
			<!--登陆前-->
			<c:if test="${empty memberId}">
			<div class="adminlogin">
				<ul>
					<li class="rightLine"><a>用户注册</a></li>
					<li class="LeftLine"><a>用户登录</a></li>
				</ul>
			</div></c:if>
			<!--登陆后-->
			<c:if test="${not empty memberId}">
			<div class="adminloginbegin-1">
          <ul>
            <li ><a href="${ctx}/front/member/memberCenter.html">进入会员中心</a></li>
            <li ><a href="#">发布采购</a></li>
            <li ><a href="#">发布供应</a></li>
            <li ><a href="#">进入店铺</a></li>
          </ul>
        </div></c:if>
			<div class="supplyqh">
				<div class="title4">
					<ul class="t-changeTab22">
						<li class="newon"><a href="#">供应商</a></li>
						<li><a href="#">零售商</a></li>
						<li><a href="#">经销商</a></li>
					</ul>
				</div>
				<div class="supplyThreeTab" style="display: block;">
					<ul class="supplyqhlist ">
				    <li><a href="http://shop.99114.com/41022079">甘肃祁连葡萄酒销售有限公司</a></li>
                    <li><a href="http://shop.99114.com/41012981.html">广州市海珠区骏康食品公司</a></li>
                    <li><a href="http://shop.99114.com/41013005.html"> 上海酩悠国际贸易有限公司</a></li>
                    <li><a href="http://shop.99114.com/41013013">成都君樽贸易有限公司</a></li>
                    <li><a href="http://shop.99114.com/41013009">西安市雁塔区佰金通酒水商行</a></li>
				</div>
				<div class="supplyThreeTab">
				   <ul class="supplyqhlist ">
					<li><a href="http://shop.99114.com/41013297">上海欧睐特贸易有限公司</a></li>
                    <li><a href="http://shop.99114.com/41013264">广州金誉酒酷贸易公司</a></li>
                    <li><a href="http://shop.99114.com/41279543"> 北京九亿龙源商贸有限责任公司</a></li>
                    <li><a href="http://shop.99114.com/41013270">长沙蕴菲酒业有限公司</a></li>
                    <li><a href="http://shop.99114.com/41286036">沈阳亿春雷商贸有限公司</a></li>
					</ul>
				</div>
				 <div class="supplyThreeTab">
				<ul class="supplyqhlist ">
					<li><a href="http://shop.99114.com/41013320">乌鲁木齐任风行贸易有限责任公司</a></li>
                    <li><a href="http://shop.99114.com/41013313">郑州市二七区龙腾酒业</a></li>
                    <li><a href="http://shop.99114.com/41335182">董玉婷酒业商贸有限公司</a></li>
                    <li><a href="http://shop.99114.com/41013299">上海应雄酒业有限公司</a></li>
                    <li><a href="http://shop.99114.com/41013298">深圳市泰源佳酒业有限公司</a></li>
				</ul>
				</div>
				<div class="loginicobottom">
					<span><img src="${ctx}/media/Images/ico1.jpg" width="26"
						height="30" />买家保证</span> <span><img
						src="${ctx}/media/Images/ico2.jpg" width="26" height="30" />
						商家认证</span> <span><img
						src="${ctx}/media/Images/ico3.jpg" width="26" height="30" />安全交易</span>
				</div>
			</div>
		</div>
		<div class="cls"></div>
		<div class="module018-h325">
			<div class="title1 bg">
				<ul class="t-changeTab floatL">
					<li class="nows">特惠特价</li>
					<li>热卖热销</li>
					<li>产品批发</li>
					<li>产品零售</li>
				</ul>
				<div class="floatR">
					<a href="" class="hh">我要发布新品</a><a
						href="${ctx}/font/supply/more/SpList">更多>></a>
				</div>
			</div>
			<div class="w1000productPic supplyFourTab dis">
				<div class="out1">
					<ul class="supplyCon clearfix">
						 <c:forEach var="tjthVo" items="${cjgyList}" begin="0" end="4">
                    <li>
                        <div class="supplyConPic"><span>
                        
                        <a href="${ctx}/font/supply/dateil.html?id=${tjthVo.id}">
                        	<c:if test="${tjthVo.localPic == true}">
							<img src="${ctx}/${tjthVo.pic}" alt="" />
							</c:if>
							<c:if test="${tjthVo.localPic == false}"> 
								<img src="http://img4.99114.com/${tjthVo.imgUrl}" alt="" />
		   					 </c:if>  
		    
		    		</a></span></div>
                        <p class="supplyConTxt"><a href="${ctx}/font/supply/dateil.html?id=${tjthVo.id}">${fn:substring(tjthVo.name,0,19)}</a></p>
                        <div class="supplyConPrice"><em class="floatL">￥${tjtjVo.promotionPrice}</em><a href="#" class="floatR">订购</a> </div>
                        <div class="supplyConCor">${tjthVo.corporationName}<img src="${ctx}/media/Images/v1/iMage12.gif" /></div>
                    </li>
                     </c:forEach>

					</ul>
				</div>
			</div>
			<div class="w1000productPic supplyFourTab">
				<div class="out1">
					<ul class="supplyCon clearfix">
					 <c:forEach var="rxrmVo" items="${rxrmList}" begin="0" end="4">
                    <li>
                        <div class="supplyConPic"><span>
                        <a href="${ctx}/font/supply/dateil.html?id=${rxrmVo.id}">
                        	<c:if test="${rxrmVo.localPic == true}">
							<img src="${ctx}/${rxrmVo.pic}" alt="" />
							</c:if>
							<c:if test="${rxrmVo.localPic == false}"> 
								<img src="http://img4.99114.com/${rxrmVo.imgUrl}" alt="" />
		   					 </c:if> 
		   				 </a></span></div>
                        <p class="supplyConTxt"><a href="${ctx}/font/supply/dateil.html?id=${rxrmVo.id}">${fn:substring(rxrmVo.name,0,19)}</a></p>
                        <div class="supplyConPrice"><em class="floatL">￥${rxrmVo.promotionPrice}</em><a href="#" class="floatR">订购</a> </div>
                        <div class="supplyConCor">${rxrmVo.corporationName}<img src="${ctx}/media/Images/v1/iMage12.gif" /></div>
                    </li>
                     </c:forEach>

					</ul>
				</div>
			</div>
			<div class="w1000productPic supplyFourTab">
				<div class="out1">
					<ul class="supplyCon clearfix">
						 <c:forEach var="bjpfVo" items="${bjpfList}" begin="0" end="4">
                    <li>
                        <div class="supplyConPic">
                        	<span>
                        		<a href="${ctx}/font/supply/dateil.html?id=${bjpfVo.id}">
                        			<c:if test="${bjpfVo.localPic  == true}">
										<img src="${ctx}/${bjpfVo.pic}" alt="" />
									</c:if>
									<c:if test="${bjpfVo.localPic == false}"> 
										<img src="http://img4.99114.com/${bjpfVo.imgUrl}" alt="" />
		   							</c:if>
		   						</a>
		   					</span>
		   				</div>
                        <p class="supplyConTxt">
                        	<a href="${ctx}/font/supply/dateil.htmlid=${bjpfVo.id}">${fn:substring(bjpfVo.name,0,19)} </a>
                        </p>
                        <div class="supplyConPrice">
                        <em class="floatL">
                        	￥${bjpfVo.promotionPrice}
                        </em>
                        <a href="#" class="floatR">订购</a> </div>
                        <div class="supplyConCor">
                        	${bjpfVo.corporationName}<img src="${ctx}/media/Images/v1/iMage12.gif" /></div>
                  	  </li>
                     </c:forEach>
					</ul>
				</div>
			</div>
			<div class="w1000productPic supplyFourTab">
				<div class="out1">
					<ul class="supplyCon clearfix">
					  <c:forEach var="bjlsVo" items="${bjlsList}" begin="0" end="4">
                    <li>
                        <div class="supplyConPic"><span><a href="Supply/dateil.html">
                       <c:if test="${bjlsVo.localPic == true}">
							<img src="${ctx}/${bjlsVo.pic}" alt="" />
							</c:if>
							<c:if test="${bjlsVo.localPic == false}"> 
								<img src="http://img4.99114.com/${bjlsVo.imgUrl}" alt="" />
		   					 </c:if>
                        
                        </a></span></div>
                        <p class="supplyConTxt"><a href="Supply/Detail.html">${fn:substring(bjlsVo.name,0,19)} </a></p>
                        <div class="supplyConPrice"><em class="floatL">￥${bjlsVo.promotionPrice}</em><a href="#" class="floatR">订购</a> </div>
                        <div class="supplyConCor">${bjlsVo.corporationName}<img src="${ctx}/media/Images/v1/iMage12.gif" /></div>
                    </li>
                     </c:forEach>

					</ul>
				</div>
			</div>
		</div>
		<div class="cls"></div>
		<div class="ad_w200">
			<img src="${ctx}/media/Temp/add1.jpg" width="200" height="80" />
		</div>
		<div class="ad_w540">
			<img src="${ctx}/media/Temp/add2.jpg" width="540" height="80" />
		</div>
		<div class="ad_w230">
			<img src="${ctx}/media/Temp/add3.jpg" width="230" height="80" />
		</div>
		<div class="cls"></div>
		<div class="module04-h320">
			<div class="title1 jiak">
				<div class="fenlei">颜色分类</div>
				<ul class="t-change floatL">
					<li class="open">冰白葡萄酒</li>
					<li>冰红葡萄酒</li>
				</ul>
				<div class="floatR green">
					<a href="" class="hh">我要发布新品</a><a href="${ctx}/font/supply/more/SpList" target="_blank">更多>></a>
				</div>
			</div>
			<div class="w754productPic supplyFiveTab dis">
				<ul class="clearfix">
					
                     <c:forEach var="bbptjListVo" items="${bbptjList}" begin="0" end="3">
                    	<li>
                            <div class="supplyConPic1"><span><a href="${ctx}/font/supply/dateil.html?id=${bbptjListVo.id}">
                             <c:if test="${bbptjListVo.localPic == true}">
							<img src="${ctx}/${bbptjListVo.pic}" alt="" />
							</c:if>
							<c:if test="${bbptjListVo.localPic == false}"> 
								<img src="http://img4.99114.com/${bbptjListVo.imgUrl}" alt="" />
		   					 </c:if>
                            </a></span></div>
                            <p class="supplyConTxt"><a href="${ctx}/font/supply/dateil.html?id=${bbptjListVo.id}">${fn:substring(bbptjListVo.name,0,19)}</a></p>
                            <div class="supplyConPrice"><em class="floatL">￥${bbptjListVo.promotionPrice}</em><a href="#" class="floatR">订购</a> </div>
                            <div class="supplyConCor">${bbptjListVo.corporationName}<img src="${ctx}/media/Images/v1/iMage12.gif" /></div>
                        </li>
                        </c:forEach>

			
			

				</ul>
			</div>
		</div>
		<div class="module3-h322">
			<div class="title">
				<h3>热销排行榜</h3>
			</div>
			<div class="hottop" id="myArea">
				<ul>
					<c:forEach var="syrxphbListVo" items="${syrxphbList}" begin="0" end="7">
            <li  class="fore"><em>1</em><h2>${fn.substring(syrxphbListVo.name,0,19)}</h2><div>
            <b>1</b>
            <a href="${ctx}/font/supply/dateil.html?id=${syrxphbListVo.id}">
            <img src="${ctx}/media/Temp/vad20.jpg" align="absmiddle"  />
            </a>
            <i><a href="${ctx}/font/supply/dateil.html?id=${syrxphbListVo.id}">${fn.substring(syrxphbListVo.name,0,19)}</a><br /><strong>￥${bhptjListVo.promotionPrice}</strong></i></div></li>
           
          </c:forEach>
				</ul>
			</div>
		</div>

		<div class="cls"></div>
		<div class="module04-h320">
			<div class="title1 jiak">
				<div class="fenlei">产品品种</div>
				<h4>
					<a href="#" class="yellow">赛美容</a>
				</h4>
				<h4>
					<a href="#">美乐</a>
				</h4>
				<h4>
					<a href="#">蛇龙珠</a>
				</h4>
				<h4>
					<a href="#">贵人香</a>
				</h4>
				<h4>
					<a href="#">赤霞珠</a>
				</h4>
				<h4>
					<a href="#">梅鹿辄</a>
				</h4>
				<h4>
					<a href="#">西拉</a>
				</h4>
				<div class="floatR green">
					<a href="" class="hh">我要发布新品</a>
					<a href="${ctx}/font/supply/more/SpList" target="_blank">更多>></a></div>
			</div>
			<div class="w754productPic dis">
				<ul class="clearfix">
					 <c:forEach var="bjpzListVo" items="${bjpzList}" begin="0" end="3">
                    	<li>
                            <div class="supplyConPic1"><span><a href="Supply/Detail.html">
                             <c:if test="${bjpzListVo.localPic == true}">
							<img src="${ctx}/${bjpzListVo.pic}" alt="" />
							</c:if>
							<c:if test="${bjpzListVo.localPic == false}"> 
								<img src="http://img4.99114.com/${bjpzListVo.imgUrl}" alt="" />
		   					 </c:if>
                            
                            </a></span></div>
                            <p class="supplyConTxt"><a href="Supply/Detail.html"> ${fn:substring(bjpzListVo.name,0,19)} </a></p>
                            <div class="supplyConPrice"><em class="floatL">${bjpzListVo.promotionPrice}</em><a href="#" class="floatR">订购</a> </div>
                            <div class="supplyConCor">${bjpzListVo.corporationName}<img src="${ctx}/media/Images/v1/iMage12.gif" /></div>
                        </li>
                        </c:forEach>
				</ul>
			</div>
		</div>

		<div id="skuCommon">
	
	    </div>
	
		<div class="cls"></div>
		<div class="module04-h590">
			<div class="title1 jiak">
				<div class="fenlei">冰酒产地</div>
				<h4>
					<a href="#" class="yellow">甘肃</a>
				</h4>
				<h4>
					<a href="#">黑龙江</a>
				</h4>
				<h4>
					<a href="#">河南</a>
				</h4>
				<h4>
					<a href="#">吉林</a>
				</h4>
				<h4>
					<a href="#">湖南</a>
				</h4>
				<h4>
					<a href="#">湖北</a>
				</h4>
				<h4>
					<a href="#">广东</a>
				</h4>
				<h4>
					<a href="#">深圳</a>
				</h4>
				<h4>
					<a href="#">上海</a>
				</h4>
				<h4>
					<a href="#">大连</a>
				</h4>
				<h4>
					<a href="#">重庆</a>
				</h4>
				<h4>
					<a href="#">南京</a>
				</h4>
				<h4>
					<a href="#">其他</a>
				</h4>
				<div class="floatR green">
					<a href="" class="hh">我要发布新品</a><a href="${ctx}/font/supply/more/SpList" target="_blank">更多>></a>
				</div>
			</div>
			<div class="w754productPic dis">
				<ul class="clearfix">
					  <c:forEach var="bjcdListVo" items="${bjcdList}" begin="0" end="3">
                    	<li>
                            <div class="supplyConPic1"><span><a href="Supply/Detail.html">
                            <c:if test="${bjcdListVo.localPic == true}">
							<img src="${ctx}/${bjcdListVo.pic}" alt="" />
							</c:if>
							<c:if test="${bjcdListVo.localPic == false}"> 
								<img src="http://img4.99114.com/${bjcdListVo.imgUrl}" alt="" />
		   					 </c:if>
                            
                            </a></span></div> 
                          
                            <p class="supplyConTxt"><a href="Supply/Detail.html"> ${fn:substring(bjcdListVo.name,0,19)} </a></p>
                            <div class="supplyConPrice"><em class="floatL">${bjcdListVo.promotionPrice}</em><a href="#" class="floatR">订购</a> </div>
                            <div class="supplyConCor">${bjcdListVo.corporationName}<img src="${ctx}/media/Images/v1/iMage12.gif" /></div>
                        </li>
                        </c:forEach>

				</ul>
			</div>
		</div>
		 <div id="rightCommon">
	
	   </div>
		<div class="module3-h295 mT10">
			<div class="title">
				<h3>
					<a href="#">交易信息</a>
				</h3>
			</div>
			<div class="tradeList">
				<ul id="trade">
					<li>
						<div>
							<p class="floatL">订单号 13031560201</p>
							<span class="floatR">已经到货</span>
						</div>
						<p>
							<span class="floatL">金额<strong>9810.0</strong>元
							</span> <span class="floatR">山东</span>
						</p>
					</li>
					<li>
						<div>
							<p class="floatL">订单号 13031560206</p>
							<span class="floatR">已经到货</span>
						</div>
						<p>
							<span class="floatL">金额<strong>113290.0</strong>元
							</span> <span class="floatR">河南</span>
						</p>
					</li>
					<li>
						<div>
							<p class="floatL">订单号 13031560215</p>
							<span class="floatR">已经到货</span>
						</div>
						<p>
							<span class="floatL">金额<strong>221770.0</strong>元
							</span> <span class="floatR">陕西</span>
						</p>
					</li>
					<li>
						<div>
							<p class="floatL">订单号 13031560213</p>
							<span class="floatR">已经到货</span>
						</div>
						<p>
							<span class="floatL">金额<strong>8890.0</strong>元
							</span> <span class="floatR">江苏</span>
						</p>
					</li>
				</ul>
				
			</div>
		</div>
		<div class="cls"></div>
		<div class="module04-h320">
			<div class="title1 jiak">
				<div class="fenlei">冰酒品牌</div>
				<h4>
					<a href="#" class="yellow">祁连</a>
				</h4>
				<h4>
					<a href="#">果园</a>
				</h4>
				<h4>
					<a href="#">诚润</a>
				</h4>
				<h4>
					<a href="#">酒之家</a>
				</h4>
				<h4>
					<a href="#">通化恒通</a>
				</h4>
				<h4>
					<a href="#">松阳</a>
				</h4>
				<h4>
					<a href="#">晟通</a>
				</h4>
				<div class="floatR green">
					<a href="" class="hh">我要发布新品</a><a href="${ctx}/font/supply/more/SpList" target="_blank">更多>></a>
				</div>
			</div>
			<div class="w754productPic dis">
				<ul class="clearfix">
					 <c:forEach var="bjppListVo" items="${bjppList}" begin="0" end="3">
                    	<li>
                            <div class="supplyConPic1"><span><a href="Supply/Detail.html">
                             <c:if test="${bjppListVo.localPic == true}">
							<img src="${ctx}/${bjppListVo.pic}" alt="" />
							</c:if>
							<c:if test="${bjppListVo.localPic == false}"> 
								<img src="http://img4.99114.com/${bjppListVo.imgUrl}" alt="" />
		   					 </c:if>
                            </a></span></div>
                            <p class="supplyConTxt"><a href="Supply/Detail.html"> ${fn:substring(bjppListVo.name,0,19)}</a></p>
                            <div class="supplyConPrice"><em class="floatL">${bjppListVo.promotionPrice}</em><a href="#" class="floatR">订购</a> </div>
                            <div class="supplyConCor">${bjppListVo.corporationName}<img src="${ctx}/media/Images/v1/iMage12.gif" /></div>
                        </li>
                        </c:forEach>

				</ul>
			</div>
		</div>
		<div class="ad_w232">
			<a href="http://www.99114.com"><img src="${ctx}/media/Images/38443228.png" width="232"
				height="80" /></a>
		</div>
		<div class="ad_w232">
			<a href="http://www.99114.com"><img src="${ctx}/media/Images/38161562.jpg" width="232"
				height="80" /></a>
		</div>
		<div class="module04-h204">
			<div class="tabW754">
				<div class="InforTab">
					<ul class="t-InforTab floatL">
						<li class="on"><a class="tabLiBg1" href="#"><span>供应</span></a></li>
						<li class=""><a class="tabLiBg2" href="#"><span>求购</span></a></li>
						<li class=""><a class="tabLiBg3" href="#"><span>代理</span></a></li>
					</ul>
					<div class="inforContent floatL block">
						<div class="w244 floatL border-r">
							<a class="w244Pic" href="#"><img
								src="${ctx}/media/Images/38161156.jpg"></a>
							<ul>
							<c:forEach items="${sygyList }" var="sygyList">
								<li><span>[供应]</span><a href="${ctx}/font/supply/dateil.html?id=${sygyList.id}">${sygyList.name}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="w244 floatL">
							<a class="w244Pic" href="#"><img
								src="${ctx}/media/Images/38161276.jpg"></a>
							<ul>
							<c:forEach var="sygy2List" items="${sygy2List }">
								<li><span>[供应]</span><a href="${ctx}/font/supply/dateil.html?id=${sygy2List.id}">${sygy2List.name}</a></li>
					        </c:forEach>			
							</ul>
						</div>
						<div class="w244 floatL">
							<a class="w244Pic" href="#"><img
								src="${ctx}/media/Temp/iPic11.jpg"></a>
							<ul>
								<c:forEach items="${sygyList }" var="sygyList">
								<li><span>[供应]</span><a href="${ctx}/font/supply/dateil.html?id=${sygyList.id}">${sygyList.name}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="inforContent floatL">
						<ul class="inforBuyCon">

							<c:forEach var="qiugou" items="${qiugou1}">
								<li><span>[求购]</span><a
									href="${ctx}/front/proPurchase/dateil.html?id=${qiugou.id}">${qiugou.title
										}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="inforContent floatL">
						<div class="w244 floatL border-r">
							<a target="_blank" href="http://bingjiu.99114.com/" 请输入元素属性=""><img
								width="286" height="78" alt="请输入图片描述"
								src="http://img4.99114.com/2013/10046/12/31/38161276.jpg"></a>
							<ul>
								<c:forEach var="proInvestment2" items="${proInvestment2 }">
									<li><span>[招商]</span><a
										href="${ctx}/front/proinvestment/dateil.html?id=${proInvestment2.id}">${proInvestment2.name}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="w244 floatL ">
							<a target="_blank" href="http://www.99114.com" 请输入元素属性=""><img
								width="286" height="78" alt="请输入图片描述"
								src="http://img4.99114.com/2013/10046/12/31/38161156.jpg" /></a>
							<ul>
								<c:forEach var="proInvestment3" items="${proInvestment3 }">
									<li><span>[招商]</span><a
										href="${ctx}/front/proinvestment/dateil.html?id=${proInvestment3.id}">${
											proInvestment3.name}</a></li>
								</c:forEach>
							</ul>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="cls"></div>
		<!--三列广告-->
		<div class="adr-w242">
			<a><img src="${ctx}/media/Images/38161428.jpg" /></a>
		</div>
		<div class="adr-w242">
			<a><img src="${ctx}/media/Images/39439184.jpg" /></a>
		</div>
		<div class="adr-w242">
			<a><img src="${ctx}/media/Images/38161472.jpg" /></a>
		</div>
		<!--微博-->
		    <div class="module03-h449 mt">
		   <iframe width="100%" height="550" frameborder="0" src="http://widget.weibo.com/weiboshow/index.php?language=&amp;width=0&amp;height=550&amp;fansRow=2&amp;ptype=1&amp;speed=0&amp;skin=1&amp;isTitle=1&amp;noborder=1&amp;isWeibo=1&amp;isFans=1&amp;uid=3956076947&amp;verifier=4998b4b9&amp;dpc=1" scrolling="no" class="share_self"></iframe></div>
            <div class="cls"></div>
		

		<div class="artContribute">
			<span class="bj-left"><a href="${ctx}/message.html?resourceType=message">我要投稿</a></span>
		</div>
		<div class="cls"></div>
		<div class="module05-h312 m0">
			<div class="title6">
				<h3>冰酒商讯</h3>
				<h4>
					<a href="${ctx}/more/busList.html">更多>></a>
				</h4>
			</div>
			<div class="artList">
				<ul>
					<c:forEach var="buiVo" items="${iceWineArticles}" begin="0"
						end="29">
						<li><a href="${ctx }/newDetial/new.html?id=${buiVo.id}">${fn:substring(buiVo.title,0,19)}</a></li>

					</c:forEach>

				</ul>
			</div>
		</div>
		<div class="module03nlm-h312 ml">
			<div class="title6">
				<h3>冰酒博客</h3>
				<h4>
					<a href="${ctx}/more/bokesList.html">更多>></a>
				</h4>
			</div>
			<div class="artList2">
				<ul>
					<c:forEach var="bokesVo" items="${bokes }" begin="0" end="9">
						<li><a href="${ctx }/newDetial/bokeDe.html?id=${bokesVo.id}">${fn:substring(bokesVo.title,0,12)}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<div class="cls"></div>
		<!--友情链接-->
	</div>
	<div class="module018-h158 cls">

	</div>
	<div class="module01 clearfix">
		<div class="footer">
			<div class="copy mT12">
				<div class="outerbox">
					<ul class="copy1">
						<li class="weight">核心服务</li>
						<li><a href="${ctx}/font/supply/supplyIndex.html">找供应</a></li>
						<li><a href="${ctx}/front/proPurchase/buyindex.html">找求购</a></li>
						<li><a href="${ctx}/front/proinvestment/proindex.html">找代理</a></li>
						<li><a href="${ctx}/front/article/list.html">查行情</a></li>
					</ul>
					<ul class="copy1">
						<li class="weight">关于我们</li>
						<li><a href="${ctx }/contact.html">关于本站</a></li>
						<li><a href="${ctx }/about.html">联系我们</a></li>
						<li><a href="${ctx }/message.html?resourceType=message">客户留言板</a></li>

					</ul>
					<ul class="copy1">
						<li class="weight">商务合作</li>
						<li><a href="Copyright/Ad.html">广告招商</a></li>
						<li><a href="${ctx }/link.html">友情链接</a></li>
					</ul>
					<ul class="copy1">
						<li class="weight">合作伙伴</li>
						<li><a href="#">中国网库</a></li>
						<li><a href="#">中国行业网联盟</a></li>
						<li><a href="#">中国B2B电子商务服务联盟</a></li>
						<li><a href="#">中国招商联盟</a></li>
					</ul>
					<div class="f_list">
						<h4 class="weight">关注我们</h4>
						<ul class="l_two">
							<li><a target="_blank" href="http://weibo.com/3956076947/profile?topnav=1&wvr=5&user=1"><span
									class="i_sina">&nbsp;</span>新浪微博</a></li>
							
						</ul>
					</div>
				</div>

			</div>
			<div class="foot">
				<p>
					版权所有<span>&copy;</span>甘肃祁连葡萄酒销售有限公司<br /> 地址：甘肃省兰州市滨河中路259号
					电话：400-800-0219 <br />邮箱：gs_qljy@qq.com<br />
					技术支持：<a href="http://business.99114.com" target="_blank"
						rel="nofollow" class="wk">中国网库</a> ICP备案号：陇ICP备14000038号-2
					<script
						src="http://s96.cnzz.com/stat.php?id=5586469&web_id=5586469&show=pic"
						language="JavaScript"></script>
					<script
						src="http://s96.cnzz.com/stat.php?id=5596693&web_id=5596693&show=pic"
						language="JavaScript"></script>
					<script type="text/javascript" id="bdshare_js"
						data="type=slide&amp;mini=1&amp;img=4&amp;uid=628257"></script>
				</p>
			</div>
		</div>
	</div>
	<!--在线客服 start-->
	<div class="service">
		<div class="service_r">
			<h4>
				<img src="${ctx}/media/Images/v1/service_img1.png" /><span>400-800-02190</span>
			</h4>
			<div class="service_rcon">
				<div class="service_rcon_t">
					<a href="#" class="service_btn"></a>
					<ul>
						<li><span>客服1：</span><img
							src="${ctx}/media/Images/v1/service_img3.jpg" /><a href="tencent://message/?uin=2248544881">在线沟通</a></li>
						<li><span>客服2：</span><img
							src="${ctx}/media/Images/v1/service_img3.jpg" /><span href="tencent://message/?uin=1838746449">在线沟通</span></li>
						<li><span>客服3：</span><img
							src="${ctx}/media/Images/v1/service_img3.jpg" /><a href="tencent://message/?uin=18793163001">在线沟通</a></li>
					</ul>
					<p>
						<span>服务时间：</span><font>9:00-18:00</font>
					</p>
				</div>
				<div class="service_rcon_b">
					<p>邮箱：</p>
					<p>gs_qljy@qq.com</p>
					
					<img src="${ctx}/media/Images/v1/service_img6.jpg" />
				</div>
			</div>
		</div>
		<a href="#" class="service_l"><img
			src="${ctx}/media/Images/v1/service_img7.png" /></a>
	</div>
	<!--在线客服 end-->
	<script language="javascript" src="${ctx}/media/Js/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/media/Js/jquery.slides.js"></script>
	<script type="text/jscript" src="${ctx}/media/Js/DD_belatedPNG.js">
		
		
		 
	
	
	</script>
	<script type="text/javascript" src="${ctx}/media/Js/index.js"></script>
	<script type="text/javascript" id="bdshell_js"></script>
	<script type="text/javascript">
		document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion="
				+ Math.ceil(new Date() / 3600000);
		<script language="javascript" type="text/javascript" src="${ctx}/media/Js/jquery.js">
	</script>
	<!-- jQuery -->
	<script type="text/javascript" src="${ctx}/media/Js/Marquee.js"></script>
	<script type="text/javascript" src="${ctx}/media/Js/index.js"></script>
	<script type="text/javascript">
		$(function() {
			/*热销产品*/
			changeTab(".tab1 li", ".tab1Con", "newHover")
			changeTab(".tab2 li", ".tab2Con", "newHover")
			changeTab(".t-changeTab22 li", ".supplyThreeTab", "newon")
			/*特惠特价*/
			changeTab(".t-changeTab li", ".supplyFourTab", "nows")
			changeTab(".t-change li", ".supplyFiveTab", "open")
			/*供应*/
			changeTab(".t-InforTab li", ".inforContent", "on")
		})

		/*热销排行榜*/
		$(function() {
			$("#myArea ul li").hover(function() {
				$("#myArea ul li").children("dl").hide()
				$("#myArea ul li").children("h3").show()
				$("#myArea ul li").removeClass("fore")
				$(this).children("dl").show()
				$(this).addClass("fore")
			})
		})
	</script>
</body>
</html>