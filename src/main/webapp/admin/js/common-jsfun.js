/**
 * function desc 当前类别是否可以添加子类别
 * code 资讯类别编码
 */
function isAddChildCategory(caCode)
{	
	var siteid = $('#caSiteId').val();
	if(siteid==''||siteid==null){
		$("#existSite").html("请选择站点");
		return;
	}
	$("#isAddChildSpan").html("");
	if(caCode.length == 9)
	{
		$("#isAddChildSpan").html("三级分类下不能再添加类别");
	}
}
/**
 * function desc 是否可以添加资讯的判断
 * code 资讯类别编码
 */
function isCanAddInfo(arClassCode)
{
	$("#isCanAdd").html("");
	if(arClassCode.length == 3)
	{
		$("#isCanAdd").html("一级分类不可添加资讯");
		return false;
	}
}
/**
 * func desc 验证资讯表单信息
 */
function verifyArticleForm()
{
	var flag = true;
	//获取资讯标题、资讯类别等验证信息
	//如果这些信息不为空，表示验证没有通过，就返回false
	//否则就表示验证都通过了，就返回true
	var aliasNameInfo = $("#aliasName").html();
	var isCanAddInfo = $("#isCanAdd").html();
	if(aliasNameInfo != '')
	{
		alert(aliasNameInfo);
		flag = false;
	}else if(isCanAddInfo){
		alert(isCanAddInfo);
		flag = false;
	}
	return flag;
}
function verifyForm()
	{
		var flag = true;
		//获取站点名称、资讯类别、资讯名称等验证信息
		//如果这些信息不为空，表示验证没有通过，就返回false
		//否则就表示验证都通过了，就返回true
		var existSiteInfo = $("#existSite").html();
		var isAddChildSpanInfo = $("#isAddChildSpan").html();
		var existNameInfo = $("#existName").html();
		var nameTooShortInfo = $("#nameTooShort").html();
		var nameTooLongInfo = $("#nameTooLong").html();
		var nameIsSpecialChar = $("#nameIsSpecialChar").html();
		if(existSiteInfo != '')
		{
			alert(existSiteInfo);
			flag = false;
		}
		else if(isAddChildSpanInfo != '')
		{
			alert(isAddChildSpanInfo);
			flag = false;
		}
		else if(existNameInfo != '')
		{
			alert(existNameInfo);
			flag = false;
		}
		else if(nameTooShortInfo != '')
		{
			alert(nameTooShortInfo);
			flag = false;
		}
		else if(nameTooLongInfo != '')
		{
			alert(nameTooLongInfo);
			flag = false;
		}
		else if(nameIsSpecialChar != '')
		{
			alert(nameIsSpecialChar);
			flag = false;
		}
		return flag;
	}

//站点名称是否存在
function siteIsExist()
{
	var caSiteId = $("#wordKey").val();
	if(caSiteId == "")
	{
		return;
	}
	$("#existSite").html("");
	var siteId = $("#caSiteId").val();
	if (siteId == "") {
		$("#existSite").html("站点名称不存在，请选择正确的站点");
	}
}
/**
 * func desc 判断类别名称是否在名称数组中存在多个
 * param name 要判断的类别名称
 * parma nameArray 要查找的名称数组
 */
