
// JavaScript Document
var $URL="http://www.99114.com";
var $URL_M="http://Manager.99114.com";
var $URL_F="http://free.99114.com";
var $URL_L="http://login.99114.com";
var OPENER = null;

String.prototype.padLeft = function(len,ch)
{
    var self = this;
    if(!self) return "";
    self = self.toString();
    if(!ch) return self;
    for(var i=self.length;i<len;i++)
    {
        self = ch + self;
    }
    return self;
};
 /*  
JavaScript的Cookie类  
 注：js设定cookie的时间是以毫秒为单位  
*/  
  function jsCookie(){   
    var COOKIE_LIFE ={year:31536000,month:2592000,week:604800,day:86400,hour:3600,browser:0}   
    this.expires = 'browser';   
    this.path = null;   
    this.domain = null;   
    this.get=function(fieldName){       
  
        var regexp = window.eval("/"+fieldName+"=([\\w%,]+)(|;)/");   
        var result = document.cookie.match(regexp);   
        return (result?unescape(result[1]):"");   
    }       
    this.set=function(fieldName,fieldValue){   
  
        var cookie_list;   
        cookie_list = fieldName+"="+escape(fieldValue);           
        cookie_list += setExpires(this.expires);   
        cookie_list += setPath(this.path);   
        cookie_list += setDomain(this.domain);   
        document.cookie = cookie_list;   
    }   
    function setExpires(expires){   
  
        var tm=0;   
          if(typeof(expires)=='string'){   
            if(!COOKIE_LIFE[expires]) return "";       
            tm = COOKIE_LIFE[expires]*1000;           
        }else if(typeof(expires)=='number'){               
            tm = expires*1000;   
        }else{return "";}   
        expires = ";expires="+new Date(new Date().getTime()+ tm).toUTCString();   
        return expires;   
    }   
    function setPath(path){   
        if(!path) return "";   
        return (";path="+path);   
    }   
    function setDomain(domain){   
        if(!domain) return "";   
        return (";domain="+domain);   
    }   
}
ckn = new jsCookie();   
ckn.expires = 'hour';   
ckn.path ="/";
ckn.domain = "99114.com";


String.prototype.trim = function()
{
    var s = this;
    return s.replace(/(^\s*)|(\s*$)/g, "");
}
if(typeof($d) == "undefined")
{
    var $d = function(id){return document.getElementById(id);}
}
/* 校验数字的合法性*/
function isNumber(chars)
{
	var re=/^\d*$/;
	if (chars.match(re) == null)
		return false;
	else
		return true;
}
/*校验邮编的合法性*/
function isValidPost( chars )
{
    var re=/^\d{6}$/;
	if (chars.match(re) == null)
		return false;
	else
		return true;
}
/*去掉数据的首尾空字符*/
function jsTrim(value)
{
    return value.replace(/(^\s*)|(\s*$)/g,"");
}
/*验证域名*/
function IsURL(v)
{
    var a=$d(v).value.toLowerCase();
    if(a=="") return true;
    return /^http:\/\/(.*)(com|cn|net|org)$/.test(a);
}
/*全选*/
function SelectAll(flag,DarkName)
{

    var nullregExp =/^\s*$/;

    var NameNull = nullregExp.test(DarkName);

    var objCheckBox=document.getElementsByTagName('input');
   
    for(var i=0;i<objCheckBox.length;i++)
    {
        if(((objCheckBox[i].type=="checkbox") && objCheckBox[i].id.toUpperCase().indexOf(DarkName.toUpperCase())>=0) || NameNull)
        {
            if(flag)
            {
                switch(flag.toUpperCase())
                {
                    case "ON":
                        objCheckBox[i].checked=true;
                        break;
                    case "OFF":
                        objCheckBox[i].checked=false;
                        break;
                    case "TOGGLE":
                        objCheckBox[i].checked= !objCheckBox[i].checked;
                        break;
                    default:
                        objCheckBox[i].checked= true;
                        break;
                }
            }
        }
    }
}
/*判断是否为空 true为空*/
function Fempty2(v)
{
    if(FtagName(v)=="SELECT" && $d(v).value=='-1')
        return true;
    if(FtagName(v)=="INPUT" && $d(v).value.length==0)
        return true;
    return false;
}
function FtagName(id)
{
    return document.getElementById(id).tagName;
}
/*写html*/
function WriteSpan(spanid,html,f)
{
    /*错误*/
    if(f==1)
        document.getElementById(spanid).innerHTML="&nbsp;<font color='red'>"+html+"</html>";
    else
        document.getElementById(spanid).innerHTML="<font color='Green'>"+html+"</html>";
}
/*去空格*/
function trim(s)
{
    if(s==null)
        return "";
    return s.replace(/(^\s*)|(\s*$)/g, "");
}

/********************************************************************************************/
function getValue(sNameKey)
{
    sNameKey = sNameKey.toUpperCase()
    var arrPara = new Array();
    arrPara = window.location.href.toUpperCase().split("?");
        if(arrPara.length >=2)
        {
           arrPara = arrPara[1].split("&");
           for(var i=0  ; i < arrPara.length ; i++)
           {
                if(arrPara[i].indexOf("=")!=-1)
                {
                    if(arrPara[i].indexOf(sNameKey +"=")==0)
                    {
                    return arrPara[i].split("=")[1].toLowerCase();
                    }
                }
           }
        }
        return "";
}
/***************************************后台导航*****************************************/

function loadMNavigator(name,objDiv){
    var arrItems = new Array();
    
    arrItems[0] = new Array("供 应","请输入要查找的关键词",$URL+"/Supply/List.shtml");
    arrItems[1] = new Array("求 购","请输入要查找的关键词",$URL+"/Buy/List.shtml");
    arrItems[2] = new Array("公 司","请输入要查找的关键词",$URL+"/Corporation/List.shtml");

    this.name = name;
    this.arrItem = arrItems;/*数组*/
    this.currentIndex=0;   /*当前显示第几个*/

    this.div=objDiv;
    this.txtObj=null;
    this.btnObj=null;
    this.count=0;
}

