<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script language="javascript" type="text/javascript" src="${ctx}/media/Js/jquery.js"></script><!-- jQuery -->
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>
</head>
<body>

<div class="wrapper clearfix">
<!-- 代码 开始 -->
<div class="module2-h326">
<div class="slider_box" id="slider_name">
  <ul class="silder_con">
  	<c:forEach var="advertises" items="${advertises}" begin="0" end="5">
  	 <li class="silder_panel clearfix">
      <a href="#" class="f_l"><img src="${ctx}/${advertises.img}" /></a>
    </li>
  	</c:forEach>
   
   <%--  <li class="silder_panel clearfix">
      <a href="#" class="f_l"><img src="${ctx}/media/Images/2012101623074142.jpg" /></a>
    </li>
    <li class="silder_panel clearfix">
      <a href="#" class="f_l"><img src="${ctx}/media/Images/2012092600425434.jpg"/></a>
    </li>
    <li class="silder_panel clearfix">
      <a href="#" class="f_l"><img src="${ctx}/media/Images/2012092600451002.jpg" /></a>
    </li>
    <li class="silder_panel clearfix">
      <a href="#" class="f_l"><img src="${ctx}/media/Images/2012092600432575.jpg" /></a>
    </li>
    <li class="silder_panel clearfix">
      <a href="#" class="f_l"><img src="${ctx}/media/Images/2012092600431140.jpg" /></a>
    </li> --%>
    
  </ul>
  <ul class="silder_nav clearfix"> 
     <c:forEach var="advertises" items="${advertises}"  begin="0" end="5"  varStatus="i">
       <%-- <c:if test="${i.index==0 }">
	     <li class="current">
       </c:if>
         <c:if test="${i.index==1 }">
         
       </c:if> --%>
       <li> <a href="${advertises.imgUrl}"><img src="${ctx}/${advertises.img}"/></a><span class="topImg disNo1"><img src="${ctx}/media/Images/top.gif" />
       </span></li>    
     </c:forEach>        
    <%-- <li class="current"><a href="#"><img src="${ctx}/media/Images/2012101623050497.jpg"/></a><span class="topImg disNo1"><img src="${ctx}/media/Images/top.gif" /></span></li>    
    <li><a href="#"><img src="${ctx}/media/Images/2012101623074142.jpg"/></a><span class="topImg disNo1"><img src="${ctx}/media/Images/top.gif" /></span></li>    
    <li><a href="#"><img src="${ctx}/media/Images/2012092600425434.jpg"/></a><span class="topImg disNo1"><img src="${ctx}/media/Images/top.gif" /></span></li>    
    <li><a href="#"><img src="${ctx}/media/Images/2012092600451002.jpg"/></a><span class="topImg disNo1"><img src="${ctx}/media/Images/top.gif" /></span></li>    
    <li><a href="#"><img src="${ctx}/media/Images/2012092600432575.jpg" /></a><span class="topImg disNo1"><img src="${ctx}/media/Images/top.gif" /></span></li>    
    <li><a href="#"><img src="${ctx}/media/Images/2012092600431140.jpg"/></a><span class="topImg disNo1"><img src="${ctx}/media/Images/top.gif" /></span></li>    --%>
  </ul>
