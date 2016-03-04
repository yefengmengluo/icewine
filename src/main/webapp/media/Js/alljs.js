// JavaScript Document


$(function(){
	//表单
	$(".form .text").focus(function(){
		$(this).addClass("textHover");
		if(this.value!=this.defaultValue){
		    $(this).css("color","#333");	
		}else{
			$(this).css("color","#999");
			}
    });
	$(".form .text").blur(function(){$(this).removeClass("textHover");
	   if(this.value!=this.defaultValue){
		    $(this).css("color","#333");	
		}else{
			$(this).css("color","#999");
			}
	});
	
	//下拉菜单
	$(".select").click(function(){
		$(this).toggleClass("position").find(".slt-option").toggle();		
	})
	$(".slt-option ul li").click(function(){
		$(this).parent().parent().parent().find("input").val($(this).find("a").text())
	})
	
	//一般下拉菜单
	$(".dropDown").click(function(){
		$(this).toggleClass("position").find(".slt-div").toggle();	
	})
	
   //图库
	$(".picList li").hover(function(){
		$(this).children(".edit").show();
		},function(){
	    $(this).children(".edit").hide();
    })	
			
   //tab切换
   $(".supDetailTabUl li").click(function(){
		var $index=$(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		$(".tab").eq($index).show().siblings(".tab").hide();
   })
   
   
   //产品搜索结果页排序选中效果
   $(".fliter-list li.rule").click(function(){
       $(this).addClass("curr")
	          .siblings().removeClass("curr");
   });
   $(".fliter-list li.rule2").click(function(){
       $(this).addClass("curr2")
	          .siblings().removeClass("curr2");
   });
   
   //产品详情页
   $(".supDetailTabOrder tr:even").addClass("even");
});












