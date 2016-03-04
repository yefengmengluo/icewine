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
<meta name="decorator" content="common"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国冰酒交易网</title>

<link type="text/css" href="${ctx}/media/Css/Base.css" rel="stylesheet" />
<link type="text/css" href="${ctx}/media/Css/Layout.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/media/Js/Common.js"></script>


<link type="text/css" href="${ctx}/media/Css/List.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/media/Css/Inquiry.css"/>
<script type="text/javascript">
/* 显示列表分页 */
function page(n, s) {
 $("#pageNo").val(n);
 $("#pageSize").val(s);
 $("#searchForm").attr('action', '${ctx}/font/supply/more/SpList').submit(); 
 return false;
}
</script>

</head>

<body>

<div class="wrapper ">
    <div class="w800 floatL">
        <div class="location-java mT10">
            <div class="sL-list floatL">查看所有分类</div>
            <h6>您现在的位置：<a href="../Index.html">首页</a> >> <a href="Index.html">产品供应</a> >> <span>钢材</span> <a class="location-javaReturn" href="List-Search.html">返回到类别选择</a></h6>
            <p>共找到<span>1288</span>条符合<span>"钢铁"</span>的查询结果</p>
        </div>	
        <div class=" mT10">
        	<div class="s-l-result">
            	<div class="s-attrKey">已选类目属性</div>
                <div class="bgWhite-java">
                    <div class="s-changed2 ">
                    	<a href="List.html"><font>建筑钢材(02)</font></a><a href="#">建筑钢材(<font>302</font>)</a> <a href="#">建筑钢材(<font>302</font>)</a> <a href="#">建筑钢材(<font>302</font>)</a> <a href="#">建筑钢材(<font>302</font>)</a> <a href="#">建筑钢材(<font>302</font>)</a><a href="#">建筑钢材(02)</a> <a href="#">建筑钢材(<font>302</font>)</a> <a href="#">建筑钢材(<font>302</font>)</a> <a href="#">建筑钢材(<font>302</font>)</a> <a href="#">建筑钢材(<font>302</font>)</a> <a href="#">建筑钢材(<font>302</font>)</a></div>
                     <div class="s-options2">
                            <a class="s-more2" href="#">查看更多</a>
                     </div>
                </div>
                <div class="cls"></div>
            </div>
            <div class="s-l-mq">
            	<div class="s-attrKey">材质</div>
                <div class="bgWhite-java">
                    <div class="s-l-choise">
                    	<form name="form1" method="post" action="">
                        <span>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_0"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_0"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              </span>
                         <span class="add_more">
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>	
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label><label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_0"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label><label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_0"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          </span>
                      </form> 
                    </div>
                    <div class="s-options">
                        <a class="s-multiple" href="#">多选</a>
                        <a class="s-more" href="#nogo">更多</a>
                    </div>
                    <div class="add_btn">
                        <a href="#">确定</a> <a href="#">取消</a>
                    </div>
                </div>
                <div class="cls"></div>
            </div>
            <div class="s-l-mq">
            	<div class="s-attrKey">用途</div>
                <div class="bgWhite-java">
                    <div class="s-l-choise">
                    	<form name="form1" method="post" action="">
                        <span>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_0"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_0"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              </span>
                         <span class="add_more">
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>	
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label><label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_0"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label><label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_0"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          </span>
                      </form> 
                    </div>
                    <div class="s-options">
                        <a class="s-multiple" href="#">多选</a>
                        <a class="s-more" href="#nogo">更多</a>
                    </div>
                    <div class="add_btn">
                        <a href="#">确定</a> <a href="#">取消</a>
                    </div>
                </div>
                <div class="cls"></div>
            </div>
            <div class="s-l-mq">
            	<div class="s-attrKey">规格</div>
                <div class="bgWhite-java">
                    <div class="s-l-choise">
                    	<form name="form1" method="post" action="">
                        <span>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_0"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_0"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                              </span>
                         <span class="add_more">
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>	
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label><label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_0"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label><label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_0"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          <label><input type="checkbox" name="CheckboxGroup1" value="五金" id="CheckboxGroup1_1"><a href="#">五金</a></label>
                          </span>
                      </form> 
                    </div>
                    <div class="s-options">
                        <a class="s-multiple" href="#">多选</a>
                        <a class="s-more" href="#nogo" >更多</a>
                    </div>
                    <div class="add_btn">
                        <a href="#">确定</a> <a href="#">取消</a>
                    </div>
                </div>
                <div class="cls"></div>
            </div>
        </div>
        <div class="s-allFind"><span>大家都在找：</span><a href="#">建筑钢材</a><a href="#">不锈钢材</a><a href="#">钢材设备</a><a href="#">其它钢材</a><a href="#">其他建筑钢材</a><a href="#">其他不锈钢材</a></div>
        <div class="s-l-contentL">
        	<div class="s-l-contentLTit"><h3>所有产品</h3><div class="floatR"><a class="s-listing on" href="List.html">列表</a><a class="s-large" href="List-BigPic.html">大图</a></div></div>
            <div class="s-leftCon">
                <div class="s-paixu">
                    <ul class="add_list">
                        <li class="s-acq add_bor"><a href="#">默认排序</a></li>
                        <li>
                        	<div class="add_select2">
                                <input type="text" class="slt_input w_80" value="发货地" /><a href="#nogo" class="add_pricebtm2box"><em class="add_pricebtm2"></em></a>
                                <div class="slt-option2">
                                    <ul>
                                        <li>
                                        	<a href="javascript:void(0);">北京</a> <em></em>
                                            <div class="hover_pop">
                                            	<ul class="area">
                                                    <li><a href="#nogo">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                        	<a href="javascript:void(0);">北京</a> <em></em>
                                            <div class="hover_pop">
                                            	<ul class="area">
                                                    <li><a href="#nogo">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                        	<a href="javascript:void(0);">北京</a> <em></em>
                                            <div class="hover_pop">
                                            	<ul class="area">
                                                    <li><a href="#nogo">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="list_po">
                                        	<a href="javascript:void(0);">北京</a> <em></em>
                                            <div class="hover_pop">
                                            	<ul class="area">
                                                    <li><a href="#nogo">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                        	<a href="javascript:void(0);">北京</a> <em></em>
                                            <div class="hover_pop">
                                            	<ul class="area">
                                                    <li><a href="#nogo">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                        	<a href="javascript:void(0);">北京</a> <em></em>
                                            <div class="hover_pop">
                                            	<ul class="area">
                                                    <li><a href="#nogo">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                        	<a href="javascript:void(0);">北京</a> <em></em>
                                            <div class="hover_pop">
                                            	<ul class="area">
                                                    <li><a href="#nogo">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="list_po">
                                        	<a href="javascript:void(0);">北京</a> <em></em>
                                            <div class="hover_pop">
                                            	<ul class="area">
                                                    <li><a href="#nogo">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                        	<a href="javascript:void(0);">北京</a> <em></em>
                                            <div class="hover_pop">
                                            	<ul class="area">
                                                    <li><a href="#nogo">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                        	<a href="javascript:void(0);">北京</a> <em></em>
                                            <div class="hover_pop">
                                            	<ul class="area">
                                                    <li><a href="#nogo">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                        	<a href="javascript:void(0);">北京</a> <em></em>
                                            <div class="hover_pop">
                                            	<ul class="area">
                                                    <li><a href="#nogo">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="list_po">
                                        	<a href="javascript:void(0);">北京</a> <em></em>
                                            <div class="hover_pop">
                                            	<ul class="area">
                                                    <li><a href="#nogo">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                        	<a href="javascript:void(0);">北京</a> <em></em>
                                            <div class="hover_pop">
                                            	<ul class="area">
                                                    <li><a href="#nogo">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                    <li><a href="#">海淀区</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                             </div>
                        </li>
                       <li>
                       	<div class="select">
							<input type="text" class="slt-input w_80" value="经营模式" /><a href="#nogo" class="add_pricebtm2box"><em class="add_pricebtm2"></em></a>
							<div class="slt-option clearfix " >
								<ul class="w48">
                                	<li><a href="javascript:void(0);"  class="w_80">经营模式</a></li>
									<li><a href="javascript:void(0);" class="w_80">生产型</a></li>
									<li><a href="javascript:void(0);"  class="w_80">贸易型</a></li>
									<li><a href="javascript:void(0);"  class="w_80">服务型</a></li>
                                    <li><a href="javascript:void(0);"  class="w_80">政府或机构</a></li>
                                    <li><a href="javascript:void(0);"  class="w_80">文化交流</a></li>
								</ul>
							</div>
                            </div>
                       </li>
                        <li>
                        	<!--
						   </div>-->
                        	<font class="add_f"><span class="fl">销量</span><a href="#nogo" class="add_pricebtm"></a></font>
                           </li>
                        <li><span class="s-price">价格</span><a href="#nogo" class="m_downicon"><em class="m_downicon2"></em></a><a href="#nogo" class="m_upicon"><em class="m_upicon1"></em></a></li>
                        <li class="priceLevel w_120 li_po">
                        <font class="po_z"><input type="text" class="s-lowerPrice grayTips" value="最低价"/> - <input type="text" class="s-topPrice grayTips" value="最高价"/></font>
                        	<div class="price_po">
                            	<p>
                                	<a href="#" class="fl clear_btn">清除</a>
                                    <a href="#nogo" class="fr Ddetermine_btn">确定</a>
                                </p>
                            </div>
                        </li>
                        <li>
                        	<!--发布时间-->
                            <span class="m_date">发布时间</span>
							<a href="#nogo" class="m_downicon"><em class="m_downicon2"></em></a><a href="#nogo" class="m_upicon"><em class="m_upicon1"></em></a>
                        </li>
                    </ul>        
                </div>
                
                
               
                     
                 <c:forEach var="l" items="${list}">     
                <div class="s-list-h148">
                	<div class="s-list-w100"><span><a href="Detail.html"> 
                	 <c:if test="${l.localPic == true}">
					<img src="${ctx}/${l.pic}" alt="" />
					  </c:if>
				  <c:if test="${l.localPic == false}"> 
					<img src="http://img4.99114.com/${l.imgUrl}" alt="" />
		 		 </c:if> 
                	
                	</a></span></div>
                    <dl class="s-listL-dl">
                    	<dt><a href="#">${l.name}</a></dt>
                        <dd>发货地：${l.areaCode}</dd>
                        <dd>发货期：3天以内</dd>
                        <dd>库存：${l.storeNum}${l.unit}</dd>
                        <dd><fmt:formatDate value="${l.addTime}" pattern="yyyy-MM-dd" /></dd>
                    </dl>
                    <div class="s-list-w157">
                    	<p class="s-list-weight"><span>${l.promotionPrice}</span>元/${l.unit}</p>
  
                    </div>
                    <div class="s-list-w210">
                    	<p>${l.corporationName}</p>
                        <p class="s-list-huise">销售部：${l.linkman}</p>
                        <p class="s-list-huise">${l.telephone}</p>
                        <p class="s-list-huise">来自:中国冰酒交易网</p>
                      
                    </div>
   			              </div>
                     </c:forEach>
                </div>
                
                
             
               <div class="page-java">
  
				<!-- <ul> -->
					<form action="" id="searchForm" method="post">
									<input type="hidden" id="pageNo" name="pageNo" value="">
					</form>
					
					${page }
					
            <!--   </ul> -->
				</div>
           </div>


        </div>
        
    </div>	
    <div class="w190 floatR">
    	<div class="mT10">
            <div class="s-tit"><h3>热销排行</h3></div>
            <ul class="s-list-ul">
            	   <c:forEach var="HotVo" items="${HotList}">    
                <li><a href="#">${fn:substring(HotVo.name,0,19)}</a></li>
               </c:forEach>
            </ul>
        </div>
        <div class="mT10">
        	<div class="s-tit"><h3>黄金供应商</h3></div>
            <ul class="s-list-ul2"> 
            	<li>
                	<a class="s-list-ul2Pic" href="#"><img src="../Temp/vad23.jpg"></a>
                    <p><a href="#">恰恰食品有限公司</a></p>
                </li>
                <li>
                	<a class="s-list-ul2Pic" href="#"><img src="../Temp/vad23.jpg"></a>
                    <p><a href="#">恰恰食品有限公司</a></p>
                </li>
                <li>
                	<a class="s-list-ul2Pic" href="#"><img src="../Temp/vad23.jpg"></a>
                    <p><a href="#">恰恰食品有限公司</a></p>
                </li>
                <li>
                	<a class="s-list-ul2Pic" href="#"><img src="../Temp/vad23.jpg"></a>
                    <p><a href="#">恰恰食品有限公司</a></p>
                </li>
                <li>
                	<a class="s-list-ul2Pic" href="#"><img src="../Temp/vad23.jpg"></a>
                    <p><a href="#">恰恰食品有限公司</a></p>
                </li>
            </ul>
        </div>
        <div class="mT10 border-line"><a href="#"><img src="../Temp/vad24.jpg"></a></div>
        <div class="mT10 border-line"><a href="#"><img src="../Temp/vad24.jpg"></a></div>
        <div class="mT10 border-line"><a href="#"><img src="../Temp/vad24.jpg"></a></div>
    </div>
    <div class="cls"></div>
