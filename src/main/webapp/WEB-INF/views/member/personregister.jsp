<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业会员注册</title>
<script src="${ctx }/admin/js/jquery-1.10.2.min.js"></script> 
<script type="text/javascript" src="${ctx }/register/js/poplayer.js"></script> 
<link href="${ctx}/admin/js/validation/style.css" type="text/css" rel="stylesheet" />  
<script type="text/javascript" src="${ctx}/admin/js/validation/Validform_v5.3.2_common.js" language="javascript"></script>	 
<link href="${ctx }/register/css/register.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/register/css/validate.css" rel="stylesheet" type="text/css"/>
<link href="${ctx }/register/css/DropDown.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/register/css/register-style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<script type="text/javascript">
function codeImage(){
	document.getElementById("rcodeimageId").src="${ctx}/validateCodeServlet?avc="+new Date();
}






</script>

<script type="text/javascript">
var rankForm;
$(function(){
 rankForm = $("#memberAdverForm").Validform({
	btnSubmit:"#confirm", 
	tiptype:3, 
	showAllError:false,
	 ajax:true,
	postonce:true,
	callback:function(data){
		//返回数据data是json对象，{"info":"demo info","status":"y"}
		//info: 输出提示信息;
		//status: 返回提交数据的状态,是否提交成功。如可以用"y"表示提交成功，"n"表示提交失败，在ajax_post.php文件返回数据里自定字符，主要用在callback函数里根据该值执行相应的回调操作;
		//你也可以在ajax_post.php文件返回更多信息在这里获取，进行相应操作；
		//ajax遇到服务端错误时也会执行回调，这时的data是{ status:**, statusText:**, readyState:**, responseText:** }；
 
		//这里执行回调操作;
		//注意：如果不是ajax方式提交表单，传入callback，这时data参数是当前表单对象，回调函数会在表单验证全部通过后执行，然后判断是否提交表单，如果callback里明确return false，则表单不会提交，如果return true或没有return，则会提交表单。
	}

});
});
</script>
<!--[if lte IE 6]>
<script src="js/DD_belatedPNG_0.0.8a-min.js" type="text/javascript"></script><script type="text/javascript">
DD_belatedPNG.fix('*');
</script>
<![endif]-->
<body>

<script type="text/javascript">
function toSinaLogin(){
	window.location="https://api.weibo.com/oauth2/authorize?client_id=2718242552&response_type=code&redirect_uri=http://member.99114.com/login/callBackSinaMethod";
}
function toQQLogin(){
	window.location="http:\/\/openapi.qzone.qq.com/oauth/show?which=Login&display=pc&client_id=101209083&response_type=code&redirect_uri=http://member.99114.com/login/callBackQQMethod";
}
</script>
<div class="head_out">
    <div class="header cf">
    	<div class="tel fr"></div>
		<div class="logo fl"><a href="javascript:void(0);" target="_blank" id="logoSrc"></a></div>
        <div class="head_tle fl"><img src="${ctx }/media/Images/tellyuan.png"/></div>
       <div class="hd_login fl"> 
       		已有账号<a id="loginA" href="${ctx}/login/check"  class="login fontGray3">登录</a>
       		<!--<a href="javascript:void(0);" onclick="toSinaLogin();"><img class="pngimg" width="19" height="19" src="/static/images/sana.png"></a>-->
       		<!-- <a href="javascript:void(0);" onclick="toQQLogin();"><img class="pngimg" width="19" height="19" src="/static/images/QQ24.png"></a> -->
       </div>
       <%-- <div class="teng_reg_btn">
            <a href="http://bingjiu.99114.com/&siteId=10046" title="点击免费注册工信部腾计划单品通会员"> 
                <img src="${ctx}/media/Images/icewne.jpg" width="208" height="41" />
            </a>
        </div> --%>
    </div>
</div> 
<form action="${ctx }/register/person" method="post" id="memberAdverForm"  autocomplete="off">
	
	<input type="hidden" id="memberId"  name="memberId"/>
	<input  type="hidden" id="siteId" name="siteId" value="10046"/>
	<input  type="hidden" id="backUrl" name="backUrl" value="http://bingjiu.99114.com/"/>
	
