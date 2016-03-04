package com.wangku.dpw.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wangku.dpw.domain.Article;
import com.wangku.dpw.service.ArticleService;
import com.wangku.dpw.util.Page;

/**
 * 搜索功能
 * @Title: SearchController.java 
 * @Description: TODO  
 * @author mlj
 * @Modified mlj      
 * @date 2015-11-15 下午5:34:19   
 * @version V1.0   
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
public class SearchController {
	
	@Resource
	private ArticleService articleService;
	
	/**
	 * searchArticle(搜索) 
	 * @param article
	 * @param modelMap
	 * @return  
	 * String 
	 * @author mlj
	 * @exception  
	 * @since  1.0
	 */
	@RequestMapping("/searchPage.html")
	public String searchArticle(Article article,ModelMap modelMap,HttpServletRequest request,HttpServletResponse response){
		Page<Article> page = new Page<Article>(request, response);
		List<Article> articleList = this.articleService.queryList(article, page);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("articleList", articleList);
		return "theme/search/searchPage";
	}
 
}