function nameInArray(name, nameArray)
{
	var count = 0;
	for(var i=0; i<nameArray.length; i++)
	{
		var nm = nameArray[i];
		if(name == nm)
		{
			count++;
		}
	}
	return count > 1;
}
//判断字符串中是否包含特殊字符
function isSpecialChar(str)
{
	var pattern = /[~!@#$%^&*()！￥（）……\\/|=+。	]/g;
	if(pattern.test(str))
	{
		return true;
	}
	else
	{
		return false;
	}
}

function titleIsExist()
{
	$("#aliasName").html("");
	var arTitle = $("#arTitle").val();
	if(arTitle != ""){
		$.post("<%=path%>/article/titleIsExist", {
			arTitle : arTitle
		}, function(data) {
			//可用
			if (!data) {
				$("#aliasName").html("资讯标题已存在,请换一个试试");
				aliasTitle = true;
			}
		});
	}
}
/**
 * function desc 在指定的站点列表中查找指定的站点的子站点
 * param site 站点对象
 * param siteList 一组站点
 */
function searchChildrenInList(site, siteList)
{
	var siteArray = new Array();
	var siteCode = site.caCode;
	for(var i=0; i<siteList.length-1; i++)
	{
		var s = siteList[i];
		var sCode = s.caCode;
		//如果子站点code的长度与站点code长度+相等，说明子站点是站点的子站点，而不是孙子站点
		if(sCode.length == siteCode.length + 3)
		{
			var parentCode = sCode.substring(0, siteCode.length);
			if(siteCode == parentCode)
			{
				siteArray.push(s);
			}
		}
	}
	return siteArray;
}
/**
 * function desc 将指定的站点数据转换成层级结构的数据添加到指定的下拉列表中
 * param siteList1 某层级的站点集合
 * param siteList2 站点下所有的类别，用于搜索某站点下的子站点
 * param selectId 下拉列表id
 */
function addSubOptionToOption(optionList, subOptionList, grandOptionList, selectId)
{
	if(optionList.length == 0)
	{
		return;
	}
	var optionStr;
	for(var i=0; i<optionList.length; i++)
	{
		var site = optionList[i];
		var siteChildren = searchChildrenInList(site, subOptionList);
		var codeLength = site.caCode.length;
		//当前类别层级
		var level = codeLength / CODE_DEPTH_BASENUM;
		var htmlSpace = getHTMLSpaceByLevel(level);
		optionStr += "<option value='"+site.caCode+"'>"+htmlSpace+site.caName+"</option>";
		if(siteChildren.length > 0)
		{
			for(var j=0; j<siteChildren.length; j++)
			{
				var siteChild = siteChildren[j];
				var siteGrandList = searchChildrenInList(siteChild, grandOptionList);
				var codeLength2 = siteChild.caCode.length;
				//当前类别层级
				var level2 = codeLength2 / CODE_DEPTH_BASENUM;
				var htmlSpace2 = getHTMLSpaceByLevel(level2);
				optionStr += "<option value='"+siteChild.caCode+"'>"+htmlSpace2+siteChild.caName+"</option>";
				if(siteGrandList.length > 0)
				{
					for(var k=0; k<siteGrandList.length;k++)
					{
						var siteGrand = siteGrandList[k];
						var codeLength3 = siteGrand.caCode.length;
						//当前类别层级
						var level3 = codeLength3 / CODE_DEPTH_BASENUM;
						var htmlSpace3 = getHTMLSpaceByLevel(level3);
						optionStr += "<option value='"+siteGrand.caCode+"'>"+htmlSpace3+siteGrand.caName+"</option>";
					}
				}
			}
		}
	}
	$(optionStr).appendTo($("#"+selectId));
}
//根据资讯类别层级，获得HTML空格
function getHTMLSpaceByLevel(level)
{
	var htmlSpace = "";
	//第一层不需要加html空格，因此循环从1开始，一般第二层才要加空格
	for(var i=1; i<level; i++)
	{
		htmlSpace += "&nbsp;&nbsp;&nbsp;";
	}
	var endString = "|-";
	if(htmlSpace.length > 0)
	{
		htmlSpace += endString;
	}
	return htmlSpace;
}
//资讯类别code深度的基数，第一层表示3，第二层表示6，以此类推
var CODE_DEPTH_BASENUM = 3;
/**
 * function desc 将指定的站点数据转换成层级结构的数据添加到指定的下拉列表中
 * param siteList1 某层级的站点集合
 * param siteList2 站点下所有的类别，用于搜索某站点下的子站点
 * param selectId 下拉列表id
 */
function addHierarchyDataToSelect(siteList1, siteList2, selectId)
{
	if(siteList1.length == 0)
	{
		return;
	}
	for(var i=0; i<siteList1.length; i++)
	{
		var site = siteList1[i];
		var siteChildren = searchChildrenInList(site, siteList2);
		var codeLength = site.caCode.length;
		//当前类别层级
		var level = codeLength / CODE_DEPTH_BASENUM;
		var htmlSpace = getHTMLSpaceByLevel(level);
		$("<option value='"+site.caCode+"'>"+htmlSpace+site.caName+"</option>").appendTo($("#"+selectId));
		if(siteChildren.length > 0)
		{
			addHierarchyDataToSelect(siteChildren, siteList2, selectId);
		}
	}
}
function isnotfindsiteid(){
	var siteid = $('#caSiteId').val();
	if(siteid==''||siteid==null){
		$("#existSite").html("请选择站点");
		return;
	}
}
//去除html标记
function removeHTMLTag(str) {
    str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
    str = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
    //str = str.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
    str=str.replace(/&nbsp;/ig,'');//去掉&nbsp;
    return str;
}
/**
 * function desc 清空一组元素的值
 * param eleIdArray 元素id数组
 */
function clearElementsValue(eleIdArray)
{
	for(var i=0; i<eleIdArray.length; i++)
	{
		$("#"+eleIdArray[i]).val('');
	}
}
