<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 首页无引用公共的头和尾 -->
<meta name="decorator" content="top" />
 <script src="${ctx }/admin/js/jquery-1.10.2.min.js"></script>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人用户卖家后台-首页</title>
<link href="${ctx }/media/memcenter/base.css" type="text/css" rel="stylesheet" /> 
<link href="${ctx }/media/memcenter/layout.css" type="text/css" rel="stylesheet"/>
<link href="${ctx }/media/memcenter/link.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.qujiance a {
  display: inline-block;
  height: 16px;
  vertical-align: middle;
  cursor: pointer;
}
</style>
<!-- 页面js处理数据库json价格区间字段之后可以在后台写一个工具类处理json形式的字段 -->
<script>
	function parseValue(priceRange){
		var priceStr =  "" ;
		//var priceRange = "[{'Number':1,'Price':128},{'Number':60,'Price':96},{'Number':120,'Price':75}]" ;
		if(priceRange){
			var data = eval(priceRange) ;
			switch (data.length) {		
			case 1:
				priceStr = data[0].Price ;
				break;
			case 2:{
				if(data[0].Price > data[1].Price ){
					priceStr = data[1].Price+"--"+data[0].Price ;
				}else{
					priceStr = data[0].Price+"--"+data[1].Price ;
				}
				break;
			}case 3:{
				if(data[0].Price > data[2].Price ){
					priceStr = data[2].Price+"--"+data[0].Price ;
				}else{
					priceStr = data[0].Price+"--"+data[2].Price ;
				}
				break;
			}
			default:
				// 目前只有三个价格区间， 后期增加的话，可以通过需排序实现最小到最大（冒泡，选择）
				break;
			}
		}
		return priceStr + "元" ;
	}
$(document).ready(function(){
	$("span[name='priceRange']").each(function(){
		var priceRange = parseValue($(this).text()) ;
		$(this).text(priceRange) ;
	}) ;
});
/* 显示列表分页 */


/* 删除确认 */
function deletenews(id){

	$("#id").attr("value",id) ;
	
} 
/* 确认删除 */
function doDelete(){
	var id = $("#id").val() ;
	if(id!=null && id != undefined){
		var url = "${ctx}/front/member/supply/detele.html" ;
		$("#messageInfo").modal("hide");//关闭窗口
		$("#deleteForm").attr("action",url).submit() ;	
	}
} 

function page(n, s) {
	 $("#pageNo").val(n);
	 $("#pageSize").val(s);
	 $("#searchForm").attr('action', '${ctx}/front/member/supply/list.html').submit(); 
	 return false;
	}
</script>
</head>
<body>

