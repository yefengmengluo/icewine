// JavaScript Document
$(function(){
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
	
	
	$(".man_ztab table tr:nth-child(odd)").addClass('altow');
	$(".man_ztab table tr th:first-child, .man_ztab table tr td:first-child").css("padding","0 3px");
	//$(".man_ztab table tr:last-child").css("background","#c0c0c0");
	
	
	//菜单管理
	//$(".div_zixun table tr:nth-child(odd)").addClass('altow2');
	  
	 //列表tab切换
	 $("#page-tabs ul li").click(function(){
		var $index=$(this).index();
		var $index2=$(this).index();
		   $(this).addClass("selected").siblings().removeClass("selected");
		   $("#page-tabs ul li:first-child").children("div").addClass("fir");
		   $(this).next("li").children("div").addClass("fir_28").parent().siblings().children("div").removeClass("fir_28");
		   //$(this).append("<div class='last'></div>");
		  $(".man_ztab").eq($index).show().siblings().hide();
		  $(".yh-tab_div").eq($index2).show().siblings().hide();
		 })
		 
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
	
	$(".info-box tr:odd").addClass("over");
	
	//展开收起
	$(".man-show").toggle(function(){
		$(this).addClass("ma-hide");
	    $(this).parent("div").next("table").hide();	
		$(this).parent("div").next("table").next("table").hide();	
		
    },function(){
		$(this).removeClass("ma-hide");
	    $(this).parents("div").next("table").show();		
		$(this).parent("div").next("table").next("table").show();
		
	});
	
	//会员公司信息管理点击文字展开  zxh
	$(".ter_mp a").toggle(function(){
		      $(this).text("收起更多").parent().siblings(".te_mp1").show();
			  $(this).parent().siblings(".te_mp").hide();
		},function(){
			   $(this).text("展开更多").parent().siblings(".te_mp1").hide();
			  $(this).parent().siblings(".te_mp").show();
			}
		)
		
	//站内信编辑列表行
	$("p input.edit").live("click", function() {
		if($(this).val()=="编辑"){
			$(this).val("确定");
			$(this).parents("tr").find("span").attr("contentEditable", true).addClass("spanedit");}
		else{
			$(this).val("编辑");
			$(this).parents("tr").find("span").attr("contentEditable", false).removeClass("spanedit");
			$(this).parents("tbody").find("tr").eq(0).find("input.addchild").attr("disabled","");
		}
	});
	$("p input.sub").live("click", function() {
		$(this).parents("tr").find("span").attr("contentEditable", false).removeClass("spanedit");
		$(this).val("编辑").attr("class","edit");
		$("#addfirstmenu").attr("disabled","");
	});

	//站内信添加子列表行
	$(".addchild").live("click",function(){
		var cc=true;
		$.each($(this).parents("tbody").find("input.edit"),function(i,n){
			if($(n).val()=="确定"){
				cc=false;
				$(this).parents("tbody").find("tr:eq(0)").find("input.addchild").attr("disabled","disabled");
			}
		})
		if(cc)
		{
			var num=$(this).parents("tbody").find("tr").size()+1;
			$(this).parents("tr").find("td:eq(0)").attr("rowspan",num);
			var str="<tr class='tr-second'><td><span class='spanedit' contentEditable='true'></span></td><td><span class='spanedit' contentEditable='true'></span></td><td><input type='radio' name='open' checked='checked' /> 当前页面打开&nbsp;&nbsp;&nbsp; <input type='radio' name='open' /> 新页面打开</td><td><p class='btn-td_p'><a href='#' class='t-move-down' style='margin-left:0px;'></a></p></td><td class='textL'><p class='yh-con-p yh-con-p2'><input type='button' class='edit' name='' value='确定'/><input type='button' class='delThis' name='' value='删除'/></p></td></tr>"
			$(this).parents("tr").after(str);
		}	
	});
	
	$(".delThis").click(function(){
	   $(this).parents("tr").remove();	
	});
	
	$("#addfirstmenu").live("click",function(){
		$(this).attr("disabled","disabled");
		var str="<tbody><tr><td rowspan='1'>1</td><td><span class='spanedit' contentEditable='true'></span></td><td><span class='spanedit' contentEditable='true'></span></td><td><input type='radio' name='open' checked='checked' /> 当前页面打开&nbsp;&nbsp;&nbsp; <input type='radio' name='open' /> 新页面打开</td><td><p class='btn-td_p'><a href='#' class='t-move-down' style='margin-left:0px;'></a></p></td><td class='textL'><p class='yh-con-p yh-con-p2'><input type='button' class='sub' name='' value='确定'/><input type='button' class='addchild' name='' value='添加'/><input type='button' name='' value='删除'/></p></td></tr></tbody>"
		$("#noteList thead").after(str);
	});
	
	
})

//资讯管理中的菜单点击效果  zzn
var N
$(document).ready(function() {
    $.ajaxSetup({
        cache: false,
        type: "POST"
    });
    N = new Event();
    //T.Bind();
})
function Event() {
    var self = this;
    $(".rpt_list img").live("click", function() {
        if ($(this).attr("cl") == 0) {
            $(this).attr("cl", "1");
            var obj = $(this).parent().parent();
            $(this).attr("src", 'images/tv-collapsable.gif');
            $.post("", "act=abc&ntcode=" + $(this).attr("vl"), function(d) {
                obj.after(d);
            });
        }
        else {
            if ($(this).attr("state") == "1") {
                $(this).attr("state", 0);
                $(this).attr("src", 'images/tv-collapsable.gif');
                self.Show($("tr[name=" + $(this).attr("vl") + "]"));
            }
            else {
                $(this).attr("state", 1);
                $(this).attr("src", 'images/tv-expandable.gif');
                self.Hide($("tr[name=" + $(this).attr("vl") + "]"));
            }
        }
    })

    /*******************************
    隐藏子类
    *******************************/
    this.Hide = function(obj) {
        $.each(obj, function(i, n) {
            $(this).css("display", "none");
            return self.Hide($("tr[name=" + $(this).attr("vl") + "]"));
        });
    }

    /*******************************
    显示子类
    *******************************/
    this.Show = function(obj) {
        $.each(obj, function(i, n) {
            $(this).css("display", "");
            $(this).find("img").eq(0).attr("src", "images/tv-collapsable.gif")
            return self.Show($("tr[name=" + $(this).attr("vl") + "]"));
        });
    }
}