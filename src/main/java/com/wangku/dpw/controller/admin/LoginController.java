package com.wangku.dpw.controller.admin;
import java.util.Map;
/*import org.apache.commons.lang.StringUtils;*/
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Primary;
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
public class LoginController   extends IceBaseController{
	
	@Resource
	private MemberService memberservice;
	@Resource
	private MemberBasicService memberBasicService;
	
	@RequestMapping("/tologin")
	public ModelAndView toLogin(ModelAndView mav){
		mav.setViewName("login");
		return mav;
	}
	
	
	
	/**
	 * 
	 * toRegister(注册) 
	 * (注册) 
	 * @param member
	 * @param mav
	 * @param request
	 * @return  
	 * ModelAndView 
	 * @exception  
	 * @since  1.0
	 */
	@RequestMapping(value="/register",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView toRegister(Member member,ModelAndView mav,HttpServletRequest request){
		mav.setViewName("member/addmember");
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
			Integer memberId=memberservice.save(member);
			
			MemberBasic memberBasic=new MemberBasic();
			memberBasic.setMemberId(memberId);
			memberBasic.setCorporationName(member.getCorporationName());
			memberBasicService.add(memberBasic);
		} 
		mav.setViewName("/theme/index");
		return mav;
	}
	/**
	 * 
	 * check(登录) 
	 * (登录) 
	 * @param mav
	 * @param request
	 * @param response
	 * @param member
	 * @return  
	 * ModelAndView 
	 * @exception  
	 * @since  1.0
	 */
	
	@RequestMapping(value="/login/check",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView  check(ModelAndView mav,HttpServletRequest request,HttpServletResponse response,Member member){
		mav.setViewName("/login");
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
			//验证码正确,验证用户名及密码
		 
			Map<String,Object> m= memberservice.getEntityBymap(map);
			if(m == null){
				//用户名或密码不正确
				mav.getModel().put("errorMsg", "2");
			}else{
				String password = (String) map.get("password");
				password = MD5Util.MD5(password);
				if(StringUtils.equals(password, (String)m.get("password"))){
					//验证成功，将登录用户信息存放在session中
					session.setAttribute("account", m.get("account"));
					Long mem = (Long)m.get("memberId");
					session.setAttribute("memberId",mem.intValue());
					// 登陆成功，设置session并设置返回结果页面
					mav.setViewName("/theme/index");
				}else{
					mav.getModel().put("errorMsg", "3");
					mav.getModel().put("account", map.get("account"));
				}
			}
		}
		return mav;
	}
	
}
 