</div>
</div>
<!-- 代码 结束 -->
        <div class="module3-h326">
             <!--登陆前-->
             <c:if test="${empty memId}">
            <div class="adminlogin">
              <ul>
              <li class="rightLine"><a href="${ctx}/member/addmember">用户注册</a></li>
              <li class="LeftLine"><a href="${ctx}/member/addmember">用户登录</a></li>
              </ul>
            </div></c:if>
            <!--登陆后-->
            <c:if test="${not empty  memId}">
     <div class="adminloginbegin-1">
          <ul>
            <li ><a href="${ctx}/icewine/front/member/memberCenter.html">进入会员中心</a></li>
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
            <div class="supplyThreeTab" style="display:block;">
                <ul class="supplyqhlist ">
                    <li><a href="Supply/Detail.html">[快速入门]222如何拥有企业展厅</a></li>
                    <li>[快速入门]如何发布商机</li>
                    <li><a href="Supply/Detail.html">一般分为容积式产品和速度式产品两类</a></li>
                    <li><a href="Supply/Detail.html">一般分为容积式产品和速度式产品两类</a></li>
                    <li><a href="Supply/Detail.html">一般分为容积式产品和速度式产品两类</a></li>
                </ul>
            </div>
             <div class="supplyThreeTab">
                 <ul class="supplyqhlist ">
                    <li><a href="Supply/Detail.html">[快速入门]222如何拥有企业展厅</a></li>
                    <li>[快速入门]如何发布商机</li>
                    <li><a href="Supply/Detail.html">一般分为容积式产品和速度式产品两类</a></li>
                    <li><a href="Supply/Detail.html">一般分为容积式产品和速度式产品两类</a></li>
                    <li><a href="Supply/Detail.html">一般分为容积式产品和速度式产品两类</a></li>
                </ul>
            </div>
             <div class="supplyThreeTab">
                 <ul class="supplyqhlist ">
                    <li><a href="Supply/Detail.html">[快速入门]222如何拥有企业展厅</a></li>
                    <li>[快速入门]如何发布商机</li>
                    <li><a href="Supply/Detail.html">一般分为容积式产品和速度式产品两类</a></li>
                    <li><a href="Supply/Detail.html">一般分为容积式产品和速度式产品两类</a></li>
                    <li><a href="Supply/Detail.html">一般分为容积式产品和速度式产品两类</a></li>
                </ul>
            </div>  
            <div class="loginicobottom">
                <span><img src="${ctx}/media/Images/ico1.jpg" width="26" height="30" /><a href="#">买家保证</a></span>
                <span><img src="${ctx}/media/Images/ico2.jpg" width="26" height="30" /><a href="#">商家认证</a></span>
                <span><img src="${ctx}/media/Images/ico3.jpg" width="26" height="30" /><a href="#">安全交易</a></span>
            </div>
            </div>
       </div>
        <div class="cls"></div>
        <div class="module018-h325">
            <div class="title1 bg">
            	<ul class="t-changeTab floatL"><li class="nows">特惠特价</li><li>热卖热销</li><li>产品批发</li><li>产品零售</li></ul>
                <div class="floatR"><a href="Ly/Detail.html" class="hh">我要发布新品</a><a href="${ctx}/font/supply/more/SpList" target="_blank">更多>></a></div>
            </div>
                <div class="w1000productPic supplyFourTab dis">
                	<div class="out1">
                	<ul class="supplyCon clearfix">
                	 <c:forEach var="tjthVo" items="${cjgyList}" begin="0" end="4">
                    <li>
                        <div class="supplyConPic"><span>
                        
                        <a href="Supply/Detail.html">
                        	<c:if test="${tjthVo.localPic == true}">
							<img src="${ctx}/${tjthVo.pic}" alt="" />
							</c:if>
							<c:if test="${tjthVo.localPic == false}"> 
								<img src="http://img4.99114.com/${tjthVo.imgUrl}" alt="" />
		   					 </c:if>  
		    
		    		</a></span></div>
                        <p class="supplyConTxt"><a href="Supply/Detail.html">${fn:substring(tjthVo.name,0,19)}</a></p>
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
                        <a href="Supply/Detail.html">
                        	<c:if test="${rxrmVo.localPic == true}">
							<img src="${ctx}/${rxrmVo.pic}" alt="" />
							</c:if>
							<c:if test="${rxrmVo.localPic == false}"> 
								<img src="http://img4.99114.com/${rxrmVo.imgUrl}" alt="" />
		   					 </c:if> 
		   				 </a></span></div>
                        <p class="supplyConTxt"><a href="Supply/Detail.html">${fn:substring(rxrmVo.name,0,19)}</a></p>
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
                        		<a href="Supply/Detail.html">
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
                        	<a href="Supply/Detail.html">${fn:substring(bjpfVo.name,0,19)} </a>
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
                        <div class="supplyConPic"><span><a href="Supply/Detail.html">
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
            <div class="ad_w200"><img src="${ctx}/media/Temp/add1.jpg" width="200" height="80" /></div>
  			<div class="ad_w540"><img src="${ctx}/media/Temp/add2.jpg" width="540" height="80" /></div>
            <div class="ad_w230"><img src="${ctx}/media/Temp/add3.jpg" width="230" height="80" /></div>
      <div class="cls"></div>
        <div class="module04-h320">
            <div class="title1 jiak">
            	<div class="fenlei">颜色分类</div>
            	<ul class="t-change floatL">
                	<li class="open">冰白葡萄酒</li>
                    <li>冰红葡萄酒</li>
                </ul>
                <div class="floatR green"><a href="Ly/Detail.html" class="hh">我要发布新品</a><a href="${ctx}/font/supply/more/SpList" target="_blank">更多>></a></div>
            </div>
                <div class="w754productPic supplyFiveTab dis">
                	<ul class="clearfix">
                    
                     <c:forEach var="bbptjListVo" items="${bbptjList}" begin="0" end="3">
                    	<li>
                            <div class="supplyConPic1"><span><a href="Supply/Detail.html">
                             <c:if test="${bbptjListVo.localPic == true}">
							<img src="${ctx}/${bbptjListVo.pic}" alt="" />
							</c:if>
							<c:if test="${bbptjListVo.localPic == false}"> 
								<img src="http://img4.99114.com/${bbptjListVo.imgUrl}" alt="" />
		   					 </c:if>
                            </a></span></div>
                            <p class="supplyConTxt"><a href="Supply/Detail.html">${fn:substring(bbptjListVo.name,0,19)}</a></p>
                            <div class="supplyConPrice"><em class="floatL">￥${bbptjListVo.promotionPrice}</em><a href="#" class="floatR">订购</a> </div>
                            <div class="supplyConCor">${bbptjListVo.corporationName}<img src="${ctx}/media/Images/v1/iMage12.gif" /></div>
                        </li>
                        </c:forEach>
                         
                   
                	</ul>
                </div>
                <div class="w754productPic supplyFiveTab">
                	<ul class="clearfix">
                    	 <c:forEach var="bhptjListVo" items="${bhptjList}" begin="0" end="3">
                    	<li>
                            <div class="supplyConPic1"><span><a href="Supply/Detail.html">
                             <c:if test="${bhptjListVo.localPic == true}">
							<img src="${ctx}/${bhptjListVo.pic}" alt="" />
							</c:if>
							<c:if test="${bhptjListVo.localPic == false}"> 
								<img src="http://img4.99114.com/${bhptjListVo.imgUrl}" alt="" />
		   					 </c:if>
                            </a></span></div>
                            <p class="supplyConTxt"><a href="Supply/Detail.html">${fn:substring(bhptjListVo.name,0,19)}</a></p>
                            <div class="supplyConPrice"><em class="floatL">￥${bhptjListVo.promotionPrice}</em><a href="#" class="floatR">订购</a> </div>
                            <div class="supplyConCor">${bhptjListVo.corporationName}<img src="${ctx}/media/Images/v1/iMage12.gif" /></div>
                        </li>
                        </c:forEach>
                         
                        
                   
                   
                	</ul>
                </div>
