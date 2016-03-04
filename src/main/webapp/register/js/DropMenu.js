/*************************
Function：DropMenu；
Input：divID，宽度，高度，是否有下级,第一级数据（数组[[]],验证等级，数据类型；
Author：凡凡
Description：无限级下拉菜单类库
**************************/
function DropMenu(obj, width, height, isNext,data,level,dbtype) {
    var self = this;
    this.jq = $("#" + obj);
    this.a = this.jq.find("a");
    this.input = this.jq.find("input").eq(0);
    this.ul = this.jq.find("ul");
    this.jq.css("width", width);
    this.height = (height ? height : 150);
    this.ischildren = false;
    this.a.click(function () { self.show(); });
    if (width) { this.input.css("width", width - (this.a.width() * 1+10)); }
    this.ul.css("width", width - 2);
    this.input.attr("mark", (obj.indexOf("_0") > -1 ? obj.substr(0, obj.indexOf("_0")) : obj));
    this.change = function () { };
    this.d = data;
    this.isnext = isNext;
    this._width = width;
    this._height = height;
    this._type=dbtype;
    this._level = level;
    this._ischeck = false;
    /***********************
     显示ul
    ************************/
    DropMenu.prototype.show = function () {
        var self = this;
        self.jq.eq(0).css("z-index", 99);
        self.ul.fadeIn(150, function () {
            $(document).one("click", function () { self.ul.eq(0).hide(); self.jq.css("z-index", ""); });
        });
    };
    /***********************
     添加li的方法并绑定事件
    ************************/
    DropMenu.prototype.add = function (text, val, ex) {
        this.ul.append('<li class="slli" val="' + val + '" ex="' + ex + '" >' + text + '</li>');
        this.bindEvent();
    };
    /***********************
    删除li
    ************************/
    DropMenu.prototype.del = function (i) {
        this.li.eq(i).remove();
    };
    /***********************
    回显赋值
    ************************/
    DropMenu.prototype.selByVal = function (v) {
        $.each(this.li, function (i, n) {
            if ($(n).attr("val") == v || $(n).html() == v) {
                $(n).click();
            }
        });
    };
    
    DropMenu.prototype.addDate = function () {
        if (this.d.length > 0) {
            $.each(this.d, function (i, n) {
                self.add($(n)[0], $(n)[1], $(n)[1]);
            });
        }
    };
    /***********************
   添加绑定事件
    ************************/
    DropMenu.prototype.bindEvent = function () {
        var self = this;
        this.li = this.jq.find("li");
        this.id = this.jq.attr("id");
        this.li.unbind();
        self.input.unbind();
        this.li.css("width", this.jq.width() - 9);
        this.li.mouseover(function () { $(this).css({ "background-color": "#0066cc", "cursor": "pointer" }); });
        this.li.mouseout(function () { $(this).css("background-color", "");});
        if (this.li.size() > 2)
        { this.ul.css("height", self.height); }
        this.li.click(function () { //li点击事件 input赋值
            self.input.val($(this).html());
            self.input.attr("val", $(this).attr("val"));
            self.input.attr("ex", $(this).attr("ex"));
            //self.change()
            $(this).parent().parent().nextAll().remove();
            self.ischildren = false;
            self.getAllValue(self.input.attr("mark"));
            //self.clear();
            var rd = self.rdata($(this).attr("val"));
            self.addChildren(rd);
            //判断如果第二级是一个市则直接显示第三级
            //add by zlb
            var $li = $("#" + self.jq.attr("id") + "_0").find('li');
            $(this).parents('div[class=d-select]').next('div').find('ul').show();
            $(document).one("click", function () { self.ul.eq(0).hide(); self.jq.css("z-index", ""); });
            if($li.length==1){ 
            	$li.click();
            }
        });
        if (self.jq.offset().top > $(document).height() - 50) {
            self.ul.css("top", -self.ul.height() - 3);
        }
        self.input.blur(function () {
            var vl = this.value;
            if (vl.indexOf("请选择") >= 0) {
                this.value = "";
            } else {
                var bl = false;
                $.each(self.li, function (i, n) {
                    if ($(n).attr("val") == vl || $(n).html() == vl) {
                        bl = true;
                        return;
                    }
                });
                if (bl) {
                    self.selByVal(vl);
                }
                else {
                    this.value = "请选择";
                    $(this).parent().parent().nextAll().remove();
                    return;
                }
            }
            //add by zlb
        }).mouseover(function(){
        	$(this).parent().siblings('ul').show();
        	$(this).parent().parent().siblings('div').find('ul').hide();
            $(document).one("click", function () { self.ul.eq(0).hide(); self.jq.css("z-index", ""); });
        });
    };
    DropMenu.prototype.getAllValue = function (mark) {
        var self = this;
        var vls = "";
        $.each($("input[mark=" + mark + "]"), function (i, n) {
            if (self._level > 0) {
                var lv = self._level - 1;
                if (lv == i) {
                    if ($(this).val() != "" && $(this).val() != "请选择") {
                        self._ischeck = true;
                    }
                }
            }
            vls += $(this).attr("val") + "|" + $(this).val() + ",";
        });
        vls = vls.substring(0,vls.length - 1);
        $("input[name=ipt_" + mark + "]").val(vls);
    };
    /***********************
    添加下级菜单
    ************************/
    DropMenu.prototype.addChildren = function (d) {
        if (d.length > 0) {
            if (this.isnext) {
                if (!this.ischildren) {
                    if ($("#" + this.jq.attr("id") + "_0").length == 0) {
                        var childrenHtml = "";
                        self.childrenid = this.jq.attr("id") + "_0";
                        childrenHtml += "<div class='d-select' id=" + self.childrenid + " >";
                        childrenHtml += "<div class='slt-chk'><input type='text' value='请选择' readonly='readonly' class='slt-input' /><a href='javascript:'class='slt-btn'></a></div>";
                        childrenHtml += "   <ul>";
                        $.each(d, function (i, n) {
                            childrenHtml += "<li  val=" + $(n)[1] + " ex=" + $(n)[2] + ">" + $(n)[0] + "</li>";
                        });
                        childrenHtml += "</ul>";
                        childrenHtml += " </div>";
                        this.jq.parent().append(childrenHtml);
                        this.ischildren = true;
                        var code = " arr" + self.childrenid + "= new DropMenu('" + self.childrenid + "'," + this._width + "," + this._height + "," + this.isnext + ",''," + this._level + ",'" + this._type + "')";
                        window.eval(code);
                    }
                }
            }
        }
    };

    /******************
    编辑显示
    *******************/
    DropMenu.prototype.backShow = function () {
        var self = this;
        var dvid = this.jq.attr("id");
        if (dvid.indexOf("_0") < 0) {
            var vls = $("#ipt_" + dvid).val();
            if (vls != "") {
                var arry = vls.split(",");
                if (arry.length > 0) {
                    $.each(arry, function (i, n) {
//                        self.selByVal(this);
//                        if (i > 0) {
//                            var cindex = "";
//                            for (j = 0; j < i; j++) {
//                                cindex += "_0";
//                            }
//                            var cid = "arr" + dvid + cindex;
//                            window.eval(cid).selByVal(this);
                        //                        }
                        self.selByVal(this.split("|")[0]);
                        if (i > 0) {
                            var cindex = "";
                            for (var j = 0; j < i; j++) {
                                cindex += "_0";
                            }
                            var cid = "arr" + dvid + cindex;
                            window.eval(cid).selByVal(this.split("|")[0]);
                        }
                    });
                }
            }
        }
    };
    /***********************
     定义类库返回值的方法
    ************************/
//    DropMenu.prototype.text = function () {return this.span.html();}
//    DropMenu.prototype.val = function () { return this.span.attr("val"); }
//    DropMenu.prototype.ex = function () { return this.span.attr("ex"); }
//    DropMenu.prototype.slf = self.jq;
    DropMenu.prototype.ischeck = function () { return this.ischeck;};
    this.addDate();
    this.backShow();
    this.bindEvent();
    
}
/********************
根据父级获取子级数据
*********************/
DropMenu.prototype.rdata = function (pcode) {
    var self = this;
    var d = [];
    d = getData(self._type,pcode);
    return d;
};
/*********************
 释放内存
*********************/
DropMenu.prototype.clear = function () {
   // var self = this;
    var dvid = this.jq.attr("id");
    var vls = $("#ipt_" + dvid).val();
    if (vls != "") {

        var arry = vls.split(",");
        if (arry.length > 0) {
            var mark = false;
            $.each(arry, function (i, n) {
                if (i > 0) {
                    var cindex = "";
                    for (var j = 0; j < i; j++) {
                        cindex += "_0";
                    }
                    var cid = "arr" + dvid + cindex;
                    if (cid == dvid) {
                        mark = true;
                    }
                    if (mark) {
                        window.eval(cid=null);
                    }
                }
            });
        }
    }
};

/********************
通用获取数据
*********************/
function getData(type, pcode) {
    var d = [];
    var startIndex = 3;
    var fd = [];//要查找数据
    switch (type.toLowerCase()) {
        case "area":
            fd = AreaMenu;
            startIndex = 6;
            break;
        case "category":
            fd = CategoryMenu;
            break;
    }
    if (pcode != "") {
        var lt = pcode.toString().length + 3;
        $.each(fd, function (i, n) {
            if ($(n)[4] == lt && $(n)[3].indexOf(pcode) > -1) {
                var arrycity = [];
                arrycity.push($(n)[1]);
                arrycity.push($(n)[3]);
                arrycity.push($(n)[3]);
                d.push(arrycity); 
            }
        });
    }
    else {
        $.each(fd, function (i, n) {
            if ($(n)[4] == startIndex) {
                var arrycity = [];
                arrycity.push($(n)[1]);
                arrycity.push($(n)[3]);
                arrycity.push($(n)[3]);
                d.push(arrycity);
            }
        });
    }
    return d;
}