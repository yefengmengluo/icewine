/*package com.wangku.dpw.controller.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wangku.dpw.domain.ProInvestmentJoin;
import com.wangku.dpw.service.ProInvestmentJoinService;
import com.wangku.dpw.util.Page;

@Controller
@RequestMapping("/proInvestmentJoin")
public class ProInvestmentJoinController {
	private Logger logger = Logger.getLogger(this.getClass());
	@Resource
	private ProInvestmentJoinService proInvestmentJoinService;
	
	@RequestMapping("/index")
	public String index(){
		return "/proInvestmentJoin/index";
	}
	
	@RequestMapping("/datagrid")
	@ResponseBody
	public List<ProInvestmentJoin> datagrid(Page pager){
		return this.proInvestmentJoinService.queryPage(pager);
	}
	
	@RequestMapping("/toEdit")
	public ModelAndView toEdit(Integer id){
		ProInvestmentJoin proInvestmentJoin = null;
		if( id != null ){
			proInvestmentJoin = this.proInvestmentJoinService.findById(id);
		}
		return new ModelAndView("/proInvestmentJoin/edit","proInvestmentJoin",proInvestmentJoin);
	}
	
	@RequestMapping("/delProInvestmentJoin")
	@ResponseBody
	public String delProInvestmentJoin(@RequestParam("codes[]")List<String> codes){
		this.proInvestmentJoinService.delete(codes);
		return "success";
	}

	@RequestMapping("/save")
	@ResponseBody
	public String save(ProInvestmentJoin proInvestmentJoin){
		Integer id = this.proInvestmentJoinService.save(proInvestmentJoin);
		return ""+id;
	}
	
	@RequestMapping("/findAll")
	@ResponseBody
	public List<Map<String,Object>> findAll(){
		return this.proInvestmentJoinService.findAll();
	}
}
*/