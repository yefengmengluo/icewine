<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 引用公共的头部和底部标签 -->
<meta name="decorator" content="common"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国冰酒交易网</title>
<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Layout.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>
</head>


<body>
<div class="wrapper"> 
  <!-- 当前位置 -->
  <div class="location mt10 mb10">
    <h6>您的当前位置：<a href="${ctx}/index.html">中国冰酒交易网</a> &gt;&gt; <em>会员加盟</em></h6>
    <span><a href="${ctx}/front/proinvestment/list.html?classCode=122">强势招商项目</a> <a href="${ctx}/front/proinvestment/list.html?classCode=123"> 最新招商</a> 
    <a href="${ctx}/front/proinvestment/list.html?classCode=124">合作商机</a> <a href="${ctx}/front/proinvestment/list.html?classCode=125">加盟创业</a> </span> </div>
  <!-- 当前位置 --> 
</div>
<div class="wrapper">
  <div class="zsjm_top">
    <div class="zsjm_top_left">
      <div class="title">
        <h3>强势招商项目</h3>
      </div>
      <div class="zsjm_top_leftCen">
      <ul>
      <c:forEach  var="proInlistVo" items="${proInlist}" > 
              <li><a href="${ctx}/front/proinvestment/dateil.html?id=${proInlistVo.id}" target="_blank">${proInlistVo.name}</a></li> 
            
          </c:forEach>   
      </ul>
      </div>
    </div>
    <div class="zsjm_top_center">
		<div class="zsjm_top_centerjs">
             <div class="t1007-ind-banner floatL comMt12 t1000-ml214" id="t1007-ind-banner" module="advertising" refusemodule="" bestfitmodule="advertising-common-single-img,t1007-ind-banner">
        <div class="t1007-ind-banner-con t1000-com-border" content="">
            <div class="advertising-common-slide">
                <ul style="top: -1350px; height: 1620px;">
                
                    <c:forEach var="advertises" items="${advflash}" begin="0" end="2">
						<li class="silder_panel clearfix"><a href="${advertises.imgUrl}" class="f_l" title="${advertises.title }"><img
								src="${ctx}/${advertises.img}" /></a></li>
					</c:forEach>
                    
               </ul>
                <ol><li class="">1</li><li class="">2</li><li class="on">3</li></ol>
            </div>
        </div>
    </div>
            
              
      </div>
      <div class="zsjm_top_center_xiangmu">
        <div class="zsjm_top_center_xiangmu_title">找项目 </div>
        <div class="zsjm_top_center_xiangmu_up">
          <div class="zsjm_top_center_xiangmu_je"> 按金额 </div>
          <form action="${ctx}/front/proinvestment/list.html">
          <div class="zsjm_top_center_xiangmu_up_right">
            <div class="zsjm_top_center_xiangmu_up_right_t">
              <div class="dx_list">
                 <input name="siteId" type="radio" checked  class="dx" value="1"/>
                一万以下 </div>
              <div class="dx_list">
                <input name="siteId" type="radio" class="dx" value="2"/>
                1-3万 </div>
              <div class="dx_list">
                <input name="siteId" type="radio" class="dx" value="3"/>
                3-10万 </div>
              <div class="dx_list">
              <div class="dx_list">
                <input name="siteId" type="radio" class="dx" value="4"/>
                10-30万 </div>
            </div>
            <div class="dx_list">
                <input name="siteId" type="radio" class="dx" value="5"/>
                30万以上 </div>
            </div>
            <div class="zsjm_top_center_xiangmu_up_right_up"><input type="submit"  class="zsjm_top_center_xiangmu_up_right_up" style="line-height: 10px;"/> 搜索 </div>
          </div></form>
        </div>
      </div>
    </div>
    <div class="zsjm_top_right">
  	<c:if test="${empty memberId}">
    <div class="surbuy-pub"> 
    
    <a target="_blank" class="s-login mR10" href="${ctx}/tologin">会员登录</a>
    <a target="_blank" class="s-register" href="${ctx}/member/addmember">会员注册</a> </div>
    </c:if>
    <!--登录前 end-->
    <!--登录后 begin-->
    <c:if test="${ not empty memberId}">
    <div class="adminBtnLogin"><a target="_blank" href="${ctx}/front/member/memberCenter.html">进入会员中心</a>
    <a target="_blank" href="#">发布采购</a>
    <a target="_blank" href="#">发布供应</a>
    <a target="_blank" href="#">进入店铺</a></div></c:if>
    <!--登录后 end-->
      <div class="zsjm_top_right_ph loginzsjm_top_right_ph border-xian">
        <div class="title02 pd0">
          <h3>热销排行榜</h3>
        </div>
        <ul>
        <c:forEach var="HotList" items="${HotList}">
          <li><a target="_blank" href="Detail.html">${HotList.name }</a></li>
       </c:forEach>
        </ul>
      </div>  
      <!--登录后 end-->
    </div>
  </div>
  <!--最新招商-->
  <div class="dljm_zxzs mT10 border-xian">
    <div class="title02">
      <h3>最新招商</h3>
      <h4><a target="_blank" href="list.html">更多>></a></h4>
    </div>
      <c:forEach  var="proInvestmentVo" items="${proInvestment1}" >  
    <div class="dljm_zxzs_list bb bolid">
      <div class="dljm_zxzs_list_l"><p><a target="_blank" href="${ctx}/front/proinvestment/dateil.html?id=${proInvestmentVo.id}">${proInvestmentVo.name}</a></p></div>
      <div class="dljm_zxzs_list_r"><a target="_blank" href="${ctx}/front/proinvestment/dateil.html?id=${proInvestmentVo.id}">
      
      
       <c:if test="${proInvestmentVo.localPic == true}">
					<img src="${ctx }/${proInvestmentVo.pic}" alt="" />
				</c:if>
				<c:if test="${proInvestmentVo.localPic == false}"> 
					<img src="http://img4.99114.com/${proInvestmentVo.imgUrl}" alt="" />
				 </c:if> </a> </div>
    </div>
    </c:forEach> 
  </div>
  <!--代理加盟_bottom-->
  <div class="wrap_all">
  	<div class="w1000">
        <div class="module017-h292 blid">
          <div class="title02">
            <h3>合作商机</h3>
            <h4><a  target="_blank" href="list.html">更多>></a></h4>
          </div>
          <ul><c:forEach  var="proInvestmentVo" items="${proInvestment2}" > 
            <li><a target="_blank" href="${ctx}/front/proinvestment/dateil.html?id=${proInvestmentVo.id}">${proInvestmentVo.name}</a></li>
          </c:forEach>
          </ul>
        </div>
        <div class="module017-h292 blid">
          <div class="title02">
            <h3>加盟创业</h3>
            <h4><a target="_blank" href="list.html">更多>></a></h4>
          </div>
          <ul>
          <c:forEach  var="proInvestmentVo" items="${proInvestment3}" > 
            <li><a target="_blank" href="${ctx}/front/proinvestment/dateil.html?id=${proInvestmentVo.id}">${proInvestmentVo.name}</a></li>
           </c:forEach>
          </ul>
        </div>
        <div class="module017-h292 blid">
          <div class="title02">
            <h3>加盟答疑</h3>
            <h4><a target="_blank" href="list.html">更多>></a></h4>
          </div>
          <ul>
           <c:forEach  var="articleListVo" items="${articleList}" > 
            <li><a target="_blank" href="${ctx}/newDetial/detail.html?id=${articleListVo.id}">${articleListVo.title}</a></li>
            </c:forEach>
          </ul>
        </div>
        <div class="module017-h292">
          <div class="title02">
            <h3>创业故事</h3>
            <h4><a target="_blank" href="list.html">更多>></a></h4>
          </div>
          <ul>
          <c:forEach  var="articleListVo" items="${articleList1}" > 
            <li><a target="_blank" href="${ctx}/newDetial/detail.html?id=${articleListVo.id}">${articleListVo.title}</a></li>
            </c:forEach>
          </ul>
        </div>
    </div>
  </div>
</div>

<script language="javascript" type="text/javascript" src="${ctx}/media/Js/jquery-1.8.0.min.js"></script><!-- jQuery -->
<script type="text/javascript" src="../Js/Index.js"></script>
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
			//alert(num)
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

</body>
<script type="text/javascript">

			$("#menu li").each(function(){
										$(this).mouseover(function (){
																	$(this).addClass("focus")
																	 
																	})
										$(this).mouseout(function (){
																	$(this).removeClass("focus")
																	 
																	})
										})


$(function(){
	$("#Nav ul li:first .fenlei_t").hover(function(){
		
		$(this).children("#menuNav").show()
		//alert("")
		},function(){
		$(this).children("#menuNav").hide()
		})
})

</script>
</html>