</div>
        <div class="module3-h322">
	<div class="title"><h3>热销排行榜</h3></div>
    <div class="hottop"  id="myArea">
        <ul>
        <c:forEach var="syrxphbListVo" items="${syrxphbList}" begin="0" end="7">
            <li  class="fore"><em>1</em><h2>${fn.substring(syrxphbListVo.name,0,19)}</h2><div>
            <b>1</b>
            <a href="Supply/Detail.html">
            <img src="${ctx}/media/Temp/vad20.jpg" align="absmiddle"  />
            </a>
            <i><a href="Supply/Detail.html">${fn.substring(syrxphbListVo.name,0,19)}</a><br /><strong>￥${bhptjListVo.promotionPrice}</strong></i></div></li>
           
          </c:forEach>
        </ul>       
    </div>
</div>
 
<div class="cls"></div>
         <div class="module04-h320">
            <div class="title1 jiak">
            	<div class="fenlei">产品品种</div>               
            	<h4><a href="#" class="yellow">赛美容</a></h4>
                <h4><a href="#">美乐</a></h4>
                <h4><a href="#">蛇龙珠</a></h4>
                <h4><a href="#">贵人香</a></h4>
                <h4><a href="#">赤霞珠</a></h4>
                <h4><a href="#">梅鹿辄</a></h4>
                <h4><a href="#">西拉</a></h4>
                <div class="floatR green"><a href="Ly/Detail.html" class="hh">我要发布新品</a><a href="${ctx}/font/supply/more/SpList" target="_blank">更多>></a></div>
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
        
 <div class="module3-h219 mT10">
				<div class="title"><h3>单品通推荐</h3><h5><a href="Ly/Detail.html">加入单品通</a></h5></div>
                    <div class="corCon">
                        <ul>
                        <li><a href="#">市场预计：中石化销售华南分..</a></li>
                        <li>市场预计：中石化销售华南分..</li>
                        <li>市场预计：中石化销售华南分..</li>
                        <li>市场预计：中石化销售华南分..</li>
                        <li>市场预计：中石化销售华南分..</li>
                        <li>市场预计：中石化销售华南分..</li>
                        <li>市场预计：中石化销售华南分..</li>
                        <li>市场预计：中石化销售华南分..</li>
                        <li>市场预计：中石化销售华南分..</li>
                        <li>市场预计：中石化销售华南分..</li>
                       <li>市场预计：中石化销售华南分..</li>
                    	</ul>
                    </div>
            </div>
 <div class="cls"></div>
