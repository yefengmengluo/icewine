function getClientH() {		//鑾峰彇鏂囨。鐨勯珮搴︼紝鐢ㄤ簬璁＄畻鑾峰彇閬僵灞傜殑楂樺害,鍦╥e6鎴栬€�7涓嬶紝褰撻〉闈㈡病鏈夊唴瀹规椂灏辫幏鍙栦笉鍒伴珮搴�	
    var winH = 0;
    if (document.documentElement && document.documentElement.clientHeight) {
        winH = Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight) + "px";
    }
    return winH;
}
function getWindowSize() {//鑾峰彇绐楀彛鐨勫搴﹀拰楂樺害
    var client = {
        width: 0,
        height: 0
    };
    if (typeof document.compatMode != 'undefined' && document.compatMode == 'CSS1Compat') {
        client.width = document.documentElement.clientWidth;
        client.height = document.documentElement.clientHeight;
    } else if (typeof document.body != 'undefined' && (document.body.scrollLeft || document.body.scrollTop)) {
        client.width = document.body.clientWidth;
        client.height = document.body.clientHeight;
    }
    return client;
}
//IE6涓嬭璁＄畻婊氬姩鏉�
function getScrollL() {
    var scrollL = 0;
    if ((document.documentElement) && (document.documentElement.scrollLeft)) {
        scrollL = document.documentElement.scrollLeft;
    }
    return scrollL;
}
function getScrollT() {
    var scrollT = 0;
    if ((document.documentElement) && (document.documentElement.scrollTop)) {
        scrollT = document.documentElement.scrollTop;
    }
    return scrollT;
}
function getAbsoluteLeftOfDialog(id) {//瀹氫綅left鐨勬暟鍊�
    var cw = getWindowSize().width;
    var objw = $("#" + id + "").width();
    var objl = (Number(cw) - Number(objw)) / 2;
    return objl;
}
function getAbsoluteTopOfDialog(id) {//瀹氫綅top鐨勬暟鍊�
    var ch = getWindowSize().height;
    var objh = $("#" + id + "").height();
    var objt = (Number(ch) - Number(objh)) / 2;
    return objt;
}
function oPosition(id) {//ie6涓嶆敮鎸乸osition:fixed瑙ｅ喅鏂规硶
    var isIE = !!window.ActiveXObject;
    var isIE6 = isIE && !window.XMLHttpRequest;
    if (isIE6) {
        var obj = document.getElementById(id); //position:fixed瀵硅薄
        var n = getAbsoluteTopOfDialog(id);  //top鍊�
        window.onscroll = function () { obj.style.top = (document.body.scrollTop || document.documentElement.scrollTop) + n + 'px'; };
        window.onresize = function () { obj.style.top = (document.body.scrollTop || document.documentElement.scrollTop) + n + 'px'; };
    }
}
function popupLayer2(id) {//ie6涓嬭Е鍙戜簨浠跺悗鎷栧姩婊氬姩鏉℃墽琛岀殑浜嬩欢
    oPosition(id);
    var h = getClientH();
    var tbt = getAbsoluteTopOfDialog(id) + "px";
    var tbl = getAbsoluteLeftOfDialog(id) + "px";
    $("#mask").css({ height: h, display: "block" });
    $("#" + id + "").css({ top: tbt, left: tbl, display: "block" });
}
function popupLayer(id) {//ie6涓嬪畾浣嶆暟鍊艰鍔犱笂婊氬姩鏉＄殑浣嶇疆锛屽叾浠栫殑娴忚鍣ㄤ笉鐢ㄨ€冭檻
    var h = getClientH();
    var isIE = !!window.ActiveXObject;
    var isIE6 = isIE && !window.XMLHttpRequest;
    if (isIE6) {
        var st = getScrollT();
        var sl = getScrollL();
        var tbt = getAbsoluteTopOfDialog(id) + Number(st) + "px";
        var tbl = getAbsoluteLeftOfDialog(id) + Number(sl) + "px";
        window.onscroll = function () { popupLayer2(id); };
    }
    else {
        var tbt = getAbsoluteTopOfDialog(id) + "px";
        var tbl = getAbsoluteLeftOfDialog(id) + "px";
    }
    $("#mask").css({ height: h, display: "block" });
    $("#" + id + "").css({ top: tbt, left: tbl, display: "block" });
}
function closeLayer(id) {//鍏抽棴寮瑰嚭妗�
	$("#iAgreeEnterprise").attr("checked",'checked');
	$("#iAgreePersonal").attr("checked",'checked');
	$("#yesIAgreeEnterprise").show();
	$("#noIAgreeEnterprise").hide();
	$("#yesIAgreePersonal").show();
	$("#noIAgreePersonal").hide();
    $("#mask").css("display", "none");
    $("#" + id + "").css("display", "none");
    $("#submitdd").removeClass("gray_agreeRegist").attr("disabled",false);
}