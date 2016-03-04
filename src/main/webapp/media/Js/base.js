// JavaScript Document
//选项卡切换
function tabs(tabtit,tabcnt){
	var tabtit="."+tabtit,
	      tabcnt="."+tabcnt;
	var $tabtit=$(tabtit),
	      $tabcnt=$(tabcnt);
    $tabtit.each(function(index){
        $(this).on('click',function(){
            var tindex=index;			
            $(this).addClass('on').siblings().removeClass('on');
            $tabcnt.eq(tindex).show().siblings(tabcnt).hide();
            /*if(more){more.eq(tindex).show().siblings('.more').hide();}*/
        })
    }); 
}
/*文字滚动 end*/
$(function(){
	// 弹出框—修改价格
	$(".price_icon").live({mouseenter:function(){
			$(this).find("font").show();
		},mouseleave:function(){
			$(this).find("font").hide();
		}
	});
	//点击头部登录
	$("#t_login").click(function(){
		$(".login_q").hide();
		$(".login_h").show();
	});
	//head滑过出现下拉框
	$(".topMuneList").hover(function(){
		$(this).addClass("snMenuHover")
		$(this).children(".show2").show()
	},function(){
		$(this).removeClass("snMenuHover")
		$(this).children(".show2").hide()
	});	
	//我的采购清单加减
	$(".btn_jian").click(function(){var i = parseInt($(this).next(".text_input").val());
        var min = parseInt($(this).next(".text_input").attr("min"));
        if (i > min){i--;
            $(this).next(".text_input").val(i);
        }
    });
    $(".btn_jia").click(function(){var i = parseInt($(this).prev(".text_input").val());
        var max = parseInt($(this).prev(".text_input").attr("max"));
        if (i < max){i++;
            $(this).prev(".text_input").val(i);
        }
    });
	//我的采购清单加减里的删除
	$(".end").click(function(){
		$(this).parent(".shoppingListCon").remove();
	});
	
	//搜索弹出层
	$(".search-select").hover(
		function(){
			$(this).addClass("search-select-active");
			$(this).find(".search-options").show();
		},function(){
			$(this).removeClass("search-select-active");
			$(this).find(".search-options").hide();
		}
	)
	$(".search-options li a").click(function(){
		$(".search-select h5 span").text($(this).text());	
		$(".search-options").hide();
	}); 	
	//收藏部分移动上去图片边框变色
	$(".sc_img").hover(function(){
			$(this).addClass("yelow_line");
		},function(){
			$(this).removeClass("yelow_line");
	});
		
	//卖家中心会员头像鼠标移上去设置的效果变化
	$("#set_tx").hover(function(){
		$(this).removeClass("set_off");
		$(this).addClass("set_on");
		},function(){
			$(this).addClass("set_off");
			$(this).removeClass("set_on");
	});		
	$(".set_off").click(function(){
		 $(this).next("").hide().end().siblings(".hy_infor_cont2").show().end();
		 $(this).hide();
	});
			
	//行业信息鼠标移上去设置的效果变化
	$("#set_hy_infor").hover(function(){
		$(this).removeClass("set_off");
		$(this).addClass("set_on");
		},function(){
			$(this).addClass("set_off");
			$(this).removeClass("set_on");
	});
		
	$("#set_hy_infor").click(function(){
		 $(this).parents().find(".hy_infor_cont").hide().end().parents().find(".hy_infor_cont2").show().end();
		 $(this).hide();
	});
		
	$("input[vl=btn_bc]").click(function(){
		$(this).parents(".hy_infor_cont2").hide().siblings(".hy_infor_cont").show().parent().parent().find(".set_off").show();
	});
	
	//低价商机推荐鼠标移上去设置的效果变化
	$("#set_low_tj").hover(function(){
		$(this).removeClass("set_off");
		$(this).addClass("set_on");
		},function(){
			$(this).addClass("set_off");
			$(this).removeClass("set_on");
	});
	
	$("#set_low_tj").click(function(){
		$(this).parents().find(".low_price_cont").hide().end().parents().find(".low_price_cont2").show().end();
		$(this).hide();
	});
		
	$("input[vl=btn_low_price]").click(function(){
		$(this).parents(".low_price_cont2").hide().siblings(".low_price_cont").show().parent().parent().find(".set_off").show();
	});
		
	//采购信息匹配鼠标移上去设置的效果变化
	$("#purchase").hover(function(){
		$(this).removeClass("set_off");
		$(this).addClass("set_on");
		},function(){
			$(this).addClass("set_off");
			$(this).removeClass("set_on");
	});
		
	$("#purchase").click(function(){
		 $(this).parents().find(".purchase_cont").hide().end().parents().find(".purchase_cont2").show().end();
		 $(this).hide();
	});
		
	$("input[vl=btn_purchase]").click(function(){
		$(this).parents(".purchase_cont2").hide().siblings(".purchase_cont").show().parent().parent().find(".set_off").show();
	});

	//全站滑动页面显示和隐藏产品搜索 2014.9.25 zyh
	$(window).scroll(function(){var s_top = $(window).scrollTop(); //获取滚动到距顶部的距离
		if(s_top>52){
		  $(".top-search").hide();
		  $(".display-table").hide();
		  $(".containerBox").css("margin-top","118px");
		  $(".header").css("margin-top",0);
		}
		else{
		  $(".top-search").show();
		  $(".display-table").show();
		  $(".containerBox").css("margin-top","158px");
		  $(".header").css("margin-top","10px");
		}
	  });
	//duhong 10.22号整合	  
	//头部
	$('.top-1-L .user').click(function(){
		$(this).toggleClass('z-hov');
	});
	$('.top-1-L .user').mouseleave(function(){
		$(this).removeClass('z-hov');
	})
	//微博显示
	$("#weib").hover(function(){
			$("#weib_k").show();
		},function(){
			$("#weib_k").hide();
	});
	$("#weix").hover(function(){
			$("#weix_k").show();
		},function(){
			$("#weix_k").hide();
	});
	
	//库币-消息   2014-10-21
	/*$(".k-obtain").one("click",function(){
		$(this).hide().next("div").show();
		$(".k-coin-value h4 span").animate({bottom: 18,
		opacity:0}, 1200);
	});*/
  //关闭浮动层
    $(".popbj").width($(document).width())
	$(".popbj").height($(document).height())
	$(".clear_btn").click(function(){
		$(".popcon").hide();
		$(".popbj").hide();
	 });
  //左侧腾计划展示
   $(".dltjh_off").click(function(){
	   $(this).hide();
	   $(".dltjh_on").show();
	   $(".jhmzs").show();
	   });
	$(".dltjh_on").mouseover(function(){
	   $(".teng_close").show();
	   })
	   $(".dltjh_on").mouseout(function(){
	   $(".teng_close").hide();
	   });
   $(".teng_close").click(function(){
	   $(".dltjh_on").hide();
	   $(".dltjh_off").show();
	   $(".jhmzs").hide();
	   });	
	$(".teng_tanc").click(function(){
		$(".jhmzs").show();
		});
	$(".jhmzs .closex").click(function(){
		$(".jhmzs").hide();
		$(".dltjh_on").show();
		$(".dltjh_off").hide();
		});
	/*2015.4.14注释*/
	/*$(".btn_sjm").click(function(){
		$(".jhmzs_success").show();
		$(".jhmzs").hide();
		});*/
	$(".jhmzs_success .closex").click(function(){
		$(".jhmzs_success").hide();
		$(".dltjh_off").hide();
		$(".dltjh_on").hide();
		/*location.reload();*/
		});
/*-------------会员信息 开始-------------------*/
	//会员信息 左侧菜单　点击不可展开收起2014-10-16
	$(".members-tree .m-a").click(function(){
		$(this).addClass("curt").siblings().removeClass("curt");
		$(this).parent().siblings().children(".m-a").removeClass("curt");
		$(this).parent().prev().addClass("curr").siblings().removeClass("curr");
	})
	//销售中心 左侧菜单－点击展开/收起 11.5
	$(".tree-f").live("click",function(){
		$(this).toggleClass("currS").next().toggleClass("disBl_t");
		$(this).find("span").toggleClass("arrow_t");
	 })
	$(".tree .m-a").click(function(){
		$(this).addClass("curt").siblings().removeClass("curt");
		$(this).parent().siblings().children(".m-a").removeClass("curt");
	})
	//会员信息 我的发贴　我的收藏　　点击展开显示
	$('.click-show').nextAll().hide();
	$(".click-show").click(function(){
		$(this).hide().nextAll().show();
		$(".m-report").hide();
		$(".m-reply").hide();	
	});
	//会员信息 我的发贴　我的收藏  评论我的　回复 举报
	$(".m-replya").click(function(){
		$(".m-replya").removeClass("on");
		$(".m-reporta").removeClass("on");
		$(this).addClass("on").siblings().removeClass("on");
		
		$(".m-reply").hide();
		$(".m-report").hide();
		$(this).parent().siblings(".m-reply").show();
		$(this).parent().siblings(".m-report").hide();
	});
	
	$(".m-reporta").click(function(){	
		$(".m-replya").removeClass("on");
		$(".m-reporta").removeClass("on");
		$(this).addClass("on").siblings().removeClass("on");	
		$(".m-report").hide();
		$(".m-reply").hide();		
		$(this).parent().siblings(".m-reply").hide();
		$(this).parent().siblings(".m-report").show();
	});
/*-------------会员信息 结束-------------------*/
/*-------------采购中心 我的交易 开始-------------------*/
	//$(".ddd tr td").last().addClass("mtd");
	$(".buylist-cont").find("tr:last").children("td").addClass("mtr");
	$(".buylist-cont tr").find("td:last").addClass("mtd");
	
	$(".buylist-cont").hover(function(){
		$(this).parent(".buylist-cont-wrap").addClass("curr");
	},function(){
		$(this).parent(".buylist-cont-wrap").removeClass("curr");
	});
	//点击添加ＣＬＡＳＳ
/*	$(".buylist-cont-wrap").click(function(){
		$(this).toggleClass("on").siblings().removeClass("on");	
	})*/
	$(".goods-detailed").find("li:last").addClass("no-b-border");
	
	
	//货品列表　标题做成悬浮效果　
	$(window).scroll(function(){var s_top = $(window).scrollTop(); //获取滚动到距顶部的距离
		var topHeight=$(".g_top_box").height();
		if(s_top>topHeight){
		  $("#tably-buybiaoti").css("position","fixed");
		  $("#tably-buybiaoti").find(".table-buylist").css("margin","0");
		}
		else{
		  $("#tably-buybiaoti").css("position","static");
		   $("#tably-buybiaoti").find(".table-buylist").css("margin","10px 0 11px 0");
		}
	  });
	/*已买到的货品——滑过小图出现大图*/
	$(".img_hover").hover(function(){
		$(this).addClass("z-d").parent().addClass("z-d");
		$(this).find(".img_max").show();
	},function(){
		$(this).removeClass("z-d").parent().removeClass("z-d");
		$(this).find(".img_max").hide();
	});
	$(".mb-1").find("tr:last").children("td").addClass("mtr");
	//订单详情、物流信息、退款信息　页签切换　结束
	/*销售中心　特流信息*/
	$(".logisticsxx").on({ 
		mouseenter: function(e) {    
		/*	var e=e || window.event;
			var y=e.clientY;
			var windowH=$(window).height();
			var ulH=$(".logisticsbox").height()+20;
			if(windowH-y<ulH){
					$(".logisticsbox").css({"top":"auto","bottom":"27px"})
				}else{
					$(".logisticsbox").css({"top":"29px","bottom":"auto"})
				}*/
			$(this).children(".logisticsbox").show().parent().siblings().children(".logisticsbox").hide();
		}, 
		mouseleave: function() { 
			$(this).children(".logisticsbox").hide().parent().siblings().children(".logisticsbox").hide();
		}
	});
	//鼠标放图片上显示删除　采购商申请退款
	$(".sc_a li").on({ 
	    mouseenter: function() {    
	      //$(this).find(".cz-btn").show();
	      $(this).find(".cz-btn").animate({bottom:"0"},200);
	    }, 
	    mouseleave: function() { 
		//$(this).find(".cz-btn").hide();	
		$(this).find(".cz-btn").animate({bottom:"-50px"},200);
	    }
	});
	/*2.退款退货管理 时间排序*/
	/*$(".timepx").click(function(){
		$(this).toggleClass('downpx');
	})
	*/
});
/*-------------评份 星星打分-------------------*/
$(function(){
	$(".revinp i[cjmark]").on('mouseover',function(){
		var preNum = 0;
		//var sum=0
		//前面的置为实心，后面的置为空心
		$(this).prevAll().andSelf().each(function(i){
			preNum++;
			//sum=sum+0.5;
			$(this).attr('class','level_entity_left');
			/*if(i%2==0){ //左半部分
				$(this).attr('class','level_entity_left');
			}else{
				$(this).attr('class','level_entity_right');
			}*/
		}); 
		$(this).nextAll().each(function(i){
			$(this).attr('class','level_hollow_left');
			/*if((i+preNum)%2==0){ //左半部分
				$(this).attr('class','level_hollow_left');
			}else{
				$(this).attr('class','level_hollow_right');
			}*/
		});
		$(this).parent().next(".revgrade").text(preNum);
	});
	//初始化静态星星控件
	$("div[showStart]").each(function(i){
		var startScore = $(this).find(".startScore").text();
		//startScore=startScore*2;
		var str = '';
		//左半部分
		for (var i = 0; i < startScore; i++){
			str += '<i class="level_entity_left" cjmark=""></i>';
			/*if(i%2==0){ 
				str += '<i class="level_entity_left" cjmark=""></i>';
			}else{
				str += '<i class="level_entity_right" cjmark=""></i>';
			}*/
		}
		//右半部分
		for (var j = startScore; j < 5; j++){
			str += '<i class="level_hollow_left" cjmark=""></i>';
			/*if(j%2==0){ 
				str += '<i class="level_hollow_left" cjmark=""></i>';
			}else{
				str += '<i class="level_hollow_right" cjmark=""></i>';
			}*/
		}
		$(this).find(".showStartScore").append(str);
	});
});	