<div class="module04-h590">
            <div class="title1 jiak">
            	<div class="fenlei">产品产地</div> 
                <h4><a href="#" class="yellow">甘肃</a></h4>                                   
            	<h4><a href="#">黑龙江</a></h4>
                <h4><a href="#">河南</a></h4>
                <h4><a href="#">吉林</a></h4>
                <h4><a href="#">湖南</a></h4>
                <h4><a href="#">湖北</a></h4>
                <h4><a href="#">广东</a></h4>
                <h4><a href="#">深圳</a></h4>
                <h4><a href="#">上海</a></h4>
                <h4><a href="#">大连</a></h4>
                <h4><a href="#">重庆</a></h4>
                <h4><a href="#">南京</a></h4>
                <h4><a href="#">其他</a></h4>
                <div class="floatR green"><a href="Ly/Detail.html" class="hh">我要发布新品</a><a href="${ctx}/font/supply/more/SpList" target="_blank">更多>></a></div>
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
<div class="module3-h285">
    <div class="title">
    <h3>最新商机</h3>
    <h4> <a href="Ly/List.html">更多&gt;&gt;</a></h4>
    <h5><a href="Ly/Detail.html">发布商机</a></h5>
    </div>
    <div class="lyCon">
        <dl>
          <dt><span>2013-08-22</span>会员：王路</dt>
          <dd><a href="/ly/list.shtml#a7862">网站挺好的，东西挺全一直在寻求相关床垫网站，平台提供的信息很全的。</a> <br />
          </dd>
        </dl>
        <dl>
          <dt><span>2013-08-22</span>会员：朱佳</dt>
          <dd><a href="/ly/list.shtml#a7861">一直在寻求相关床垫网站，平台提供的信息很全，应该有我需要的信息。</a> <br />
          </dd>
        </dl>
        <dl>
          <dt><span>2013-08-22</span>会员：王国庆</dt>
          <dd><a href="/ly/list.shtml#a7860">平台版块清晰，吸引大一直在寻求相关床垫网站，平台提供的信息很全家！</a> <br />
          </dd>
        </dl>
    </div>
