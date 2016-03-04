package com.wangku.dpw.controller.admin;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wangku.dpw.domain.ProPurchaseExtension;
import com.wangku.dpw.service.ProPurchaseExtensionService;

@Controller
@RequestMapping("/proPurchaseExtension")
public class ProPurchaseExtensionController {
	private Logger logger = Logger.getLogger(this.getClass());
	@Resource
	private ProPurchaseExtensionService proPurchaseExtensionService;
	
	@RequestMapping("/index")
	public String index(){
		return "/proPurchaseExtension/index";
	}
	
	
	
	@RequestMapping("/toEdit")
	public ModelAndView toEdit(Integer id){
		ProPurchaseExtension proPurchaseExtension = null;
		if( id != null ){
			proPurchaseExtension = this.proPurchaseExtensionService.findById(id);
		}
		return new ModelAndView("/proPurchaseExtension/edit","proPurchaseExtension",proPurchaseExtension);
	}
	
	@RequestMapping("/delProPurchaseExtension")
	@ResponseBody
	public String delProPurchaseExtension(@RequestParam("codes[]")List<String> codes){
		this.proPurchaseExtensionService.delete(codes);
		return "success";
	}

	@RequestMapping("/save")
	public String save(ProPurchaseExtension proPurchaseExtension){
		Long id = this.proPurchaseExtensionService.save(proPurchaseExtension);
		return ""+id;
	}
	
}