/*-------------采购中心 我的交易 结束-------------------*/
//tab 切换　采购中心首页　个人　企业   2014-10-21
$(document).ready(function(){
	//$(".tag_cg").switchTab({titCell: "dt a",defaultIndex: 0});
	//$(".tag_tj").switchTab({titCell: "dt a",defaultIndex: 0});
	
	$(".cjhd a").each(function(i) {	
		$(this).click(function(){
			$(this).addClass("on").siblings().removeClass("on");
			$(".cjbd").eq(i).show().siblings(".cjbd").hide();
		});
	});
	$(".tjhd a").each(function(i) {	
		$(this).click(function(){
			$(this).addClass("on").siblings().removeClass("on");
			$(".tjbd").eq(i).show().siblings(".tjbd").hide();
		});
	});
});	
//input\textarea获得焦点时提示消失
$(document).ready(function(){
	function myVal(inputClassName){
		var inputName="."+inputClassName; 
		$(inputName).css("color","#aaa"); 
		$(inputName).focus(function(event) {
			$a1val = $(this).val();
			if ($a1val == this.defaultValue) {
				$(this).val("");
				$(this).css("color","#3c3c3c");
			} else {
				$(this).val($a1val);
				//$(this).css("color","#aaa");
			}
		});
		$(inputName).blur(function() {
			$a1val = $(this).val();
			if ($a1val != "") {
				$(this).val($a1val);
				//$(this).css("color","#3c3c3c");
			} else {
				$(this).val(this.defaultValue);
				$(this).css("color","#aaa");
			}
		})
	};
	myVal("inptText");
});	

