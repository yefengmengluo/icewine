package com.wangku.dpw.controller.admin;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wangku.dpw.controller.front.IceBaseController;
import com.wangku.dpw.domain.Article;
import com.wangku.dpw.domain.ArticleCategory;
import com.wangku.dpw.domain.ArticleDetail;
import com.wangku.dpw.domain.ProSupply;
import com.wangku.dpw.domain.WebCategory;
import com.wangku.dpw.service.ProSupplyService;
import com.wangku.dpw.service.WebCategoryService;
import com.wangku.dpw.util.Page;

@Controller
@RequestMapping("/prosupply")
public class ProSupplyController extends IceBaseController {

	@Resource
	private ProSupplyService prosupplyService;

	@Resource
	private WebCategoryService webcategoryservice;
	/**
	 * method 发布供应 Date 15-10-27 author Lyc
	 * 
	 */
	@RequestMapping(value = "toadd")
	public String toadd() {
		return "supply/addsupply";
	}

	
	
	@RequestMapping("/deleteSupply")
	public String articleDatele(@RequestParam(value="id")String id){
		if(id!=null&&!"".equals(id)){
		 List<String> ids = new ArrayList<String>();
		   ids.add(id);
			this.prosupplyService.delete(ids);
		}
		return "redirect:/prosupply/getProSupply";
	}
	/**
	 * 
	 * prosupplyUpdate(查看Id) (这里描述这个方法适用条件 – 可选)
	 * 
	 * @param id
	 * @param modelMap
	 * @return String
	 * @exception
	 * @since 1.0
	 */
	@RequestMapping("/updateById")
	public String prosupplyUpdate(@RequestParam(value = "id", required = false) Integer id,ModelMap modelMap) {
		ProSupply prosupply = this.prosupplyService.findById(id);
	    List<WebCategory> webcategory = this.webcategoryservice.queryList(new WebCategory());
	    
		modelMap.addAttribute("category", webcategory);
		modelMap.addAttribute("list", prosupply);
		return "supply/update";
	}

	/**
	 * 
	 * update(修改) (这里描述这个方法适用条件 – 可选)
	 * 
	 * @param proSupply
	 * @return
	 * @throws Exception
	 *             String
	 * @exception
	 * @since 1.0
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ProSupply proSupply) throws Exception {
		this.prosupplyService.save(proSupply);
		return "redirect:/prosupply/getProSupply";
	}

	@RequestMapping(value = "/addSupply", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String addProSupply(ProSupply prosupply, HttpServletRequest request) {
		/* prosupply.setMemberId(super.getLoginUserId(request)); */
		/*
		 * prosupply.setSiteId(10046); prosupplyservice.addProSupply(prosupply);
		 */
		return "supply/addsupply";

	}

	@RequestMapping(value = "/getProSupply", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String getProSupply(ProSupply prosupply, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		Page<ProSupply> page = new Page<ProSupply>(request, response);
		List<ProSupply> list = this.prosupplyService.queryList(prosupply, page);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("list", list);
		return "supply/getList";

	}
}
