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
<link type="text/css" href="${ctx}/media/Css/Layout.css"
	rel="stylesheet" />
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>
<link type="text/css" href="${ctx}/media/Css/listDetail.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/media/Js/Jquery.js"></script>
<script type="text/javascript" src="${ctx}/media/Js/Index.js"></script>
</head>

<body>

<div class="t1000-com-wrapper">
    <div class="comW800 floatL">
        <div class="locationListDetail comMt12" id="locationListDetail" module="breadcrumb">
        <div content="">
            
            <h6>您现在的位置：<a href="">首页</a> >> <a  href="">企业会员</a> >> <span>冰酒</span> </h6>
            <!-- <p>共找到<span>1288</span>条符合<span>"钢铁"</span>的查询结果</p> -->
        </div>
        </div>	
        <div class="comContentL comMt12" id="corListCon" module="corporation">
            <div class="supListLeftCon" content="">
                
              <p class="cls"></p>
              <div class="gold" id="companyH"  >
                <c:forEach var="memberVo" items="${page.list}">
                <dl class="GoldList">
                  <dt class="corListTextSm">
                    <h2><a>   ${memberVo.corporationName }</a></h2>
                    <p>经营类型：
                    <c:if
											test="${memberVo.dealInId  eq 'production' }">
                                                   生产型
                                                    </c:if> <c:if
											test="${memberVo.dealInId  eq 'wholesale' }">
                                                   批发性
                                                    </c:if> <c:if
											test="${memberVo.dealInId  eq 'businessService' }">
                                                    商务服务
                                                    </c:if> <c:if
											test="${memberVo.dealInId  eq 'productsProxy' }">
                                                   代理商
                                                    </c:if> 
                                                    <c:if
											test="${memberVo.dealInId  eq 'other' }">
                                                其他
                                                    </c:if> 
                    </p>
                     <p >公司简介：
                     <c:if test="${not empty memberVo.summary}">
                     ${fn:substring(memberVo.summary, 0, 25)}</c:if></p>
                    <p class="address">公司地址：${memberVo.dealInAreaCode}</p>
                  </dt>
                  
                  <dd class="corCompanyProduct">
                 <c:forEach var="proSupplyVo" items="${memberVo.proSupply}"  begin="0" end="2">
                    <p><span class="corImgSpan"><a>
                    
                    
                    <c:if test="${proSupplyVo.localPic ==true}">
											<img src="${ctx }/${proSupplyVo.pic}" alt="" width="100px" height="100px"/>
										</c:if> 
										<c:if test="${proSupplyVo.localPic == false}">
											<img src="http://img4.99114.com/${proSupplyVo.imgUrl}" width="100px" height="100px"
												alt="" />
										</c:if> 
                    </a>
                    
                    </span><a>${proSupplyVo.name}</a> 价格：<span class="red">面议</span></p>
                    </c:forEach> 
                    
                  </dd>
                </dl>
                </c:forEach>
              </div>
             
              
              
             
           </div>
                <div class="page-java">
							<ul>
								<form action="" id="searchForm" method="post">
									<input type="hidden" id="pageNo" name="pageNo" value="" />
								</form>
								${page}
							</ul>
                </div>


        </div>
        
    </div>	
    <div class="comW190 floatR">
    	
        <div class="t1000-business-supplier comMt12" id="t1000-business-supplier" module="corporation" bestFitModule="global-common-pic-list" refuseModule="corporation-common-*" >
        	<div class="t1000-com-title"><h3 headline=""><a href="#">黄金供应商</a></h3></div>
            <div class="t1000-business-supplier-box t1000-com-border-top" content="">
            	<ul class="global-common-pic-list clearfix">
                    <c:forEach var="jinpai" items="${jinpai}" begin="0" end="4">
                    <li><span><a title="" href="">
                    
                     <c:if test="${jinpai.localPic ==true}">
								<img src="${ctx }/${jinpai.pictureUrl}" alt="" width="100px" height="100px"/>
										</c:if> 
										<c:if test="${jinpai.localPic == false}">
											<img src="http://img4.99114.com/${jinpai.imgUrl}" width="100px" height="100px"
												alt="" />
										</c:if> 
                    </a></span></li>
                     </c:forEach>
                </ul>	
            </div>
        </div>
           <div class="t1000-business-ad listComAd-188X218" module="advertising" id="t1000-business-ad" bestFitModule="global-common-pic-list,advertising-common-single-html" refuseModule="global-common-*,advertising-common-*" >
        	<div class="listComAd-188X218-con" content="">
            	<ul class="ad_188x218">
                   <!--  <li><a target="_blank" href=""><img src="../../../fodder/t1150/188x218.jpg" /></a></li>
                    <li><a target="_blank" href=""><img src="../../../fodder/t1150/188x218.jpg" /></a></li>
                    <li><a target="_blank" href=""><img src="../../../fodder/t1150/188x218.jpg" /></a></li> -->
                </ul>
            </div>
        </div>
    </div>
    <div class="cls"></div>
</div>

<div class="cls"></div>

<script type="text/javascript">
		//分页
		function page(n, s) {
			$("#pageNo").prop("value", n);
			$("#searchForm").prop('action',
					"${ctx }/front/corporation/list.html").submit();
			return false;
		}
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
/*鼠标划过显示离开隐藏*/

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
