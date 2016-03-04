<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="zh-CN"
	xml:lang="zh-CN">
<head>
<title>找回密码</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx }/forgetpwd/css/paginate.css" />
<link rel=stylesheet type=text/css href="${ctx }/forgetpwd/css/base.css">
<link rel=stylesheet type=text/css href="${ctx }/forgetpwd/css/wbox.css">
<script type="text/javascript" src="${ctx }/forgetpwd/js/jquery.js"></script>
<script type="text/javascript" src="${ctx }/forgetpwd/js/jquery.paginate.js"></script>
<script type="text/javascript" src="${ctx }/forgetpwd/js/date.js"></script>
<script type="text/javascript" src="${ctx }/forgetpwd/js/ui.js"></script>
<script type="text/javascript" src="${ctx }/forgetpwd/js/jQuery.WKDialog.js"></script>
<link href="${ctx }/forgetpwd/css/style0426.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/forgetpwd/js/Validform_v5.3.2_min.js"></script>
<link href="${ctx }/forgetpwd/css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
     
      var S 
        $(document).ready(function () {
            $.ajaxSetup({
                cache: false,
                type: "POST",
                async: false
            });
            S = new sub();

        })
        var validEmail = false;
        var validMobile = false;
        /**
         * 初始化页面
         */
        function sub() {
            //验证邮箱验证码
            $("#email_code").blur(function () {
                $("#validate_code_message").addClass("Validform_checktip");
                var email = $("#userName").val();
                var code = $("#email_code").val();
                if (null != code && "" != code && undefined != code) {
                    $.post("/login/checkFindPwdCode", {
                        code: code,
                        email: email,
                        codeType: "email"
                    }, function (data) {
                        if (data == "true") {
                            validEmail = true;
                            $("#validate_code_message").removeClass("Validform_right");
                            $("#validate_code_message").removeClass("Validform_wrong");
                            $("#validate_code_message").addClass("Validform_right");
                            $("#validate_code_message").html("验证码正确!");
                        } else if(data == "invalid"){
                        	 validEmail = false;
                             $("#validate_code_message").removeClass("Validform_right");
                             $("#validate_code_message").removeClass("Validform_wrong");
                             $("#validate_code_message").addClass("Validform_wrong");
                             $("#validate_code_message").html("验证码无效，请重新获取验证码!");
                        } else {
                            validEmail = false;
                            $("#validate_code_message").removeClass("Validform_right");
                            $("#validate_code_message").removeClass("Validform_wrong");
                            $("#validate_code_message").addClass("Validform_wrong");
                            $("#validate_code_message").html("验证码错误!");
                        }
                    });
                } else if (null == code || "" == code || undefined == code) {
                    $("#validate_code_message").removeClass("Validform_right");
                    $("#validate_code_message").removeClass("Validform_wrong");
                    $("#validate_code_message").addClass("Validform_wrong");
                    $("#validate_code_message").html("请输入验证码!");
                    validEmail = false;
                }
            }); 
            //验证手机验证码
            $("#tel_validateCode").blur(function () {
                $("#validate_code_message_mobile").addClass("Validform_checktip");
                var email = $("#userName").val();
                var code = $("#tel_validateCode").val();
                if (null != code && "" != code && undefined != code) {
                    $.post("/login/checkFindPwdCode", {
                        code: code,
                        email: email,
                        codeType: "mobile"
                    }, function (data) {
                        if (data == "true") {
                            validMobile = true;
                            $("#validate_code_message_mobile").removeClass("Validform_right");
                            $("#validate_code_message_mobile").removeClass("Validform_wrong");
                            $("#validate_code_message_mobile").addClass("Validform_right");
                            $("#validate_code_message_mobile").html("验证码正确!");
                        } else if(data == "invalid"){
                       	 validEmail = false;
                         $("#validate_code_message_mobile").removeClass("Validform_right");
                         $("#validate_code_message_mobile").removeClass("Validform_wrong");
                         $("#validate_code_message_mobile").addClass("Validform_wrong");
                         $("#validate_code_message_mobile").html("验证码无效，请重新获取验证码!");
                       }  else {
                            validMobile = false;
                            $("#validate_code_message_mobile").removeClass("Validform_right");
                            $("#validate_code_message_mobile").removeClass("Validform_wrong");
                            $("#validate_code_message_mobile").addClass("Validform_wrong");
                            $("#validate_code_message_mobile").html("验证码错误!");
                        }
                    });
                } else if (null == code || "" == code || undefined == code) {
                    $("#validate_code_message_mobile").removeClass("Validform_right");
                    $("#validate_code_message_mobile").removeClass("Validform_wrong");
                    $("#validate_code_message_mobile").addClass("Validform_wrong");
                    $("#validate_code_message_mobile").html("请输入验证码!");
                    validMobile = false;
                }
            }); 

            /**
             * 验证用户名是否存在
             */
             function sucUserNameFun() {
                var imagesTag = "<img id='second_image' src='/static/images/mima2.png' width='1000' height='37' />";
                $("#image_div").html(imagesTag);
                var account = $("#userName").val();
                $.post("/login/checkMemberByAccount", {account: account}, function (data) {
                    if (null != data && data.length != 0) {
                        $("#input_userName_div").hide();
                        $("#select_passwordForm_div").show();
                        $("#tel_find_pwd").hide();
                        $("#no_userFormPas_div").hide();
                        $("#set_password_div").hide();
                        $("#update_passwordSuc_div").hide();
                        $("#account").html(data.account);
                        $("#accounts").html(data.account);
                        $("#accountname").html(data.account);
                        if (null != data.email) {
                            $("#email").html(data.email);
                            $("#email_dd").html(data.email);
                        } else {
                            $("#email").html("");
                        }
                        if (null != data.mobile) {
                            $("#telphone").html(data.mobile);
                            $("#telphone_dd").html(data.mobile);
                        } else {
                            $("#telphone").html("");
                        }
                        var email = $("#email").html();
                        var telphone = $("#telphone").html();
                        var memberId = data.accountRandom;
                        $("#memberId").val(memberId);
                        if (email == "" || null == email) {
                            $("#email_option").remove();
                            $("#email_div").hide();
                            if (telphone == "" || null == telphone) {
                                $("#tel_option").remove();
                                $("#tel_div").hide();
                                checkQuestion(account);
                            } else {
                                $("#email_div").hide();
                                $("#tel_div").show();
                                $("#questionPwd_div").hide();
                                checkQuestion(account);
                            }
                        } else {
                            if (telphone == "" || null == telphone) {
                                $("#tel_option").remove();
                                $("#tel_div").hide();
                                checkQuestion(account);
                            } else {
                                $("#email_option").attr("selected", true);
                                $("#email_div").show();
                                $("#tel_div").hide();
                                $("#questionPwd_div").hide();
                                checkQuestion(account);
                            }
                        }
                    } else {
                        alert("该账号不存在，请您注册！！！");
                    }
                });
            } 

            /**
             * 设置新密码
             */
            function sucUpdatePwdFun() {
                var account = $("#memberId").val();
                var password = $("#password").val();
                $.post("/login/updateFindPassword", {account: account, password: password}, function (data) {
                    if (data == true) {
                        var imagesTag = "<img id='four_image' src='/static/images/mima4.png' width='1000' height='37' />";
                        $("#image_div").html(imagesTag);
                        $("#input_userName_div").hide();
                        $("#tel_find_pwd").hide();
                        $("#no_userFormPas_div").hide();
                        $("#set_password_div").hide();
                        $("#update_passwordSuc_div").show();
                    } else {
                        $("#input_userName_div").hide();
                        $("#tel_find_pwd").hide();
                        $("#no_userFormPas_div").hide();
                        $("#set_password_div").show();
                        $("#update_passwordSuc_div").hide();
                        alert("密码修改失败！");
                    }
                });
            } 

            /**
             * 选择密保找回方式
             */
                //function findPwdForms(){
          $("#findPwdForm").on("change", function () {
                var pwdForm = $("#findPwdForm").val();
                if (pwdForm == 2) {
                    $("#email_div").hide();
                    $("#tel_div").show();
                    $("#questionPwd_div").hide();
                } else if (pwdForm == 1) {
                    $("#email_div").show();
                    $("#tel_div").hide();
                    $("#questionPwd_div").hide();
                } else {
                    $("#email_div").hide();
                    $("#tel_div").hide();
                    $("#questionPwd_div").show();
                }
            }); 

            /**
             * 登录
             */
             $("#login_btn").on("click", function () {
                var siteId = 10046;
                location.href = "/member/toMemberType?siteId=" + siteId;
            }); 
            /**
             * 异步查询有无设置密保问题
             */
           function checkQuestion(account) {

                $.post("/login/getResponseByMemberId", {account: account}, function (data) {
                    if (data != null && data.length != 0) {
                        createPwd(data);//动态创建密保问题
                        var selects = $("select option").length;
                        if (selects >= 2) {
                            $("#input_userName_div").hide();
                            $("#select_passwordForm_div").show();
                            $("#tel_find_pwd").hide();
                            $("#questionPwd_div").hide();
                            $("#no_userFormPas_div").hide();
                            $("#set_password_div").hide();
                            $("#update_passwordSuc_div").hide();
                        } else {
                            $("#input_userName_div").hide();
                            $("#select_passwordForm_div").show();
                            $("#tel_find_pwd").hide();
                            $("#questionPwd_div").show();
                            $("#no_userFormPas_div").hide();
                            $("#set_password_div").hide();
                            $("#update_passwordSuc_div").hide();
                        }
                    } else {
                        $("#pwd_option").remove();
                        var selectValue = $("select option").length;
                        if (selectValue <= 0) {
                            $("#no_userFormPas_div").show();
                            $("#select_passwordForm_div").hide();
                            $("#no_userFormPas_div").show();
                        } else {
                            $("#tel_find_pwd").hide();
                            $("#select_passwordForm_div").show();
                            $("#no_userFormPas_div").hide();
                            var selectValue = $("#select_append").val();
                            if (selectValue == 3) {
                                $("#questionPwd_div").show();
                            } else {
                                $("#questionPwd_div").hide();
                            }
                        }
                        $("#input_userName_div").hide();
                        $("#set_password_div").hide();
                        $("#update_passwordSuc_div").hide();

                    }
                });
            } 

            /**
             * 创建密保问题节点
             */
          function createPwd(data) {
                var account = $("#accountname").html();
                var createQuestion = "";
                var num = 0;
                for (var i = 0; i < data.length; i++) {
                    num = i + 1;
                    $.each(data[i].questions, function (i, item) {
                        createQuestion += "<dl class='nomar'><dt>密保问题" + num + "：</dt><dd>" + item.questionName + "</dd></dl>";
                        createQuestion += "<dl><dt>我的回答：</dt><dd id='dd_" + num + "'><input type='text' id='responseValue_" + num + "' name='responseValue_" + num + "' datatype='*'ajaxurl='/login/checkResponseValueByAccount?account=" + account + "' nullmsg='请输入密保答案！'  errormsg='您输入的答案不正确，请确认！' class='input input01' /><span class='Validform_checktip' id='response_form_" + num + "'></span></dd></dl>";
                    });
                }
                createQuestion += "<dl><dt>&nbsp;</dt><dd><input type='submit' class='btn01' value='下一步' id='question_btn'/></dd></dl>";
                $("#questionPwd_div").html(createQuestion);
            } 

            /**
             * 邮箱验证
             */
         function setPwdEmailFun() {
                var imagesTag = "<img id='second_image' src='/static/images/mima3.png' width='1000' height='37' />";
                $("#image_div").html(imagesTag);
                $("#input_userName_div").hide();
                $("#select_passwordForm_div").hide();
                $("#no_userFormPas_div").hide();
                $("#set_password_div").show();
                $("#update_passwordSuc_div").hide();
                $("#email_div").hide();
                $("#tel_div").hide();
            } 

            /**
             * 手机验证
             */
          function setPwdTelFun() {
                var imagesTag = "<img id='second_image' src='/static/images/mima3.png' width='1000' height='37' />";
                $("#image_div").html(imagesTag);
                $("#input_userName_div").hide();
                $("#select_passwordForm_div").hide();
                $("#tel_find_pwd").hide();
                $("#questionPwd_div").hide();
                $("#no_userFormPas_div").hide();
                $("#set_password_div").show();
                $("#update_passwordSuc_div").hide();
            } 

            /**
             * desc:换一张
             */
          $("#codeImage").on("click", function () {
                var timenow = new Date().getTime();
                document.getElementById("rcodeimage").src = "/login/getImage?dateout=" + timenow;
                $("#verificationCode").val("");
                $("#verificationCode").parent().find("span").removeClass("Validform_right").removeClass("Validform_wrong").html("");
            });

            /**
             * desc:倒计时
             */
            var wait = 60, t;

            function times() {
                //判断是否过了60秒
                if (wait == 0) {
                    $("#append_message").hide();
                    wait = 60;
                } else {
                    $("#append_message").show();
                    $("#append_message").html("已向您的邮箱发送了验证码邮件，请查收。或等待<u>" + wait + "</u>秒后再次点击获取");
                    wait--;
                    setTimeout(function () {
                        times()
                    }, 1000)
                }
            } 

            /**
             * desc:倒计时
             */
            var waits = 60, t;

            function mobileTimes() {
                //判断是否过了60秒
                if (waits == 0) {
                    $("#idSpan").hide();
                    waits = 60;
                } else {
                    $("#idSpan").show();
                    $("#idSpan").html("已向您的手机发送了验证码短信，请查收。或等待<u>" + waits + "</u>秒后再次点击获取");
                    waits--;
                    setTimeout(function () {
                        mobileTimes()
                    }, 1000)
                }
            }
 
            /**
             * 获取验证码
             */
           $("#getMobile_Validate").on("click", function () {
                var account = $("#userName").val();
                if (waits != 60) {
                    return;
                }
                if (null != account && "" != account && undefined != account) {
                    $.post("/login/sendPwdMobile", {account: account}, function (data) {
                        if ("-1" == data) {
                            $("#isContinueSendMobile").show();
                            $("#isContinueSendMobile").addClass("Validform_wrong");
                            $("#isContinueSendMobile").html("每个手机每天只能获取三次短信!");
                        } else {
                            mobileTimes();
                            $("#isContinueSendMobile").hide();
                        }
                    });
                }
            }); 

            /**
             * 邮箱获取验证码
             */
           $("#getEmail_Validate").on("click", function () {
                if (wait != 60) {
                    return;
                }
                var account = $("#userName").val();
                if (null != account && "" != account && undefined != account) {
                    $.post("/login/sendPwdEmail", {account: account}, function (data) {
                        if ("-1" == data) {
                            $("#isContinueSend").show();
                            $("#isContinueSend").addClass("Validform_wrong");
                            $("#isContinueSend").html("每个邮箱每天只能获取三次邮件验证码!");
                        } else {
                            times();
                            $("#isContinueSend").hide();
                        }
                    });

                }
            });

            function update_suc_fun() {
                var imagesTag = "<img id='second_image' src='/static/images/mima3.png' width='1000' height='37' />";
                $("#image_div").html(imagesTag);
                $("#input_userName_div").hide();
                $("#select_passwordForm_div").hide();
                $("#tel_find_pwd").hide();
                $("#questionPwd_div").hide();
                $("#no_userFormPas_div").hide();
                $("#set_password_div").show();
                $("#update_passwordSuc_div").hide();
            } 


            //验证通过之后 后台缓存状态
            function setKeyCache() {
                $.post("/login/setKeyCache", {keyId: $("#memberId").val()}, function (data) {

                });
            }

            $("#emailValidateCode").Validform({
                btnSubmit: "#email_tel_validate",
                tiptype: 3,
                showAllError: false,
                ajaxPost: true,
                datatype: {},
                beforeSubmit: function (curform) {
                    if (validEmail == false) {
                        var email_code = $("#email_code").val();
                        if (null == email_code || "" == email_code || undefined == email_code) {
                            $("#email_code").focus();
                            $("#validate_code_message").removeClass("Validform_right");
                            $("#validate_code_message").removeClass("Validform_wrong");
                            $("#validate_code_message").addClass("Validform_wrong");
                            $("#validate_code_message").html("请输入验证码!");
                            return false;
                        }
                        return false;
                    }
                    setKeyCache();//加入缓存验证
                    setPwdEmailFun();
                    return false;
                }
            });

            $("#mobileValidateCode").Validform({
                btnSubmit: "#mobile_tel_validate",
                tiptype: 3,
                showAllError: false,
                ajaxPost: true,
                datatype: {},
                beforeSubmit: function (curform) {
                    if (validMobile == false) {
                        var tels_validate = $("#tel_validateCode").val();
                        if (null == tels_validate || "" == tels_validate || undefined == tels_validate) {
                            $("#tel_validateCode").focus();
                            $("#validate_code_message_mobile").removeClass("Validform_right");
                            $("#validate_code_message_mobile").removeClass("Validform_wrong");
                            $("#validate_code_message_mobile").addClass("Validform_wrong");
                            $("#validate_code_message_mobile").html("请输入验证码!");
                            return false;
                        }
                        return false;
                    }
                    setKeyCache();//加入缓存验证
                    setPwdTelFun();
                    return false;
                }
            });

             $("#set_pwd_form").Validform({
                btnSubmit: "#set_password_btn",
                tiptype: 3,
                showAllError: false,
                ajaxPost: true,
                datatype: {},
                beforeSubmit: function (curform) {
                    var account = $("#userName").val();
                    sucUpdatePwdFun(account);
                    return false;
                }
            }); 

            //$("#account_form").Hidemsg();
           $("#account_form").Validform({
                btnSubmit: "#btn_account",
                tiptype: 3,
                showAllError: false,
                ajaxPost: true,
                datatype: {},
                beforeSubmit: function (curform) {
                    sucUserNameFun();
                    return false;
                }
            }); 

            //$("#question_form").Hidemsg();
            $("#question_form").Validform({
                btnSubmit: "#question_btn",
                tiptype: 3,
                showAllError: false,
                ajaxPost: true,
                datatype: {},
                beforeSubmit: function (curform) {
                    setKeyCache();//加入缓存验证
                    update_suc_fun();
                    return false;
                }
            }); 


           var imagesTag = "<img id='first_image' src='${ctx}/media/Images/forgetpwd/mima1.png' width='1000' height='37' />";
            $("#image_div").html(imagesTag);
            $("#input_userName_div").show();
            $("#select_passwordForm_div").hide();
            $("#tel_find_pwd").hide();
            $("#no_userFormPas_div").hide();
            $("#set_password_div").hide();
            $("#update_passwordSuc_div").hide();

        }  
    
    </script>
