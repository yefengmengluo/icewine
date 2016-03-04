package com.wangku.dpw.controller.front;
import java.util.Map;
/*import org.apache.commons.lang.StringUtils;*/
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.util.StringUtils;
import com.wangku.dpw.controller.front.IceBaseController;
import com.wangku.dpw.domain.Member;
import com.wangku.dpw.domain.MemberBasic;
import com.wangku.dpw.service.MemberBasicService;
import com.wangku.dpw.service.MemberService;
import com.wangku.dpw.util.MD5Util;


/**
 * 
 * @Title: 登录or注册
 * @Description: TODO  
 * @author Liuyuchen  
 * @Modified Administrator      
 * @date 2015-11-10 下午4:14:18   
 * @version V1.0
 */
@Controller
public class RegisterController   extends IceBaseController{
	
	@Resource
	private MemberService memberservice;	
	@Resource
	private MemberBasicService memberBasicService;
	/**
	 *个人用户注册跳转 
	 * @return
	 */
	@RequestMapping("/register.html")
	public String personPage(){
		return"/member/personregister";
	}
	/**
	 * 
	 * toRegister(个人用户注册) 
	 * (注册) 
	 * @param member
	 * @param mav
	 * @param request
	 * @return  
	 * ModelAndView 
	 * @exception  
	 * @since  1.0
	 */
	@RequestMapping(value="/register/person",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView toRegister(Member member,MemberBasic memberBasic,ModelAndView mav,HttpServletRequest request){
		mav.setViewName("member/personregister");
		Map<String,Object> map  = super.requestForMap(request);
		if(map.get("vcode")==null){
			return mav;
		}
		String pagevcode = ((String) map.get("vcode")).toUpperCase();
		HttpSession session = request.getSession();
		String sysvcode = (String) session.getAttribute("validateCode");
		if(!StringUtils.equals(pagevcode, sysvcode)){
			//验证码不正确
			mav.getModel().put("errorMsg", "1");
			mav.getModel().put("account", map.get("account"));
			mav.getModel().put("password", map.get("password"));
		}else{
			if(map.get("password")!=null){
			String password = (String) map.get("password");
			password=MD5Util.MD5(password);
			System.out.println("这是MD5处理的密码"+password);
			}
		
		    Integer id  =	memberservice.save(member);
			
			memberBasic.setCorporationName(member.getCorporationName());
			memberBasic.setMemberId(id);
			memberBasicService.add(memberBasic);
			
		} 
		mav.setViewName("/login");
		return mav ;
	}
	
	
	/**
	 *企业用户注册跳转 
	 * @return
	 */
	@RequestMapping("/company.html")
	public String companyUser(){
		return"/member/companyregister";
	}
	
	/**
	 * 
	 * toRegister(企业用户注册) 
	 * (注册) 
	 * @param member
	 * @param mav
	 * @param request
	 * @return  
	 * ModelAndView 
	 * @exception  
	 * @since  1.0
	 */
	@RequestMapping(value="/register/company",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView toRegisterMember(Member member,MemberBasic memberBasic,ModelAndView mav,HttpServletRequest request){
		mav.setViewName("member/companyregister");
		Map<String,Object> map  = super.requestForMap(request);
		if(map.get("vcode")==null){
			return mav;
		}
		String pagevcode = ((String) map.get("vcode")).toUpperCase();
		HttpSession session = request.getSession();
		String sysvcode = (String) session.getAttribute("validateCode");
		if(!StringUtils.equals(pagevcode, sysvcode)){
			//验证码不正确
			mav.getModel().put("errorMsg", "1");
			mav.getModel().put("account", map.get("account"));
			mav.getModel().put("password", map.get("password"));
		}else{
			if(map.get("password")!=null){
			String password = (String) map.get("password");
			password=MD5Util.MD5(password);
			System.out.println("这是MD5处理的密码"+password);
			}
			
			Integer id = memberservice.save(member);
			memberBasic.setMemberId(id);
			memberBasic.setCorporationName(member.getCorporationName());
			memberBasicService.add(memberBasic);
		} 
		mav.setViewName("/login");
		return mav ;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
 