<div class="main">
	<div class="content">
		<div class="perTitle comTitle">
		<a href="${ctx}/company.html" class="tab zyblr">企业会员注册</a>
		<a href="${ctx}/register.html" class="tab">个人会员注册</a>
        <div class="accountInfo cf">
            <div id="RegForm" class="form accountForm">
                <div id="select_regName" class="item cf">
                	<span class="label"><em class="fontRed mr5">*</em>用户名：</span>
                    	<div class="intelligent_regName">
                    <div class="fl item_info">
                             <input type="text" class="text" datatype="/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/" maxlength="16"  ajaxurl="${ctx}/member/sAccount"  nullmsg="请输入用户名！" errormsg="限4-16位以字母开头的字母，数字，下划线字符组合！" id="account" name="account"/>
                         	 <label class="info" style="display: none;color:#666;">
								4-16位以字母开头的字母，数字，下划线字符组合
							 </label>
                             <i class="i_name"></i>
                        </div>
                    </div>
                </div>
                <div id="o-password">
                	<div class="item cf">
                    	<span class="label"><em class="fontRed mr5">*</em>密码：</span>
                        <div class="fl item_info">
                        	<input type="password" class="text"  id="password2" name="password" datatype="*6-15" maxlength="16" nullmsg="请设置密码！" errormsg="请输入6-16个字母、数字，区分大小写"/>
                            <label class="info" style="display: none;color:#666;">
                                6-16个字符，建议使用字母与数字组合，区分大小写
                            </label>
                             <i class="i_pass" id="namespan"></i>
                            
                         

                        </div>
                    </div>
                    <div class="item cf">
                    	<span class="label"><em class="fontRed mr5">*</em>确认密码：</span>
                        <div class="fl item_info">
                        	<input type="password" class="text" id="double_pass" name="double_pass"  datatype="*6-15"  recheck="password" maxlength="16" nullmsg="请再输入一次密码！" errormsg="您两次输入的账号密码不一致！" name="confirm_password"  />
                        	<label class="info" style="display: none;color:#666;">
                            	  请再次输入密码
                            </label>
                             <i class="i_pass" id="double_pass"></i>
                          
                        </div>
                    </div>
                </div>
                <div id="iphone_check">
                    <div class="item cf">
                        <span class="label laltit"><em class="fontRed mr5">*</em>手机验证：</span>
                        <div class="fl item_info">
                        	<div class="telval">
                                <input type="text"  class="text" datatype="m" maxlength="11" nullmsg="手机号不能为空！"  errormsg="请输入有效号码，如以13开头,11位纯数字!"  id="mobile"  name="mobile"/>
                               	  <label class="info" style="display: none;color:#666;">请输入有效手机号码，如以13开头,11位纯数字!</label>
                               
                                  <i class="i_tel" id="namespan"></i>
                            </div>
                        </div>
                    </div>
                    
                      <div class="item cf">
                    	<span class="label"><em class="fontRed mr5">*</em>验证码：</span>
                        <div class="fl item_info mb20">
                            <input type="text" class="text yzm_item_text" id="imgCheckCode" name="imgCheckCode" maxlength="6" onblur="checkImgCode(this);"/>
                            <img id="rcodeimageId" src="${ctx}/validateCodeServlet" style="width:86px;height:28;cursor: pointer;">
                            <span id="imgCodeMsg" class="Validform_checktip" style="display:none"></span>
                        </div>
                    </div>
                    
                <%--   <div class="item cf">
                    	<span class="label"><em class="fontRed mr5">*</em>验证码：</span>
                        <div class="fl item_info mb20">
                           <input  type="text" id="vcode" name="vcode"  autocomplete="false"  nullmsg="验证码不能为空！" class="text yzm_item_text"  errormsg="请输入正确的验证码"  maxlength="6"  onmouseover="this.style.borderColor='#41d6d6'" onmouseout="this.style.borderColor=''">
					
                         <!--   <input type="text" class="text yzm_item_text" id="imgCheckCode" name="imgCheckCode" maxlength="6" onblur="checkImgCode(this);"/>   -->
                            <img id="rcodeimageId"  onclick="codeImage()" src="${ctx}/validateCodeServlet" style="width:86px;height:28;cursor: pointer;">
                            <label class="info" style="display: none;color:#666;">
                            	  请再次输入验证码
                            </label>
                            <span id="vcode" class="Validform_checktip" style="display:none"></span>
                        </div>
                    </div>  --%>
       
               <div class="item cf">
                    	<!--  <span class="label"><em class="fontRed mr5">*</em>短信验证码：</span> -->
                        <div class="fl item_info mb20">
                           <!--  <input type="text" class="text yzm_item_text fl mr10" id="mobileCode" name="mobileCode" maxlength="6" onblur="checkCode('mobile','mobileCode');"/> -->
                          <!--   <a href="javascript:void(0)" style="cursor:pointer;" class="search_bj fl mt8"><em>免费获取验证码</em></a> -->
                           <!--  <span id="mobileErrorMsg" class="hide prompt Validform_checktip Validform_wrong">验证码不正确，请重新输入</span> -->
                            <span id="mobileRightMsg" class="hide prompt Validform_checktip Validform_right" style="line-height:40px;">&nbsp;</span>
                            <label id="mobileSendLimit" class="hide prompt yzm_third_tishi ">每个手机号码每天只能获取三次短信验证码，如果您仍未收到验证短信，请联系客服。</label>
                            <label id="accountCheck" class="hide prompt yzm_third_tishi ">未输入用户名或页面缓存失效，请输入用户名或刷新页面后再试。</label>
                            <label class="succeed yzm_succeed hide"></label>
                            <div class="clear"></div>
                            <span id="idSpan" class="tck_panelWarn mt10 mb20 hide"></span>
                            <input type="hidden" id="code" name="code" />
                        </div>
                    </div> 
                </div> 

                
          <div class="others">
                	<div class="font12"><input type="checkbox" class="mr5" checked="checked" id="iAgreeEnterprise"/>我已阅读并同意
                	<a href="javascript:void(0)" class="fontBlue" onclick="popupLayer('t4');">《中国网库用户服务条款》</a></div>
                    <div class="agree_out">
                    	<input  type="submit" id="submitdd" class="agreeRegist" value="立即注册"/>
                    </div>
                </div>
            </div>

            	
            	