</div>

<div class="cls"></div>
<!--版权信息 begin-->


<!--询盘弹出层 start-->
 <%-- <div class="w600" id="inquiryDiv" style="display:none;">
	    <div class="Ma-list mT10">
        <form>
        	<table width="100%" cellspacing="2">
            	<tr>
                	<td width="17%" align="right">我的询问：</td >
                	<td width="55%" align="left">
                	<textarea name="title" style="resize: none;" class="Ma-asked"  
                	onblur="if(this.value=='') this.value='说出你向卖家提出的问题，如：我想采购20吨钢管，给我报个价吧！如：我想要样品，可以发过来吗？';this.style.color='#B3B3B3';" 
                	onclick="if(this.value == '说出你向卖家提出的问题，如：我想采购20吨钢管，给我报个价吧！如：我想要样品，可以发过来吗？') this.value='';this.style.color='black';" >说出你向卖家提出的问题，如：我想采购20吨钢管，给我报个价吧！如：我想要样品，可以发过来吗？</textarea>
                	</td>
                	<td width="28%" align="left" class="Ma-hui" ><p style="line-height:20px;">描述越详细，越有利于找到合适供应商。</p></td>
                </tr>
              <tr>
                	<td width="17%" align="right"><font class="Ma-red">*</font> 公司名称：</td>
                	<td width="55%" align="left">
             
                     	<input name="corpName" type="text" class="input1" value="如：北京昌隆电气设备有限公司"  
                	onblur="if(this.value=='') this.value='如：北京昌隆电气设备有限公司';this.style.color='#B3B3B3';" 
                	onclick="if(this.value == '如：北京昌隆电气设备有限公司') this.value='';this.style.color='black';" />
                	</td>
                	<td width="28%" align="left">&nbsp;</td>
                </tr>
                <tr>
                	<td width="17%" align="right"><font class="Ma-red">*</font> 联系人：</td>
                	<td width="55%" align="left">
                
                    <input name="linkMan" type="text" class="input1" value="如：张三" 
                	onblur="if(this.value=='') this.value='如：张三';this.style.color='#B3B3B3';" 
                	onclick="if(this.value == '如：张三') this.value='';this.style.color='black';"  />
                	</td>
                	<td width="28%" align="left">&nbsp;</td>
                </tr>
                <tr>
                	<td width="17%" align="right"><font class="Ma-red">*</font> 联系电话：</td>
                	<td width="55%" align="left">
              
                    <input name="tel" type="text" class="input1" value="如：固定电话或手机号" 
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
                <tr >
                    <td width="17%" align="right">验证码：</td>
                	<td  colspan="2" >
                	<input id="shop_product_inquiry_image" name="vocde" class="input1" maxlength="4" style="width:80px;color:black;"/>
                	<img id="rcodeimage" src="${webRoot!}vcode/image" />
                	<a href="javascript:void(0);" onclick="codeImage(/vcode/image')">看不清，换一张</a>
                	</td>
               	</tr>
                <tr >
                    
                	<td height="53" colspan="3" align="center" >
                	<input name="Submit"  type="button"  value="发送询盘"  id="inquiry_submit"
                	 class="btn" style="cursor:pointer;" onclick="doinquiry('${productId!}','${toMemberId!}',2)" />
                	</td>
               	</tr>
            </table>
            </form>
        </div>
	</div> --%>
<%-- <!-- 	---------------------------------------页面弹框提示--------------------------------------- -->
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
        	<a class="tck_btn" href="${loginUrl!}">我要登录</a>
        	<a class="tck_btn mrZero" href="${registerUrl!}">我要注册</a>
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
</div>	 --%>
<!--询盘弹出层 end-->
<Script type="text/javascript" src="../Js/Jquery.js"></script>
<script type="text/javascript" src="../Js/ArtDialog/ArtDialog.source.js?skin=green"></script>
<script type="text/javascript" src="../Js/Inquiry.js"></script>
<script type="text/javascript" src="../Js/Index.js"></script>
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
