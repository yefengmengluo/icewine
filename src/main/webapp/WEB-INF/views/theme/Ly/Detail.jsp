<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国冰酒交易网</title>
<!--共有样式-->
<meta name="decorator" content="common" />
<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Layout.css"
	rel="stylesheet" />
<style type="text/css">
	.error{
		color:red;
		margin-left:5px;
	}
</style>
<script language="javascript" type="text/javascript" src="${ctx}/media/Js/jquery-1.11.2.min.js"></script> 
<script type="text/javascript" src="${ctx}/media/Js/jquery.validate.js"></script>
<script>
jQuery.extend(jQuery.validator.messages, {  
    required: "请填写本字段",  
    remote: "验证失败",  
    email: "请输入正确的电子邮件",  
    url: "请输入正确的网址",  
    date: "请输入正确的日期",  
    dateISO: "请输入正确的日期 (ISO).",  
    number: "请输入正确的数字",  
    digits: "请输入正确的整数",  
    creditcard: "请输入正确的信用卡号",  
    equalTo: "请再次输入相同的值",  
    accept: "请输入指定的后缀名的字符串",  
    maxlength: jQuery.validator.format("允许的最大长度为 {0} 个字符"),  
    minlength: jQuery.validator.format("允许的最小长度为 {0} 个字符"),  
    rangelength: jQuery.validator.format("允许的长度为{0}和{1}之间"),
    maxlength: jQuery.validator.format("允许的最大长度为 {0} 个字符"),  
    max: jQuery.validator.format("请输入一个最大为 {0} 的值"),  
    min: jQuery.validator.format("请输入一个最小为 {0} 的值")  
}); 
$().ready(function() {
	jQuery.validator.addMethod("ismobile",function(value, element) {
				var length = value.length;
				var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1}))+\d{8})$/;
				return (length == 11 && mobile.exec(value)) ? true: false;
			}, "请正确填写您的手机号码");
	
	$("#formJoin").validate({
		rules: {
			img: {// 手机
				required: true ,
				ismobile: true
			},
			imgUrl:{ // 邮箱
				email : true
			},
			biref:{ // 公司名称
				required: true
			},
			title:{ // 标题
				required: true
			},
			content:{ // 留言
				required: true,
				maxlength: 1000
			}
		} ,
		messages: {
			img: {// 邮箱
				required: "请输入手机号"
			},
			imgUrl:{ // 邮箱
				email : "请输入正确的email格式"
			},
			biref:{
				required: "请输入公司名称"
			},
			title:{ // 标题
				required: "请输入姓名"
			},
			content:{ // 留言
				required: "请输入留言",
				maxlength : "留言长度不能超过1000个汉字",
			}
		}
	}); 
});


</script>
</head>

