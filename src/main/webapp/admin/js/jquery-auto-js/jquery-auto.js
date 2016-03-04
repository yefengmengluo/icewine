$(document).ready(function() {
	var value = unicode($("#wordKey").val());
	$("#wordKey").autocomplete(ctx+"/site/searchajax", {
		width : 320, // 提示的宽度，溢出隐藏
		max : 50,// 显示数量
		autoFill : true,// 当前高亮的内容显示在文本框中
		scroll : false, // 当结果集大于默认高度时是否使用卷轴显示
		highlight : false,
		scroll : true,
		matchContains : true,
		multiple :false,
		formatItem : function(row, i, max) {
			return '<span style="color:gray;padding-right:10px;">站点 </span>' + row.siName + '<span style="color:yellow;">[' + row.siId + ']</span>';
		},
		formatMatch : function(row, i, max) {
			return row.siName;
		},
		parse:function(data) {//解释返回的数据，把其存在数组里 
			var array=eval(data);
			var parsed = []; 
			if(array == null)
			{
				return parsed;
			}
			for (var i = 0; i < array.length; i++) { 
				parsed[i] = { 
				data: array[i], 
				value: array[i].siName, 
				result: array[i].siName 
				}; 
			}
			return parsed; 
	   }
	}).result(function(event, row, formatted) {
       $("#caSiteId").val(row.siId);
    });
});
// unicode编码
function unicode(zn) {
	return escape(zn).replace(/%/g, '\\');
}