<div class="w840">
	
	<h2 class="peomes_h2 yahei ji_10">产品列表（共计：${page.count}条<span class="tow"></span>）
	 <div class="zd_list zd_list_product klpo_tia">
			<ul>
		<a href="${ctx }/front/member/supply/list.html?status=8" class="current loh loh1 loy lon"><input type="button" class="btn btn-default btn-outlined" value="已推荐"></a> 
	    <a href="${ctx }/front/member/supply/list.html?status=16" class="current loh loh1 loy lon"><input type="button" class="btn btn-default btn-outlined" value="已置顶"></a>
	    <a href="${ctx }/front/member/supply/list.html?status=4" class="current loh loh1 loy lon"><input type="button" class="btn btn-default btn-outlined" value="禁用"></a> 
	    <a href="${ctx }/front/member/supply/list.html?status=32" class="current loh loh1 loy lon"><input type="button" class="btn btn-default btn-outlined" value="已删除"></a>
			</ul>
			<i class="klpo_tia_99"><span class=" yellow_bg yellow_bg1 num_p">99</span></i>
		</div>
	</h2>
	<div class="Search_div clearfix mb8">
		<a href="${ctx }/front/member/supply/add.html" class="grayBtn btn_fblue fr mt15">+发布新产品</a>
		<form action="${ctx }/front/member/supply/list.html" method="post">
		<input type="text" class="Search_div_input1 w228 h28 border1 grayTips top_3 left_0"  name="name"  placeholder="输入货品标题" value="${supplyVo.name}"/>
		<input type="submit" value="搜&nbsp;索" class="h30 w65 Search_div_input2 border2 fl" >
		</form>
		
	</div>
	<!--表格部分start-->
	<div class="w840" id="tably-buybiaoti" style="z-index:100;top:0; background-color:#FFF">
	
			<table class="cgBox-table-title h42 h42_bg " cellpadding="0" cellspacing="0" >
				<tr>
					<th class="w42"></th>
					<th class="w80 cent_1">图片</th>
					<th class="w160 cent_1">&nbsp;标题</th>
					<th class="w120 cent_1">
						<div class="timepx jd_pad">
							价格<span class="arrup"></span>
						</div>
						</th>
					<th class="w145 cent_1">所属店铺分类</th>
					<th class="w100">
						<div class="left_-5">
							信息质量等级
						</div>
					</th>
					<th class="w141 cent_1">
						<div class="timepx">
							发布时间
							<span class="arrup"></span>
						</div>
					</th>
					<th class="w80 cent_1">	
						操作
					</th>
				</tr>
		</table>
	</div>
	<%-- <table class="cgBox-table-title  fnk jx_10 h42_bg">
			<tr>
				<th class="w40_1 bor_boder" ><input type="checkbox" class="cgbox_check1"/></th>
				<th align="left"><a class="import_btn ml10" href="#"><em>重　发</em></a><a class="import_btn ml10" href="#"><em>店铺分类</em></a><a class="import_btn ml10" href="#"><em>下　架</em></a><a  class="btn btn-danger btn-sm" data-toggle="modal" onclick="deletenews(${supplyVo.id})"  data-target="#messageInfo" title="" target="_blank"><em>永久删除</em></a>
				</th>
			</tr>
		</table> --%>
		<table class="cgBox-table-title ">
		 <form id="deleteForm"><input id="id" type="hidden" name="id"></form>
		<c:forEach var="supplyVo" items="${list}">
		
		<tr class="bo_top" >
			<td class="w41_1 bor_boder min_3" align="center"><input type="checkbox" class="cgbox_check2"/></td>
			<td>
				<table cellpadding="0" cellspacing="0" class="w797">
					<tr>
						<td class="w80 ">
							<div class="pic_box_a">
							<c:if test="${supplyVo.localPic==true }">
							<img src="${ctx}/${supplyVo.pic}" width="60" height="60"/>
							</c:if>
							<c:if test="${supplyVo.localPic==false }">
							<img src="http://img4.99114.com/${supplyVo.imgUrl}" width="60" height="60"/>
							</c:if>
							</div>
						</td>
						<td class="w160 ">
							<div class="font12  div_wid">
								<a href="" target="_blank" class="bule">${supplyVo.name }</a>
							</div>
						</td>
						<td class="w150_a cent_1" align="center">
							<div class="pad_t_3  mar_5">
								<span name="priceRange">${supplyVo.priceInterval}</span><i></i>
							</div>
						</td>
						<td class="w160 cent_1">
							<div class="pad_t_3 mar_5">
								暂无分类<i></i>
							</div>
						</td>
						<td width="160" align="center">
							<div class="liststar">
								<span class="nine"></span>
							</div>
							<!--0没有ＣＬＡＳＳ　1为one 2为second third four five six seven eight nine ten 依次类推-->
						</td>
						<td class="w141 " align="center" >
							<div class="pad_t_3 soan_ong">
								<fmt:formatDate value="${supplyVo.addTime}" pattern="yyyy-MM-dd" />
							</div>
						</td>
						<td class="w100 cent_1" >
							<div class="pad_t_3 mar_r">
								<a href="${ctx}/front/member/supply/update.html?id=${supplyVo.id}" title="" target="_blank" class="xg_10 xg_10_a">修改</a>
							</div>
							  <div class="pad_t_3 mar_r"> 
								<a class="import_btn ml10" data-toggle="modal" onclick="deletenews(${supplyVo.id})"  data-target="#messageInfo" title="" target="_blank" >永久删除</a>
					         </div>  
							<div class="pad_t_3 mar_r">
								<a href="" title="" target="_blank" class="xg_10 xg_10_a">下架</a>
							</div>
						</td>
					</tr>
					<tr>
						<td  colspan="7" class="fz_bg post_po" height="26">
							<span class="fz_f">分享</span>
							<!--百度分享代码start-->
							<div class="bdsharebuttonbox fx_btn1">
								<a href="#" class="bds_more" data-cmd="more" style="margin: 1px 6px -4px 2px; line-height:0"></a>
							</div>
							<span class="xi_bg pro_fon ys_a">
								<em></em>
							</span>
							<!--百度分享代码end-->
							
						</td>
					</tr>
				</table>
			</td>
			
		</tr>
		
		</c:forEach>
		
	</table>
	<!-- <table class="cgBox-table-title  fnk  h42_bg m_-1 bor_bom">
			<tr>
				<th class="w40_1 bor_boder" ><input type="checkbox" class="cgbox_check1"/></th>
			<th align="left"><a class="import_btn ml10" href="#"><em>重　发</em></a><a class="import_btn ml10" href="#"><em>店铺分类</em></a><a class="import_btn ml10" href="#"><em>下　架</em></a><a class="import_btn ml10" href="#"><em>永久删除</em></a> 
				</th>
			</tr>
		</table> -->
	
		

<!-- 分页 -->
		<form action="" id="searchForm" method="post">
									<input type="hidden" id="pageNo" name="pageNo" value="">
					</form>
					
					${page }


</div>
 	<!-- 弹出框 --> 
	<div class="modal fade" id="messageInfo" data-backdrop="false" style="margin-top: 100px;width: 500px; margin-left: 600px;"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog-tc">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="messageInfoLabel">确认删除</h4>
				</div>
				<div class="modal-body">您确定要删除吗？</div>
				<div class="modal-footer" style="margin-top: 100px;width: 500px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" onclick="doDelete();" class="btn btn-primary">确认</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 弹出框 end -->
<script type="text/javascript">
/*-------------select美化-------------------*/
$('select.regularSelect').tzSelect();
window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];


</script>
<!---百度分享代码end--->
</html>
