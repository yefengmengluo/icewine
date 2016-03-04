<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国冰酒交易网</title>
<link href="${ctx}/media/Css/base1.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/media/Css/layout1.css" type="text/css" rel="stylesheet"/>
</head>

<body>
	<div class="r-top-wrap">
		<div class="w1000 r-top">
			<span>采购管理</span>
		</div>
	</div>
	<div></div><!--为了兼容ie7-->
	<div class="Instructions_P">
		<h3 class="Instr_tit">
			流程说明书：
		</h3>
		<!--流程说明步骤 start-->
		
		<div class="lism_type">
			<span class="lism_type_fd">发布采购单</span>
			<span class="arrow_P"></span>
			<span class="lism_type_fd">查看供应商报价并洽谈</span>
			<span class="arrow_P"></span>
			<span class="lism_type_fdw">
				<p class="jdcd_yj">交易方式</p>
				<p class="jyfs_p">在线确认收货、线上下单线下支付）</p>
			</span>
			<span class="arrow_P"></span>
			<span class="lism_type_fd">交易完成</span>
			
			
		</div>
		<div class="clear"></div>
		<div class="cgd_titie">
			<table class="cgd_title_a">
				<tr>
					<td width="98" align="right" class="font_st">
						<i class="yj_red">*</i> 采购单标题：
					</td>
					<td align="left">
						<input type="text" id="title" name="title" class="cdg_input inptText" value="如：采购显示器、主机、办公桌、办公椅"/>
					</td>
					<td align="left">
						<span class="prompt ts_infor_a">这里是提示信息，全表单一样</span>
					</td>
				</tr>
			</table>
		</div>
		<div class="cgd_inp">
			<h3 class="sczz_title">
				采购单基本信息
			</h3>
			<div class="sczz_titleC">
				<table class="table_A" cellpadding="0" cellspacing="0" border="0">
					
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="108" align="right"  height="50"  valign="top"> 
										<div class="Name">
											<i class="yj_red">*</i> 采购数量：
										</div>
									</td>
									<td align="left" width="340"  height="50" valign="top" >
										<input type="text" class="input_wh162"  id="purchaseAmount" name="purchaseAmount"/>
										<div class="selec_yj">
											<select name="" class="set select_1 regularSelect  yj_w65"   >
											<option value="opt1">件</option>
											<option value="opt2">请选择</option>
										</select>
										</div>
									</td>
									
								</tr>
							</table>
						</td>
						<td  width="108" align="right" height="50" valign="top" >
							<div class="Name">
								<i class="yj_red">*</i> 目标单价：
							</div>	
						</td>
						<td align="left" valign="top" height="50">
							<input type="text" class="input_wh149" id="unitPrice" name="unitPrice"/>
								<div class="selec_yj">
									<select name="" class="set select_1 regularSelect w80"   >
										<option value="opt1">元</option>
										<option value="opt2">请选择</option>
									</select>
								</div>	
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="108" align="right" height="40" valign="top"  > 
										<div class="Name">
											<i class="yj_red"></i> 产品描述：
										</div>
									</td>
									<td align="left" width="240"valign="top" >
										<input type="text" class="input_B" name="summary"/>
									</td>
								
								</tr>
							</table>
						</td>
					</tr>
			
					
				</table>
				
			</div>
			<div class="fbcg_bus ">
				<a href="javascript:" class="grayBtn btn_fblue ">+添加更多采购产品</a>
			</div>
			<!--详细说明及留言框part-->
			<div class="deataik">
				<div class="deataik_left">
					<p class="Xxsm">详</p>
					<p class="Xxsm">细</p>
					<p class="Xxsm">说</p>
					<p class="Xxsm">明</p>
					
				</div>
				<div class="deataik_right">
					<div class="tea_r">
						<textarea class="textDn inptText" >请在这里填写您对采购单的详细说明 </textarea>	
					</div>
					<div class="up_index">
						<a class="import_btn Uploadfile" href="#"><em>上传文件</em></a><span class="scwj_fs">您可以上传word、excel、txt或图片类型的文件</span>
					</div>
					<div class="clear"></div>
					<table class="table_B" cellpadding="0" cellspacing="0">
						<tr>
							<td width="20" height="25">
								<div class="pic_jiaobiao wank"></div>
							</td>
							<td width="165" align="left" height="25">
								<div class="wjNAme">
									<a href="" title="4034970a304e251ff083..." target="_blank" class="ablue">4034970a304e251ff083...</a>
								</div>
								
							</td>
							<td>
								<div class="Dletea" height="25">
									<a href="" title="" target="_blank" class="ablue">删除</a>
								</div>
							
							</td>
						</tr>	
						<tr>
							<td width="20" height="25">
								<div class="pic_jiaobiao2 wank"></div>
							</td>
							<td width="165" align="left" height="25">
								<div class="wjNAme">
									<a href="" title="4034970a304e251ff083..." target="_blank" class="ablue">4034970a304e251ff083...</a>
								</div>
								
							</td>
							<td height="25">
								<div class="Dletea">
									<a href="" title="" target="_blank" class="ablue">删除</a>
								</div>
							
							</td>
						</tr>
						<tr>
							<td width="20" height="25">
								<div class="pic_jiaobiao3 wank"></div>
							</td>
							<td width="165" align="left" height="25">
								<div class="wjNAme">
									<a href="" title="4034970a304e251ff083..." target="_blank" class="ablue">4034970a304e251ff083...</a>
								</div>
								
							</td>
							<td height="25">
								<div class="Dletea">
									<a href="" title="" target="_blank" class="ablue">删除</a>
								</div>
							
							</td>
						</tr>
						<tr>
							<td width="20" height="29">
								<div class="pic_jiaobiao4 wank"></div>
							</td>
							<td width="165" align="left" height="29">
								<div class="wjNAme">
									<a href="" title="4034970a304e251ff083..." target="_blank" class="ablue">4034970a304e251ff083...</a>
								</div>
								
							</td>
							<td height="29">
								<div class="Dletea" height="25">
									<a href="" title="" target="_blank" class="ablue">删除</a>
								</div>
							
							</td>
						</tr>
					</table>
					
					
				</div>
			</div>
		</div>
		<div class="cgd_inpa">
			<h3 class="sczz_title">
				采购条件
			</h3>
			<table class="Purchase_com  mt10">
				<tr>
					<td align="right" height="50" width="160">
						<div class="pur_title">
							<i class="yj_red">*</i> 报价截至日期：
						</div>
					</td>
					<td align="left" height="50">
						<select name="" class="set select_1 regularSelect w260"   >
							<option value="opt1">2011-04-15</option>
							<option value="opt2">2011-04-16</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right" height="50" width="160">
						<div class="pur_title">
							<i class="yj_red">*</i> 收货地：
						</div>
					</td>
					<td align="left" height="50">
						<table>
							<tr>
								<td align="left" height="50">
									<table cellpadding="0" cellspacing="0">
										<tr>
											<td align="left"  height="50">
												<select name="" class="set select_1 regularSelect w126"   >
													<option value="opt1">选择省</option>
													<option value="opt2">2011-04-16</option>
												</select>
											</td>
											<td align="left"  height="50" class="pl10">
												<select name="" class="set select_1 regularSelect w126"   >
													<option value="opt1">选择市</option>
													<option value="opt2">2011-04-16</option>
												</select>
											</td>
											<td align="left"  height="50"  class="pl10">
												<select name="" class="set select_1 regularSelect w126"   >
													<option value="opt1">选择地区</option>
													<option value="opt2">2011-04-16</option>
												</select>
											</td>
										</tr>
									</table>	
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="right" height="50" width="160">
						<div class="pur_title">
							 期望供应商所在地：
						</div>
					</td>
					<td>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td align="left" height="50">
								<select name="" class="set select_1 regularSelect w260"   >
									<option value="opt1">区域不限</option>
									<option value="opt2">2011-04-16</option>
								</select>
							</td>
							<td align="left"  height="50">
								<div class="xg_aera">
									<a class="import_btn  Modify_a" href="#"><em>修改地区</em></a>
								</div>
							</td>
						</tr>
					</table>
					</td>
				</tr>
					<tr>
					<td align="right" height="50" width="160">
						<div class="pur_title">
							报价要求：
						</div>
					</td>
					<td align="left" height="50">
						<table cellpadding="0" cellspacing="0" width="525">
							<tr>
								<td width="25" align="left" valign="middle">
									<input type="checkbox"/>
								</td>
								<td align="left" width="125" >
									提供样品或样品图片
								</td>
								<td width="24" align="left" valign="middle">
									<input type="checkbox" class=""/>
								</td>
								<td width="90" align="left">
									需增值税发票
								</td>
								<td width="24" align="left" valign="middle">
									<input type="checkbox" class=""/>
								</td>
								<td align="left">
									提供样品或样品图片
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div class="cgd_inpa">
			<h3 class="sczz_title">
				联系信息
			</h3>
			<table class="Purchase_com mt20">
				<tr>
					<td width="160" align="right" height="50" valign="top">
						<div class="pur_titlea">
							<i class="yj_red">*</i> 联系人：
						</div>
					</td>
					<td align="left" height="50" valign="top">
						<input type="text" class="input_BN inptText" value="如：张三" id="linkman" name="linkman"/>
					</td>
				</tr>
					<tr>
					<td width="160" align="right" height="50" valign="top">
						<div class="pur_titlea">
							<i class="yj_red">*</i> 联系电话：
						</div>
					</td>
					<td align="left" height="50"  valign="top">
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td align="left"> 
									<input type="text" class="input_BN inptText" value="请输入公司固定电话或手机号" id="tel" name="tel"/>
								</td>
								<td>
									<span class="prompt">填写手机号可免费接受短信提醒。</span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
					<tr>
					<td width="160" align="right" height="50" valign="top">
						<div class="pur_titleb">
							<i class="yj_red">*</i> 联系方式：
						</div>
					</td>
					<td align="left" height="50" valign="top">
						<table cellpadding="0" cellspacing="0" class="yj-8px" >
							<tr class="bom5P">
								<td width="126" align="left" ><label><input type="radio" class="jgkj "  name="testradio" />仅供应商可见</label></td>
								<td width="102" align="left"><label><input type="radio" class="jgkj"  name="testradio" />全部可见</label></td>
								<td width="126" align="left"><label><input type="radio" class="jgkj"  name="testradio" />不可见</label></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		
		</div>
		<div class="issue">
			<a class="Goom" href="#">我要发布</a>
		</div>
		
	</div>
	<div class="footer">
	<p>@1999-2013 中国网库 ALL rights reserved</p>
</div>
	<script type="text/javascript" src="../../js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="../../js/jquery.tzSelect.js"></script><!--select美化-->
	<script type="text/javascript" src="../../js/base.js" ></script>
<script type="text/javascript">
/*-------------select美化-------------------*/
$('select.regularSelect').tzSelect();
</script>
	
</body>
</html>
