/** 区域三级联动 **/

$(document).ready(function() {
	loadAddress(0,null) ;
  });
function loadAddress(level,parentCode){
		level = level * 1 + 1 ;
		var data = {
				level : level,
				parentCode : parentCode
		} ;
		$.ajax({
			data : data,
			url : ctx+"/sysArea/arealevel",
			async : false,
			type : "POST",
			success : function(data) {
				var str = "<option value='-1'>--请选择--</option>";
				for ( var i = 0; i < data.length; i++) {
					str += "<option value='"+data[i].areaCode+"'>" + data[i].name + "</option>";
				}
				if(level==1){
					$("#provienceId").empty();
					$("#provienceId").append(str);	
				}else if(level==2){
					$("#cityId").empty();
					$("#cityId").append(str);
				}else if(level == 3){
					$("#countyId").empty();
					$("#countyId").append(str);
				}
			}
		});
	}
	function selectedAddress(obj,level){
		var parentCode = $(obj).find("option:selected").val() ;  // .prop("value") ;
		if(parentCode != -1){
			loadAddress(level,parentCode) ;	
		}else if(parentCode == -1 && level==1){
			var str = "<option value='-1'>--请选择--</option>";
			$("#cityId").empty();
			$("#cityId").append(str);
			$("#countyId").empty();
			$("#countyId").append(str);
		}else if(parentCode == -1 && level==2){
			var str = "<option value='-1'>--请选择--</option>";
			$("#countyId").empty();
			$("#countyId").append(str);
		}
	}