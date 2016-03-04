package com.wangku.dpw.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wangku.dpw.domain.Article;
import com.wangku.dpw.service.ArticleDetaiService;
import com.wangku.dpw.service.ArticleService;
import com.wangku.dpw.util.Page;

/**
 * 资讯所有板块更多资讯展示
 * 
 * @Title: MoreArticleListController.java
 * @Description: TODO
 * @author mlj
 * @Modified mlj
 * @date 2015-11-9 下午3:42:15
 * @version V1.0
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
@RequestMapping("/more")
public class MoreArticleListController {
	@Resource
	private ArticleService articleService;

	@Resource
	private ArticleDetaiService articleDetaiService;

	/**
	 * moreList(资讯更多的查询) (这里描述这个方法适用条件 – 可选)
	 * 
	 * @param article
	 * @param modelMap
	 * @return String
	 * @exception
	 * @since 1.0
	 */
	// 新闻资讯更多查询
	@RequestMapping("/articleList.html")
	public String moreList(Article article, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		Page<Article> page = new Page<Article>(request, response);
		List<Article> articleMoreList = this.articleService.morePage("101101",
				page);
		modelMap.addAttribute("articleMoreList", articleMoreList);
		modelMap.addAttribute("page", page);

		return "theme/Article1/List";
	}

	// 酿制工艺更多查询
	@RequestMapping("/makeList.html")
	public String moreListArticle2(Article article, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		Page<Article> page = new Page<Article>(request, response);
		List<Article> articleMoreList = this.articleService.morePage("101102",
				page);
		modelMap.addAttribute("articleMoreList", articleMoreList);
		modelMap.addAttribute("page", page);

		return "theme/Article1/makeList";
	}

	// 冰酒品牌
	@RequestMapping("/brandList.html")
	public String wineBrand(Article article, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		Page<Article> page = new Page<Article>(request, response);
		List<Article> articleMoreList = this.articleService.morePage("101103",
				page);
		modelMap.addAttribute("articleMoreList", articleMoreList);
		modelMap.addAttribute("page", page);

		return "theme/Article1/brandList";

	}

	// 国际动态
	@RequestMapping("/nterList.html")
	public String nternationalList(Article article, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		Page<Article> page = new Page<Article>(request, response);
		List<Article> articleMoreList = this.articleService.morePage("101104",
				page);
		modelMap.addAttribute("articleMoreList", articleMoreList);
		modelMap.addAttribute("page", page);

		return "theme/Article1/nterList";

	}

	// 行情价格
	@RequestMapping("/pricesList.html")
	public String pricesList(Article article, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		Page<Article> page = new Page<Article>(request, response);
		List<Article> articleMoreList = this.articleService.morePage("101105",
				page);
		modelMap.addAttribute("articleMoreList", articleMoreList);
		modelMap.addAttribute("page", page);

		return "theme/Article1/pricesList";

	}

	// 名企访谈
	@RequestMapping("/superList.html")
	public String superList(Article article, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		Page<Article> page = new Page<Article>(request, response);
		List<Article> articleMoreList = this.articleService.morePage("101106",
				page);
		modelMap.addAttribute("articleMoreList", articleMoreList);
		modelMap.addAttribute("page", page);

		return "theme/Article1/superList";

	}

	// 原料供应
	@RequestMapping("/supplysList.html")
	public String supplysList(Article article, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		Page<Article> page = new Page<Article>(request, response);
		List<Article> articleMoreList = this.articleService.morePage("101107",
				page);
		modelMap.addAttribute("articleMoreList", articleMoreList);
		modelMap.addAttribute("page", page);

		return "theme/Article1/supplysList";

	}

	// 冰酒常识
	@RequestMapping("/commonsList.html")
	public String commonsList(Article article, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		Page<Article> page = new Page<Article>(request, response);
		List<Article> articleMoreList = this.articleService.morePage("101108",
				page);
		modelMap.addAttribute("articleMoreList", articleMoreList);
		modelMap.addAttribute("page", page);

		return "theme/Article1/commonsList";

	}

	// 冰酒博客
	@RequestMapping("/bokesList.html")
	public String bokesList(Article article, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		Page<Article> page = new Page<Article>(request, response);
		List<Article> articleMoreList = this.articleService.morePage("101109",
				page);
		modelMap.addAttribute("articleMoreList", articleMoreList);
		modelMap.addAttribute("page", page);

		return "theme/Article1/bokesList";

	}
	
	
	//冰酒商讯
	@RequestMapping("/busList.html")
	public String busList(Article article, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		Page<Article> page = new Page<Article>(request, response);
		List<Article> articleMoreList = this.articleService.morePage("101110",
				page);
		modelMap.addAttribute("articleMoreList", articleMoreList);
		modelMap.addAttribute("page", page);

		return "theme/Article1/busList";

	}
}
