
//加载地址信息
	function loadAreaMes(ctx,currentCode,id1,id2,id3){
		var currareaCode = currentCode+"";//当前地区编码
		//获取省级下拉列表
		var areaCode1 = '101';
		var areaCodeLen1 = 6;
		var url =ctx+"/sysArea/cascadeShow/"+areaCode1+"/"+areaCodeLen1+"/sysArea.html";
		$.ajax({
			contentType:"application/json",
			dataType:"json",
			type:"POST",
			url:url,
			success:function(data1){
				var areas1 = data1;
				for(var i in areas1){
					if(currareaCode && areas1[i].areaCode == currareaCode.substr(0,6)){
						$("#"+id1).append("<option selected='selected' value="+areas1[i].areaCode+">"+areas1[i].name+"</option>");
					}else{
						$("#"+id1).append("<option  value="+areas1[i].areaCode+">"+areas1[i].name+"</option>");
					}
				}
				//获取地区市级下拉列表
				var areaCode2 = areas1[0].areaCode;
				if(currareaCode != 0 && currareaCode != ''){
					areaCode2 = currareaCode.substr(0,6);
				}
				var areaCodeLen2 = 9;
				var url =ctx+"/sysArea/cascadeShow/"+areaCode2+"/"+areaCodeLen2+"/sysArea.html";
				$.ajax({
					contentType:"application/json",
					dataType:"json",
					type:"POST",
					url:url,
					success:function(data2){
						var areas2 = data2;
						for(var i in areas2){
							if(currareaCode && areas2[i].areaCode == currareaCode.substr(0,9)){
								$("#"+id2).append("<option selected='selected' value="+areas2[i].areaCode+">"+areas2[i].name+"</option>");
							}else{
								$("#"+id2).append("<option  value="+areas2[i].areaCode+">"+areas2[i].name+"</option>");
							}
						}
						
						//获取县级下拉列表
						var areaCode3 = areas2[0].areaCode;
						if(currareaCode != 0 && currareaCode !=''){
							areaCode3 = currareaCode.substr(0,9);
						}
						var areaCodeLen3 = 12;
						var url =ctx+"/sysArea/cascadeShow/"+areaCode3+"/"+areaCodeLen3+"/sysArea.html";
						$.ajax({
							contentType:"application/json",
							dataType:"json",
							type:"POST",
							url:url,
							//async:false,
							success:function(data3){
								var areas3 = data3;
								for(var i in areas3){
									if(currareaCode && areas3[i].areaCode == currareaCode.substr(0,12)){
										$("#"+id3).append("<option selected='selected' value="+areas3[i].areaCode+">"+areas3[i].name+"</option>");
									}else{
										$("#"+id3).append("<option  value="+areas3[i].areaCode+">"+areas3[i].name+"</option>");
									}
								}
							}
						});
					}
				});
			}
		});
		
		
	//切换时，实现三级联动
	$(".area").change(function(){
		var id =  $(this).attr("id");
		id = id.substr(0,id.length-1);
		var id2 = id + "2";
		var id3 = id + "3";
		var areaCode = $(this).val();
		var areaCodeLen = areaCode.length;
		
		if(areaCodeLen == 6){//点击省级下拉列表
			//获取地区市级下拉列表
			var areaCodeLen2 = 9;
			var url =ctx+"/sysArea/cascadeShow/"+areaCode+"/"+areaCodeLen2+"/sysArea.html";
			$.ajax({
				contentType:"application/json",
				dataType:"json",
				type:"POST",
				url:url,
				success:function(data2){
					var areas2 = data2;
					$("#"+id2).empty();
					for(var i in areas2){
							$("#"+id2).append("<option  value="+areas2[i].areaCode+">"+areas2[i].name+"</option>");
					}
					
					
					//获取县级下拉列表
					var areaCode3 = areas2[0].areaCode;
					var areaCodeLen3 = 12;
					var url =ctx+"/sysArea/cascadeShow/"+areaCode3+"/"+areaCodeLen3+"/sysArea.html";
					$.ajax({
						contentType:"application/json",
						dataType:"json",
						type:"POST",
						url:url,
						success:function(data3){
							$("#"+id3).empty();
							var areas3 = data3;
							for(var i in areas3){
									$("#"+id3).append("<option  value="+areas3[i].areaCode+">"+areas3[i].name+"</option>");
							}
						}
					});
				}
			});
		}
		
		
		if(areaCodeLen == 9){//点击地区市级下拉列表
			//获取地县级下拉列表
			var areaCodeLen3 = 12;
			var url =ctx+"/sysArea/cascadeShow/"+areaCode+"/"+areaCodeLen3+"/sysArea.html";
			$.ajax({
				contentType:"application/json",
				dataType:"json",
				type:"POST",
				url:url,
				success:function(data3){
					$("#"+id3).empty();
					var areas3 = data3;
					for(var i in areas3){
							$("#"+id3).append("<option  value="+areas3[i].areaCode+">"+areas3[i].name+"</option>");
					}
				}
			});
			
		}
	});
	};
	