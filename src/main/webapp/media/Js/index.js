// JavaScript Document
$(function(){
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
		})		
	//我的采购清单加减
	$(".btn_jian").click(function() {
        var i = parseInt($(this).next(".text_input").val());
        var min = parseInt($(this).next(".text_input").attr("min"));
        if (i > min) {
            i--;
            $(this).next(".text_input").val(i);
        }
    })
    $(".btn_jia").click(function() {
        var i = parseInt($(this).prev(".text_input").val());
        var max = parseInt($(this).prev(".text_input").attr("max"));
        if (i < max) {
            i++;
            $(this).prev(".text_input").val(i);
        }
    })
	//我的采购清单加减里的删除
	$(".end").click(function(){
		$(this).parent(".shoppingListCon").remove();
	});
	
		
	
	
	$(".searchTab ul li").each(function(){
		$(this).click(function(){
			$(".searchTab ul li").removeClass("on")
			$(this).addClass("on")		
		})
	}) 	
	
	$(".focusBlur").blur(function(){
		if($(this).val==""){
				alert("")
		}	
	})
	$(".focusBlur").focus(function(){
		if($(this).val==""){
				alert("")
		}	
	})	
	/*登陆提示框 关闭*/
	$(".tsCls").click(function(){
		$(".loginTs").hide();
	})
})
/*首页切换*/
function changeTab(sName1,sName2,attr){
	$(sName1).each(function(a){    
		$(this).mouseover(function(){
			$(sName1).removeClass(attr)
			$(this).addClass(attr)
			$(sName2).hide()
			$(sName2).eq(a).show()
			})
		})		
}




/*2013.05.24*/

$(function(){
	/*********************************Supply/List.html ****************************/
	/*已选类目属性点击删除*/
	$(".s-changed a i").click(function(){
		$(this).parent("a").remove();
	});
	/*点击多选*/
	$(".s-multiple").click(function(){
		$(this).parent().siblings().find(".add_more").show();
		$(this).parent().siblings().find("input").show();
		$(this).parent().siblings(".s-l-choise").addClass("w658");
		$(this).parent(".s-options").hide();
		$(this).parent().parent().parent().find(".add_btn").show();
	});
	/*点击更多*/
	$(".s-more").click(function(){
		if($(this).parent().siblings().find(".add_more").is(":visible")){
			$(this).parent().siblings().find(".add_more").hide();
			$(this).parent().siblings(".s-l-choise").removeClass("wmore");
			$(this).text("更多")
			$(this).addClass("more_icon");
			$(this).removeClass("s-sq");
			
		}else{
			$(this).parent().siblings(".s-l-choise").addClass("wmore")
			$(this).parent().siblings().find(".add_more").show();
			
			$(this).text("收起")
			$(this).removeClass("more_icon");
			$(this).addClass("s-sq");
			};
			
	});
	
	/*搜索*/
	$(".form .text").focus(function(){$(this).addClass("textHover");});
	$(".form .text").blur(function(){$(this).removeClass("textHover");});
	/*zminput换文字颜色*/
	function inputTipText(){      
		$("[class*=grayTips]") //所有样式名中含有grayTips的input     
		.each(function(){     
		   var oldVal=$(this).val();   //默认的提示性文本     
		   $(this)     
		   .css({"color":"#888"})  //灰色     
		   .focus(function(){     
			if($(this).val()!=oldVal){$(this).css({"color":"#000"})}else{$(this).val("").css({"color":"#888"})}     
		   })     
		   .blur(function(){     
			if($(this).val()==""){$(this).val(oldVal).css({"color":"#888"})}     
		   })     
		   .keydown(function(){$(this).css({"color":"#000"})})     
			   
		})     
	}     	
	$(function(){     
		inputTipText();  //直接调用就OK了
		return false;     
	})
	
	/*所有采购类型*/
	$(".select").click(function(event){
		$(this).toggleClass("add_position").find(".slt-option").toggle();
		event.stopPropagation();		
	})
	$(".slt-option ul li").click(function(){
		$(this).parent().parent().parent().find("input").val($(this).find("a").text())
	})
	/*发货地*/
	$(".add_select2").click(function(event){
		$(this).toggleClass("add_position").find(".slt-option2").toggle();
		event.stopPropagation();	
	})
	$.each($(".slt-option2 ul.area li"),function(){
	  $(this).click(function(){
		  $(".slt_input").val($(this).text());
		});
	});
	
	$(".slt-option2 ul li").hover(function(){
		$(this).css("z-index","2");
		$(this).addClass("li_hover");
		$(this).find("div").show();
		$(".list_po").find(".hover_pop").addClass("hover_popr");
	},function(){
		$(this).removeClass("li_hover");
		$(this).css("z-index","0");
		$(this).find("div").hide();
	});
	
	
	$(document).click(function(){
		$(".slt-option2").hide();
		$(".slt-option").hide();
	});
	
	
	//发布时间上下箭头
	$(".m_downicon").click(function(){
		$(this).children("em").addClass("m_downicon2");
		$(this).siblings().children("em").addClass("m_upicon1");
		$(this).siblings().children("em").removeClass("m_upicon2");
	});
	$(".m_upicon").click(function(){
		$(this).children("em").addClass("m_upicon2");
		$(this).siblings().children("em").addClass("m_downicon1");
		$(this).siblings().children("em").removeClass("m_downicon2");
	});
	
	//首页加减
	$(".btn_jian").click(function() {
        var i = parseInt($(this).next(".text_input").val());
        var min = parseInt($(this).next(".text_input").attr("min"));
        if (i > min) {
            i--;
            $(this).next(".text_input").val(i);
        }
    })

    $(".btn_jia").click(function() {
        var i = parseInt($(this).prev(".text_input").val());
        var max = parseInt($(this).prev(".text_input").attr("max"));
        if (i < max) {
            i++;
            $(this).prev(".text_input").val(i);
        }
    })
	
	//加减里的删除
	$(".end").click(function(){
		$(this).parent(".shoppingListCon").remove();
	});
	
	/*20130530*/
	//点销量箭头互换
	$(".add_pricebtm").toggle(function(){
		$(this).addClass("add_pricebtm8");
	},function(){
		$(this).removeClass("add_pricebtm8");
	});
	//输入价格出现确定按钮
	$(".s-lowerPrice ").focus(function(){
		$(this).parent().siblings(".price_po").show();
		      //event.stopPropagation();
		
	});
	var inputfocus=$(".s-lowerPrice,.s-topPrice");
	inputfocus.focus(function(){
		$(this).parent().siblings(".price_po").show();
		//event.stopPropagation();
	});
	inputfocus.parents(".priceLevel").click(function(event){
		//event=event||window.event;
		event.stopPropagation(); 
	});
	$(document).click(function(e){                       
		$(".price_po").hide();
	});
	
	//价格只能输入文字
	$(".s-lowerPrice,.s-topPrice").keyup(function(){  //keyup事件处理 
        $(this).val($(this).val().replace(/\D|^0/g,''));  
    }).bind("paste",function(){  //CTR+V事件处理 
        $(this).val($(this).val().replace(/\D|^0/g,''));  
    }).css("ime-mode", "disabled");  //CSS设置输入法不可用
	
	//清除价格
	$(".clear_btn").click(function(){
		$(this).parents().siblings().find(".s-lowerPrice").attr("value","");
		$(this).parents().siblings().find(".s-topPrice").attr("value","");
	});
	//点击确定div消失
	$(".Ddetermine_btn").click(function(){
		$(this).parents(".price_po").hide();
	});
	/*点击更多*/
/*	$(".s-more2").click(function(){
		if($(this).text("查看更多")){
			$(".s-changed2").css("height","auto")
			$(this).text("收起")
		}else{
			alert("")
			$(".s-changed2").css("height","32px")
			$(this).text("查看更多")
			};
			
	});*/
		$(".s-more2").toggle(function(){
				$(".s-changed2").css("height","auto")
				$(".s-more2").addClass("s-more2aa")
				$(this).text("收起")
				},function(){
				$(".s-changed2").css("height","32px")
				$(this).text("查看更多")	
				$(".s-more2").removeClass("s-more2aa")	
				}
		)
});