</div>
<div class="module3-h295 mT10">
                <div class="title"><h3><a href="#">交易信息</a></h3></div>
                <div class="tradeList">
                    <ul>
                      <li>
                        <div>
                          <p class="floatL">订单号 13031560259</p>
                          <span class="floatR">已经到货</span></div>
                        <p><span class="floatL">金额<strong>3210.0</strong>元</span> <span class="floatR">批发商-绿时代</span></p>
                      </li>
                      <li>
                        <div>
                          <p class="floatL">订单号 13031560259</p>
                          <span class="floatR">已经到货</span></div>
                        <p><span class="floatL">金额<strong>3210.0</strong>元</span> <span class="floatR">批发商-绿时批发商-绿时代代-绿时代</span></p>
                      </li>
                      <li>
                        <div>
                          <p class="floatL">订单号 13031560259</p>
                          <span class="floatR">已经到货</span></div>
                        <p><span class="floatL">金额<strong>3210.0</strong>元</span> <span class="floatR">批发商-绿时代</span></p>
                      </li>
                      <li>
                        <div>
                          <p class="floatL">订单号 13031560259</p>
                          <span class="floatR">已经到货</span></div>
                        <p><span class="floatL">金额<strong>3210.0</strong>元</span> <span class="floatR">批发商-绿时代</span></p>
                      </li>
                    </ul>
                </div>
              </div>
 <div class="cls"></div>
<div class="module04-h320">
            <div class="title1 jiak">
            	<div class="fenlei">产品品牌</div>               
            	<h4><a href="#" class="yellow">祁连</a></h4>
                <h4><a href="#">果园</a></h4>
                <h4><a href="#">诚润</a></h4>
                <h4><a href="#">酒之家</a></h4>
                <h4><a href="#">通化恒通</a></h4>
                <h4><a href="#">松阳</a></h4>
                <h4><a href="#">晟通</a></h4>
                <div class="floatR green"><a href="Ly/Detail.html" class="hh">我要发布新品</a><a href="${ctx}/font/supply/more/SpList" target="_blank">更多>></a></div>
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
<div class="ad_w232"><a href="#"><img src="${ctx}/media/Images/zhaozu.jpg" width="232" height="80" /></a></div>
<div class="ad_w232"><a href="#"><img src="${ctx}/media/Images/zhaozu.jpg" width="232" height="80" /></a></div>
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
            	<a class="w244Pic" href="#"><img src="${ctx}/media/Temp/w285.jpg"></a>
                <ul>
                	<li><span>[供应]</span><a href="#">现烤热卖现烤热卖最新鲜现烤热卖最新鲜最新鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[供应]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[供应]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[供应]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                </ul>
            </div>
            <div class="w244 floatL">
            	<a class="w244Pic" href="#"><img src="${ctx}/media/Temp/w285.jpg"></a>
                <ul>
                	<li><span>[供应]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[供应]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[供应]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[供应]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                </ul>
            </div>
            <div class="w244 floatL">
            	<a class="w244Pic" href="#"><img src="${ctx}/media/Temp/iPic11.jpg"></a>
                <ul>
                	<li><span>[供应]</span><a href="#">现烤热卖最新现烤热卖最新鲜现烤热卖最新鲜鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[供应]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[供应]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[供应]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                </ul>
            </div>
        </div>
        <div class="inforContent floatL">
            <ul class="inforBuyCon">
                <li><span>[求购]</span><a href="Buy/Detail.html">现烤热卖最新鲜现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                <li><span>[求购]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                <li><span>[求购]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                <li><span>[求购]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                <li><span>[求购]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                <li><span>[求购]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                <li><span>[求购]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                <li><span>[求购]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                <li><span>[求购]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                <li><span>[求购]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                <li><span>[求购]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                <li><span>[求购]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                <li><span>[求购]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                <li><span>[求购]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
            </ul>
        </div>
        <div class="inforContent floatL">
        	<div class="w244 floatL border-r">
            	<a class="w244Pic" href="#"><img src="${ctx}/media/Temp/w285.jpg"></a>
                <ul>
                	<li><span>[招商]</span><a href="Information/Detail.html">怎么个品类网现烤热卖最新现烤热卖最新鲜现烤热卖最新鲜现烤热卖最新鲜鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[招商]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[招商]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[招商]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                </ul>
            </div>
            <div class="w244 floatL ">
            	<a class="w244Pic" href="#"><img src="${ctx}/media/Temp/w285.jpg"></a>
                <ul>
                	<li><span>[招商]</span><a href="#">品类网特卖会现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[招商]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[招商]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                    <li><span>[招商]</span><a href="#">现烤热卖最新鲜 靖江猪肉脯 靖江肉</a></li>
                </ul>
            </div>
            
      </div>
    </div>
    </div>