loadMNavigator.prototype.createHtmlLink=function(tabIndex)
{
    if(!this.div)
    {

    }
    this.currentIndex = tabIndex;
    var sTemp="",sCss="";
    for(var i=0 ; i < this.arrItem.length ; i++)
    {
        sCss = i == this.currentIndex ? "on" :"";
        sTemp +="<li class=\""+ sCss +"\"><a href=\"javaScript:"+ this.name +".setIndex("+ i +")" +"\">"+this.arrItem[i][0]+"</a></li>";
    }
    this.div.innerHTML = sTemp;
    this.initEvents();
}

loadMNavigator.prototype.setIndex=function(tabIndex)
{
    this.createHtmlLink(tabIndex);
}

loadMNavigator.prototype.initEvents=function()
{
    var currentObj = this;
    if(this.txtObj)
    {
        this.txtObj.onkeypress=function(e){
            var iKeyCode = window.event?event.keyCode:e.which;
            if(iKeyCode==13)
            {
               currentObj.doSearch();
               return false;
            }
            return true;
        }
    }
    if(this.btnObj)
    {
        this.btnObj.onclick=function(){
            currentObj.doSearch();
            return false;
            }
    }
}

loadMNavigator.prototype.doSearch=function()
{
    if(this.txtObj.value.trim() == 0)
    {
        alert("请输入您要检索的关键词");
        this.txtObj.focus();
        return;
    }
    var searchUrl = this.arrItem[this.currentIndex][2] +"?k="+ encodeURIComponent(this.txtObj.value);
    /*新打开搜索窗口*/
    openLink(this.btnObj,searchUrl);
}

loadMNavigator.prototype.pressKeyCode=function(e,obj)
{
    var iKeyCode = window.event?e.keyCode:e.which;
    if(iKeyCode==13)
    {
        this.doSearch(e);
        return false;
    }
    return true;
}

/***************************************免费版店铺版通用导航js*****************************************/

function loadNavigator(name,objDiv){
    var arrItems = new Array();
    arrItems[0] = new Array("供应","请输入要查找的门店关键词",$URL+"/Supply/List.shtml");
    arrItems[1] = new Array("求购","请输入要查找的门店关键词",$URL+"/Buy/List.shtml");
    arrItems[2] = new Array("公司","请输入要查找的门店关键词",$URL+"/Corporation/List.shtml");
    arrItems[3] = new Array("招商","请输入要查找的门店关键词",$URL+"/Information/List.shtml");
    arrItems[4] = new Array("资讯","请输入要查找的门店关键词",$URL+"/Article/List.shtml");
    this.name = name;
    this.arrItem = arrItems;/*数组*/
    this.currentIndex=0;   /*当前显示第几个*/
    this.div=objDiv;
    this.txtObj=null;
    this.btnObj=null;
    this.count=0;
}

loadNavigator.prototype.createHtmlLink=function(tabIndex)
{
    if(!this.div)
    {
        alert("加载导航搜索栏必须要有一个容器!");
        return;
    }
    this.currentIndex = tabIndex;
    var sTemp="",sCss="",sSplit="";
    for(var i=0 ; i < this.arrItem.length ; i++)
    {

        if(i == this.currentIndex)
        {
            sCss="on";
            sSplit="　<span>↓</span>　";
        }
        else
        {
            sCss="";
            sSplit="　|　";
            
        }
        sTemp += "<a href=\"javaScript:"+ this.name +".setIndex("+ i +")" +"\" class=\""+ sCss +"\">"+this.arrItem[i][0]+"</a>" + sSplit;
    }
this.div.innerHTML = sTemp;
    this.initEvents();
}

loadNavigator.prototype.setIndex=function(tabIndex)
{
    this.createHtmlLink(tabIndex);
}

loadNavigator.prototype.initEvents=function()
{
    var currentObj = this;
    if(this.txtObj)
    {
        this.txtObj.onkeypress=function(e){
            var iKeyCode = window.event?event.keyCode:e.which;
            if(iKeyCode==13)
            {
               currentObj.doSearch();
               return false;
            }
            return true;
        }
    }
    if(this.btnObj)
    {
        this.btnObj.onclick=function(){
            currentObj.doSearch();
            return false;
            }
    }
}

loadNavigator.prototype.doSearch=function()
{
    if(this.txtObj.value.trim() == 0)
    {
        alert("请输入您要检索的关键词");
        this.txtObj.focus();
        return;
    }
    var searchUrl = this.arrItem[this.currentIndex][2] +"?k="+ encodeURIComponent(this.txtObj.value);// + "&t="+ getValue("t");
    /*新打开窗口*/
    openLink(this.btnObj,searchUrl);
}

loadNavigator.prototype.pressKeyCode=function(e,obj)
{
    var iKeyCode = window.event?e.keyCode:e.which;
    if(iKeyCode==13)
    {
        this.doSearch(e);
        return false;
    }
    return true;
}


