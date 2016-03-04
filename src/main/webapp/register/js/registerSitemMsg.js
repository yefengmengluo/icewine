/**
 * 娉ㄥ唽椤甸潰澶村熬淇℃伅鍔ㄦ€佽祴鍊�
 */
$(function(){
	getSiteMsg();
});

/**
 * 娉ㄥ唽椤甸潰澶村熬淇℃伅鍔ㄦ€佽祴鍊糾ethod
 */
function getSiteMsg(){
	
	   var value=$("#siteId").val();
	   var proPath=$("#proPath").val();
	   $.post(proPath+"/login/getSiteMsg", {siteId:value}, function(data) {
		   //header_register 椤甸潰logo src
		   if(data.logo != undefined){
				$("#logoSrc").html('<img class="img" src="'+data.logo+'"/>');
		   }else {
			   $("#logoSrc").html('<img class="img" src="'+proPath+'/static/images/register/reg_lg.png"/>');
		   }
		   
		   if(data.url != undefined){
			   $("#logoSrc").attr("href",data.url);
			   if(value!=null&&value!=1&&value!="1"){
				   $("#privatePrice").attr("href",data.url+"/Supply/");
			   }
		   }
		   
		   //鑵捐鍒掕繛鎺�
		   if(data){
			   $("#tengSrc").attr("href", "http://teng.99114.com/home.shtml");
		   }
		   
		   if(data.name != undefined){
			   $("#copyrightSapn").text(data.name); 
		   }
		   
		   if(data.fax != undefined){
			   $("#faxSpan").text(data.fax);
		   }
		   
		   if(data.telephone != undefined){
			   $("#telSpan").text(data.telephone);
		   }
		   
		   if(data.address != undefined){
			   $("#addressSapn").text(data.address);
		   }
		   
		   if(data.email != undefined){
			   $("#emailSpan").text(data.email);
		   }
	});
}