<body>
	<div class="wrapper">
		<!-- 当前位置 -->
		<div class="location mt10 mb10">
			<h6>
				您的当前位置：<a href="${ctx}/index.html ">中国冰酒交易网</a> &gt;&gt; 我要留言
			</h6>
			<%-- <span><a href="${ctx}/media/Detail.html">红冰酒</a> 白冰酒 桃红冰酒 起泡酒</span> --%>
		</div>
		<!-- 当前位置 -->
	</div>
	<div class="wrapper">
		<div class="left-756 floatL">
			<div class="liuyanBox">
				<div class="title">
					<h3>我要留言</h3>
				</div>
				<div class="Ly">
					<ul class="newTabLy">
						<li class="newHover" id="companyId">企业</li>
						<li >个体</li>
					</ul>
					<div class="Ly_from newContent dis">
						<form action="${ctx }/save.html"  method="post"  id="formJoin" enctype="multipart/form-data" >
						  <input name="nature" type="hidden" id="messageType" value="company"/>
						  <input name="adType" type="hidden" value="message"/> 
							<table width="100%" border="0">
								<tr>
									<td width="18%" align="right">留言类别：</td>
									<td colspan="2"><p>
											 <label> <input type="radio" name="flag" value="求购" id="RadioGroup1_0" /> 求购
                                            </label> <label> <input type="radio" name="flag"  value="供应" id="RadioGroup1_1" /> 供应
											</label> <label> <input type="radio" name="flag" value="招商加盟" id="RadioGroup1_0" /> 招商加盟
											</label> <label> <input type="radio" name="flag" value="合作" id="RadioGroup1_1" /> 合作
											</label> <label> <input type="radio" name="flag" value="提供资讯知识" id="RadioGroup1_0" /> 提供资讯知识
											</label>
										</p></td>
								</tr>
								<tr id="companyName">
									<td align="right"><span>*</span>公司名称：</td>
									<td width="45%"><input name="biref"  id="biref" type="text" class="inputLy" /></td>
								</tr>

								<tr>
									<td align="right"><span>*</span>姓名：</td>
									<td><input name="title" type="text"  id="name" onkeyup="value=value.replace(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')" class="inputLy" /></td>
								</tr>

								<tr>
									<td align="right"><span>*</span>手机：</td>
									<td><input name="img"  id="usPhone" type="text" class="inputLy"  /></td>
								</tr>

								<tr>
									<td align="right">邮箱：</td>
									<td><input name="imgUrl" maxlength="20"  id="email" type="text" class="inputLy" /></td>
								</tr>

								<tr>
									<td align="right"><span>*</span>留言：</td>
									<td><textarea  name="content"  id="need" cols="" rows=""></textarea></td>
								</tr>
								<tr>
									<td align="right">&nbsp;</td>
									<td colspan="2"><input  onclick="submit()" type="submit" value="" class="tjbot" /></td>
								</tr>
							</table>
							<div class="tel">
								<p class="bbb">您还可以通过以下方式，让客服人员直接帮您处理</p>
								<div class="teltext">0931-2661880</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--我要留言-->
		<div class="right-232 floatR">
			<!--丙纶求购-->
			<div class="tradeMessage">
				<div class="tadeTit">交易信息</div>
				<ul class="tradeList commentUlName">
					<li>
						<div>
							<p class="floatL">订单号 13031560201</p>
							<span class="floatR">已经到货</span>
						</div>
						<p>
							<span class="floatL">金额<strong>9810.0</strong>元
							</span> <span class="floatR">批发商-绿时代</span>
						</p>
					</li>
					<li>
						<div>
							<p class="floatL">订单号 13031560206</p>
							<span class="floatR">已经到货</span>
						</div>
						<p>
							<span class="floatL">金额<strong>15236.8</strong>元
							</span> <span class="floatR">猎人谷梅洛特酒</span>
						</p>
					</li>
					<li>
						<div>
							<p class="floatL">订单号 15031560206</p>
							<span class="floatR">已经到货</span>
						</div>
						<p>
							<span class="floatL">金额<strong>3210.0</strong>元
							</span> <span class="floatR">批发商-绿时代</span>
						</p>
					</li>
					<li>
						<div>
							<p class="floatL">订单号 15731560206</p>
							<span class="floatR">已经到货</span>
						</div>
						<p>
							<span class="floatL">金额<strong>3210.0</strong>元
							</span> <span class="floatR">批发商-绿时代</span>
						</p>
					</li>
					<li>
						<div>
							<p class="floatL">订单号157315602078</p>
							<span class="floatR">已经到货</span>
						</div>
						<p>
							<span class="floatL">金额<strong>3210.0</strong>元
							</span> <span class="floatR">批发商-绿时代</span>
						</p>
					</li>
					<li>
						<div>
							<p class="floatL">订单号 137315602008</p>
							<span class="floatR">已经到货</span>
						</div>
						<p>
							<span class="floatL">金额<strong>3210.0</strong>元
							</span> <span class="floatR">批发商-绿时代</span>
						</p>
					</li>
					<li>
						<div>
							<p class="floatL">订单号 137315602011</p>
							<span class="floatR">已经到货</span>
						</div>
						<p>
							<span class="floatL">金额<strong>3210.0</strong>元
							</span> <span class="floatR">批发商-黄金冰酒</span>
						</p>
					</li>
					<li>
						<div>
							<p class="floatL">订单号 1373156002310</p>
							<span class="floatR">已经到货</span>
						</div>
						<p>
							<span class="floatL">金额<strong>321010.0</strong>元
							</span> <span class="floatR">祁连传奇精</span>
						</p>
					</li>

				</ul>
			</div>
			<div class="cls"></div>
		</div>
		<!--右侧部分-->
		<div class="cls"></div>
	</div>
	<!--版权信息 begin-->

	<%-- <script language="javascript" type="text/javascript"
		src="${ctx}/media/Js/index.js"></script> --%>
	<!-- jQuery -->
	<script>
		function tab(sName) {
			
			sName.each(function(a) {
				$(this).click(function() {
					$("#formJoin")[0].reset() ;
					$(".error").each(function(){
						$(this).empty() ;
					});
					if($(this).attr("id") == "companyId"){  // 企业用户
						$("#messageType").attr("value","company") ;
						$("#companyName").show(); 
					}else{
						$("#messageType").attr("value","person") ;
						$("#companyName").hide();
					}
					$(sName).removeClass("newHover");
					$(this).addClass("newHover");
					/* $(this).parent().siblings().hide();
					$(this).parent().siblings().eq(a).show(); */
				})
			})
		}
		$(function() {
			tab($(".newTabLy li"));
		
		});
	
</script>
<!-- jQuery -->
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>

</body>
</html>
