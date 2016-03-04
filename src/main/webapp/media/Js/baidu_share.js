//demo url:http://share.baidu.com/code/advance
/*$(function(){})=$(document).ready(function(){})$(window).load(function(){})*/
$(function(){
window._bd_share_config = {
			common : {
				bdText :$("#productName").html()
				//bdText :$("#productName").val()//,	自定义分享内容
				//bdDesc : '自定义分享摘要',	
				//bdUrl : '自定义分享url地址', 	
				//bdPic : '自定义分享图片'
			},
			share : [{
				"bdSize" : 16
			}]
		}
		with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
});