</div>
<div class="cls"></div>
<!--三列广告-->
<div class="adr-w242"><a><img src="${ctx}/media/Temp/vad37.jpg" /></a></div>
<div class="adr-w242"><a><img src="${ctx}/media/Temp/vad37.jpg" /></a></div>
<!--微博-->
  <div class="module03-h449 mt"><iframe width="232" scrolling="no" height="449" frameborder="0" src="http://widget.weibo.com/weiboshow/index.php?language=&amp;width=0&amp;height=550&amp;fansRow=2&amp;ptype=1&amp;speed=0&amp;skin=1&amp;isTitle=1&amp;noborder=1&amp;isWeibo=1&amp;isFans=1&amp;uid=3735606571&amp;verifier=86c1c81c&amp;dpc=1" class="share_self"> </iframe></div>
  <div class="cls"></div>

<div class="artContribute"><span class="bj-left"><a href="#">我要投稿</a></span></div>
<div class="cls"></div>
<div class="module05-h312 m0">
    <div class="title6">
        <h3>冰酒商讯</h3>
        <h4><a href="${ctx}/more/busList.html">更多>></a></h4>
    </div>
    <div class="artList">
    <ul>
    <c:forEach var="buiVo" items="${iceWineArticles}" begin="0" end="29">
     <li><a href="${ctx }/newDetial/new.html?id=${buiVo.id}">${fn:substring(buiVo.title,0,19)}</a></li>
    
    </c:forEach>
   
   <!--  <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产茶产家用水品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶茶产家用水产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产茶产家用水品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶茶产家用水产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产茶产家用水品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产茶产家用水品博</a></li> -->
    </ul>
    </div>
</div>
<div class="module03nlm-h312 ml">
    <div class="title6">
        <h3>冰酒博客</h3>
        <h4><a href="${ctx}/more/bokesList.html">更多>></a></h4>
    </div>
    <div class="artList2">
    	<ul>
    	<c:forEach var="bokesVo" items="${bokes }" begin="0" end="9">
    	<li><a href="${ctx }/newDetial/bokeDe.html?id=${bokesVo.id}">${fn:substring(bokesVo.title,0,12)}</a></li>
    	</c:forEach>
   <!--  <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产茶产家用水品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶茶产家用水产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li>
    <li><a href="#">首届衡阳茶文化节暨茶产品博</a></li> -->
    </ul>
    </div>
</div>

<div class="cls"></div>
 <!--友情链接-->
</div>
<div class="module018-h158 cls">

	<!-- <div class="title7"><h3>友情链接</h3></div>
    <div class="links">
    <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a><a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a><a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a> <a href="#">中国铁塔交易网</a>
</div> -->
</div> 
<div class="module01 clearfix">
<div class="footer">
	<div class="copy mT12">
		<div class="outerbox">
                 <ul class="copy1">
                     <li class="weight">核心服务</li>
                     <li><a href="#">找供应</a></li>
                     <li><a href="#">找求购</a></li>
                     <li><a href="#">找代理</a></li>
                     <li><a href="#">查行情</a></li>
                 </ul>
                 <ul class="copy1">
                     <li class="weight">关于我们</li>
                     <li>
                     <a href="Copyright/AboutUs.html">关于本站</a></li>
                     <li>
                     <a href="Copyright/ContactUs.html">联系我们</a></li>
                     <li>
                     <a href="Copyright/Ly.html">客户留言板</a></li>
                    
                 </ul>             
                 <ul class="copy1">
         <li class="weight">商务合作</li>
                     <li><a href="Copyright/Ad.html">广告招商</a></li>
                     <li><a href="Copyright/Link.html">友情链接</a></li>
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
                        <li><a target="_blank" href="http://weibo.com/u/2523407600"><span class="i_sina">&nbsp;</span>新浪微博</a></li> 
                        <li><a target="_blank" href="http://hongzaojyw.bokee.com"><span class="i_renren">&nbsp;</span>博客网</a></li>
                        <li><a target="_blank" href="http://t.sohu.com/u/274446486"><span class="i_dban">&nbsp;</span>搜狐</a></li> 
                        <li><a target="_blank" href="http://my.tianya.cn/61241179"><span class="i_qzone">&nbsp;</span>天涯</a></li> 
                        <li><a target="_blank" href="http://t.qq.com/wangchunya8092"><span class="i_sina2">&nbsp;</span>腾讯微博</a></li>
                        <li><a target="_blank" href="http://blog.ifeng.com/5823165.html"><span class="i_wangyi">&nbsp;</span>凤凰</a></li>     
                    </ul> 
                </div>   
		  </div> 
                          
  </div>
	<div class="foot">
    	<p>版权所有<span>&copy;</span>中国产品交易网<br />