<div class="special_code">
	<img width="105" height="105" class="img1 mt10" src="${ctx }/media/Images/apple.png"/>
	<img width="14" height="15" class="img2 mt10" src="${ctx }/media/Images/ios_icon.png"/>苹果手机下载通道
	<img width="105" height="105" class="img1 mt20" src="${ctx }/media/Images/android.png"/>
	<img width="13" height="15" class="img2 mt10" src="${ctx }/media/Images/android (2).png"/>安卓手机下载通道
</div>

               <!--  <div class="others cf">
                	<div class="font12"><input type="checkbox" class="mr5" checked="checked" id="iAgreeEnterprise"/>我已阅读并同意<a href="#nogo" class="fontBlue" onclick="popupLayer('t4');">《中国网库用户服务条款》</a></div>
                     <div class="agree_out">
                    	<input  type="submit" id="submitdd" class="agreeRegist" value="立即注册"/>
                    </div>
                </div> -->
            </div>
            <!--企业注册 end-->
        </div>
        <!--企业注册accountInfo end-->
    </div>
</div>
</form>



<div class="tan" id="t4"> 
               <h2>中国网库服务条款</h2>
                <div class="ty_con">
                  	<div class="pop_h400">
                    	<p>欢迎阅读北京网库信息技术股份有限公司（中国网库）服务条款协议(下称"本协议")，您应当在使用服务之前认真阅读本协议全部内容，且对本协议中加粗字体显示的内容，中国网库督促您应重点阅读。本协议阐述之条款和条件适用于您使用中国网库及旗下所有行业网、品类网（所涉域名为：99114.com、99114.cn，下同），所提供的在行业上下游企业间(B-TO-B)电子市场(e-market)中进行信息发布、网上推广、在线报价、洽谈交易等服务(下称"服务")。</p>
                        <h5>1. 接受条款</h5>
                        <p>
以任何方式进入并使用中国网库平台服务即表示您已充分阅读、理解并同意自己已经与中国网库订立本协议，且您将受本协议的条款和条件("条款") 约束。中国网库可随时自行全权决定更改"条款"。如"条款"有任何变更，中国网库仅将在网站上发布新条款予以公示，不再单独通知予您。如您不同意相关变更，则必须停止使用"服务"。经修订的"条款"一经在中国网库网站公布后，立即自动生效。一旦您继续使用"服务"，则表示您已接受经修订的"条款"，当您与中国网库发生争议时，应以最新的"条款"为准。除另行明确声明外，任何使"服务"范围扩大或功能增强的新内容均受本协议约束。
本协议内容包括协议正文及所有中国网库已经发布或将来可能发布的各类规则。所有规则为本协议不可分割的一部分，与本协议正文具有同等法律效力。
                        </p>
                        <h5>2.服务使用对象</h5>
                        <p>
