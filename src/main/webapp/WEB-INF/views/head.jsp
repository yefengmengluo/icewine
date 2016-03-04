<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="sitemesh"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript" type="text/javascript" src="${ctx}/media/Js/jquery.js"></script><!-- jQuery -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<sitemesh:head></sitemesh:head>
<title><sitemesh:title></sitemesh:title></title>
</head>
<body>
	<!--header begin-->
	<!--未登陆 begin-->
	<c:if test="${ empty memberId }">
	 <div class="top_out login_q">
		<div class="top-1">
			<div class="top-1-L fl">
				欢迎访问冰酒交易网 <a href="${ctx}/tologin" class="login mr5 mL10" id="t_login">登陆</a>| <a
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
						<!-- 我的进货单  end
						进货单中暂未添加任何货品 start -->
						<div class="shoppingListno topMuneListCon show1">
							<p>进货单中暂未添加任何货品</p>
							<a href="#">查看进货单</a>
						</div>
						<!-- 进货单中暂未添加任何货品 end -->
					</div>
				</li>
				<li>
					<div class="snMenu topMuneList">
						<a href="#" class="topTwoBorder"><span class="spanB">会员中心</span><b></b></a>
						会员中心1 start
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
				<li class="topWeibo"><iframe width="103" height="24" frameborder="0" src="http://widget.weibo.com/relationship/followbutton.php?language=zh_cn&amp;width=136&amp;height=24&amp;uid=3956076947&amp;style=2&amp;btn=red&amp;dpc=1" border="0" marginheight="0" marginwidth="0" allowtransparency="true" scrolling="no"></iframe>

					</li>
			</ul>
		</div>
	</div> </c:if>
	<!--未登陆 end-->
	<!--登陆后 begin-->
	<div class="top_out disNo login_h">

		<div class="top-1">
			<div class="top-1-L fl">
				您好,欢迎登录中国冰酒交易网<a href="${ctx}/memExit.html" class="regist mL10">[退出]</a>
				<div class="loginTs">
					<div class="loginTsCon">
						<div class="tsCls"></div>
						<p>
							尊敬的冰酒交易网会员，您已成功登录本站<br /> <a href="${ctx}/icewine/front/member/memberCenter.html">快速进入会员中心</a>
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
						<!--我的进货单 start -->
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
						<!--我的进货单  end -->
						<!--进货单中暂未添加任何货品 start -->
						<div class="shoppingListno topMuneListCon show2">
							<p>进货单中暂未添加任何货品</p>
							<a href="#">查看进货单</a>
						</div>
						<!--进货单中暂未添加任何货品 end -->
					</div>
				</li>
				<li>
					<div class="snMenu topMuneList">
						<a href="#" class="topTwoBorder"><span class="spanB">会员中心</span><b></b></a>
						<!--会员中心1 start -->
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
						<!--会员中心1 end -->
						<!--会员中心2 start -->
						<div class="topBuyC topMuneListCon show1">
							<a href="#">订单管理</a>
						</div>
						<!--会员中心2 end -->
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
	</div>
	<!--登陆后 end-->
	<div class="cls"></div>
	<!--头部开始-->
	<div id="top">
		<div class="wrapper">
			<div class="top-2">
				<div class="logo floatL">
					<a href="#"><img src="${ctx}/media/Images/bjlogo.jpg" alt="" /></a>
				</div>
				<div class="search floatL tags">
					<div class="sear_box">
						<div class="tabTitleSecach search-tabTitle">
							<ul id="tabul">
								<li class="on"><a href="javascript://"
									onclick="javaScript:loadSearch.setIndex(0,'on');">供应</a></li>
								<li class=""><a href="javascript://"
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
								  <input id="txtSearchKey" name="" class="searchWord floatl" value="请输入您感兴趣的内容" onblur="if(this.value=='') this.value='请输入您感兴趣的内容';" onclick="if(this.value == '请输入您感兴趣的内容') this.value='';" type="text"/>
                                  <input id="btnSearch" name="" class="searchBut floatl ml10" value="找供应" type="button"/>
								   
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
                loadSearch.isTabSearch =true;
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
						<div class="menuNav" id="menuNav" style="display:none ;">
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
										href="#">河南</a> <a href="Supply/Detail.html">吉林</a><a href="#">湖南</a><a
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
	<!--头部结束-->

	<!-- body -->
	<sitemesh:body></sitemesh:body>


	<!--  footer -->
	<!--版权信息 begin-->
	<div class="module019 clearfix">
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
						<li><a href="${ctx }/index.html">关于本站</a></li>
						<li><a href="${ctx }/about.html">联系我们</a></li>
						 <li><a href="${ctx }/message.html?resourceType=message">留言板</a></li>

					</ul>
					<ul class="copy1">
						<li class="weight">商务合作</li>
						<li><a href="Copyright/Ad.html">广告招商</a></li>
						<li><a href="${ctx }/link.html">友情链接</a></li>
					</ul>
					<ul class="copy1">
						<li class="weight">合作伙伴</li>
						<li><a href="http://www.99114.com/">中国网库</a></li>
						<li><a href="#">中国行业网联盟</a></li>
						<li><a href="#">中国B2B电子商务服务联盟</a></li>
						<li><a href="#">中国招商联盟</a></li>
					</ul>
					<div class="f_list">
						<h4 class="weight">关注我们</h4>
						<ul class="l_two">
							<li><a target="_blank" href="http://weibo.com/u/2523407600"><span
									class="i_sina">&nbsp;</span>新浪微博</a></li>
							<li><a target="_blank" href="http://hongzaojyw.bokee.com"><span
									class="i_renren">&nbsp;</span>博客网</a></li>
							<li><a target="_blank" href="http://t.sohu.com/u/274446486"><span
									class="i_dban">&nbsp;</span>搜狐</a></li>
							<li><a target="_blank" href="http://my.tianya.cn/61241179"><span
									class="i_qzone">&nbsp;</span>天涯</a></li>
							<li><a target="_blank" href="http://t.qq.com/wangchunya8092"><span
									class="i_sina2">&nbsp;</span>腾讯微博</a></li>
							<li><a target="_blank"
								href="http://blog.ifeng.com/5823165.html"><span
									class="i_wangyi">&nbsp;</span>凤凰</a></li>
						</ul>
					</div>
				</div>

			</div>
			<div class="foot">
				<p>
					版权所有<span>&copy;</span>甘肃祁连葡萄酒销售有限公司<br /> 地址：甘肃省兰州市滨河中路259号
					电话：400-800-0219 <br />邮箱：gs_qljy@qq.comICP<br />
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
	<!--版权结束-->
	</body>
	<!-- jQuery -->
	<%-- <script language="javascript" type="text/javascript" src="${ctx}/media/Js/jquery.js"></script> --%><!-- jQuery -->
	<%-- <script type="text/javascript" src="${ctx}/media/Js/Marquee.js"></script> --%>
	<script type="text/javascript" src="${ctx}/media/Js/index.js"></script>
	<script type="text/javascript">
		$(function() {
			/* $('#marquee1').kxbdMarquee({
				direction : 'left',
				controlBtn : {
					left : '#goL',
					right : '#goR'
				},
				newAmount : 4,
				eventA : 'mouseenter',
				eventB : 'mouseleave'
			}); */

		});
	$("#menu li").each(function() {
		$(this).mouseover(function() {
			$(this).addClass("focus")

		})
		$(this).mouseout(function() {
			$(this).removeClass("focus")

		})
	})
	/*鼠标划过显示离开隐藏*/
</script>

</html>