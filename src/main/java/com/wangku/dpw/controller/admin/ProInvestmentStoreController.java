package com.wangku.dpw.controller.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wangku.dpw.domain.ProInvestmentStore;
import com.wangku.dpw.service.ProInvestmentStoreService;

@Controller
@RequestMapping("/proInvestmentStore")
public class ProInvestmentStoreController {
	private Logger logger = Logger.getLogger(this.getClass());
	@Resource
	private ProInvestmentStoreService proInvestmentStoreService;
	
	@RequestMapping("/index")
	public String index(){
		return "/proInvestmentStore/index";
	}
	

	
	@RequestMapping("/toEdit")
	public ModelAndView toEdit(Integer id){
		ProInvestmentStore proInvestmentStore = null;
		if( id != null ){
			proInvestmentStore = this.proInvestmentStoreService.findById(id);
		}
		return new ModelAndView("/proInvestmentStore/edit","proInvestmentStore",proInvestmentStore);
	}
	
	@RequestMapping("/delProInvestmentStore")
	@ResponseBody
	public String delProInvestmentStore(@RequestParam("codes[]")List<String> codes){
		this.proInvestmentStoreService.delete(codes);
		return "success";
	}

	@RequestMapping("/save")
	@ResponseBody
	public String save(ProInvestmentStore proInvestmentStore){
		Long id = this.proInvestmentStoreService.save(proInvestmentStore);
		return ""+id;
	}
	
	
}