</head>
<body
	style="background:url(${ctx}/media/Images/forgetpwd/mainbg.gif) repeat;">

   
   
	<!-- <iframe src="/common/header_findpwd_iframe.jsp?siteId=10046" scrolling="no"
        style="width:100%;height:103px;height:107px\9; +height:103px; _height:103px; border:none; background:none;"
        frameborder="0" framewidth="0" allowTransparency="true"></iframe>
 -->
    <input type="hidden" value="" id="ctx" />
	<div class="mima" id="image_div"></div>
	<form action="" id="account_form">
		<div class="password clearfix" id="input_userName_div">
			<h5>请输入您需要找回登录密码的账户名</h5>

			<div class="mid" style="width: 640px">
				<dl>
					<dt>用户名：</dt>
					<dd>
						<input type="text" class="input input02" id="userName"
							datatype="*" nullmsg="请输入用户名！" name="userName" />
					</dd>
					<!-- ajaxurl="/login/checkUnAccount" -->

				</dl>
				<dl class="verify">
					<dt>验证码：</dt>
					<dd>
						<input type="text" id="verificationCode" name="verificationCode"
							class="input input02" datatype="*" nullmsg="请输入验证码！" />
					</dd>
					<!--  ajaxurl="/login/checkAccountCode" -->
					<dd>
						<a href="javascript:void(0);" id="codeImage"> <img
							id="rcodeimage" width="86" height="28" />看不清，换一张
						</a>
					</dd>
					<!--  src="/login/getImage"  -->

				</dl>
				<dl>
					<dt>&nbsp;</dt>
					<dd>
						<input type="button" class="btn01" value="下一步" id="btn_account" />
					</dd>
				</dl>
			</div>
		</div>
	</form>

	<!-- <div class="password clearfix" id="select_passwordForm_div" style="display:none;">
    <h5>您正在为账户 <i id="account"></i> 重置登录密码，请选择找回方式：</h5>

    <div class="mid">
        <dl class="reset">
            <dt>选择密码找回方式：</dt>
            <dd id="select_append">
                <select id="findPwdForm">
                    <option value="1" id="email_option">邮箱找回</option>
                    <option value="2" id="tel_option">手机找回</option>
                    <option value="3" id="pwd_option">密保问答</option>
                </select>
            </dd>
        </dl>
        <form action="" id="emailValidateCode">
            <div id="email_div">
                <dl class="nomar">
                    <dt>您的邮箱：</dt>
                    <dd id="email_dd"></dd>
                </dl>
                <span id="email" style="display:none;"></span>
                <dl class="reset">
                    <dt>&nbsp;</dt>
                    <dd><input type="button"
                               style="border:1px solid #ccc; padding:2px 6px; cursor:pointer; background-color:#eee;"
                               class='m2' id="getEmail_Validate" value="免费获取验证码"/>
                        <span id="isContinueSend" style="display:none;"></span></dd>
                </dl>
                <span id="append_message" style="display:none;"></span>
                <dl>
                    <dt>验证码：</dt>
                    <dd><input type="text" class="input input01" id="email_code" name="email_code"/>
                        <span id="validate_code_message"></span></dd>
                </dl>
                <dl>
                    <dt>&nbsp;</dt>
                    <dd>
                        <input type="button" class="btn01" value="下一步" id="btn_email" onclick="setPwdEmailFun()"/>
                        <input type="submit" class="btn01" id="email_tel_validate" value="下一步"/>
                        <input type="hidden" name="memberId" id="memberId"/></dd>
                </dl>
            </div>
        </form>
        <form action="" id="mobileValidateCode">
            <div id="tel_div">
                <dl class="nomar">
                    <dt>您的手机：</dt>
                    <dd id="telphone_dd"></dd>
                </dl>
                <span id="telphone" style="display:none;"></span>
                <dl class="reset">
                    <dt>&nbsp;</dt>
                    <dd><input type="button"
                               style="border:1px solid #ccc; padding:2px 6px; cursor:pointer; background-color:#eee;"
                               class='m2' id="getMobile_Validate" value="免费获取验证码"/>
                        <span id="isContinueSendMobile" style="display:none;"></span></dd>
                </dl>
                <span id="idSpan" style="display:none;"></span>
                <dl>
                    <dt>验证码：</dt>
                    <dd><input type="text" class="input input01" id="tel_validateCode" name="tel_validateCode"/>
                        <span id="validate_code_message_mobile"></span></dd>
                </dl>
                <dl>
                    <dt>&nbsp;</dt>
                    <dd> <input type="button" class="btn01" value="下一步" id="btn_tel" onclick=""/>
                        <input type="submit" class="btn01" id="mobile_tel_validate" value="下一步"/></dd>
                </dl>
            </div>
        </form>

        <form id='question_form'>
            <div id="questionPwd_div"></div>
        </form>
    </div>
