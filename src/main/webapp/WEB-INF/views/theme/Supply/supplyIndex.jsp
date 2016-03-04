<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 引用公共的头部和底部标签 -->
<meta name="decorator" content="common"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国冰酒交易网</title>
<link type="text/css" href="${ctx}/media/Css/Layout.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/media/Js/jquery.js"></script><!--搜索-->
<script type="text/javascript">
	//分页
	function page(n, s) {
		$("#pageNo").prop("value", n);
		$("#searchForm").prop('action', "${ctx }/more/bokesList.html")
				.submit();
		return false;
	}
	
	$(document).ready(function(){
		$.ajax({
			url:'${ctx}/common/right.html', // 
			type:'post',
			success:function(data){
				$("#rightCommon").html(data) ;
			}
		}) ;
	}) ; 
</script>
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script> 
</head>
<body>
<div class="wrapper"> 
  <!-- 当前位置 -->
  <div class="location mt10 mb10">
    <h6>您的当前位置：<a href="${ctx}/media/Index.html">中国冰酒交易网</a> &gt;&gt; <em>产品供应</em></h6>
    <span><a href="Detail.html">厂家供应</a> 经销商供应 每周一星 热销排行榜</span> </div>
  <!-- 当前位置 --> 
</div>
<div class="wrapper">
  <div class="left-756 floatL">
    <div class="surbuy-Recomsupply">
      <div class="title">
        <h3>特价特惠</h3><div><a class="more" href="${ctx}/font/supply/more/SpList" target="_blank">更多&gt;&gt;</a></div>
      </div>
      
      <div class="surbuy-Recomsupply-cen border-xian h290 hoverBorder">
      <!--动态加载效果
      <img class="status" src="${ctx}/media/Images/045.gif" />
      -->
        <ul class="clearfix">
          <c:forEach var="cjgyListVo" items="${cjgyList }" begin="0" end="15">
          <li>
            <dl>
              <dt><span><a href="${ctx}/font/supply/dateil.html?id=${cjgyListVo.id}" target="_blank">
                           <c:if test="${cjgyListVo.localPic == true}">
							<img src="${ctx}/${cjgyListVo.pic}" alt="" />
							</c:if>
							<c:if test="${cjgyListVo.localPic == false}"> 
								<img src="http://img4.99114.com/${cjgyListVo.imgUrl}" alt="" />
		   					 </c:if>  
              
              
               </span></dt>
              <dd><a href="${ctx}/font/supply/dateil.html?id=${cjgyListVo.id}" target="_blank">${cjgyListVo.name }</a></dd>
              <dd><span class="font-14b-red">${cjgyListVo.priceMin }</span>元</dd>
              <dd class="surbuy-RecomsupplyBtn"><a href="${ctx}/font/supply/dateil.html?id=${cjgyListVo.id}" target="_blank">查看详情</a></dd>
              <dd class="moreInfor">${cjgyListVo.memberName }<img src="${ctx}/media/Images/v1/iMage12.gif" /></dd>
            </dl>
          </li>
          
          </c:forEach>
          
          
          
        
        </ul>
      </div>
    </div>
  </div>
  <div class="right-232 floatR">
  	<!--登录前 begin--> 
  	<c:if test="${empty memId}">
   <div class="surbuy-pub"> <a target="_blank" class="s-login mR10" href="${ctx}/tologin">会员登录</a>
   <a target="_blank" class="s-register" href="${ctx}/member/addmember">会员注册</a> </div></c:if>

    <!--登录前 end-->
    <!--登录后 begin-->
    <c:if test="${not empty memId}">
    <div class="adminBtnLogin"><a target="_blank" href="${ctx}/front/member/memberCenter.html">进入会员中心</a>
    <a target="_blank" href="#">发布采购</a>
    <a target="_blank" href="#">发布供应</a>
    <a target="_blank" href="#">进入店铺</a></div></c:if>
    <!--登录后 end-->
    <div class="surbuy-jptj mT10">
      <div class="title">
        <h3>每周一星</h3>
      </div>
      <div class="surbuy-jptj-bor">
        <dl>
          <dt><img src="${ctx}/media/Images/35615368.jpg" alt="" /></dt>
          <dd>
            <p><strong><a target="_blank" href="">张裕冰葡萄酒
</a></strong></p>
           酒色深厚，甜白葡萄酒</dd>
          <dd><span class="font-14b-red">258.00</span>元</dd>
        </dl>
      </div>
    </div>
    <div class="surbuy-hottop h382 mT10">
      <div class="title-2">热销排行榜</div>
      <div class="surbuy_rxph_txt">
      
      
       <c:forEach var="hotVo" items="${hotList }" begin="0" end="7">
        <dl>
          <dt><span><a target="_blank" href="${ctx}/font/supply/dateil.html?id=${hotVo.id}">
          
                           <c:if test="${hotVo.localPic == true}">
							<img src="${ctx}/${hotVo.pic}" alt="" />
							</c:if>
							<c:if test="${hotVo.localPic == false}"> 
								<img src="http://img4.99114.com/${hotVo.imgUrl}" alt="" />
		   					 </c:if>  
         
          </a></span></dt>
          <dd class="surbuy_rxph_txt_t"><a target="_blank" href="${ctx}/font/supply/dateil.html?id=${hotVo.id}">${hotVo.name }
            </a></dd>
          <dd class="surbuy_rxph_txt_c">价格：面议</dd>
          <dd class="surbuy_rxph_txt_d">${hotVo.memberName }</dd>
        </dl>
       
       </c:forEach>
       
        
      </div>
    </div>
  </div>
  <div class="cls"></div>
</div>
</body>
</html>