地址：北京市东城区胜古中路1号蓝宝商务大厦402 电话：400-6056-258 <br />传真：010-64429077 邮箱：yujinhe@99114.com<br />
 技术支持：<a href="http://business.99114.com" target="_blank" rel="nofollow" class="wk">中国网库</a> ICP备案号：京ICP证060961号<script src="http://s96.cnzz.com/stat.php?id=5586469&web_id=5586469&show=pic" language="JavaScript"></script>
		<script src="http://s96.cnzz.com/stat.php?id=5596693&web_id=5596693&show=pic" language="JavaScript"></script>
        <script type="text/javascript" id="bdshare_js" data="type=slide&amp;mini=1&amp;img=4&amp;uid=628257"></script></p>
    </div>
</div>
</div>
<!--在线客服 start-->
<div class="service">
    <div class="service_r">
        <h4><img src="${ctx}/media/Images/v1/service_img1.png" /><span>09312661880</span></h4>
        <div class="service_rcon">
            <div class="service_rcon_t">
                <a href="#" class="service_btn"></a>
                <ul>
                    <li><span>客服1：</span><img src="${ctx}/media/Images/v1/service_img3.jpg" /><a href="#">在线沟通</a></li>
                    <li><span>客服2：</span><img src="${ctx}/media/Images/v1/service_img4.jpg" /><span href="#">在线沟通</span></li>
                    <li><span>客服3：</span><img src="${ctx}/media/Images/v1/service_img5.jpg" /><a href="#">在线沟通</a></li>
                </ul>
                <p><span>服务时间：</span><font>9:00-18:00</font></p>
            </div>
            <div class="service_rcon_b">
                <p>邮箱：</p>
                <p>lvcha@99114.com</p>
                <p>传真：010-3614041</p>
                <img src="${ctx}/media/Images/v1/service_img6.jpg" />
            </div>
        </div>
    </div>
     <a href="#" class="service_l"><img src="${ctx}/media/Images/v1/service_img7.png" /></a>
</div>
<!--在线客服 end-->
<script language="javascript" src="${ctx}/media/Js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/media/Js/jquery.slides.js"></script>
<script type="text/jscript" src="${ctx}/media/Js/DD_belatedPNG.js"> </script> 
<script type="text/javascript" src="${ctx}/media/Js/index.js"></script> 
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000);
<script language="javascript" type="text/javascript" src="${ctx}/media/Js/jquery.js"></script><!-- jQuery -->
<script type="text/javascript" src="${ctx}/media/Js/Marquee.js"></script> 
<script type="text/javascript" src="${ctx}/media/Js/index.js"></script>
<script type="text/javascript">
$(function(){
	/*热销产品*/
	changeTab(".tab1 li",".tab1Con","newHover")
	changeTab(".tab2 li",".tab2Con","newHover")
	changeTab(".t-changeTab22 li",".supplyThreeTab","newon")
	/*特惠特价*/
	changeTab(".t-changeTab li",".supplyFourTab","nows")
	changeTab(".t-change li",".supplyFiveTab","open")
	/*供应*/
	changeTab(".t-InforTab li",".inforContent","on")
})

/*热销排行榜*/
$(function(){
	$("#myArea ul li").hover(function(){
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