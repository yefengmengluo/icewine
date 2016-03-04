package com.wangku.dpw.controller.admin;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.util.StringUtils;
import com.wangku.dpw.controller.front.IceBaseController;
import com.wangku.dpw.domain.Member;
import com.wangku.dpw.service.MemberService;
import com.wangku.dpw.util.MD5Util;

/**
 * 后台用户登录
 * @author wk691
 *
 */
@Controller
public class AdminLoginController extends IceBaseController {
	@Resource
	private MemberService memberService;
	
	@RequestMapping(value="/login.html",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView  login(ModelAndView mav,HttpServletRequest request,HttpServletResponse response,Member member){
		mav.setViewName("/login/login");
		Map<String,Object> map = super.requestForMap(request);
		if(map.get("vcode")==null){
			return mav;
		}
		String pagevcode = ((String) map.get("vcode")).toUpperCase();
		HttpSession session =request.getSession();
		String sysvcode = (String) session.getAttribute("validateCode");
		if(!StringUtils.equals(pagevcode, sysvcode)){
			//验证码不正确
			mav.getModel().put("errorMsg", "1");
			mav.getModel().put("account", map.get("account"));
			mav.getModel().put("password", map.get("password"));
		}else{
			//验证码正确,验证用户名及密码
			Map<String,Object> m  = memberService.getEntityBymap(map);
			if(m == null){
				//用户名或密码不正确	
				mav.getModel().put("errorMsg", "2");
			}else{
				String password = (String)map.get("password");
				password = MD5Util.MD5(password);
				
				if(StringUtils.equals(password , (String)m.get("password"))){
					//验证成功，将登录用户信息存放在session中
					session.setAttribute("account", m.get("account"));
					Long mem = (Long)m.get("memberId");
					session.setAttribute("memberId", mem.intValue());
					// 登陆成功，设置session并设置返回结果页面
					mav.setViewName("redirect:/article/list.html");
				}else{
					mav.getModel().put("errorMsg", "3");
					mav.getModel().put("account", map.get("account"));
				}
			}
		}
		return mav;
	}
 
}
