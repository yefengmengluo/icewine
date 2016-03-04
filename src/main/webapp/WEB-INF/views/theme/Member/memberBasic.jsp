<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="${ctx}/media/Css/base1.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/media/Css/layout1.css" type="text/css" rel="stylesheet" />
<meta name="decorator" content="top"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人用户卖家后台-首页</title>

</head>
<body>
<div class="w840">
	<div class="title-s">
		<p>基本信息</p>
	</div>
	<!--页签切换-->
	<form action="${ctx}/front/member/saveMember.html" method="post" enctype="multipart/form-data">
	<input  type="hidden" name="memberId" value="${member.memberId }"/>
	<div class="slidetxtbox userinfo_box">
		<!-- 错误提醒条 信息填写不符合要求的时候调用 start-->
		<!-- <div class="gi_tips_bar"><a href="#nogo" class="gi_close"></a><span class="i_error cf_ff0">您填写的公司信息不符合要求，请重新填写！最多可以显示两行。</span></div> -->
		<!-- 错误提醒条 信息填写不符合要求的时候调用 end-->
		<ul class="tab-title blue-tab hd tabb">
			<li class="on"><s></s><b></b>基本资料</li>
			
			<li><s></s><b></b>联系人信息</li>
		</ul>
		<div class="bd"><!--bd 页签切换-->
			<!--基本资料 start-->
			<div>
				<div class="g_userInfo">
					<p class="pop_tdtitle cf_c60">以下信息，请如实、完整填写。</p>
					<table border="0" cellpadding="0" cellspacing="0" class="us_table">
						<tr>
							<th><s class="cf_ff0 mr7">*</s>公司名称：</th>
							<td><input type="text" class="text_inp inptText ipt_w258" name="corporationName" value="${memberBasic.corporationName}" /><span class="prompt">请用中文完整填写在工商局注册的公司全称</span><!--输入正确提示<span class="prompt pright"></span>--></td>
						</tr>
						<tr>
							<th>工商注册号：</th>
							<td><input type="text" class="text_inp inptText ipt_w258" name="regNumber" value="${memberBasic.regNumber}"/></td>
						</tr>
						<tr>
							<th><s class="cf_ff0 mr7" >*</s>企业类型：</th>
							<td>
								<select name="enrollId" class="regularSelect sel_w280">
									<option value="opt1" selected="selected">私营股份有限公司</option>
									<option value="opt2">私营股份有限责任公司</option>
									<option value="opt2">外企（非欧美）</option>
									<option value="opt2">国企</option>
									<option value="opt2">外企（欧美）</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><s class="cf_ff0 mr7">*</s>注册地址：</th>
							<td>
								<div class="m_sel_box clearfix">
									<select name="" class="col-md-2 area" id="sysArea1">
										
									</select>
									<select name="" class="col-md-2 area" id="sysArea2">
										
									</select>
									<select name="dealInAreaCode" class="col-md-2" id="sysArea3">
									
									</select>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>法定代表人：</th>
							<td><input type="text" class="text_inp inptText ipt_w258" name="artificialPerson" value="${memberBasic.artificialPerson }"/></td>
						</tr>
						<tr>
							<th>公司图片：</th>
							<td class="g_com_td clearfix">
								<ul class="g_in_l fl clearfix">
									<li><a href="#">
									
									<c:if
											test="${memberBasic.localPic == true}" >
											<img id="smallPicOne" src="${ctx }/${memberBasic.logo}" alt="" width="120px" height="120px"/>
										</c:if> <c:if test="${memberBasic.localPic == false}">
											<img src="http://img4.99114.com/${memberBasic.imgUrlLogo}" alt="" width="120px" height="120px"/>
										</c:if></a><span>公司LOGO</span></li>
									<li><a href="#">
									<c:if
											test="${memberBasic.localPic == true}">
											<img id="smallPicOne" src="${ctx }/${memberBasic.pictureUrl}" alt="" width="150px" height="150px"/>
										</c:if> <c:if test="${memberBasic.localPic == false}">
											<img src="http://img4.99114.com/${memberBasic.imgUrl}" alt="" width="150px" height="150px"/>
										</c:if></a><span>公司形象图</span></li>
								</ul>
								<div class="ys_txt fl" style="padding-left: 20px; width: 300px;">
									<div class="ys_pos">
										<p>图片比例1:1</p>
										<p>LOGO建议尺寸120px x 120px</p>
										<p>形象图建议尺寸200px x 150px</p>
									</div>
								</div>
								
							</td>
						</tr>
						<tr> 
						  <th><s class="cf_ff0 mr7">*</s>公司LOGO：</th>
						  <td>
						  <input name="files" type="file" class=""
											accept="image/gif, image/jpeg,image/png"> <input
											name="logo" value="${memberBasic.logo }" type="hidden"/>
										<p style="color: #ff0000" />更换企业LOGO(图片文件大小：不能超过5M)</p>
									
						  </td>
						</tr>
						<tr> 
						  <th><s class="cf_ff0 mr7">*</s>企业形象图：</th>
						  <td>
						  <input name="files1" type="file" class=""
											accept="image/gif, image/jpeg,image/png"> <input
											name="pictureUrl" value="${memberBasic.pictureUrl }" type="hidden"/>
										<p style="color: #ff0000" />更换形象图(图片文件大小：不能超过5M)</p>
									
						  </td>
						</tr>
						<tr>
							<th><s class="cf_ff0 mr7">*</s>公司简介：</th>
							<td>
								<textarea class="ys_textarea" name="summary" value="${memberBasic.summary}" style="height: 120px;">${memberBasic.summary}</textarea>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!--基本资料 end-->
			<!--详细资料 start-->
			
			
			<!--产业链推送 end-->
			<!--联系人信息 start-->
			<div>
				<div class="g_userInfo">
					<p class="pop_tdtitle cf_c60">以下信息将显示在店铺中，请如实、完整填写。</p>
					<table border="0" cellpadding="0" cellspacing="0" class="us_table">
						<tr>
							<th>我的头像：</th>
							<td class="g_com_td clearfix">
								<ul class="g_in_l fl clearfix">
									<li><a href="#"><c:if
											test="${member.localPic == true}">
											<img id="smallPicOne" src="${ctx}/${member.headPortrait}" alt="" width="120px" height="120px"/>
										</c:if> <c:if test="${member.localPic == false}">
											<img src="http://img4.99114.com/${member.imgUrl}" alt="" width="120px" height="120px"/>
										</c:if></a></li>
								</ul>
								<div class="ys_txt fl">
									<div class="ys_pos">
										<p>图片比例1:1</p>
										<p>建议尺寸120px x 120px</p>
									</div>
								</div>
							</td>
						</tr>
						<tr> 
						  <th><s class="cf_ff0 mr7">*</s>我的头像：</th>
						  <td>
						  <input name="files2" type="file" class=""
											accept="image/gif, image/jpeg,image/png"> <input
											name="headPortrait" value="${member.headPortrait}" type="hidden"/>
										<p style="color: #ff0000" />更换我的头像(图片文件大小：不能超过5M)</p>
									
						  </td>
						</tr>
						<tr>
							<th><s class="cf_ff0 mr7">*</s>姓名：</th>
							<td><input type="text" class="text_inp inptText ipt_w138" value="${member.linkMan}" name="linkMan"/>
							<label class="l_label ml5">
							<input type="radio"  name="sex" value="female"  ${member.sex eq "female" ? "checked":"" }/>
							女士</label><label class="l_label ml10">
							<input type="radio"  name="sex"  value="male" ${member.sex eq "male" ? "checked":"" }/>先生</label></td>
						</tr>
						<tr>
							<th>手机：</th>
							<td><input type="text" class="text_inp inptText ipt_w258" value="${member.mobile}" name="mobile"/></td>
						</tr>
						<tr>
							<th>邮箱：</th>
							<td><input type="text" class="text_inp inptText ipt_w258" value="${member.email }" name="email"/></td>
						</tr>
						<tr>
							<th>固定电话：</th>
							<td><input type="text" class="text_inp inptText ipt_w258" value="${member.telephone}" name="telephone"/></td>
						</tr>
						
						<tr>
							<th>传真：</th>
							<td><input type="text" class="text_inp inptText ipt_w258" value="${member.fax}" name="fax"/></td>
						</tr>
						<tr>
							<th>QQ：</th>
							<td>
								<input type="text" class="text_inp inptText ipt_w258" value="${member.qq}" name="qq"/>
								
								
								
							</td>
						</tr>
						<tr>
							<th><s class="cf_ff0 mr7">*</s>联系地址：</th>
							<td>
								
									<div class="m_sel_box clearfix">
										<select name="" class="col-md-2 area" id="sysArea11" style="width: 88px">
											
										</select>
										<select name="" class="col-md-2 area" id="sysArea12" style="width: 88px">
											
										</select>
										<select name="areaCode" class="col-md-2" id="sysArea13" style="width: 88px">
					
										</select>
									</div>
									
						
								
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!--联系人信息 end-->
		</div>
		<div class="mt40 mb40 t-text-c">
			<input  type="submit" value="保存"/>
			<!-- <a class="new_addbut" href="#">保&nbsp;存</a> -->
		</div>
	</div> 
	</form>
	<!--页签切换 结束-->
