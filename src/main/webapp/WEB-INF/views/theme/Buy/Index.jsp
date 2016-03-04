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
<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Layout.css"
	rel="stylesheet" />
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>
<script language="javascript" type="text/javascript" src="${ctx}/media/Js/jquery-1.8.0.min.js"></script><!-- jQuery -->

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
	<div class="wrapper">
		<div class="buy_cgzc">
			<div class="title">
				<h3>采购专场</h3>
			</div>
			<div class="buy-cgzcCen">
				<c:forEach var="advertises" items="${advertises}" begin="5" end="7">
					<dl>
						<dt>
							<span><a href="${advertises.imgUrl}"
								target="_blank"><img src="${ctx}/${advertises.img}"
									width="50" height="50" /></a></span>
						</dt>
						<dd>
							<a href="Detail.html" target="_blank">${advertises.title}</a>
						</dd>
					</dl>

				</c:forEach>
			</div>
		</div>
		<div class="buy_c_t">
			<div class="buy_flash">
					  <div class="t1007-ind-banner floatL comMt12 t1000-ml214" id="t1007-ind-banner" module="advertising" refusemodule="" bestfitmodule="advertising-common-single-img,t1007-ind-banner">
        <div class="t1007-ind-banner-con t1000-com-border" content="">
            <div class="advertising-common-slide">
                <ul style="top: -1350px; height: 1620px;">
                
                    <c:forEach var="advertises" items="${advflash}" begin="3" end="4">
						<li class="silder_panel clearfix"><a href="${advertises.imgUrl}" class="f_l" title="${advertises.title }"><img
								src="${ctx}/${advertises.img}" /></a></li>
					</c:forEach>
                    
               </ul>
                <ol><li class="">1</li><li class="on">2</li></ol>
            </div>
        </div>
    </div>
            
			</div>
			<div class="buy_flash_zzqg">
				<p>正在求购</p>
				<div class="I-scrollCon">
					<ul class="I-scrollTop">
						<c:forEach var="adverti" items="${zhengzaiqiugou}" begin="5"
							end="7">
							<li><a class="" href="${adverti.imgUrl}" title="${adverti.title }">${adverti.title }</a></li>

						</c:forEach>
						

					</ul>
				</div>
			</div>
		</div>

		<!--登录后 begin-->
		<div class="module3-h302">
			
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
			
			
			<div class="pvc_gy pvc_gyLogin">
				<div class="pvc_buy_title">
					<ul class="newTab_buy">
						<li class="li_on_buy"><a target="_blank" href="#">供应商</a></li>
						<li><a href="#" target="_blank">零售商</a></li>
						<li><a href="#" target="_blank">经销商</a></li>
					</ul>
				</div>
				<div class="pvc_buy_txt dis">
					<ul>
					<c:forEach var="gongyingshang" items="${gongyingshang }" begin="0" end="3">
						<li><a href="" target="_blank">${gongyingshang.corporationName }</a>
						</li>
						</c:forEach>
					</ul>
				</div>
				<div class="pvc_buy_txt">
					<ul>
						<c:forEach var="gongyingshang" items="${gongyingshang }" begin="4" end="7">
						<li><a href="" target="_blank">${gongyingshang.corporationName }</a>
						</li>
						</c:forEach>
						
					</ul>
				</div>
				<div class="pvc_buy_txt">
					<ul>
						<c:forEach var="lingxiaoshang" items="${lingxiaoshang }" begin="0" end="3">
						<li><a href="" target="_blank">${lingxiaoshang.corporationName }</a>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="module3-h300_bottom">
				<h3>常用工具</h3>
				<ul>
					<li>
						<p>
							<img src="${ctx}/media/Images/cygj1.jpg" />
						</p> <span><a target="_blank" href="#">体验商铺</a></span>
					</li>
					<li>
						<p>
							<img src="${ctx}/media/Images/cygj2.jpg" />
						</p> <span><a href="#">商机发布</a></span>
					</li>
					<li>
						<p>
							<img src="${ctx}/media/Images/cygj3.jpg" />
						</p> <span><a href="#">诚信验证</a></span>
					</li>
					<li>
						<p>
							<img src="${ctx}/media/Images/cygj4.jpg" />
						</p> <span><a href="#">批发采购</a></span>
					</li>
				</ul>
			</div>
		</div>
		<!--登录后 end-->
		<div class="cls"></div>
		<div class="buy_left mT10 bolid">
			<div class="buy_left_list bolid">
				<div class="title02">
					<h3>紧急求购</h3>
					<div></div>
					<h4>
						<a target="_blank" href="list.html">更多>></a>
					</h4>
					<h6>
					<c:if test="${empty memberId}">
						<a target="_blank" href="${ctx}/tologin">我要发布求购</a>
					</c:if>
					<c:if test="${not empty memberId}">
					    <a target="_blank" href="${ctx}/front/member/buyadd.html">我要发布求购</a>
					</c:if>
					</h6>
				</div>
				<ul>
					<c:forEach var="jinjiqiugouVo" items="${jinjiqiugou}">
						<li>
							<p>[求购]</p> <span><a target="_blank"
								href="${ctx}/front/proPurchase/dateil.html?id=${jinjiqiugouVo.id}">${jinjiqiugouVo.title
									}</a></span>
						</li>

					</c:forEach>
				</ul>
			</div>
			<div class="buy_left_list">
				<div class="title02">
					<h3>当日求购</h3>
					<h4>
						<a target="_blank" href="list.html">更多>></a>
					</h4>
					<h6>
						<c:if test="${empty memberId}">
						<a target="_blank" href="${ctx}/tologin">我要发布求购</a>
					</c:if>
					<c:if test="${not empty memberId}">
					    <a target="_blank" href="${ctx}/front/member/buyadd.html">我要发布求购</a>
					</c:if>
					</h6>
				</div>
				<ul>
					<c:forEach var="dangriqiugouVo" items="${dangriqiugou}">
						<li>
							<p>[求购]</p> <span><a target="_blank" href="${ctx}/front/proPurchase/dateil.html?id=${dangriqiugouVo.id}">${dangriqiugouVo.title}</a></span>
						</li>
					</c:forEach>



				</ul>
			</div>
		</div>
		<div class="buy_cxb mT10">
			<div class="title">
				<h3>诚信榜</h3>
			</div>
			<div class="buy_cxbCen">
				<ul>
				<c:forEach var="chengxin" items="${chengxin}" begin="0" end="5">
					<li><a target="_blank" href="">${chengxin.corporationName}</a></li>
				</c:forEach>
				</ul>
			</div>
		</div>
		<div class="buy_left mT10 bolid">
			<div class="buy_left_list bolid">
				<div class="title02">
					<h3>大宗采购</h3>
					<h4>
						<a target="_blank" href="list.html">更多>></a>
					</h4>
					<h6>
						<c:if test="${empty memberId}">
						<a target="_blank" href="${ctx}/tologin">我要发布求购</a>
					</c:if>
					<c:if test="${not empty memberId}">
					    <a target="_blank" href="${ctx}/front/member/buyadd.html">我要发布求购</a>
					</c:if>
					</h6>
				</div>
				<ul>
					<c:forEach var="dazongcaigouVo" items="${dazongcaigou}">

						<li>
							<p>[求购]</p> <span><a href="${ctx}/front/proPurchase/dateil.html?id=${dazongcaigouVo.id}">${dazongcaigouVo.title}</a></span>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="buy_left_list">
				<div class="title02">
					<h3>冰酒预购</h3>
					<h4>
						<a target="_blank" href="list.html">更多>></a>
					</h4>
					<h6>
						<c:if test="${empty memberId}">
						<a target="_blank" href="${ctx}/tologin">我要发布求购</a>
					</c:if>
					<c:if test="${not empty memberId}">
					    <a target="_blank" href="${ctx}/front/member/buyadd.html">我要发布求购</a>
					</c:if>
					</h6>
				</div>
				<ul>
					<c:forEach var="yugouVo" items="${yugou}">
						<li>
							<p>[求购]</p> <span><a href="${ctx}/front/proPurchase/dateil.html?id=${yugouVo.id}">${yugouVo.title}</a></span>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="buy_cxb mT10">
			<div class="title">
				<h3>推荐供应商</h3>
			</div>
			<div class="buy_cxbCen">
				<ul>
				<c:forEach var="tuijian" begin="0" end="5" items="${tuijian }">
					<li><a target="_blank" href="">${tuijian.corporationName }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="cls"></div>
	</div>


	<script type="text/javascript">
		$(function() {
			$(".newTab_buy li").each(function(index) {
				$(this).mouseover(function() {
					$(".newTab_buy li").removeClass("li_on_buy") //æææçliæ ·å¼æ¸é¤
					$(this).addClass("li_on_buy") //ä¸ºå½åç»è¿çæ·»å cssæ ·å¼
					$(".pvc_buy_txt").removeClass("dis") //æ.newContentä¸çcssæ ·å¼æ¸é¤
					$(".pvc_buy_txt:eq(" + index + ")").addClass("dis")//ç»å¯¹åºçdivæ·»å cssæ ·å¼
				})//end mouseover
			})//end each
		})

		</script>
		
		<script type="text/javascript">