服务仅供能够根据相关法律订立具有法律约束力的合约的自然人、法人或其他组织使用。因此，您的年龄必须在十八周岁或以上，才可使用中国网库服务。如不符合本项条件，请勿使用"服务"。中国网库可随时自行全权决定拒绝向任何服务对象提供"服务"。"服务"不会提供给被暂时或永久中止资格的中国网库会员。
                        </p>
                        <h5>3. 收费</h5>
                        <p>
                        中国网库保留在根据第1条通知您后，收取"服务"费用的权利。您因进行交易、向中国网库获取有偿服务或接触中国网库服务器而发生的所有应纳税赋，以及相关硬件、软件、通讯、网络服务及其他方面的费用均由您自行承担。中国网库保留在无须发出书面通知，仅在中国网库网站公示的情况下，暂时或永久地更改或停止部分或全部"服务"的权利。
                        </p>
                        <h5>4.中国网库网站仅作为信息发布或交易地点</h5>
                        <p>
                        您完全了解中国网库网站上的信息系用户自行发布，且可能存在风险和瑕疵。中国网库网站仅作为用户物色交易对象，就货物和服务的交易进行协商，以及获取各类与贸易相关的服务的地点。但是，中国网库不能控制交易所涉及的物品的质量、安全或合法性，商贸信息的真实性或准确性，以及交易方履行其在贸易协议项下的各项义务的能力。中国网库不能也不会控制交易各方能否履行协议义务。此外，您应注意到，与外国国民、未成年人或以欺诈手段行事的人进行交易的风险是客观存在的。您应自行谨慎判断确定相关物品及/或信息的真实性、合法性和有效性，并自行承担因此产生的责任与损失。
                        </p>
                        <h5>5.您的资料和供买卖的物品</h5>
                        <p>
                        "您的资料"包括您在注册、交易或列举物品过程中、在任何公开信息场合或通过任何电子邮件形式，向中国网库或其他用户提供的任何资料，包括数据、文本、软件、音乐、声响、照片、图画、影像、词句或其他材料。您应对"您的资料"负全部责任，而中国网库仅作为您在网上发布和刊登"您的资料"的被动渠道。但是，倘若中国网库认为"您的资料"可能使中国网库承担任何法律或道义上的责任，或可能使中国网库 (全部或部分地) 失去中国网库的互联网服务供应商或其他供应商的服务，或您未在中国网库规定的期限内登录或再次登录网站，则中国网库可自行全权决定对"您的资料"采取中国网库认为必要或适当的任何行动，包括但不限于删除该类资料。您特此保证，您对提交给中国网库的"您的资料"拥有全部权利，包括全部版权。您确认，中国网库没有责任去认定或决定您提交给中国网库的资料哪些是应当受到保护的，对享有"服务"的其他用户使用"您的资料"，中国网库也不必负责。
                        </p>
                        <h5>5.1 注册义务。</h5>
                        <p>
                        如您在中国网库网站注册，您同意：(a) 根据中国网库网站刊载的会员资料表格的要求，提供关于您或贵公司的真实、准确、完整和反映当前情况的资料；(b) 维持并及时更新会员资料，使其保持真实、准确、完整和反映当前情况。倘若您提供任何不真实、不准确、不完整或不能反映当前情况的资料，或中国网库有合理理由怀疑该等资料不真实、不准确、不完整或不能反映当前情况，中国网库有权暂停或终止您的注册身份及资料，并拒绝您在目前或将来对"服务"(或其任何部份) 以任何形式使用。如您代表一家公司或其他法律主体在中国网库登记，则您声明和保证，您有权使该公司或其他法律主体受本协议"条款"约束。
                        </p>
                        <h5>5.2 会员注册名、密码和保密。</h5>
                        <p>
                        在您按照注册页面提示填写信息、阅读并同意本协议并完成全部注册程序后或以其他中国网库允许的方式实际使用中国网库网站服务时，您即成为中国网库会员（亦称会员），中国网库根据会员注册名和密码确认您的身份。您须自行负责对您的会员注册名和密码保密，且须对您在会员注册名和密码下发生的所有活动（包括但不限于发布信息资料、网上点击同意或提交各类规则协议、网上续签协议或购买服务等）承担责任。您同意：(a) 如发现任何人未经授权使用您的会员注册名或密码，或发生违反保密规定的任何其他情况，您会立即通知中国网库；及 (b) 确保您在每个上网时段结束时，以正确步骤离开网站。中国网库不能也不会对因您未能遵守本款规定而发生的任何损失或损毁负责。您理解中国网库对您的请求采取行动需要合理时间，中国网库对在采取行动前已经产生的后果（包括但不限于您的任何损失）不承担任何责任。
                        </p>
                        <h5>5.3 关于您的资料的规则。</h5>
                        <p>
                        您同意，"您的资料"和您发布在中国网库网站上的任何"物品"（泛指一切可供依法交易的、有形的或无形的、以各种形态存在的某种具体的物品，或某种权利或利益，或某种票据或证券，或某种服务或行为。本协议中"物品"一词均含此义）
                        </p>
                        <p>a. 不会有欺诈成份，与售卖伪造或盗窃无涉； </p>
                        <p>
                        b. 不会侵犯任何第三者对该物品享有的物权，或版权、专利、商标、商业秘密或其他知识产权，或隐私权、名誉权等任何权利；
                        </p>
                        <p>
                        c. 不会违反任何法律、法规、条例或规章 (包括但不限于关于规范出口管理、贸易配额、保护消费者、不正当竞争或虚假广告的法律、法规、条例或规章)；
                        </p>
                        <p>
                        d. 不会含有诽谤（包括商业诽谤）、恐吓或骚扰的内容；
                        </p>
                        <p>e. 不会含有淫秽、或包含任何儿童色情内容； </p>
                        <p>f. 不会含有蓄意毁坏、恶意干扰、秘密地截取或侵占任何系统、数据或个人资料的任何病毒、伪装破坏程序、电脑蠕虫、定时程序炸弹或其他电脑程序；</p>
                        <p>g. 不会直接或间接与下述各项货物或服务连接，或包含对下述各项货物或服务的描述：(i) 本协议项下禁止的货物或服务；或 (ii) 您无权连接或包含的货物或服务。此外，您同意不会：(h) 在与任何连锁信件、大量胡乱邮寄的电子邮件、滥发电子邮件或任何复制或多余的信息有关的方面使用"服务"；(i) 未经其他人士同意，利用"服务"收集其他人士的电子邮件地址及其他资料；或 (j) 利用"服务"制作虚假的电子邮件地址，或以其他形式试图在发送人的身份或信息的来源方面误导其他人士。</p>
                        <h5>5.4 被禁止物品</h5>
                        <p>
                        您不得在中国网库网站公布或通过中国网库网站买卖：(a) 可能使中国网库违反任何相关法律、法规、条例或规章的任何物品；或 (b) 中国网库认为应禁止或不适合通过本网站买卖的任何物品。
                        </p>
                        <h5>6. 您完全理解并同意不可撤销地授予中国网库及其关联公司下列权利：</h5>
                        <h5>6.1对于您提供的资料，您授予中国网库及其关联公司独家的、全球通用的、永久的、免费的许可使用权利 (并有权在多个层面对该权利进行再授权)，使中国网库及其关联公司有权(全部或部份地) 使用、复制、修订、改写、发布、翻译、分发、执行和展示"您的资料"或制作其派生作品，和/或以现在已知或日后开发的任何形式、媒体或技术，将"您的资料"纳入其他作品内。</h5>
                        <h5>6.2当您违反本协议或与中国网库签订的其他协议的约定，中国网库有权以任何方式通知关联公司（包括但不限于直营分公司、各地区代理商等，下同），要求其对您的权益采取限制措施包括但不限于要求关联公司中止、终止对您提供部分或全部服务，且在其经营或实际控制的任何网站公示您的违约情况。