</div> 
<script src="${ctx}/admin/js/area.js"></script>
<script type="text/javascript" src="${ctx}/media/Js/jquery.superslide.2.1.1.js"></script><!--tab 页签切换-->
<script type="text/javascript" src="${ctx}/media/Js/jquery.tzSelect.js"></script><!--select美化-->
<script type="text/javascript">

$(function(){
	var ctx = "${ctx}";
	//公司注册地址
	var currentCode =  ${memberBasic.dealInAreaCode}+"";
	loadAreaMes(ctx,currentCode,'sysArea1','sysArea2','sysArea3');
	//供应商地址
	 var currentSuplyCode =  ${member.areaCode}+"";
	loadAreaMes(ctx,currentSuplyCode,'sysArea11','sysArea12','sysArea13');
});
/*-------------tab 页签切换-------------------*/
tabs("m_tabLi","tabContent");
$('select.regularSelect').tzSelect();
jQuery(".slidetxtbox").slide({delayTime:0,pnLoop:false});

$(function(){
//产业链推送中增加5个空格：
	var inpList = "<div class='s_inptBox clearfix'><input type='text' class='text_inp inptText ipt_w82' /><input type='text' class='text_inp inptText ipt_w82' /><input type='text' class='text_inp inptText ipt_w82' /><input type='text' class='text_inp inptText ipt_w82' /><input type='text' class='text_inp inptText ipt_w82' /><a href='javascript:;' title='删除' class='i_del'>删除</a></div>"
	$(".s_span_add").live("click",function(){
		$(this).hide().parent().find("p").before(inpList);
	});
	$(".i_del").live("click",function(){
		$(this).parents("td").find(".s_span_add").show();
		$(this).parent().remove();
	});
//联系人信息中添加地址：
	$(".add_dress_2").hide();
	$(".add_dress .btn_selxg").click(function(){
		$(this).hide();
		$(".add_dress_2").show();
	});
	$(".add_dress_2 .btn_selxg").click(function(){
		$(this).parents("td").find(".btn_selxg").show();
		$(this).parent().hide();
	});
//联系人信息中激活说明下拉
	$(".g_jh_p").hover(function(){
		$(".explainDiv").show();
		$(this).parents("td").css({"position":"relative","z-index":10000});
	},function(){
		$(".explainDiv").hide();
		$(this).parents("td").css({"position":"relative","z-index":0});
	});
	
});
</script>
</body>
</html>