</div>

<div class="password clearfix" id="no_userFormPas_div" style="display:none;">
    <h5 class="bg">您正在为账户 <i id="account"></i> 重置登录密码，请选择找回方式：</h5>

    <div class="mid">
        <table width="310" border="0">
            <tr>
                <td valign="middle"><img src="/static/images/I.gif" width="100" height="102"/></td>
                <td valign="middle">您没有可用的密码找回<br/>方式请联系客服找回密码！</td>
            </tr>
        </table>
    </div>
</div>


<div class="password clearfix" id="set_password_div" style="display:none;">
    <h5>您正在为账户 <i id="accounts"></i> 重置登录密码，请设置新密码：</h5>

    <form action="" id="set_pwd_form">
        <div class="mid mid_big">
            <dl>
                <dt>用户名：</dt>
                <dd class="yellow" id="accountname"></dd>
            </dl>
            <dl>
                <dt>输入新密码：</dt>
                <dd id="dd_pwd"><input type="password" id="password" name="password" class="input input02"
                                       datatype="*6-15" errormsg="密码范围在6~15位之间！"/></dd>
            </dl>
            <dl>
                <dt>确认新密码：</dt>
                <dd id="dd_comfirm"><input type="password" name="passwordConfirm" id="passwordConfirm"
                                           class="input input02" datatype="*" recheck="password"
                                           errormsg="您两次输入的账号密码不一致！"/><em id="em_comfirm"></em></dd>
            </dl>
            <dl>
                <dt>&nbsp;</dt>
                <dd><input type="button" class="btn01" id="set_password_btn" value="下一步"/></dd>
            </dl>
        </div>
</div>
</form>
<div class="password clearfix" id="update_passwordSuc_div" style="display:none;">
    <h5 class="bg">您已成功为账户 <i id="account"></i> 重置登录密码</h5>

    <div class="mid">
        <table width="350" border="0">
            <tr>
                <td valign="middle" align="left" width="69"><img src="/static/images/right_green.gif" width="59"
                                                                 height="57"/></td>
                <td valign="middle">恭喜您，您的新密码已设置成功。<br/>可通过新密码登录网站，请牢记并妥善保管。</td>
            </tr>
            <tr>
                <td valign="middle"></td>
                <td valign="middle"><input type="button" class="btn01" value="登 录" id="login_btn"/>&nbsp;&nbsp;
                    <a href="javascript:void(0)">查看帮助</a></td>
            </tr>
        </table>
    </div>
</div>

<iframe src="/common/bottom_iframe.jsp?siteId=10046" scrolling="no"
        style="width:100%;height:auto; border:none; background:none;" frameborder="0" framewidth="0"
        allowTransparency="true"></iframe>

 -->
	<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?f160a8c6f9e75fcc0c45d38950c1b318";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>





</body>
</html>