</h5>
                        <h5>6.3同样，当您向中国网库关联公司作出任何形式的承诺，且相关公司已确认您违反了该承诺，则中国网库有权立即按您的承诺约定的方式对您的账户采取限制措施，包括但不限于中止或终止向您提供服务，并公示相关公司确认的您的违约情况。您了解并同意，中国网库无须就相关确认与您核对事实，或另行征得您的同意，且中国网库无须就此限制措施或公示行为向您承担任何的责任。</h5>
                        <h5>7.隐私</h5>
                        <p>
                        尽管有第6条所规定的许可使用权，但基于保护您的隐私是中国网库的一项基本原则，为此中国网库还将根据中国网库的隐私声明使用"您的资料"。中国网库隐私声明的全部条款属于本协议的一部份，因此，您必须仔细阅读。请注意，您一旦自愿地在中国网库交易地点披露"您的资料"，该等资料即可能被其他人士获取和使用。
                        </p>
                        <h5>8.信息发布及交易程序</h5>
                        <h5>8.1 添加产品描述条目。产品描述是由您提供的在中国网库网站上展示的文字描述、图画和/或照片，可以是(a) 对您拥有而您希望出售的产品的描述；或 (b) 对您正寻找的产品的描述。您可在中国网库网站发布任一类产品描述，或两种类型同时发布，条件是，您必须将该等产品描述归入正确的类目内。中国网库不对产品描述的准确性或内容负责。</h5>
                        <h5>8.2 就交易进行协商。</h5>
                        <h5>交易各方通过在中国网库网站上明确描述报盘和回盘，进行相互协商。所有各方接纳报盘或回盘将使所涉及的中国网库用户有义务完成交易。除非在特殊情况下，诸如用户在您提出报盘后实质性地更改对物品的描述或澄清任何文字输入错误，或您未能证实交易所涉及的用户的身份等，报盘和承诺均不得撤回。</h5>
                        <h5>8.3 处理交易争议。</h5>
                        <p>
                        (i)中国网库不涉及用户间因交易而产生的法律关系及法律纠纷，不会且不能牵涉进交易各方的交易当中。倘若您与一名或一名以上用户，或与您通过中国网库网站获取其服务的第三者服务供应商发生争议，您免除中国网库 (及中国网库代理人和雇员) 在因该等争议而引起的，或在任何方面与该等争议有关的不同种类和性质的任何(实际和后果性的) 权利主张、要求和损害赔偿等方面的责任。
                        </p>
                        <p>
                        (ii)中国网库有权受理并调处您与其他用户因交易产生的争议，同时有权单方面独立判断其他用户对您的投诉及(或)索偿是否成立，若中国网库判断索偿成立，则您应及时使用自有资金进行偿付。中国网库没有使用自用资金进行偿付的义务，但若进行了该等支付，您应及时赔偿中国网库的全部损失，否则中国网库有权通过前述方式抵减相应资金或权益，如仍无法弥补中国网库损失，则中国网库保留继续追偿的权利。因中国网库非司法机构，您完全理解并承认，中国网库对证据的鉴别能力及对纠纷的处理能力有限，受理贸易争议完全是基于您之委托，不保证争议处理结果符合您的期望，亦不对争议处理结果承担任何责任。中国网库有权决定是否参与争议的调处。
                        </p>
                        <p>
                        (iii) 中国网库有权通过电子邮件等联系方式向您了解情况，并将所了解的情况通过电子邮件等方式通知对方，您有义务配合中国网库的工作，否则中国网库有权做出对您不利的处理结果。
                        </p>
                        <p>
                        (ⅳ)经生效法律文书确认用户存在违法或违反本协议行为或者中国网库自行判断用户涉嫌存在违法或违反本协议行为的，中国网库有权在中国网库平台上以网络发布形式公布用户的违法行为并做出处罚（包括但不限于限权、终止服务等）。
                        </p>
                        <h5>8.4 运用常识。 </h5>
                        <p>
                        中国网库不能亦不试图对其他用户通过"服务"提供的资料进行控制。就其本质而言，其他用户的资料，可能是令人反感的、有害的或不准确的，且在某些情况下可能带有错误的标识说明或以欺诈方式加上标识说明。中国网库希望您在使用中国网库网站时，小心谨慎并运用常识。
                        </p>
                        <h5>9.交易系统</h5>
                        <h5>9.1 不得操纵交易</h5>
                        <p>
                        您同意不利用帮助实现蒙蔽或欺骗意图的同伙(下属的客户或第三方)，操纵与另一交易方所进行的商业谈判的结果。
                        </p>
                        <h5>9.2 系统完整性</h5>
                        <p>您同意，您不得使用任何装置、软件或例行程序干预或试图干预中国网库平台的正常运作或正在中国网库网站上进行的任何交易。您不得采取对任何将不合理或不合比例的庞大负载加诸中国网库网络结构的行动。您不得向任何第三者披露您的密码，或与任何第三者共用您的密码，或为任何未经批准的目的使用您的密码。 </p>
                        <h5>9.3 反馈</h5>
                        <p>您不得采取任何可能损害信息反馈系统的完整性的行动，诸如：利用第二会员身份标识或第三者为您本身留下正面反馈；利用第二会员身份标识或第三者为其他用户留下负面反馈 (反馈数据轰炸)；或在用户未能履行交易范围以外的某些行动时，留下负面的反馈 (反馈恶意强加)。</p>
                        <h5>9.4 不作商业性利用</h5>
                        <p>您同意，您不得对任何资料作商业性利用，包括但不限于在未经中国网库授权高层管理人员事先书面批准的情况下，复制在中国网库网站上展示的任何资料并用于商业用途。</p>
                        <h5>10. 终止或访问限制。</h5>
                        <p>您同意，在中国网库未向您收费的情况下，中国网库可自行全权决定以任何理由 (包括但不限于中国网库认为您已违反本协议的字面意义和精神，或您以不符合本协议的字面意义和精神的方式行事) 终止您的"服务"密码、帐户 (或其任何部份) 或您对"服务"的使用，并删除和丢弃您在使用"服务"中提交的 "您的资料"。您同意，在中国网库向您收费的情况下，中国网库应基于合理的怀疑且经电子邮件通知的情况下实施上述终止服务的行为。中国网库同时可自行全权决定，在发出通知或不发出通知的情况下，随时停止提供"服务"或其任何部份。您同意，根据本协议的任何规定终止您使用"服务"之措施可在不发出事先通知的情况下实施，并承认和同意，中国网库可立即使您的帐户无效，或撤销您的帐户以及在您的帐户内的所有相关资料和档案，和/或禁止您进一步接入该等档案或"服务"。帐号终止后，中国网库没有义务为您保留原帐号中或与之相关的任何信息，或转发任何未曾阅读或发送的信息给您或第三方。此外，您同意，中国网库不会就终止您接入"服务"而对您或任何第三者承担任何责任。第12、13、14和22各条应在本协议终止后继续有效。</p>
                        <h5>11. 违反规则会有什么后果？ </h5>
                        <p>在不限制其他补救措施的前提下，发生下述任一情况，中国网库可立即发出警告，暂时中止、永久中止或终止您的会员资格，删除您的任何现有产品信息，以及您在网站上展示的任何其他资料：(i) 您违反本协议；(ii) 中国网库无法核实或鉴定您向中国网库提供的任何资料；或 (iii) 中国网库相信您的行为可能会使您、中国网库用户或通过中国网库或中国网库网站提供服务的第三者服务供应商发生任何法律责任。在不限制任何其他补救措施的前提下，倘若发现您从事涉及中国网库网站的诈骗活动，中国网库可暂停或终止您的帐户。</p>
                        <h5>12. 服务"按现状"提供</h5>
                        <p>中国网库会尽一切努力使您在使用中国网库网站的过程中得到乐趣。遗憾的是，中国网库不能随时预见到任何技术上的问题或其他困难。该等困难可能会导致数据损失或其他服务中断。为此，您明确理解和同意，您使用"服务"的风险由您自行承担。"服务"以"按现状"和"按可得到"的基础提供。中国网库明确声明不作出任何种类的所有明示或暗示的保证，包括但不限于关于适销性、适用于某一特定用途和无侵权行为等方面的保证。中国网库对下述内容不作保证：(i)"服务"会符合您的要求；(ii)"服务"不会中断，且适时、安全和不带任何错误；(iii) 通过使用"服务"而可能获取的结果将是准确或可信赖的；及 (iv) 您通过"服务"而购买或获取的任何产品、服务、资料或其他材料的质量将符合您的预期。通过使用"服务"而下载或以其他形式获取任何材料是由您自行全权决定进行的，且与此有关的风险由您自行承担，对于因您下载任何该等材料而发生的您的电脑系统的任何损毁或任何数据损失，您将自行承担责任。您从中国网库或通过或从"服务"获取的任何口头或书面意见或资料，均不产生未在本协议内明确载明的任何保证。</p>
                        <h5>13. 责任范围</h5>
                        <p>您明确理解和同意，中国网库不对因下述任一情况而发生的任何损害赔偿承担责任，包括但不限于利润、商誉、使用、数据等方面的损失或其他无形损失的损害赔偿 (无论中国网库是否已被告知该等损害赔偿的可能性)：(i) 使用或未能使用"服务"；(ii) 因通过或从"服务"购买或获取任何货物、样品、数据、资料或服务，或通过或从"服务"接收任何信息或缔结任何交易所产生的获取替代货物和服务的费用；(iii) 未经批准接入或更改您的传输资料或数据；(iv) 任何第三者对"服务"的声明或关于"服务"的行为；或 (v) 因任何原因而引起的与"服务"有关的任何其他事宜，包括疏忽。</p>
                        <h5>14. 赔偿</h5>
                        <p>您同意，因您违反本协议或经在此提及而纳入本协议的其他文件，或因您违反了法律或侵害了第三方的权利，而使第三方对中国网库平台及其子分公司、董事、职员、代理人提出索赔要求（包括司法费用和其他专业人士的费用），您必须赔偿给中国网库及其分公司、董事、职员、代理人，使其等免遭损失。</p>
                        <h5>15. 遵守法律 </h5>
                        <p>您应遵守与您使用"服务"，以及与您竞买、购买和销售任何物品以及提供商贸信息有关的所有相关的法律、法规、条例和规章。 </p>
                        <h5>16. 无代理关系</h5>
                        <p>您与中国网库仅为独立订约人关系。本协议无意结成或创设任何代理、合伙、合营、雇用与被雇用或特许权授予与被授予关系。</p>
                        <h5>17. 广告和金融服务。</h5>
                        <p>您与在"服务"上或通过"服务"物色的刊登广告人士通讯或进行业务往来或参与其推广活动，包括就相关货物或服务付款和交付相关货物或服务，以及与该等业务往来相关的任何其他条款、条件、保证或声明，仅限于在您和该刊登广告人士之间发生。您同意，对于因任何该等业务往来或因在"服务"上出现该等刊登广告人士而发生的任何种类的任何损失或损毁，中国网库无需负责或承担任何责任。您如打算通过"服务"创设或参与与任何公司、股票行情、投资或证券有关的任何服务，或通过"服务"收取或要求与任何公司、股票行情、投资或证券有关的任何新闻信息、警戒性信息或其他资料，敬请注意，中国网库不会就通过"服务"传送的任何该等资料的准确性、有用性或可用性、可获利性负责或承担任何责任，且不会对根据该等资料而作出的任何交易或投资决策负责或承担任何责任。</p>
                        <h5>18. 链接。 </h5>
                        <p>"服务"或第三者均可提供与其他万维网网站或资源的链接。由于中国网库并不控制该等网站和资源，您承认并同意，中国网库并不对该等外在网站或资源的可用性负责，且不认可该等网站或资源上或可从该等网站或资源获取的任何内容、宣传、产品、服务或其他材料，也不对其等负责或承担任何责任。您进一步承认和同意，对于任何因使用或信赖从此类网站或资源上获取的此类内容、宣传、产品、服务或其他材料而造成（或声称造成）的任何直接或间接损失，中国网库均不承担责任。
 </p>
                        <h5>19. 通知</h5>
                        <p>除非另有明确规定，任何通知应以电子邮件形式发送，(就中国网库而言) 电子邮件地址为 99114@99114.com，或 (就您而言) 发送到您在登记过程中向中国网库提供的电子邮件地址，或有关方指明的该等其他地址。在电子邮件发出二十四 (24) 小时后，通知应被视为已送达，除非发送人被告知相关电子邮件地址已作废。或者，中国网库可通过邮资预付挂号邮件并要求回执的方式，将通知发到您在登记过程中向中国网库提供的地址。在该情况下，在付邮当日三 (3) 天后通知被视为已送达。</p>
                        <h5>20. 不可抗力</h5>
                        <p>对于因中国网库合理控制范围以外的原因，包括但不限于自然灾害、罢工或骚乱、物质短缺或定量配给、暴动、战争行为、政府行为、通讯或其他设施故障或严重伤亡事故等，致使中国网库延迟或未能履约的，中国网库不对您承担任何责任。</p>
                        <h5>21. 转让</h5>
                        <p>中国网库转让本协议无需经您同意。</p>
                        <h5>22. 其他规定</h5>
                        <p>本协议取代您和中国网库先前就相同事项订立的任何书面或口头协议。本协议各方面应受中华人民共和国大陆地区法律的管辖。倘若本协议任何规定被裁定为无效或不可强制执行，该项规定应被撤销，而其余规定应予执行。条款标题仅为方便参阅而设，并不以任何方式界定、限制、解释或描述该条款的范围或限度。中国网库未就您或其他人士的某项违约行为采取行动，并不表明中国网库撤回就任何继后或类似的违约事件采取行动的权利。 </p>
                        <h5>23. 诉讼</h5>
                        <p>因本协议或中国网库服务所引起或与其有关的任何争议, 双方应协商解决，协商不成，各方均可向北京市仲裁委员会申请仲裁。</p>
                    </div>
             <input type="button" value="同意并继续" class="ty_btn" onclick="closeLayer('t4');"/>
      </div>
</div>



<div class="footer">
	<div class="ft_con">
    	<!-- <p>版权所有：<span id="copyrightSapn">中国农产品类交易网</span></p>
        <p>地址：<span id="addressSapn">北京市东城区胜古中路1号蓝宝大厦4层</span>  电话：<span id="telSpan">010-57496826</span></p>
        <p>传真：<span id="faxSpan">010-64451032</span>   邮箱：<span id="emailSpan">shiliyong@99114.com</span></p> -->
    </div>
</div>



<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?f160a8c6f9e75fcc0c45d38950c1b318";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<%--  <script type="text/javascript" src="${ctx }/register/js/jquery.js"></script> --%>
<%-- <script type="text/javascript" src="${ctx }/register/js/registerSitemMsg.js"></script>
<script type="text/javascript" src="${ctx }/register/js/register_common.js"></script>

<script type="text/javascript" src="${ctx }/register/js/DropMenu.js"></script> --%>
<!-- <script type="text/javascript" src="http://static.99114.com/static/js/common/area.js"></script> -->
</body>
</html>