/*-------------发布产品-------------------*/
$(function(){
	$(".cs-table").find("td").removeClass("z-d");
	$(".cs-table").find("td").children("div").removeClass("z-d");
	$(".updown").hide();
	$(".more_attribute").click(function(){
		var j_updown=$(this).prev(".updown");
		if(j_updown.is(":visible")){
			$(j_updown).hide();
			$(this).html("<a href='javascript:;'>显示更多属性<span></span></a>");//text("显示<b>精品</b>品牌");
		}else{
			$(j_updown).show();
			$(this).html("<a href='javascript:;'>隐藏属性<span class='up'></span></a>");//text("显示<b>精品</b>品牌");
		}		
		return false;
	});
	// 发布产品 提示信息
	/*	$(".price_icon").hover(function(){
			$(this).find("font").show();
			},function(){
			$(this).find("font").hide();
		});
	*/
	$(".category li").live("click",function(){
		$(this).addClass("curr").siblings().removeClass("curr");
	});
	//优化 shx 0724
	$(".yhBtn").click(function(){
		$("#secondpane").show();
		$("#firstpane").hide();
	});
	$(".gbBtn").click(function(){
		$("#secondpane").hide();
		$("#firstpane").show();
	});

	/*$("#secondpane .menu_body:eq(0)").show();
		$("#secondpane p.menu_head").click(function(){
			$(this).toggleClass("conFd").next("div.menu_body").slideToggle(500).siblings("div.menu_body").slideUp("slow");
			$(this).siblings().removeClass("conFd");
	});*/
	$("#secondpane p.menu_head").click(function(){
		var temp=$(this).next("div.menu_body").children("p");
		//alert(temp.html())
		if(temp.html()!=""){
			$(this).toggleClass("conFd").next("div.menu_body").slideToggle(500).siblings("div.menu_body").slideUp("slow");
			$(this).siblings().removeClass("conFd");
		}else{
			$(this).css("cursor","default");
		}
	});
	//返回顶部 2014.11.11 发布产品
	(function($){
		$(window).scroll(function(){
		var s_w = window.screen.width;
		var s_h = window.screen.height;
		var s_top = parseInt($(window).scrollTop()+8);
		if(s_w >=1280 && s_h >= 450 && s_top>500){
			$("#qrcode").fadeIn("normal");
			$("#gotop").fadeIn("normal");
		}else{
			$("#qrcode").fadeOut("normal");
			$("#gotop").fadeOut("normal");
		}
	});
	$("#back").bind("click",function(){$("html, body").animate({scrollTop:0},100);})})(jQuery)
	//意见反馈
	$("#backF").click(function(){
		$(".adcDtl").removeClass("disNo").animate({right: '16px'}, "slow");
		$("#backF").addClass("backFon");
	});
	$(".tckCls").click(function(){
		$(this).parents(".adcDtl").animate({right: '-360px'}, "slow");
		$("#backF").removeClass("backFon");
	});

	/*-----------------样品管理-添加样品 2014-11-6 zyh------------------------*/
	$(".yang_buylist").hover(function(){
		$(this).find(".yang_listBg").show();
	},function(){
		$(this).find(".yang_listBg").hide();
	});
	/*----------------- 打折信息 gyj------------------------*/
	//$('select.regularSelect').tzSelect();
	/*$(".dropDown li").bind("click",function(){
		$(".zd_jb img").attr({"src":"../../images/zk_"+$(this).text()+".gif"})
	})*/

/*-----------------发布产品----3.发布成功页.html 优化展开收起------------------------*/
	$("#YouHua").toggle(function(){
		$("#YouHuaCont").slideDown(300);
		$(this).html("收起建议<span class='up'></span>");
	},function(){
		$("#YouHuaCont").slideUp(300);
		$(this).html("优化建议<span></span>");
	});
	$('#DingYue').click(function(){
		if($(this).is(":checked")){
			$('#DYemail').show();
		}else{
			$('#DYemail').hide();
		}
	});
	
/*-----------------会员信息　部门名片　编辑------------------------*/
	$(".c-editor-pop").hide();
	$('.cardEdit').click(function(){
		$(this).parent(".c-h").siblings(".c-editor-pop").show();
		$(this).parents(".card").addClass("z-d")
	});	
	$('.cardSave').click(function(){
		$(this).parents(".c-editor-pop").hide();
		$(this).parents(".card").removeClass("z-d")
	});	
	function cardNum(){
		var i=$(".card").length;		
		if((i%2)!=0 && i>2){			
				$(".c-editor-pop:last").addClass("upshow");			
		}
	}
	cardNum();	
/*-----------------5.我的收藏--3.收藏的店铺------------------------*/
	$(".product-img").each(function() {
		var leni=$(this).find("li").length;
		if(leni<=1){
			$(this).parents(".bd").siblings(".pageR").hide()
		}
	});
/*---------------2014/12-5 dh 报价----------*/
	$(".tradePrc").hide();
	$(".editPrc").toggle(function(){
		$(".tradePrc").slideDown(300);
		$(this).html("收起多级产品价格").addClass("zk");
	},function(){
		$(".tradePrc").slideUp(300);
		$(this).html("展开多级产品价格").removeClass("zk");
	});
	
	$('.a-colse').click(function(){
		$(this).parent().hide();
	});	
	
/*	$(".thumbnail li").on({ 
	    mouseenter: function() {    
			$(this).addClass("z-hov");
	    }, 
	    mouseleave: function() { 
			$(this).removeClass("z-hov");
	    },
	    click:function() {     
			$(this).addClass("curr").siblings().removeClass("curr");
			var imgSrc=$(this).children("img").attr("alt"); 
			$(".tstext").hide();
			$(".r-bigimg").children("img").attr("src",imgSrc).end().show();
	    }
	});
*/	
	$(".thumbnail li").hover(function(){
		$(this).addClass("curr").siblings().removeClass("curr");
		var imgSrc=$(this).children("img").attr("alt"); 
		$(".r-bigimg").children("img").attr("src",imgSrc).end().show();
	},function(){
		$(".r-bigimg").hide();
	});

	
	//报价 3.1引导第三步 批量导入 当cgBox时DIV大于4时，给本身赋值
	var cgBoxChild=$(".cgBox > div").length;
	var cgBoxLong=cgBoxChild*125;
	if (cgBoxChild > 4){
		$(".cgBox").css("width",cgBoxLong+"px")
		$(".btnP").css("bottom",62+"px")
	}
	//已发过--主动报价 鼠标放上去 显示相关操作按扭
	$(".tempBox").on({ 
	    mouseenter: function() {    
	    	$(this).find(".tempMask").show();
	    }, 
	    mouseleave: function() { 
			$(this).find(".tempMask").hide();
	    }
	});
	//已发过--1.3报价单预览 滑过价格
	$("#jc-g1").hide()
	$(".price").hover(function(){
		$("#jc-g1").toggle()
	})
	$(".bj-pop").on({ 
		mouseenter: function() {    
			$(this).children(".jc-gg").show().parent().siblings().children(".jc-gg").hide();
		}, 
		mouseleave: function() { 
			$(this).children(".jc-gg").hide().parent().siblings().children(".jc-gg").hide();
		}
	});
	
/*---------------2015/1-5 dh 销售中心\店铺管 理资讯分类----------*/
	//展开
	$('.subclass').hide();
	$('.btn-an').on('click',function(){
		$(this).parent().parent().siblings('.subclass').toggle();
		$(this).toggleClass("on");
	})
	//分类
	/*$('.add-btn').on('click',function(){
		var _my = $(this).parent().siblings(":last").clone(true);
		$(this).parent().before(_my);
	})
	$('.add-btn-s').on('click',function(){
		var _my = $(this).parent().parent().siblings().children('.add-s').clone(true);
		$(this).parent().parent().before(_my);
	})*/
	$('.categoryName').hover(function(){
		$(this).addClass("on");
	},function(){
		$(this).removeClass("on");
	});
	$('.addyumingbtn').click(function(){
		$("#addyuminginp").slideDown(200);
	});
	
/*---------------2015/1-5 dh 应用中心-400电话-电话号码管理----------*/
	var ah=$(".taba").height()+158;
	var bh=$(".tabb").height()+75;
	var ch=538;
	$(".tab-box").height(ah);
	$(".number-box li:nth-child(4n-1)").addClass("mthird");
	$(".number-box a").click(function(){
		$(".abc-box").animate({left:-1000+"px"},500);
		$(".tab-box").height(bh);
		$(".tab-process").removeClass("p01").addClass("p02");
	});
	
	$("#BtnToPick").click(function(){
		$(".abc-box").animate({left:0+"px"},500);
		$(".tab-box").height(ah);
		$(".tab-process").removeClass("p02").addClass("p01");
	});
	
	$(".openBtn").click(function(){
		$(".abc-box").animate({left:-2000+"px"},500);
		$(".tab-box").height(ch);
		$(".tab-process").removeClass("p02").addClass("p03");
	});
	$(".tpinp").focus(function() {
		$(".tpinp-text").show();
	});
	$(".tpinp").blur(function() {
		$(".tpinp-text").hide();
	})
	$('.tpa').click(function(){
		$(this).toggleClass("on");
	});
	$("#bindingSetBtn").click(function(){
		$(this).parent().hide();
		$("#bindingSet").show();
	});
	
	$("#Recycling").click(function(){
		$("#RecyclingPop").show();
	});
	$(".order_pop_tit a,#cancelBtn").click(function(){
		$("#RecyclingPop").hide();
	});
	$("#yesBtn").click(function(){
		$("#RecyclingPoptyes").show();
		$("#RecyclingPop").hide();
	});
	$(".order_pop_tit a,#shutBtn").click(function(){
		$("#RecyclingPoptyes").hide();
	});
	$("#packageEditBtn").click(function(){
		$("#packageEdit").show();
	});
	
	
});
/*交易须知浮动标*/
$(document).ready(function() {
	var Kwidth = $(window).width()
	var Bwidth = $(".wrapper").width()
		Leftw  = ( Kwidth - Bwidth )/2
		
	$('.J-jyxz').css({
		"position":"fixed",
		"top": 392,
		"left": Leftw + Bwidth
	});
});

