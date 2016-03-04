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

<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Detail.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/media/Css/Inquiry.css"/>
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>
</head>
<body>
<!--header begin-->
<!--未登陆 begin-->

<div class="wrapper"> 
  <!-- 当前位置 -->
  <div class="location mt10 mb10">
    <h6>您的当前位置：<a href="${ctx}/index.html">中国冰酒交易网</a> &gt;&gt; <em><a href="${ctx}/front/proinvestment/proindex.html">会员加盟</a></em></h6>
    <span><a href="${ctx}/front/proinvestment/list.html?classCode=122">强势招商项目</a> <a href="${ctx}/front/proinvestment/list.html?classCode=123"> 最新招商</a> 
    <a href="${ctx}/front/proinvestment/list.html?classCode=124">合作商机</a> <a href="${ctx}/front/proinvestment/list.html?classCode=125">加盟创业</a> </span> </div>
  <!-- 当前位置 --> 
</div>
<!--main-->

<div class="wrapper ">
	<div class="left-756 b-DetailL floatL">
    	<div class="b-DetailLTit">${proInvestment.name}</div>
        <div class="tb-wrap_l floatL">
            <div class="jqzoom">
            <img height="300" src="http://img4.99114.com/${imgImages.imgPath}" jqimg="http://img4.99114.com/${imgImages.imgPath}" width="300" id="bigImg"/></div>
            <div id="spec">
             <div class="control specLeftT" id="specLeft"></div>
             <div id="specList">
                <ul class="listImg">
                  <li>
                  
                  <a href=""><c:if
											test="${proInvestment.localPic == true}">
											<img id="smallPicOne" src="${ctx }/${proInvestment.pic}" alt="" />
										</c:if> <c:if test="${proInvestment.localPic == false}">
											<img src="http://img4.99114.com/${proInvestment.imgUrl}" alt="" />
										</c:if></a>
                  
                  
                  </li>
                </ul>
             </div>
             <div class="control specRightT" id="specRight"></div>	
            </div>
        </div>
        <div class="floatR mR20 I-Detail-w400">
        	<p>项目资金:<span><c:if
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
                                                    </c:if></span>万元</p>
            <ul>
            	<li>品牌：${proInvestment.brandName }</li>
                <li>保证金额:${proInvestment.guaranteeSum}</li>
             
                <li>品牌发源地：${proInvestment.areaCode}</li>
            </ul>
            <div class="I-BTN">
           <a href="javascript:openDialogInfo('${proInvestment.id}','${proInvestment.memberId}');" class="showbox2">询盘留言</a> 
            </div>
        </div>
        <div class="cls"></div>
		<div class="w716">
        	<div class="b-D-Tit mT20">招商详情</div>
            <p class="b-D-detailTxt mB50">
            ${proInvestment.summary}
            </p>
        </div>
    </div>
    <div class="right-232 floatR mT10">
    	<div class="b-D-w228dl">
        	<h3>${proInvestment.memberBasic.corporationName}<img src="${ctx}/media/Temp/vad22.jpg"/></h3>
            <ul>
            	<li>联系人：${proInvestment.member.linkMan}</li>
                <li>联系电话：${ proInvestment.member.telephone}</li>
                <li>联系地址：${ proInvestment.member.address}</li>
                <li>邮政编码：${ proInvestment.member.postCode}</li>
                <li>邮    箱：${ proInvestment.member.email}</li>
            </ul>
           
    </div>
    <div class="cls"></div>
</div>
<div class="cls"></div>

<!--询盘弹出层 start-->

