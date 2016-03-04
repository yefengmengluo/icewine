package com.wangku.dpw.controller.admin;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wangku.dpw.domain.ProInvestmentExtension;
import com.wangku.dpw.service.ProInvestmentExtensionService;

@Controller
@RequestMapping("/proInvestmentExtension")
public class ProInvestmentExtensionController {
	private Logger logger = Logger.getLogger(this.getClass());
	@Resource
	private ProInvestmentExtensionService proInvestmentExtensionService;
	
	@RequestMapping("/index")
	public String index(){
		return "/proInvestmentExtension/index";
	}
	
	
	
	@RequestMapping("/toEdit")
	public ModelAndView toEdit(Integer id){
		ProInvestmentExtension proInvestmentExtension = null;
		if( id != null ){
			proInvestmentExtension = this.proInvestmentExtensionService.findById(id);
		}
		return new ModelAndView("/proInvestmentExtension/edit","proInvestmentExtension",proInvestmentExtension);
	}
	
	@RequestMapping("/delProInvestmentExtension")
	@ResponseBody
	public String delProInvestmentExtension(@RequestParam("codes[]")List<String> codes){
		this.proInvestmentExtensionService.delete(codes);
		return "success";
	}

	@RequestMapping("/save")
	@ResponseBody
	public String save(ProInvestmentExtension proInvestmentExtension){
		Long id = this.proInvestmentExtensionService.save(proInvestmentExtension);
		return ""+id;
	}
	
	
}
