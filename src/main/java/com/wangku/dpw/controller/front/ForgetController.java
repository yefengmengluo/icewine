package com.wangku.dpw.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ForgetController {
  
	
	@RequestMapping("/forget.html")
	public String forgetPwd(){
		
		
		return"theme/pwdEmail/findpassword";
	}
}