<div class="w600" id="inquiryDiv" style="display:none;">
	    <div class="Ma-list mT10">
        <form  action="${ctx}/front/proinvestment/toquote.html"
			method="post">
			<input  type="hidden" name="memberId" id="memberId" value="${proInvestment.memberId }"/>
        	<table width="100%" cellspacing="2">
            	<tr>
                	<td width="17%" align="right">我的询问：</td >
                	<td width="55%" align="left">
                	<textarea name="quote" id="quote" style="resize: none;" class="Ma-asked"  
                	onblur="if(this.value=='') this.value='说出你向卖家提出的问题，如：我想采购20吨钢管，给我报个价吧！如：我想要样品，可以发过来吗？';this.style.color='#B3B3B3';" 
                	onclick="if(this.value == '说出你向卖家提出的问题，如：我想采购20吨钢管，给我报个价吧！如：我想要样品，可以发过来吗？') this.value='';this.style.color='black';" >说出你向卖家提出的问题，如：我想采购20吨钢管，给我报个价吧！如：我想要样品，可以发过来吗？</textarea>
                	</td>
                	<td width="28%" align="left" class="Ma-hui" ><p style="line-height:20px;">描述越详细，越有利于找到合适供应商。</p></td>
                </tr>
              <tr>
                	<td width="17%" align="right"><font class="Ma-red">*</font> 公司名称：</td>
                	<td width="55%" align="left">
             
                     	<input name="companyName" id="companyName" type="text" class="input1" value="如：北京昌隆电气设备有限公司"  
                	onblur="if(this.value=='') this.value='如：北京昌隆电气设备有限公司';this.style.color='#B3B3B3';" 
                	onclick="if(this.value == '如：北京昌隆电气设备有限公司') this.value='';this.style.color='black';" />
                	</td>
                	<td width="28%" align="left">&nbsp;</td>
                </tr>
                <tr>
                	<td width="17%" align="right"><font class="Ma-red">*</font> 联系人：</td>
                	<td width="55%" align="left">
                
                    <input name="linkman" type="text" class="input1" value="如：张三" 
                	onblur="if(this.value=='') this.value='如：张三';this.style.color='#B3B3B3';" 
                	onclick="if(this.value == '如：张三') this.value='';this.style.color='black';"  />
                	</td>
                	<td width="28%" align="left">&nbsp;</td>
                </tr>
                <tr>
                	<td width="17%" align="right"><font class="Ma-red">*</font> 联系电话：</td>
                	<td width="55%" align="left">
              
                    <input name="phone" type="text" class="input1" value="如：固定电话或手机号" 
                	onblur="if(this.value=='') this.value='如：固定电话或手机号';this.style.color='#B3B3B3';" 
                	onclick="if(this.value == '如：固定电话或手机号') this.value='';this.style.color='black';"  />
                	</td>
                	<td width="28%" align="left" class="Ma-hui"><p style="line-height:20px;">正确联系方式帮助您快速联系到供应商</p></td>
                </tr>
                <tr>
                	<td width="17%" align="right">联系邮箱：</td>
                	<td width="55%" align="left">
                	
                	<input name="email" type="text" class="input1" value="jszc@99114.com" 
                	onblur="if(this.value=='') this.value='jszc@99114.com';this.style.color='#B3B3B3';" 
                	onclick="if(this.value == 'jszc@99114.com') this.value='';this.style.color='black';"  />
                	</td>
                	
                	<td width="28%" align="left">&nbsp;</td>
                </tr>
               <%--  <tr >
                    <td width="17%" align="right">验证码：</td>
                	<td  colspan="2" >
                	<input id="shop_product_inquiry_image" name="vocde" class="input1" maxlength="4" style="width:80px;color:black;"/>
                	<img id="rcodeimage" src="${webRoot!}vcode/image" />
<!--                 	<a href="javascript:void(0);" onclick="codeImage(/vcode/image')">看不清，换一张</a>
 -->                	</td>
               	</tr> --%>
                <tr >
                    
                	<td height="53" colspan="3" align="center" >
                	<input name="Submit"  type="submit"  value="发送询盘"  id="inquiry_submit"
                	 class="btn" style="cursor:pointer;"  /> 
                	</td>
               	</tr>
            </table>
            </form>
        </div>
	</div>
<!-- 	---------------------------------------页面弹框提示--------------------------------------- -->

<!-- 提交成功提示框(未登录) -->
<div class="tck_out" id="shop_product_inquiry_success" style="display: none;">
    <div class="tck_main">
    	<div class="tck_main_tle">
        	<p><img src="../Images/v1/iMage15.gif" />
        	<span style="font-size: 14px; font-weight: bold;line-height: 32px;">恭喜！您的询盘已经送成功！</span></p>
            <p>供应商会尽快与您联系！&nbsp;&nbsp;</p>
        </div>
        <div class="tck_tishi clearfix">
        	<p class="fl ts_con">登录或注册成为中国网库会员，将帮您更好的管理信息，找到更多高质量供应商。</p>
        </div>
        <div class="btn_out clearfix">
        	<%-- <a class="tck_btn" href="${loginUrl!}"> --%>我要登录</a>
        	<%-- <a class="tck_btn mrZero" href="${registerUrl!}"> --%>我要注册</a>
        </div>
    </div>
</div>
<!-- 提交成功提示框(已登录) -->
<div class="tck_out" id="shop_product_inquiry_login_success" style="display: none;">
    <div class="tck_main">
    	<div class="tck_main_tle">
        	<p><img src="../Images/v1/iMage15.gif" />
        	<span style="font-size: 14px; font-weight: bold;line-height: 32px;">恭喜！您的询盘已经送成功！</span></p>
            <p>供应商会尽快与您联系！&nbsp;&nbsp;</p>
        </div>
        <div class="btn_out">
        	<a class="tck_btn btn_inquiry_cancel" >确定</a>
        </div>
    </div>
</div>	
<!--询盘弹出层 end-->
<script type="text/javascript" src="${ctx}/media/Js/Jquery.jqzoom.js"></script>
<script type="text/javascript" src="${ctx}/media/Js/Jquery.livequery.js"></script>
<script type="text/javascript" src="${ctx}/media/Js/Fangdajs.js"></script>
<script type="text/javascript" src="${ctx}/media/Js/ArtDialog/ArtDialog.source.js?skin=green"></script>
<script type="text/javascript" src="${ctx}/media/Js/Inquiry.js"></script>
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
</body>
</html>
