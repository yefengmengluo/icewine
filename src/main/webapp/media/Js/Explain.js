// JavaScript Document
$(function(){
	
	$(".showbox3").click(function(){
		$("#TB_overlayBG").css({
			display:"block",height:$(document).height(),width:$("body").width()
		});
		$(".box4").css({
			left:($("body").width()-$(".box4").width())/2-20+"px",
			top:($(window).height()-$(".box4").height())/2+$(window).scrollTop()+"px",
			display:"block"
		});
	});
	
	$(".close").click(function(){
		$("#TB_overlayBG").css("display","none");
		$(".box4").css("display","none");
	});
	
})
