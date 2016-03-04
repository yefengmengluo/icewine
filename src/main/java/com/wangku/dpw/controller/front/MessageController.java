package com.wangku.dpw.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wangku.dpw.domain.Advertise;
import com.wangku.dpw.domain.MemberBasic;
import com.wangku.dpw.service.AdvertiseService;
import com.wangku.dpw.service.MemberBasicService;
import com.wangku.dpw.util.Page;
/**
 * 用户留言
 * @Title: MessageController.java 
 * @Description: TODO  
 * @author mlj
 * @Modified mlj      
 * @date 2015-11-12 上午10:51:42   
 * @version V1.0   
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
public class MessageController {
	@Resource
	private AdvertiseService advertiseService;
	@Resource
	private MemberBasicService memberBasicService;
	
	/**
	 * message(留言跳转) 
	 * (这里描述这个方法适用条件 – 可选) 
	 * @return  
	 * String 
	 * @author wk691
	 * @exception  
	 * @since  1.0
	 */
	@RequestMapping("/message.html")
	public String  message(@RequestParam(value="resourceType",required=true)String resourceType,ModelMap modelMap){
		Advertise advertise = new Advertise();
		advertise.setAdType(resourceType);
	
		return"theme/Ly/Detail";
	}
    /**
     * saveMessage(保存留言的方法) 
     * @param advertise
     * @param request
     * @return  
     * String 
     * @author wk691
     * @exception  
     * @since  1.0
     */
	@RequestMapping("/save.html")
	public String saveMessage(Advertise advertise,HttpServletRequest request){
			this.advertiseService.save(advertise);
			String type = advertise.getAdType().toLowerCase().toString();
			
		return "redirect:/detail.html?resourceType="+type;
	}
	
	/**
	 * 列表留言页面
	 * @param resourceType
	 * @param advertise
	 * @param request
	 * @param response
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/detail.html")
    public String detail(@RequestParam(value="resourceType",required=true)String resourceType, Advertise advertise,HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
		advertise.setAdType(resourceType);
		Page<Advertise> page = new Page<>(request,response);
	    List<Advertise> advertises = this.advertiseService.queryList(advertise, page);
		modelMap.addAttribute("page",page);
		modelMap.addAttribute("advertises",advertises);
		// 单品通推荐
		List<MemberBasic> jinpai = this.memberBasicService.querycorList("8","128");
        modelMap.addAttribute("jinpai", jinpai);
		return"theme/Ly/List"; 
}
}