/**********************************首页**********************************/
var $H = {
	isIE:(navigator.userAgent.toLowerCase().indexOf("msie")>=0)?true:false,
	add:function(url,title)
	{
		if(!(/^http:\/\//gi.test(url)))
		{
			var host = location.protocol+"//"+location.hostname+":"+location.port
			if(/^\//gi.test(url)) url = host + url;
			else url = host + "/"+url;
		}
		if(!title) title = document.title;
		if(this.isIE && window.external) window.external.addFavorite(url,title);
		else if(window.sidebar) window.sidebar.addPanel(title,url,"");
	},
	setHome:function(e,url)
	{
		if(!url) url = location.href;
		try
		{
			if(!e) e = window.event;
			var element = (this.isIE)?e.srcElement:e.target;
			element.style.behavior = "url(#default#homepage)";			
			element.setHomePage(url);
			return;
		}
		catch (ex1)
		{
            try
            {
				if(window.confirm("将"+url+"设置为首页，继续吗？"))
				{
					netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
					var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components. interfaces.nsIPrefBranch);
					prefs.setCharPref('browser.startup.homepage',url);
				}
            }
            catch (ex2)
            {
				var msg = "错误原因如下：\n";
				msg += "1、调用格式不正确，请按照History.setHome(事件，URL)格式调用!\n";
				msg += "2、您使用的为Mozilla FireFox等浏览器，当前设置不允许使用此功能，在地址栏中输入about:config更改signed.applets.codebase_principal_support键值为true即可。\n";
				msg += "3、浏览器不支持!\n";
				window.alert(msg);
            }
		}
	},
	back:function()
	{
		window.history.back();
	},
	forward:function()
	{
		window.history.forward();
	},
	go:function()
	{
		if(arguments.length==0) return;
		if(isNaN(arguments[0]))
			window.location = arguments[0];
		else
			window.history.go(arguments[0]);

	}
};
/**********************************与窗口操作相关的脚本**********************************/
var $W = {
	close:function()
	{
	if(arguments.length==1)
			window.opener = null;
		window.close();
	},
	print:function()
	{
	
	    window.print();
	    return;
		var content = arguments[0]||"";
		var w = window.open('');
		w.document.open();
		w.document.write(content);
		w.document.close();
		return w;
	},
	open:function()
	{
		var url = arguments[0]||"";
		var mode = arguments[1]||"_blank";
		var feature = arguments[2]||"location=no,status=no,menubar=no,toolbar=no,resizable=no,top=0,left=0";
		var replace = false;
		var w = window.open(url,mode,feature,replace);
		w.document.title = "自定义窗口|版权所有|行业网";
	},
	alert:function()
	{
		var content = arguments[0]||"继续操作么？";
		window.alert(content);
	},
	confirm:function()
	{
		var content = arguments[0]||"继续操作么？";
		return window.confirm(content);
	},
	prompt:function()
	{
		var message = arguments[0]||"";
		var _default = arguments[1]||"";
		return window.prompt(message,_default);
	},
	redirect:function()
	{
		if(arguments.length==0) return;
		var url = arguments[0];
		window.location = url;
	},
	setData:function(data)
	{
		try
	    {
		    if(data.replace(/(^[\s|　]*)|([\s|　]$)/g,"").length==0)
		    {
			    return;
		    }
		    if(window.clipboardData) 
		    {
			    window.clipboardData.setData("Text", data);
		    }
		    else if (window.netscape) 
		    {
		        netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
		        var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
		        if (!clip) return;
		        var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
		        if (!trans) return;
		        trans.addDataFlavor('text/unicode');
		        var str = new Object();
		        var len = new Object();
		        var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
		        var copytext=data;
		        str.data=copytext;
		        trans.setTransferData("text/unicode",str,copytext.length*2);
		        var clipid=Components.interfaces.nsIClipboard;
		        if (!clip) return false;
		        clip.setData(trans,null,clipid.kGlobalClipboard);
		    }
		    if(arguments.length==2)
		    {
			    window.alert("[=="+data+"==]已经成功复制到剪贴板上!");
		    }
		    else if(arguments.length == 1)
		    {
		        window.alert("已经成功复制到剪贴板上");
		    }
		    return false;
		}catch(ex){window.alert("您的浏览器不支持直接拷贝，请使用复合键Ctrl+C拷贝！");}
	}
};
Array.prototype.insertAt=function(index,value){
    var part1 = this.slice(0,index);
    var part2 = this.slice(index);
    part1.push(value);
    return(part1.concat(part2));
};
/********************************总站头部航******************************/
    function loadTopSearch(name,siteId){
        var arrItems = new Array();
        arrItems[0] = new Array("供应",true,"请输入您感兴趣的内容","/icewine/font/supply/more/SpList","supply");
        arrItems[1] = new Array("求购",true,"请输入您感兴趣的内容","/icewine/front/proPurchase/list.html","buy","Buy/Detail");
        arrItems[2] = new Array("公司",true,"请输入您感兴趣的内容","/icewine/front/corporation/list.html","corporation");
        arrItems[3] = new Array("招商",true,"请输入您感兴趣的内容","/icewine/front/proinvestment/list.html","information");
		arrItems[4] = new Array("资讯",true,"请输入您感兴趣的内容","/icewine/searchPage.html","article1");
        arrItems[5] = new Array("展会",false,"请输入您感兴趣的内容","/Exhibition/List.shtml","exhibit");
        arrItems[6] = new Array("行情",false,"请输入您感兴趣的内容","","market");
        arrItems[7] = new Array("社区",false,"请输入您感兴趣的内容","http://bbs.99114.com/","bbs");
        arrItems[8] = new Array("B2B",false,"请输入您感兴趣的内容","/Tool/List.shtml","tool");
        arrItems[9] = new Array("进店网",false,"请输入您感兴趣的内容","http://www.jindian.com.cn/","jindian");
        arrItems[10] = new Array("资讯",false,"请输入您感兴趣的内容","/Article4/List.shtml","article4");
        arrItems[11] = new Array("资讯",false,"请输入您感兴趣的内容","/Article3/List.shtml","article3");
        arrItems[12] = new Array("资讯",false,"请输入您感兴趣的内容","/Article2/List.shtml","article2");
        arrItems[13] = new Array("资讯",false,"请输入您感兴趣的内容","/Article1/List.shtml","article1");
        arrItems[14] = new Array("资讯",false,"请输入您感兴趣的内容","/Article/List.shtml","article"); 
        this.name = name;
        this.txtObj = null;/*搜索输入框*/
        this.btnObj =null ;/*搜索按钮*/
        this.currentIndex = 0;/*搜索选项*/
        this.tabDiv = null;
        this.key="";
        this.isChild=false;
        this.isTabSearch =false;
        this.siteId=siteId;//siteId站点ID 可选参数
//        if(this.siteId)
//        {
//            arrItems=arrItems.insertAt(1,new Array("报价",true,"请输入您感兴趣的内容","/Quotation/","quotation"));
//        }
        this.arrItem = arrItems;/*选项数组*/
    }
    loadTopSearch.prototype.doSearch=function()
    {
       if(!this.isTabSearch)
          this.getIndex();
       if(this.arrItem[this.currentIndex][2]==trim(this.txtObj.value) || trim(this.txtObj.value)=='' || trim(this.txtObj.value)=='请输入产品名称')
       {
            //总站搜索供应，不输入关键字跳转到大类别页
            if(this.siteId&&(this.currentIndex==0))
            {
                window.location.href="/Category/Category_0_0.shtml";
                return;
            }
            else
            {
                alert("请输入您感兴趣的关键词！");
                this.txtObj.select();
                return;
            }
       }
       this.key = this.txtObj.value;
       
        var productTypeUrl ="";
        var type = document.getElementsByName("TopSearchradioProductType");
        for(var i=0 ; i < type.length; i ++)
        {
            if(type[i].checked==true)
            {
                productTypeUrl =  "&t=" + type[i].value;
                break;
            }
        }
        
       ckn.set("searchKey",this.key);
       var searchUrl = this.arrItem[this.currentIndex][3] +"?k="+ encodeURIComponent(this.key) + productTypeUrl;
       
       //保存搜索关键字信息
       //var stype;
       //switch(this.currentIndex)
       //{
       //     case 0:
       //      stype = 1  //找供应
       //      break
       //    case 1:
       //      stype = 2  //找采购
       //      break
       //    case 2:
       //      stype = 3  //找公司
       //      break
       //    case 3:
       //      stype = 4  //找招商
       //      break
       //    case 5:
       //    case 7:
       //    case 8:
       //    case 10:
       //    case 11:
       //    case 12:
       //    case 13:
       //      stype = 5  //找资讯
       //      break  
       //    default:
       //      stype = 1

       //}
       //saveSearchKeyWord(this.key,stype);
       
      //添加mode参数
      if(getValue("mode")!='') 
      searchUrl=searchUrl+"&mode="+getValue("mode");
      
      //总站并且为报价搜索
//      if(this.siteId&&(this.currentIndex==1))
//      {
//        searchUrl=this.arrItem[this.currentIndex][3]+"List_0_0_{k}.shtml";
//        searchUrl=searchUrl.replace("{k}",encodeURIComponent(this.key))
//      }
       window.location.href=searchUrl;
    }
    loadTopSearch.prototype.getIndex=function()
    {
        this.currentIndex=0;
        for(var i = 0 ; i < this.arrItem.length ; i++)
        {
            for(var j = 4; j < this.arrItem[i].length ; j++)
            {
                if(window.location.pathname.toUpperCase().indexOf(this.arrItem[i][j].toUpperCase())!=-1)
                {
                    this.currentIndex = i;
                    return;
                }           
            }
        }
    }
     
    loadTopSearch.prototype.setIndex=function(index,className)
    {   
        this.currentIndex = index;
        if(!this.tabDiv)
        {
            alert("加载导航搜索栏必须要有一个容器!");
            return;
        }
        
        var sTemp="",sCss="",sSplit="";
        for(var i=0 ; i < this.arrItem.length ; i++)
        {
            if(!this.arrItem[i][1])
                continue;
            if(i == index)
            {
                sCss=className||"on";
            }
            else
            {
                sCss="";
            }
            if(className)
            {
//                if(i==1)
//                {
//            sTemp += "<li class=\""+ sCss+"\"><span class=\"newBG\"><a href=\"javaScript://\" onclick=\"javaScript:"+ this.name +".setIndex("+ i +",'"+className+"');" +"\">"+this.arrItem[i][0]+"</a></span></li>" ;
//                }
//                else
//                {
                    sTemp += "<li class=\""+ sCss+"\"><a href=\"javaScript://\" onclick=\"javaScript:"+ this.name +".setIndex("+ i +",'"+className+"');" +"\">"+this.arrItem[i][0]+"</a></li>" ;
//                }
            }
            else
            sTemp += "<li class=\""+ sCss+"\"><a href=\"javaScript://\" onclick=\"javaScript:"+ this.name +".setIndex("+ i +");" +"\">"+this.arrItem[i][0]+"</a></li>" ;
        }
        this.btnObj.value =  "找" + this.arrItem[index][0];
        this.tabDiv.innerHTML = sTemp;
    }
    loadTopSearch.prototype.createHTML=function()
    {
        this.getIndex();
        if(arguments.length>0&&arguments[0])
         this.setIndex(this.currentIndex,arguments[0]);
        else
         this.setIndex(this.currentIndex);
    }
    
     
    loadTopSearch.prototype.initEvents=function()
    {
        /*初始化控件，添加事件*/
        var currentObj = this;
        this.getIndex();
        if(this.txtObj)
        {
        
            var key = this.arrItem[this.currentIndex][2];
            var tempKey = getValue("k") || ckn.get("searchKey");
 
            if(this.isChild)
                key ="请输入产品名称";
                
            if(trim(decodeURIComponent(tempKey))=="" || trim(decodeURIComponent(tempKey))== key)
                this.txtObj.value = key;
            else
                this.txtObj.value = trim(decodeURIComponent(tempKey));
                
            this.txtObj.onkeypress=function(e){
                var iKeyCode = window.event?event.keyCode:e.which;
                if(iKeyCode==13)
                {
                   currentObj.doSearch();
                   return false;
                }
                return true;
            }
            this.txtObj.onfocus=function(e)
            {
               this.select();
            }
        }
        if(this.btnObj)
        {
            this.btnObj.onclick=function(){
                /*按钮的onclick事件=doSearch()*/
                currentObj.doSearch();
                return false;
                }
        }
        if(this.imgObj)
        {
            this.imgObj.onclick=function(){
                currentObj.doSearch();
                return false;
                }
        }
    }

/**************************************传入A对象附链接并打开*****************************************/
function openLink(obj,url,target)
{
    if(!target)
        target = "_blank"
    try
    {
        if(obj.tagName.toLowerCase() == "a")
        {
            obj.href= url;
            obj.target=target;
        }
        else
        {
            window.open(url,target);
        }
    }
    catch(ex)
    {
        ;
    }
}

/*****************************************注册页面帮助***************************************************/
/*
pointEnum 1 关于行业通会员
          2 怎样成为行业通会员
          3 成为行业通会员的优势
          4 发布商机
          5 推广企业
          6 订阅商机
          7 生易助手
          8 结交商友
          9 个性化页面
          10 优先加入Vip
*/
function helpRegister(obj,roleId,pointEnum)
{
var Enum = new Array();
    Enum[0]=new Array("1","关于行业通会员");
    Enum[1]=new Array("2","怎样成为行业通会员");
    Enum[2]=new Array("3","成为行业通会员的优势");
    Enum[3]=new Array("4","发布商机");
    Enum[4]=new Array("5","推广企业");
    Enum[5]=new Array("6","订阅商机");
    Enum[6]=new Array("7","生易助手");
    Enum[7]=new Array("8","结交商友");
    Enum[8]=new Array("9","个性化页面");
    Enum[9]=new Array("10","优先加入Vip");
    Enum[10]=new Array("11","更多");
    Enum[11]=new Array("12","帮助中心");
    
    window.open("http://copyright.Config.99114.com/user/index.html");
    /*alert("会员类型:"+roleId + "|"+ Enum[pointEnum-1][1]);*/
}

/*****************************************报价***************************************************/
function gotoQuote(obj,productId)
{
    openLink(obj,$URL +"/product/Quote.shtml?id="+productId);
}
/*****************************************加入收藏**************************************************
EnumID: 
        供应信息 = 1,
        采购信息 = 2,
        招商信息 = 4,
        服务信息 = 8,
        加工信息 = 16,
        二手信息 = 32,
        库存信息 = 64,
        招聘信息=128,
        展会信息=256
 */

function gotoHistory(SourceID,SourceName,HTMLID,EnumID)
{
var Alias="";
SourceID = SourceID || 0;
if(parseInt(SourceID) ==0 || !SourceName || !EnumID || !HTMLID)
{
    alert("参数传递错误，无法收藏！");
    return;
}

Alias= prompt("请输入方便您的记的别名",SourceName);
if(Alias == null || trim(Alias)=="")
{
    alert("您已经取消操作或者别名为空，无法完成“加入收藏”操作！");
    return;
}
           jQuery.ajax({
                    url:'/Ajax/Login.ashx',
                    type: 'get',
                    data: "action=gotoHistory&SourceID=" + SourceID + "&Alias="+encodeURIComponent(Alias)+ "&SourceName="+encodeURIComponent(SourceName)+"&HTMLID="+encodeURIComponent(HTMLID)+ "&TypeID=" + EnumID ,
                    timeout: 5000,
                    error: function(){
                    },
                    beforeSend:function(){
                    },
                    success: function(result){
                    
                    var iValue = parseInt(result.split("|")[1]);
                    var msg = result.split("|")[0];
                    alert(msg);
                    if(result.split("|")[1] == "-2")
                    {
                        window.open("http://work.99114.com");
                    }
                    if(result.split("|")[1] == "1")
                    {
                        window.open("http://work.99114.com/MemberHistory/MemberHistorySupply.aspx");
                    }else if(result.split("|")[1] == "2"){
                    	window.open("http://work.99114.com/MemberHistory/MemberHistoryBuy.aspx");
                    }
                    }

            });
        
 
}
//gotoHistory(1,"MYName","XXXXXXXX",1);
/*****************************************生意助手***************************************************/
function gotoHelp(obj,HelpID)
{
    //"生意助手号,默认为0或者空"
    if(HelpID && trim(HelpID).length>0)
    {
        window.open('http://Copyright.Config.99114.com/syzs/online/index.html?uin='+HelpID+'&agentid=970&transferpage=1&tq_bottom_ad_url=http://qtt.tq.cn/post/sendmain.html&tq_right_infocard_url=http://qtt.tq.cn/showcard.do&page=&ispaymoney=1&localurl=http://www.99114.com/&ltype=0',0,'width=598,height=425,location=no,resizable=0,scrollbars=0,status=no,toolbar=no,location=no,menu=no,top=100,left=200');
    }
    else
    {
        alert("尚未开通生意助手,请联系客服人员!");
    }
}
/*****************************************询价***************************************************/
function gotoAskfor(obj,productId)
{
    openLink(obj,$URL+"/product/Ask.shtml?id="+productId);
}
/*****************************************订购***************************************************/
function gotoOrder(obj,productId,price)
{
if(price)
 price = "" +price +"";
    if(price && price.match(/^[1-9]\d*.*\d*|0.*\d*[1-9]\d*$/))
    {
    openLink(obj,$URL+"/product/Order.shtml?id="+productId);
    }
    else
    alert("面议价格不能下订单");
    
}
/*****************************************报价***************************************************/
function gotoQuote(obj,productId)
{
    openLink(obj,$URL +"/product/Quote.shtml?id="+productId);
}
/*****************************************关注度***************************************************/
function gotoProductLevel(obj,productId)
{
    return;
    openLink(obj,$URL+"/gotoProductLevel/"+productId+".shtml");
}
/*****************************************诚信指数***************************************************/
function gotoHonestyLevel(obj,MemberId)
{
    openLink(obj,$URL+"/Corporation/Honesty.shtml?id=" +MemberId );
}
/*****************************************添加商友***************************************************/
/*(事件源,会员ID,公司名称,TypeID:收藏类型[1供应商,2采购商]*/
function gotoPartner(obj,SourceID,ChineseName,TypeID)
{
var Alias="";
SourceID = SourceID || 0;
if(parseInt(SourceID) ==0 || !ChineseName || !TypeID)
{
    alert("参数传递错误，无法加为商友！");
    return;
}

Alias= prompt("请输入方便您的记的别名",ChineseName);
if(!Alias)
{
    return;
}
else if(trim(Alias)=="")
{
    alert("别名不能为空，无法加为商友！");
    return;
}
       jQuery.ajax({
                url:'/Ajax/Login.ashx',
                type: 'get',
                data: "action=gotoPartner&SourceID=" + SourceID + "&Alias="+encodeURIComponent(Alias)+ "&TypeID=" + TypeID ,
                timeout: 5000,
                error: function(){
                },
                beforeSend:function(){
                },
                success: function(result){
                
                var iValue = parseInt(result.split("|")[1]);
                var msg = result.split("|")[0];
                alert(msg);
                }

        });
}
/*gotoPartner(null,1,"神话",2);*/
/***************************************首页通用登录头******************************************/
/*参数说明(用户名,密码,状态（未登录、登录、注销）,html控件)*/
function login(accObj,pwdObj,type)
{
    var divObj = $d("topAjaxLogin");
    var oldHtml = divObj.innerHTML;
    var account = accObj ? accObj.value : "";
    var pwd = pwdObj ? pwdObj.value : "";  
        type = type || 1;
    if(trim(account)=='' && accObj)
    {
        alert("请输入用户名！");
        accObj.select();
        return;
    }
    if(trim(pwd) == '' && pwdObj)
    {
        alert("请输入密码！");
        pwdObj.select();
        return;
    }
    
    jQuery.ajax({
            url:'/Ajax/Login.ashx',
            type: 'get',
            data: "action=ajaxLogin&account=" + account + "&pwd=" + pwd + "&type=" + type  + "&time=" + Math.random(),
            timeout: 5000,
            error: function(){ divObj.innerHTML = oldHtml;},
            beforeSend:function(){divObj.innerHTML = "<span style='color:#f00;'>正在登录…</span>";},
            success: function(result){
                var iValue = parseInt(result.split("|")[1]);
                var msg = result.split("|")[0];
                /*注销*/
                if(iValue==-2 || iValue>=1)
                {
                    divObj.innerHTML= msg;

                    if( pwdObj!=null && pwdObj!=null && iValue>=1 && window.location.host.indexOf("99114.com")==-1 && type!=2)
                    { 
                       document.body.innerHTML += "<div style=\"display:none;\"><IFRAME FRAMEBORDER=0 SCROLLING=NO SRC=\""+$URL_L+"/synLogin.aspx?account="+account+"&pwd="+pwd+"&synLogin=synLogin\"></IFRAME></div>";
                       alert("退出成功");
                       location.href=location.href;
                    }
                    else if(window.location.host.indexOf("99114.com")==-1 && type==2)
                    {
                       document.body.innerHTML += "<div style=\"display:none;\"><IFRAME FRAMEBORDER=0 SCROLLING=NO SRC=\""+$URL_L+"/synLogin.aspx?synLogin=synLoginOut\"></IFRAME></div>";
                    }
                }
                
                if(iValue==-1)
                {
                    if(trim(msg).length > 0)
                    {
                        alert(msg);
                        accObj.select();
                        divObj.innerHTML = oldHtml;
                    }
                }
            }
    });
}

function detailLogin(objTxt,ojbPwd,objCode,objImg)
{
    var account = objTxt ? objTxt.value : "";
    var pwd = ojbPwd ? ojbPwd.value : "";  
    var code  = objCode ? objCode.value : "";  

    if(trim(account)=='')
    {
        alert("请输入用户名！");
        objTxt.focus();
        return;
    }
    if(trim(pwd) == '')
    {
        alert("请输入密码！");
        
        return;
    }
     if(trim(code) == '')
    {
        alert("请输入验证码！");
        return;
    }
    
    jQuery.ajax({
            url:'/Ajax/Login.ashx',
            type: 'get',
            data: "action=ajaxDetailLogin&account=" + account + "&pwd=" + pwd + "&code=" + code + "&time=" + Math.random(),
            timeout: 5000,
            error: function(){
            },
            beforeSend:function(){
            },
            success: function(result){
                var msg = result.split("|")[1];
                if(parseInt(result.split("|")[0]) >=1)
                {
                  document.body.innerHTML += "<div style=\"display:none;\"><IFRAME FRAMEBORDER=0 SCROLLING=NO SRC=\""+$URL_L+"/synLogin.aspx?account="+account+"&pwd="+pwd+"&synLogin=synLogin\"></IFRAME></div>";
                  window.location.reload();
                }
                else
                {
                    if( trim(msg)!='' )
                    alert(msg);
                }
            }
    });
}

/*****************************************客户端获取地区编码***************************************************/
function getAreaCode(element)
{
	var objs = document.getElementById(element).getElementsByTagName("SELECT");
	var value = "";
	for(var i=objs.length-1;i>=0;i--)
	{
		if(objs[i].value.length>0 && objs[i].value.length%3 == 0)
		{
			value = objs[i].value;
			break;
		}
	}
	return value;
}
/*************************************前台搜索页通用脚本*****************************************/
function doSearch(name)
{
  this.name = name;
  this.paraURL =null;
}

doSearch.prototype.setPara =function(key,value)
{
    if(!this.paraURL)
        this.paraURL =  window.location.search.substring(1);
    var isReplaced = false;
    if( this.paraURL.length >=1)
    {
        var arrPara = this.paraURL.split("&");
        
        this.paraURL ="";
        for(var i=0 ; i < arrPara.length ; i ++)
        {
              if(arrPara[i].indexOf("=")!=-1)
              {
                    if(arrPara[i].indexOf(key +"=")==0)
                    {
                        isReplaced=true;
                        this.paraURL  += arrPara[i].split("=")[0] +"=" +value + "&";
                    }
                    else
                        this.paraURL  += arrPara[i].split("=")[0] +"=" +arrPara[i].split("=")[1] + "&";
              }
        }
    }
    if(!isReplaced)
        this.paraURL +=key +"=" + value +"&";
    if( this.paraURL.lastIndexOf("&") == this.paraURL.length-1)
       this.paraURL = this.paraURL.substring(0 ,this.paraURL.length-1);
}
doSearch.prototype.go=function(){
window.location = window.location.protocol +"//"+  window.location.host +  window.location.pathname+"?" + this.paraURL;
}
/********************************************************************/
/*
用法:   例如: <input id="Button1" type="button" value="button" OnClick="search();"/>

        function search()
        {
        var search1 = new doSearch();
        search1.setPara("key1","value1");   设置key value
        search1.setPara("key2","value2");
        search1.setPara("key3","value3");
        search1.go();    //执行搜索方法
        }
*/
/********************************************************************/
/*详细页搜索*/
function gotoChildSearch(obj,keyID,btnID)
{
    var obj = new loadTopSearch(obj);
    obj.txtObj = $d(keyID);
    obj.btnObj = $d(btnID);
    obj.isChild=true;
    /*控件添加事件*/
    obj.initEvents();

}


/********************************************************************/
/*填补页面中装载错误的图片*/
function imgOnError()
{
	var imgs = document.getElementsByTagName("IMG");
	for(var i=0;i<imgs.length;i++)
	{
		if(imgs[i].src && imgs[i].src.indexOf("_sm")>=0)
		{
			imgs[i].onerror = function()
			{
			    if(this.src.toLowerCase().indexOf("_sm")>=0)
			    {
				    this.src = this.src.replace("_sm","");
				}
				return true;
			}
		}
	}
}

/********************************************************************/
//imgid验证码图片ID，flag标识，0隐藏验证码，1显示，2改变
function changeValidateCode(imgid,flag)
{
    var img = document.getElementById(imgid);
    if(img)
    {
        flag = parseInt(flag);
        if(flag == 0)
        {
            /*隐藏*/
            img.style.display = "none";
        }
        else if(flag == 1)
        {
            /*显示*/
            img.style.display = "";
            img.src = "validatecode.aspx?r="+Math.random();
        }
        else if(flag == 2)
        {
            /*改变*/
            img.style.display = "";
        }
    }
}

/********************************************************************/
/*居中打开新窗口*/
function openWin(Url,Width,Height,Obj)
{
Obj = Obj || 'Sample';

var fullWidth = document.documentElement.offsetWidth;
var fullHeight = document.documentElement.offsetHeight ;
if($H.isIE)
{
    fullWidth = document.documentElement.clientWidth;
    fullHeight = document.documentElement.clientHeight ;
}
var top = ((fullHeight - Height) / 2);
var left= ((fullWidth - Width) / 2);
if(Width > fullWidth)left =0 ;
if(Height > fullHeight)top =0 ;
Obj = window.open(Url, Obj, 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,width='+Width+',height='+Height+',left='+left+',top='+top+'');
}


/********************************************************************/
/*资讯分享到百度贴吧*/
function share(type,link,title,content)
{
    var itieba_share = 'http://tieba.baidu.com/i/sys/share?link=' + encodeURIComponent(link)+'&type=' + encodeURIComponent(type)+'&title=' + encodeURIComponent(title)+'&content=' + encodeURIComponent(content);
    if (!window.open(itieba_share, 'itieba', 'toolbar=0,resizable=1,scrollbars=yes,status=1,width=626,height=436')) 
    {
        location.href = itieba_share;
    }
}
/**************会员模板类别菜单控制显示隐藏类****************/
function initCategory(id,ul)
{
	this.id =id;
	this.childShow = false;
	this.lis = ul.getElementsByTagName("li");
}
initCategory.prototype.init = function()
{
 	var curr = this;
	if(!this.lis)return;
	for(var i=0 ; i <this.lis.length; i ++)
	{
		var li = this.lis[i];
		/*隐藏子类*/
		if(li.className.toLowerCase().indexOf("child") != -1)
		{
			if(!this.childShow)li.style.display="none";
		}
		else/*处理父类*/
		{
        	if(this.hasChild(li.id))
			{
				li.getElementsByTagName("A")[0].href="javaScript:" +curr.id + ".showChild('"+ li.id +"');";
			}
		}
	}
}
initCategory.prototype.showChild=function(code)
{
	for(var i=0 ; i <this.lis.length; i ++)
	{
		var li = this.lis[i];
		if(li.className.toLowerCase().indexOf("child") != -1 && li.id.indexOf(code)==0)
		{
			li.style.display=  li.style.display == "none" ? "" : "none" ;
			}
	}
}
initCategory.prototype.hasChild = function(code)
{
	var x=0;
	for(var i=0 ; i <this.lis.length; i ++)
	{
		var li = this.lis[i];
		if(li.id.indexOf(code)==0){
			x++;
			if(x>=2)
			return true;
		}
	}
	return false;
}


/*调用示例
var ulObj = document.getElementById("columnProduct");//外层UL标签;
var initCate = new initCategory("initCate",ulObj);
initCate.childShow=false;//初始菜单是否显示;
initCate.init();
*/
/**************会员模板类别菜单控制显示隐藏类****************/

function bangBangEnable()
{
   //alert("该用户的帮帮账户还没有激活,无法在线交谈!");
   window.open("http://bangbang.99114.com/Function/function_1.html");
}


/**************搜索关键字****************/
/*--------------------------------------------------------------------------------------------------
功能说明：保存站点搜索关键字信息
参数说明：key - 搜索关键字  stype - 搜索信息类型（1、供应信息 2、采购信息 3、公司信息 4、招商信息 5、资讯信息）
*--------------------------------------------------------------------------------------------------
*/
function saveSearchKeyWord(key,stype)
{
    if(key.length > 0)
    {
        var sourceurl = document.URL;
        var url="/Ajax/SearchHotKeyWord.ashx?k="+encodeURI(key)+"&stype="+stype+""; 
        var ajax = new AJAX();
        ajax.Request(url,{method:"GET",onSuccess:okSaveKeyWord,onFail:noSaveKeyWord});
    }
}

function okSaveKeyWord(ajax)
{    
} 

function noSaveKeyWord(ajax)
{ 
} 

/********************************************AJAX**************************************************/
/*--------------------------------------------------------------------------------------------------
*Description:创建AJAX类
*Example:var ajax = new AJAX();ajax.Request(url,{onSuccess:m1,onActive:m2,onFail:m3});
*function m1(obj){//obj即为AJAX对象}
*--------------------------------------------------------------------------------------------------
*/
function AJAX()
{
	//basic parameters
	this.error = ["错误列表如下：\n"];
	this.message = null;
	//necessary parameters
	this.method = "POST";
	this.url = null;
	this.asynchronous = true;
	//other parameter
	this.contentType = "application/x-www-form-urlencoded";
	this.parameters = "";
	this.encryption = false;
}
AJAX.prototype.createRequest = function()
{
	var request = null;
	if(window.XMLHttpRequest)
	{
		this.error.push(this.error.length+":运行平台不支持ActiveXObject;\n");
		request = new XMLHttpRequest();
	}
	else if(window.ActiveXObject)
	{
		this.error.push(this.error.length+":运行平台不支持XMLHttpRequest;\n");
		try
		{
			request = new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (ex)
		{
			this.error.push(this.error.length+":"+ex.message);
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}		
	}
	this.message = this.error.toString().replace(/,([0-9]+:)/g,"$1");
	return request;	
}
AJAX.onReadyStateChange = function()
{
	var self = AJAX.bind;
	var args = [];
	for(var i=0,len=arguments.length;i<len;i++)
	{
		args.push(arguments[i]);
	}
	return function()
	{
		if(args[0].readyState>=1 && args[0].readyState<=3)
		{
			if(args[1].onActive) AJAX.execute(args[0],args[1].onActive);
		}
		if(args[0].readyState == 4)
		{
			if(args[0].status == 200)
			{
				if(args[1].onSuccess) AJAX.execute(args[0],args[1].onSuccess);
			}
			else
				if(args[1].onFail) AJAX.execute(args[0],args[1].onFail);
		}
		else
		{
			if(args[1].onFail) AJAX.execute(args[0],args[1].onFail);
		}
	}
}
AJAX.execute = function()
{
	if(typeof(arguments[1])=="function")
		arguments[1](arguments[0]);
	else if(typeof(arguments[1])=="string")
		eval(arguments[1])(arguments[0]);	
}
AJAX.prototype.Request = function(url,obj)
{
	//To be sure request object exists
	var request = this.createRequest();
	if(!request)
	{
		this.error.push(this.error.length+":创建Ajax对象失败;");
		this.message = this.error.toString().replace(/,([0-9]+:)/g,"$1");
		return;
	}
	if(!url)
	{
		this.error.push(this.error.length+":请仔细填写请求相对或者绝对地址;");
		this.message = this.error.toString().replace(/,([0-9]+:)/g,"$1");
		return;
	}
	if(!obj.onSuccess)
	{
		this.error.push(this.error.length+":至少包括处理成功事件方法;");
		this.message = this.error.toString().replace(/,([0-9]+:)/g,"$1");
		return;
	}
	if(obj.encryption) this.encryption = true;
	//set url
	this.url = url;
	//set method
	if(/^(?:post|get)$/i.test(obj.method)) this.method = obj.method.toUpperCase();
	//set asynchronous
	if(obj.asynchronous && typeof(obj.asynchronous) == "boolean") this.asynchronous = true;
	else if(obj.asynchronous == "true") this.asynchronous = true;
	else if(obj.asynchronous == "false") this.asynchronous = false;
	else this.asynchronous = true;
	//parameters
	if(obj.parameters) this.parameters = obj.parameters;
	if(this.url.indexOf("?")>=0)
	{
		this.parameters = (this.parameters)?(this.url.split("?")[1] + "&" + this.parameters):(this.url.split("?")[1]);
		this.url = this.url.split("?")[0];
	}
	//set header
	if(obj.contentType) this.contentType = obj.contentType;
	//set encryption
	var ps = this.parameters.split("&");
	var ns = "";
	for(var i=0,len=ps.length;this.encryption && i<len;i++)
	{
		var p = ps[i].split("=");
		ns += p[0] + "=" + encodeURIComponent(p[1]);
	}
	if(ns) this.parameters = ns;
	//To be sure every request is differrent
	if(this.parameters) this.parameters = this.parameters + "&r="+Math.random();
	else this.parameters = "r="+Math.random();
	if(this.method == "POST")
	{
		request.onreadystatechange = AJAX.onReadyStateChange(request,obj);
		request.open(this.method,this.url,this.asynchronous);
		if(typeof(request.setRequestHeader)=="function") request.setRequestHeader("Content-Type",this.contentType);
		request.send(this.parameters);
	}
	else
	{
		this.url = (this.parameters) ? (this.url+"?"+this.parameters):(this.url);
		request.onreadystatechange = AJAX.onReadyStateChange(request,obj);
		request.open(this.method,this.url,this.asynchronous);
		if(typeof(request.setRequestHeader)=="function") request.setRequestHeader("Content-Type",this.contentType);
		request.send(null);
	}
}

/*认证地址*/
function credit(typeid,memberid)
{
    var creditType=[];
    creditType.push([1,"标王","http://hyt.99114.com/Abouthyt/biaowang_introduce.html"]);
    creditType.push([2,"金牌供应商","http://hyt.99114.com/Abouthyt/jinpai_introduce.html"]);
    creditType.push([3,"BCP认证","http://www.99114.com"]);
    creditType.push([4,"企推委认证","http://www.99114.com"]);
    creditType.push([5,"BCP认证","http://www.99114.com"]);
    creditType.push([6,"企业营业执照认证","http://www.99114.com"]);
    creditType.push([7,"个人实名认证","http://www.99114.com"]);
    creditType.push([8,"国付宝支付","http://www.99114.com"]);
    creditType.push([9,"银联在线支付","http://www.99114.com"]);
    for(var i=0;i<creditType.length;i++)
    {
        if((creditType[i][0]-1)==typeid)
        {
            window.open(creditType[i][2]+"?id="+memberid);
            break;
        }
    }
}



