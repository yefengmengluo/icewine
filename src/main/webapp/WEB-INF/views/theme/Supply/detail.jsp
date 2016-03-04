<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 引用公共的头部和底部标签 -->
<meta name="decorator" content="common" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国冰酒交易网</title>
<link type="text/css" href="${ctx}/media/Css/listDetail.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/module.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Layout.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Detail-S.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/media/Js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/media/Js/scrollpic.js"></script>
<style type="text/css">


</style>
</head>
<body>
	<div class="t1000-com-wrapper clearfix">
		<div id="bfb" class="comMt12 floatL clearfix "
			style="width: 754px; overflow: hidden;">
			<div id="bf5" class="bf5_d">
				<div class="widget">
					<div class="t1000-sup-conbox clearfix">
						<div class="t1000-sup-contitle textC">
							<h2>${prosupply.name }</h2>
						</div>
						<!--产品放大镜-->
						<div class="tb-wrap_l floatL">
							<div class="jqzoom">
								<img src="http://img4.99114.com/${imgImages.imgPath }"
									jqimg="http://img4.99114.com/${imgImages.imgPath }" id="bigImg">
							</div>
							<div id="spec">
								<div class="control specLeftT" id="specLeft"></div>
								<div id="specList">
									<ul class="listImg">
										<li><img id="smallPicOne"
											src="http://img4.99114.com/${imgImages.imgPath }"
											src_H="http://img4.99114.com/${imgImages.imgPath }"
											src_D="../../../fodder/t1000/comW300h300.jpg"></li>
									</ul>
								</div>
								<div class="control specRightT" id="specRight"></div>
							</div>
						</div>
						<!--tb-wrap end-->
						<div class="supDetailR floatR">
							<!--按照市场指导价格显示样式  不能删-->
							<div class="supDetailDpTab">
								<p class="font14 supDetailDpTit bold pad">
									市场指导价格： <span class="red bold font18">${prosupply.promotionType
										}</span> 元/千克
								</p>
								<p class="pad textC">
									<a href="#" class="btnRed"><span>查看批发价</span></a>
								</p>
							</div>
							<div class="supDetailDpTab2">
								<table cellpadding="0" cellspacing="0" border="0" width="90%">
									<tr>
										<td>建议零售价：<span class="fontorange bold">${prosupply.promotionType
												}</span> 元/瓶
										</td>
										<td>发货期：<span class="fontorange bold">3</span> 天以内
										</td>
									</tr>
									<tr>
										<td>支付方式：银联支付</td>
										<td>发货地：${prosupply.extractAddr }</td>
									</tr>
									<tr>
										<td>月在线销量：${prosupply.sales}</td>
										<td>发票税率：17%</td>
									</tr>
								</table>
							</div>
							<div class="tb-bottom">
								<p class="form">
									<span class="w60">订购数量：</span><input type="text" name=""
										class="text w68" />/瓶 （可售数量：${prosupply.storeNum }瓶）
								</p>
								<div class="supDetailMt30 clearfix">
									<span class="fl supDetailPadR"></span>
									<div class="select mr5 myf-sel fl">
										<!--               <input type="text" class="slt-input slt-input_w90" value="请您选择地区" /><a href="javascript:void(0);" class="slt-btn"></a> -->
										<div class="slt-option w116">
											<ul>
												<!-- <li><a href="javascript:void(0);">请您选择地区</a></li> -->
											</ul>
										</div>
									</div>
									<!--select end-->
									<!--   <div class="fl"><span class="fontorange bold">20</span> 元</div> -->
								</div>
								<!--运费end-->
								<p class="comMt20 textC">
									<a href="${ctx }/tologin" id="web_box1" class="btnOrange"><span>加入进货单</span></a>&nbsp;&nbsp;&nbsp;<a
										href="${ctx }/tologin" id="web_box2" class="btnBlue2"><span>发布询盘</span></a>
								</p>
							</div>
							</table>
							<!--tb-bottom end-->
							<!--以上按照商品价格显示样式-->
						</div>
						<div class="clear"></div>
						<!--supDetailR end-->
						
						<div class="content-xx">
							<div class="supDetailTabBox">
							<div class="tabBox clearfix" > 
								<ul class="supDetailTabUl" style="padding: 0px; border-bottom: 0px;">
									<li class="on"><a href="javascript:void(0)"><span>产品简介</span></a></li>
									<li><a href="javascript:void(0)"><span>成交记录</span></a></li>
									<li><a href="javascript:void(0)"><span>订购说明</span></a></li>
									<li><a href="javascript:void(0)"><span>联系方式</span></a></li>
									<!-- Baidu Button BEGIN -->
									<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare"
										style="margin-top: 8px;">
										<span class="sharetxt">分享：</span> <a class="bds_qzone"></a> <a
											class="bds_tsina"></a> <a class="bds_tqq"></a> <a
											class="bds_renren"></a> <a class="bds_t163"></a> <span
											class="bds_more"></span>
									</div>
                                   
                                     </div>
									<div style="display: block;" id="myshop_proDetail_info"
										class="tab">
										<div id="renderAttribute">
											<table width="100%" cellspacing="0" cellpadding="0"
												border="0" class="table-introduce">
												<tbody>
													<tr>
														<td class="td-intro_1">是否进口</td>
														<td>是</td>
														<td class="td-intro_1">产品类别</td>
														<td>冰酒</td>
													</tr>
													<tr>
														<td class="td-intro_1">净重（规格）</td>
														<td>375</td>
														<td class="td-intro_1">酒精含量</td>
														<td>10</td>
													</tr>
													<tr>
														<td class="td-intro_1">品牌</td>
														<td>麦克威尔品丽珠冰白葡萄酒</td>
														<td class="td-intro_1">葡萄品种</td>
														<td>品丽珠</td>
													</tr>
													<tr>
														<td class="td-intro_1">年份</td>
														<td></td>
														<td class="td-intro_1">产地</td>
														<td>加拿大</td>
													</tr>
													<tr>
														<td class="td-intro_1">葡萄汁含量</td>
														<td></td>
														<td class="td-intro_1">原料与配料</td>
														<td></td>
													</tr>
													<tr>
														<td class="td-intro_1">特产</td>
														<td></td>
														<td class="td-intro_1">含糖量</td>
														<td></td>
													</tr>
													<tr>
														<td class="td-intro_1">生产厂家</td>
														<td></td>
														<td class="td-intro_1">保质期</td>
														<td></td>
													</tr>
													<tr>
														<td class="td-intro_1">商品条形码</td>
														<td></td>
														<td class="td-intro_1">储藏方法</td>
														<td></td>
													</tr>
													<tr>
														<td class="td-intro_1">产品标准号</td>
														<td></td>
														<td class="td-intro_1">卫生许可证</td>
														<td></td>
													</tr>
													<tr>
														<td class="td-intro_1"></td>
														<td></td>
														<td class="td-intro_1">颜色</td>
														<td></td>
													</tr>
													<tr>
														<td class="td-intro_1">包装方式</td>
														<td>瓶装</td>
														<td class="td-intro_1">包装规格</td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div></div>
										<script type="text/javascript">	var
                
                
              
    <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6629899" ></script>
										<script type="text/javascript" id="bdshell_js"></script>
										<script type="text/javascript">
    document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
    </script>
										<!-- Baidu Button END -->
										<!-- <span class="collect"><a href="#">此点收藏</a></span> -->
								</ul>
								<div class="tab" style="display: block;">
									<table width="100%" cellpadding="0" cellspacing="0" border="0"
										class="supDetailTabIntrodue">
									</table>
									<p>${prosupply.summary } </p>
									<!-- <p>生效日期：2013年1月22日 - 2013年2月21日</p>
									<p>产品名称：篮球Wiver耳环配件树脂球手链配件DIY时尚饰品</p>
									<p>生效日期：2013年1月22日 - 2013年2月21日</p> -->
									<!-- <p class="textC comMt20">
										<img src="../../../fodder/t1000/w570h270.jpg" />
									</p>
									<p class="textC comMt20">
										<img src="../../../fodder/t1000/w570h270.jpg" />
									</p> -->
								</div>
								<div class="tab">
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										class="supDetailTabOrder">
										<caption class="month-record">
											本商品累计成交 <em class="fontorange">100</em> 单 ，其中线上交易 <em
												class="fontorange">100</em> 单 ，线下交易 <em class="fontorange">200</em>
											单
										</caption>
										<tbody>
											<tr>
												<th>买家</th>
												<th>宝贝名称</th>
												<th>价格</th>
												<th>购买数量</th>
												<th>成交时间</th>
												<th>状态</th>
											</tr>
											<tr>
												<td class="td-user">
													<p>我爱**…爱</p>
												</td>
												<td class="td-pro">
													<p>宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称</p>
												</td>
												<td>
													<p class="fontorange">1009</p>
												</td>
												<td>
													<p>1</p>
												</td>
												<td>
													<p>2013-6-16 10:30</p>
												</td>
												<td>
													<p>成交</p>
												</td>
											</tr>
											<tr>
												<td class="td-user">
													<p>我爱**…爱</p>
												</td>
												<td class="td-pro">
													<p>宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称</p>
												</td>
												<td>
													<p class="fontorange">1009</p>
												</td>
												<td>
													<p>1</p>
												</td>
												<td>
													<p>2013-6-16 10:30</p>
												</td>
												<td>
													<p>成交</p>
												</td>
											</tr>
											<tr>
												<td class="td-user">
													<p>我爱**…爱</p>
												</td>
												<td class="td-pro">
													<p>宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称宝贝名称</p>
												</td>
												<td>
													<p class="fontorange">1009</p>
												</td>
												<td>
													<p>1</p>
												</td>
												<td>
													<p>2013-6-16 10:30</p>
												</td>
												<td>
													<p>成交</p>
												</td>
											</tr>
											<tr>
												<td class="td-user">
													<p>我爱**…爱</p>
												</td>
												<td class="td-pro">
													<p>宝贝名称宝贝名称宝名称宝贝名宝贝名称宝贝名称宝贝名称</p>
												</td>
												<td>
													<p class="fontorange">1009</p>
												</td>
												<td>
													<p>1</p>
												</td>
												<td>
													<p>2013-6-16 10:30</p>
												</td>
												<td>
													<p>成交</p>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="pagelist">
										<ul>
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li class="current">3</li>
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li>
											<li>...</li>
											<li class="next"><a href="#"><img
													src="../Images/dj.png" width="8" height="10" /></a></li>
											<li>共20页&nbsp;&nbsp;&nbsp;到第 <input type="text"
												name="textfield" id="textfield" /> 页 <input name="submit"
												type="submit" class="sub123" value="" />
											</li>
										</ul>
									</div>
									<!--pagelist end-->
								</div>
								<!--成交记录 end-->
								<div class="tab">
									<p class="jy-title">
										<span class="font14 bold">交易方式</span>（当前商品支持以下在线支付方式）
									</p>
									<p>
										<img src="../Images/gy-pic1.gif" />
									</p>
									<p class="font14 bold">银联条件的支付及说明</p>
									<p class="fontindent">
										个人卡支付：拥有开通"网上支付"功能的银行卡，即可完成在线支付。 <a href="#" class="fontblue">查看银联支付的银联列表</a>
									</p>
									<p class="fontindent">企业卡支付：每笔向卖家收费10元人民币手续费，而且企业打款还可以省一笔汇划费。
									</p>
								</div>
								<!--订购说明 end-->
								<div class="tab">
									<div class="supDetailTabCon">
										<p class="mb20">
											<span class="font-name">好想你枣业股份有限公司</span>(免费会员)
										</p>
										<div class="contact-left fl">
											<p>
												张三<br />销售经理
											</p>
										</div>
										<div class="contact-right fl">
											<p>地 址：公明镇楼村后海旭发科技园5栋四楼北面公明镇楼村后海旭发科技园5栋四</p>
											<p>移动电话： 1333333333333</p>
											<p>办公电话： 010-8977777</p>
											<p>传 真： 010-8977777转888</p>
											<p>电子邮箱： qinxiaopeng@.99114.com</p>
											<p>邮 编： 100029</p>
											<p>网 站： www.99114.com</p>
										</div>
										<div class="clear"></div>
									</div>
								</div>
								<!--联系方式 end-->
							</div>
						</div>
						<!--产品的详细资料 end-->
					</div>
				</div>
				<script type="text/javascript" src="${ctx }/js/scrollpic.js"></script>
				<div class="widget  comMt12">
					<div class="t1000-sup-conbox">
						<div class="t1000-sup-contitle">中国冰酒交易网热销排行</div>
						<!-- picrotate_left start  -->
						<div class="supDetailW724 clearfix">
							<a onmouseup=ISL_StopUp_1() class="LeftBotton"
								onmousedown=ISL_GoUp_1() onmouseout=ISL_StopUp_1()
								href="javascript:void(0);"></a>
							<div class="pcont" id="ISL_Cont_1">
								<div class="ScrCont">
									<div id="List1_1">
										<!-- piclist begin -->
									<c:forEach var="hotVo" items="${hotList }" >
										<a href="#" class="pl">
										  <c:if test="${hotVo.localPic == true}">
								          <img src="${ctx}/${hotVo.pic}" alt="" />
								          </c:if> 
								          <c:if test="${hotVo.localPic == false}">
								          <img src="http://img4.99114.com/${hotVo.imgUrl}"  width="150px" height="150px"  />
								          </c:if>
										
											<p>${fn:substring(hotVo.name,0,9)}</p>
											<p>
												<span class="red bold">${hotVo.sales }</span> /袋
											</p>
										</a>
										
									</c:forEach>
										
									</div>
									<div id="List2_1"></div>
								</div>
							</div>
							<a onmouseup=ISL_StopDown_1() class="RightBotton"
								onmousedown=ISL_GoDown_1() onmouseout=ISL_StopDown_1()
								href="javascript:void(0);"></a>
						</div>
						<script type="text/javascript">
                        picrun_ini()
                         </script>
						<!-- picrotate_left end -->
					</div>
				</div>
				<!--该商家的产品推荐-->
				<div class="searchT">
					<form method="get" action="detail_t1000.html">
						<input type="text" class="input" name=""> <input
							class="searchTBtn" type="button" name="" value="找供应"> <input
							class="searchTBtn" type="button" name="" value="联盟搜索">
					</form>
				</div>


				<!--   <div class="addSearch"><strong>相关搜索</strong><span><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a><a href="#">好想你枣业</a></span></div>-->
			</div>
		</div>
		 <div class="comW232 floatR">
			<div class="widget comMt12">
				<div class="t1000-sup-conbox">
					<div class="t1000-sup-bfboxtext sj-info">
						<div class="sj-line">
						<p class="t1000-sup-contitle" style="width: 300px;margin-left: -9 px;">公司档案</p>
							<p>
								<span class="blue font14 bold">${memberBasic.corporationName }</span>
							</p>
							<p>
								联系人：${member.linkMan }&nbsp;&nbsp;<a target=blank
									href=tencent://message/?uin=123456&Site=工具啦&Menu=yes><img
									border="0" SRC=http://wpa.qq.com/pa?p=1:123456:6
									alt="点击这里给我发消息"></a>
							</p>
							<p>工商认证信息：已审核</p>
							<c:if test="${memberBasic.dealInId eq 'production' }">
							<p>经营模式：生产类型</p>
							</c:if>
							<c:if test="${memberBasic.dealInId eq 'wholesale' }">
							<p>经营模式：批发型</p>
							</c:if>
							<c:if test="${memberBasic.dealInId eq 'businessService' }">
							<p>经营模式：商务服务</p>
							</c:if>
							<c:if test="${memberBasic.dealInId eq 'productsProxy' }">
							<p>经营模式：代理商</p>
							</c:if>
							<c:if test="${memberBasic.dealInId eq 'other' }">
							<p>经营模式：其他类型</p>
							</c:if>
							<p>
								主营业务：<span class="sj-sort">酒品</span>
							</p>
							<p>所在地区：${memberBasic.dealInAreaCode}</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="t1000-sup-conbox comMt12">
				<div class="t1000-sup-contitle">联系我们</div>
				<div class="t1000-sup-bfboxtext">
					<p>联系人：${member.linkMan }</p>
					<p>手机：${member.mobile }</p>
					<p>电话：${member.telephone }</p>
					<p>联系地址：${memberBasic.dealInAreaCode}</p>
				</div>
			</div>
			<div class="t1000-sup-other-pro comMt12 t1000-com-border"
				id="t1000-sup-other-pro" module="supply"
				bestFitModule="global-common-text-list"
				refuseModule="global-common-*,supply-common-pic-top-text-bottom">
				<div class="t1000-sup-contitle">
				
					<div class="con-title">相关产品</div>
				</div>
				<div class="t1000-sup-other-pro-box" content="">
					<ul class="global-common-text-list clearfix">
					    <c:forEach var="hotVo" items="${hotList }" begin="8" end="26">
					    
					    <li><a title="" href="${ctx}/font/supply/dateil.html?id=${hotVo.id}">${hotVo.name}</a></li>
					    
					    </c:forEach>
						
					</ul>
				</div>
			</div>
			<div class="t1000-sup-other-cor-pro-box t1000-com-border comMt12"
				id="t1000-sup-other-cor-pro-box" module="supply"
				bestFitModule="supply-common-hotline-con"
				refuseModule="supply-common-*,global-common-pic-list-text">
				<!-- <div class="con-box"> -->
				<div class="t1000-sup-contitle">
					<div class="con-title">该商家的其他产品</div>
					<div class="D_detailUl">
						<div class="surbuy_rxph_txt">
						<c:forEach var="hotVo" items="${hotList }" begin="0" end="7">
						
							<dl>
								<dt>
									<span><a href="${ctx}/font/supply/dateil.html?id=${hotVo.id}"
										title="低价白酒批发生态酒宴酒坊和顺白酒 浓香型珍藏原浆中国白酒" target="_blank">
										  <c:if test="${hotVo.localPic == true}">
								          <img src="${ctx}/${hotVo.pic}" alt="" />
								          </c:if> 
								          <c:if test="${hotVo.localPic == false}">
								          <img src="http://img4.99114.com/${hotVo.imgUrl}" alt="" />
								          </c:if>
										
									</span>
								</dt>
								<dd class="surbuy_rxph_txt_t">
									<a href="${ctx}/font/supply/dateil.html?id=${hotVo.id}"
										title="低价白酒批发生态酒宴酒坊和顺白酒 浓香型珍藏原浆中国白酒">${fn:substring(hotVo.name,0,12)}</a>
								</dd>
								<dd class="surbuy_rxph_txt_c">${hotVo.sales }</dd>
								<dd class="surbuy_rxph_txt_d">${hotVo.memberName }</dd>
							</dl>
							
							</c:forEach>
							
							
						</div>
					</div>
				</div>

    </div> 
			<div class="t1000-sup-oter-art t1000-com-border comMt12"
				id="t1000-sup-oter-art" module="article" article="" bestFitModule=""
				refuseModule="global-common-pic-list,article-common-*">
				<div class="t1000-sup-contitle">
					<div class="con-title">相关资讯</div>
				</div>
				<div class="t1000-sup-oter-art-box" content="">
					<ul class="global-common-text-list clearfix">
					    <c:forEach var="infoVo" items="${commonInfo}" begin="0" end="10">
					    <li><a title="" href="${ctx }/newDetial/detail.html?id=${infoVo.id}">${fn:substring(infoVo.title,0,13)}</a></li>
					    </c:forEach>
					</ul>
				</div>
			</div>
			<div class="t1000-sup-new-buy t1000-com-border comMt12"
				id="t1000-sup-new-buy" module="article" article=""
				bestFitModule="global-common-text-list"
				refuseModule="global-common-pic-list,global-common-pic-list-text">
				<div class="t1000-sup-contitle">
					<div class="con-title">最新求购</div>
				</div>
				<div class="t1000-sup-new-buy-box" content="">
					<ul class="global-common-text-list clearfix">
					 <c:forEach var="newVo" items="${newqiugous}" begin="0" end="10">
					 	<li><a title="" href="${ctx}/front/proPurchase/dateil.html?id=${newVo.id}">${fn:substring(newVo.title,0,15)}</a></li>
					 </c:forEach>
					
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/media/Js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx}/media/js/Jquery.jqzoom.js"></script>
<script type="text/javascript"
	src="${ctx}/media/js/jquery.livequery.js"></script>
<script type="text/javascript" src="${ctx}/media/js/fangdajs.js"></script>
<script type="text/javascript" src="${ctx}/media/js/alljs.js"></script>
<script type="text/javascript" src="${ctx}/media/js/jquery-ui.js"></script>
<script type="text/javascript" src="${ctx}/media/js/wbox.js"></script>
<script type="text/javascript">
//弹窗
 var wbox=null;
$(function(){
   $("#web_box1").click(function(){
     wbox= $("#web_box1").wBox({noTitle:true,drag:false,requestType:"iframe",target:"tk-a.html"});
     wbox.showBox();
   });   
   $("#closeBtn").click(function(){wbox.close();});
   
   $("#web_box2").click(function(){
     wbox= $("#web_box2").wBox({noTitle:true,drag:false,requestType:"iframe",target:"xunpan-cc.html"});
     wbox.showBox();
   });   
   $("#closeBtn").click(function(){wbox.close();});
   
});
</script>
</html>
