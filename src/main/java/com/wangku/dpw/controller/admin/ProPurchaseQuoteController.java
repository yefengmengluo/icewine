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

import com.wangku.dpw.domain.ProPurchaseQuote;
import com.wangku.dpw.service.ProPurchaseQuoteService;

@Controller
@RequestMapping("/proPurchaseQuote")
public class ProPurchaseQuoteController {
	private Logger logger = Logger.getLogger(this.getClass());
	@Resource
	private ProPurchaseQuoteService proPurchaseQuoteService;
	
	@RequestMapping("/index")
	public String index(){
		return "/proPurchaseQuote/index";
	}
	
	
	@RequestMapping("/toEdit")
	public ModelAndView toEdit(Integer id){
		ProPurchaseQuote proPurchaseQuote = null;
		if( id != null ){
			proPurchaseQuote = this.proPurchaseQuoteService.findById(id);
		}
		return new ModelAndView("/proPurchaseQuote/edit","proPurchaseQuote",proPurchaseQuote);
	}
	
	@RequestMapping("/delProPurchaseQuote")
	@ResponseBody
	public String delProPurchaseQuote(@RequestParam("codes[]")List<String> codes){
		this.proPurchaseQuoteService.delete(codes);
		return "success";
	}

	@RequestMapping("/save")
	@ResponseBody
	public String save(ProPurchaseQuote proPurchaseQuote){
		Integer id = this.proPurchaseQuoteService.save(proPurchaseQuote);
		return ""+id;
	}
	
	
}
