<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="top" />

<link rel=stylesheet type=text/css href="${ctx }/media/Css/base1.css">
<link rel=stylesheet type=text/css href="${ctx }/media/Css/layout1.css">
<link rel=stylesheet type=text/css href="${ctx }/media/Css/link.css">
<title>发出的报价</title>
<style type="text/css">
.modal-dialog-tc {
	width: 600px;
	margin: 200px auto;
}
</style>
<script type="text/javascript">

/* 删除确认 */
function deletenews(id){
	$("#id").attr("value",id) ;
}
/* 确认删除 */
function doDelete(){
	var id = $("#id").val() ;
	if(id!=null && id != undefined){
		var url = "${ctx}/front/member/buydetele.html" ;
		$("#messageInfo").modal("hide");//关闭窗口
		$("#deleteForm").attr("action",url).submit() ;	
	}
}
function show(noj){
	 $(".summary1").text(noj);  
	
}

</script>
</head>
<body>
	<div class="w840">
    <h2 class="peomes_h2 yahei ji_10">采购单报价管理</h2>
   
    
    <table class="table_m cklb_B">
        <td class="w275">报价供应商</td>
        <td class="w150">报价总额</td>
        <td class="w156"><div class="timepx uppx">报价时间<span class="arrup"></span></div></td>
        <td class="w91">有无发票</td>
        <td >操作</td>
    </table>
    <table class="hpoM hhybn">
       <c:forEach var="proPur" items="${proPurchaseQuote1}">
        <tr>

            <th class="w255 bor_bom">

                <a href="" title="" target="_blank" class="ablue Absev mt10">${proPur.memberBasic.corporationName }</a>
                <p class="mb20  mt7"><img src="${ctx}/media/Images/teng.png" class="mr5">
                <img src="${ctx}/media/Images/i_xyrzs.png" class="mr5">
                <img src="${ctx}/media/Images/dptblue.png" class="mr5">${proPur.member.linkMan}
            
            </th>
            <td  class="w150 bor_bom">
                <p class="nulpo">${proPur.proPurchase.purchaseAmount}</p>
                <p class="julom">（含运费：10.00）</p>
            </td>
            <td class="w156 bor_bom">
                <p>${proPur.proPurchase.addTime}</p>

            </td>

            <td  class="w91 bor_bom">
            <c:choose>
            
             <c:when test="${proPur.proPurchase.invoiceRequest eq 1 }">有</c:when>
             <c:when test="${proPur.proPurchase.invoiceRequest eq 2 }">有</c:when>
             
             <c:otherwise>
                                               无
             </c:otherwise>
            </c:choose>
            	
            </td>
            <td class="bor_bom">
                <a href="${ctx}/front/member/quotedetail.html?id=${proPur.id}"  title="" target="_blank"  class="ablue mr7 ">查看</a>
                <!-- <a href=""  title="" target="_blank"  class="ablue mr7 ">入围</a>
				<a href=""  title="" target="_blank"  class="ablue mr7 ">退回</a> -->
                <a href="${ctx}/front/member/checkQuote.html?id=${proPur.id}"  title="" target="_blank"  class="ablue ">删除</a>
            </td>
        </tr>
        </c:forEach>
        
     <!--   <tr>

            <th class="w255 bor_bom">

                <a href="" title="" target="_blank" class="ablue Absev mt10">北京丑丑有限公司</a>
                <p class="mb20  mt7"><img src="../../images/teng.png" class="mr5"><img src="../../images/i_xyrzs.png" class="mr5"><img src="../../images/dptblue.png" class="mr5">张三<img src="../../images/xiong.png" class="ml5"><img src="../../images/qier.png" class="ml5"></p>
            </th>
            <td  class="w150 bor_bom">
                <p class="nulpo">￥1,150,010.00 </p>
                <p class="julom">（含运费：10.00）</p>
            </td>
            <td class="w156 bor_bom">
                <p>2015-05-04</p>

            </td>

            <td  class="w91 bor_bom">无</td>

            <td class="bor_bom">
				<div>
                <a href=""  title="" target="_blank"  class="ablue fl ml15 ">查看</a>
              
				
				
				<div class="pomsti gkolv  fl">已退回<img src="../../images/shelha.png" width="16" height="16" class="umoobco ml5 mt-3" id=""/>
				<div class="pammokj pb5">
					<p><span class="resion">退回原因:</span>此处为退回原因，每行最多为20个
中文字符，超出后折行，此处为退回原因，每行最多为20个中文字符，超出后折行，此处为退回原因，每行最多为20个中文字符，超出后
折行，此处为退回原因，每行最多为20个中文字符，超出后折行，此处为退回原因，每行最多为20个中文字符，超出后折行，此处为退回
原因，每行最多为20个中文字符，超出后折行，此处为退回原因，每行最多为20个中文字符，出后折行，最多200个中文字符。
					
					</p>	
					<p  ><span class="resion">2015-05-20 </span><span class="resion ml5 ">11:30:00</span></p>
				</div>
			</div>
			</div>
			  <a href=""  title="" target="_blank"  class="ablue fl ml15 ">删除</a>
            </td>
        </tr> -->
        



    </table>

</div>
<script type="text/javascript" src="../../js/jquery-1.7.min.js"></script>
<script type="text/javascript">
$('.pammokj').hide();
	$('.umoobco').mouseenter(function(){
		$('.pammokj').show();	
					
	}).parent(".pomsti").mouseleave(function()
		{
			$(this).find(".pammokj").hide();
			
	});
		
	$('.pammokj').mouseenter(function(){
		$(this).show();	
		
	});
	$('.pammokj').mouseleave(function(){
		$(this).hide();
		
	});
	</script>
	<!-- 弹出框 -->
	<div class="modal fade" id="messageInfo" data-backdrop="false"
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
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" onclick="doDelete();" class="btn btn-primary">确认</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 弹出框 end -->
	<script type="text/javascript">
//分页
function page(n, s) {
$("#pageNo").prop("value",n);
$("#searchForm").prop('action', "${ctx }/front/member/buylist.html").submit(); 
return false;
}
</script>
</body>
</html>