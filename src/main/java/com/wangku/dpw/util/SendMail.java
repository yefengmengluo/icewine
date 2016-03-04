package com.wangku.dpw.util;



public class SendMail {
	public static void sendRegEmail(String toadd,String encode,String link){
		
		StringBuilder msag = new StringBuilder("<a href='"+link+"' target=\"_blank\">");
	    try {
		msag.append("点此链接激活账户："+link);
		msag.append("</a>");
		msag.append("<br /> <br />");
		/*send("中国冰酒交易网--找回密码",msag.toString(),toadd);*/
		
	    }catch(Exception e){
	    	 e.printStackTrace();
	    }
	}
	
	/* public static void send(String subject,String msg,String toadd) throws Exception{
	        HtmlEmail email = new HtmlEmail();
	        email.setHostName("smtp.163.com");
	        email.setSmtpPort(25);
	        email.setAuthenticator(new DefaultAuthenticator("zqdn_mlj@163.com", "zqdnmlj5689"));
	        email.setSSLOnConnect(false);
	        email.setCharset("UTF-8");
	        email.setFrom("zqdn_mlj@163.com");
	        email.setSubject(subject);
	        email.addTo(toadd); //邮件
	        email.setHtmlMsg(msg);
	        email.send();

	    }*/

}
