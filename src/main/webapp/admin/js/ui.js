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
    $(".rpt_list img").on("click", function() {
        if ($(this).attr("cl") == 0) {
            $(this).attr("cl", "1");
            var obj = $(this).parent().parent();
            $(this).attr("src", '/platform/img/tv-collapsable.gif');
            $.post("", "act=abc&ntcode=" + $(this).attr("vl"), function(d) {
                obj.after(d);
            });
        }
        else {
            if ($(this).attr("state") == "1") {
                $(this).attr("state", 0);
                $(this).attr("src", '/platform/img/tv-collapsable.gif');
                self.Show2($("tr[ca_name=" + $(this).attr("vl") + "]"),$(this).attr("ca_site_id"));
            }
            else {
                $(this).attr("state", 1);
                $(this).attr("src", '/platform/img/tv-expandable.gif');
                self.Hide2($("tr[ca_name=" + $(this).attr("vl") + "]"),$(this).attr("ca_site_id"));
            }
        }
    })

    /*******************************
    隐藏子类
    *******************************/
    this.Hide = function(obj) {
        $.each(obj, function(i, n) {
            $(this).css("display", "none");
            return self.Hide($("tr[ca_name=" + $(this).attr("vl") + "]"));
        });
    }

    /*******************************
    显示子类
    *******************************/
    this.Show = function(obj) {
        $.each(obj, function(i, n) {
            $(this).css("display", "");
            //不改变子类展开或关闭的图标
            //$(this).find("img").eq(0).attr("src", "/platform/img/tv-collapsable.gif")
            return self.Show($("tr[ca_name=" + $(this).attr("vl") + "]"));
        });
    }
    
    /*******************************
    隐藏子类
    *******************************/
    this.Hide2 = function(obj,caSiteId) {
        $.each(obj, function(i, n) {
        	var trsiteid = $(this).attr("ca_site_id");
        	if(caSiteId == trsiteid)
        	{
        		$(this).css("display", "none");
        		return self.Hide2($("tr[ca_name=" + $(this).attr("vl") + "]"),trsiteid);
        	}
        });
    }

    /*******************************
    显示子类
    *******************************/
    this.Show2 = function(obj, caSiteId) {
        $.each(obj, function(i, n) {
        	var trsiteid = $(this).attr("ca_site_id");
        	if(caSiteId == trsiteid)
        	{
        		$(this).css("display", "");
        		return self.Show2($("tr[ca_name=" + $(this).attr("vl") + "]"),trsiteid);
        	}
        });
    }
}