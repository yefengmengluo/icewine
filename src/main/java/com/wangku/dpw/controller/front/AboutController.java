package com.wangku.dpw.controller.front;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 联系我们页面
 * @author mlj
 *
 */
@Controller
public class AboutController {
	
	
	
	/**
	 * 联系我们页面跳转
	 * 
	 * @return
	 */
	@RequestMapping("/about.html")
	public String aboutUs() {

		return "theme/Copyright/ContactUs";
	}

	/**
	 * 隐私条列页面跳转
	 */
	@RequestMapping("/privacy.html")
	public String privacy() {

		return "theme/Copyright/privacy";
	}
    
	/**
	 * 关于页面跳转
	 */
	@RequestMapping("/contact.html")
	public String contact() {

		return "theme/Copyright/AboutUs";
	}
	
	/**
	 * 关于页面跳转
	 */
	@RequestMapping("/link.html")
	public String link() {

		return "theme/Copyright/Link";
	}
}