function comTab1(tabTit,tabName){
	$(tabTit).hover(function(){
		$(this).addClass(tabName).siblings().removeClass(tabName);
		var index=$(this).index();
		$(this).parent().parent().siblings().children().eq(index).show().siblings().hide();
	})		
}
function comTab2(tabTit,tabName){
	$(tabTit).hover(function(){
		$(this).addClass(tabName).siblings().removeClass(tabName);
		var index=$(this).index();
		$(this).parent().siblings().children().eq(index).show().siblings().hide();
	})		
}

/*轮播*/
function banner($bannerPic,Icon){
	var num=1;
	var timer=null;
	$("ul",$bannerPic).append($("ul li",$bannerPic).clone());
	var liNum=$("ul li",$bannerPic).length/2;
	var liW=$("ul li:eq(0)",$bannerPic).height();//一个图片的宽度
	$("ul",$bannerPic).css("top",-liW+"px")
	$("ul",$bannerPic).css("height",(liNum+1)*liW);//赋值图片div的总宽	
	$("ol li",$bannerPic).click(function(){
		$(this).addClass(Icon).siblings().removeClass(Icon);
		var index=$(this).index();
		$(this).parent().siblings("ul").animate({top:-(index+1)*liW+"px"},300)	
		num=index;	
	})
	function palyBanner(){
		if(num>=liNum){
			$("ul",$bannerPic).animate({top:-(liNum+1)*liW},500,function(){$("ul",$bannerPic).css("top",-liW+"px")})
			$("ol li",$bannerPic).eq(0).addClass(Icon).siblings().removeClass(Icon);	
			num=0;
		}else{
			$("ol li",$bannerPic).eq(num).addClass(Icon).siblings().removeClass(Icon);	
			$("ul",$bannerPic).animate({top:-(num+1)*liW},500)
			num++;	
		}
	}
	var timer=setInterval(palyBanner,3000);
	$bannerPic.hover(
		function(){
			clearInterval(timer);
		},
		function(){
			timer=setInterval(palyBanner,3000);
		}
	)			
}
/*轮播*/
$(function(){
	comTab1(".advertising-common-tab-3-tit ul li","on");//公告切换	
	comTab2(".t1007-ind-buytab-tit h2 ","tabin");//公告切换	
	//首页banner	
	banner(
		$bannerPic=$(".t1007-ind-banner-con .advertising-common-slide"),
		Icon="on"
	)
})
</script>
<script type="text/javascript">
	$("#menu li").each(function() {
		$(this).mouseover(function() {
			$(this).addClass("focus")

		})
		$(this).mouseout(function() {
			$(this).removeClass("focus")

		})
	})
	$(function() {
		$("#Nav ul li:first .fenlei_t").hover(function() {
			$(this).children("#menuNav").show()
			//alert("")
		}, function() {
			$(this).children("#menuNav").hide()
		})
	})
</script>
<script type="text/javascript">
	$(function() {
		var setName
		$(".I-scrollCon").hover(
				function() {
					clearInterval(setName)
				},
				function() {
					setName = setInterval(function() {
						$(".I-scrollTop").animate(
								{
									marginTop : "-25px"
								},
								1000,
								function() {
									$(".I-scrollTop").css("margin-top", "0")
											.find("li:first").appendTo(
													".I-scrollTop")
								})
					}, 2000)
				}).trigger("mouseleave")

	})
</script>
</body>
</html>
