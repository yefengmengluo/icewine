// JavaScript Document
//$(document).ready(function(){

	//修改默认验证规则  
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
	    range: jQuery.validator.format("请输入介于 {0} 和 {1} 之间的值"),  
	    max: jQuery.validator.format("请输入一个最大为 {0} 的值"),  
	    min: jQuery.validator.format("请输入一个最小为 {0} 的值")  
	}); 

	jQuery.validator.addMethod("ismobile", function(value, element) {  
	    var length = value.length;     
	    var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1}))+\d{8})$/;     
	    return (length == 11 && mobile.exec(value))? true:false;  
	}, "请正确填写您的手机号码");
	jQuery.validator.addMethod("istel", function(value, element) {  
	    var tel = /^0\d{2,3}-\d{7,8}$/;
	    return (value == "" || tel.exec(value))? true:false;  
	}, "请正确填写您的电话号码");
	jQuery.validator.addMethod("isfax", function(value, element) {  
	    var fax = /^0\d{2,3}-\d{7,8}$/;
	    return (value == "" || fax.exec(value))? true:false;  
	}, "请正确填写您的传真号码");

// validate signup form on keyup and submit
	$("#signupForm").validate({
		rules: {
			siName: {// 站点名称
				required: true,
				rangelength:[2,64]
			},
			siAlias:{// 别名
				required:true,
				maxlength:16
				
			},
			siUrl:{// url
				required:true,
				maxlength:64,
				url:true
			},
			siIcp:{// icp
				required:true,
				maxlength:32
			},
			siTel:{// 固话
				istel:true
			},
			siPostcode:{// 邮编
				number:true,
				maxlength:6
			},
			siMobile:{// 移动电话
				ismobile:true
			},
			siFax:{// 传真
				isfax:true
			},
			siEmail:{
				email: true
			},
			siLinkman:{// 联系人
				maxlength:8
			},
			siAddress:{// 详细地址
				maxlength:30
			},
			siAnalysisCode:{// 流量统计
				maxlength:500
			},
			siAreaCode:{// 地区code
				required:true,
				maxlength:16
			}
		},
		messages: {
			siName: {
				required:"请输入站点名称",
				rangelength:"站点名称长度要在2-64个字符之间"
			},
			siAlias:{
				required:"请输入站点别名",
				maxlength:"找点别名长度不能超过16个字符"
//				remote:"别名已经存在,请换一个试试"
			},
			siUrl:{// url
				required:"站点域名不能为空",
				maxlength:"站点域名长度不能超过64个字符",
				url:"请输入合法的url地址"
			},
			siIcp:{// icp
				required:"icp号码不能为空",
				maxlength:"icp号码长度不能超过32个字符"
			},
			siTel:{// 固话
				istel:"请正确填写您的电话号码"
			},
			siPostcode:{// 邮编
				number:"邮编只能是数字",
				maxlength:"邮编长度不能超过6个数字"
			},
			siMobile:{// 移动电话
				ismobile:"请正确填写您的手机号码"
			},
			siFax:{// 传真
				isfax:"请正确填写您的传真号码"
			},
			siEmail:{
				email: "请输入正确的email格式"
			},
			siLinkman:{// 联系人
				maxlength:"联系人长度不能超过8个字符"
			},
			siAddress:{// 详细地址
				maxlength:"详细地址长度不能超过30个字符"
			},
			siAnalysisCode:{// 流量统计
				maxlength:"流量统计长度不能超过500个字符"
			},
			siAreaCode:{// 地区code
				required:"请输入地区code",
				maxlength:"地区code长度不能超过16个字符"
			}
		}
	});

//});