/********************************采购搜索页查看更多zm20130827*************************************/
/*点击查看更多分类**/
$(document).ready(function(){ 
	  var gt = $(".s-changedm2 a:gt(3)");	
	  gt.hide();
	  $(".s-optionsn").click(function(){
		  if(gt.is(":visible")){
			  gt.hide();
			  $(".s-optionsn a").removeClass("hover").text("查看更多");
  
	   }else{
		      gt.show();
		      $(".s-optionsn a").addClass("hover").text("收起");
	   };
	    return false;
      });

});














/*******************************************20131010zm报价弹出层******************************************/
$(function(){
	//报价弹出层
	$(".showbox").click(function(){
		$("#TB_overlayBG").css({
			display:"block",height:$(document).height()
		});
		$(".pop").css({
			left:($("body").width()-$(".pop").width())/2+"px",
			top:($(window).height()-$(".pop").height())/2+"px",
			display:"block"
		});
	});
	$(".b-close").click(function(){
		$("#TB_overlayBG").css("display","none");
		$(".pop").css("display","none");
	});
	//询盘弹出层
	$(".showbox2").click(function(){
		$("#TB_overlayBG").css({
			display:"block",height:$(document).height()
		});
		$(".pop2").css({
			left:($("body").width()-$(".pop2").width())/2+"px",
			top:($(window).height()-$(".pop2").height())/2+"px",
			display:"block"
		});
	});
	$(".b-close").click(function(){
		$("#TB_overlayBG").css("display","none");
		$(".pop2").css("display","none");
	});
/*划过产品图出现边框*/
	$(".hoverBorder ul li").hover(function() {
		$(this).addClass("selectedCon")
		$(this).children().find(".moreInfor").show()
	}, function() {
		$(this).removeClass("selectedCon")
		$(this).children().find(".moreInfor").hide()
	});

	
	
});

/*shx 最后li的底部虚线*/
$.each($("ul.commentUlName"),function(){
	$(this).find("li:last").addClass("lastLi");
})

$(document).ready(function(){
	$('<a href="#" id="retop">返回顶部</a>').appendTo('body').fadeOut().click(function(){
		$(document).scrollTop(0);
		$(this).fadeOut();
		return false
	});
	var $retop = $('#retop');
	$(window).scroll(function(){
		if ($(document).scrollTop() === 0){
			$retop.fadeOut()
		}else{
			$retop.fadeIn()
		}
		if ($.browser.msie && $.browser.version == 6.0 && $(document).scrollTop() !== 0){
			$retop.css({ 'opacity': 1 })
		} 
	});
});
$(function(){
	   $(".service_l").hover(function(){
		  $(".service_r").css("display","block");
		  $(".service").css("width","200px");
	   });
	$(".service").hover(function(){
		  $(".service_r").css("display","block");
	   },function(){
		   $(".service_r").css("display","none");
		  $(".service").css("width","33px");
	});	 
})
