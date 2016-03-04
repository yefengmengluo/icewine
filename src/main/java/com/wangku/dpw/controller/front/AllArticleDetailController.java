package com.wangku.dpw.controller.front;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wangku.dpw.domain.Article;
import com.wangku.dpw.domain.ArticleDetail;
import com.wangku.dpw.service.ArticleDetaiService;
import com.wangku.dpw.service.ArticleService;

/**
 * 资讯各大板块所有的资讯详情页
 * @Title: AllArticleDetailController.java 
 * @Description: TODO  
 * @author mlj  
 * @Modified mlj    
 * @date 2015-11-9 下午3:20:10   
 * @version V1.0   
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
@RequestMapping("/newDetial")
public class AllArticleDetailController {
   @Resource
   private ArticleService articleService;
   
   @Resource
   private ArticleDetaiService articleDetaiService;
   
   
	/**
	 * detail(资讯详情的跳转) 
	 * @param article
	 * @param Id
	 * @param modelMap
	 * @return  
	 * String 
	 * @author wk691
	 * @exception  
	 * @since  1.0
	 */
	//新闻资讯模块详情的跳转
	@RequestMapping("/new.html")
	public String arcticleDetail(@RequestParam(value="id",required=false)Integer id,ModelMap modelMap){
		Article article = this.articleService.findById(id);
		ArticleDetail articleDetail =this.articleDetaiService.findyId(article.getId());
		modelMap.addAttribute("article", article);
		modelMap.addAttribute("articleDetail", articleDetail);
		// 新闻资讯相关文章推荐 列表
		List<Article> articleList = this.articleService.queryMoreList("101101");
		modelMap.addAttribute("articleList", articleList);		
		return "theme/articleDetai/newDe";
	}
	//新闻资讯2模块详情的跳转
   @RequestMapping("/detail.html")
	public String detail(Article article,ArticleDetail articleDetail,@RequestParam(value="id",required=false)Integer id,ModelMap modelMap) {
     	
		article = this.articleService.findById(id);
		articleDetail =this.articleDetaiService.findyId(article.getId());
		modelMap.addAttribute("article", article);
		modelMap.addAttribute("articleDetail", articleDetail);
		// 新闻资讯2相关文章推荐 列表
		List<Article> article2 = this.articleService.queryMoreList("101113");
		modelMap.addAttribute("article2", article2);
    return "theme/articleDetai/Detail";
	}
   //酿制工艺模块详情的跳转
   @RequestMapping("/makeDetail.html")
   public String makeDetail(Article article,ArticleDetail articleDetail,@RequestParam(value="id",required=false)Integer id,ModelMap modelMap){
	    article = this.articleService.findById(id);
		articleDetail =this.articleDetaiService.findyId(article.getId());
		modelMap.addAttribute("article", article);
		modelMap.addAttribute("articleDetail", articleDetail);
		//酿制工艺相关文章推荐 列表
		List<Article> makeList = this.articleService.queryMoreList("101102");
		modelMap.addAttribute("makeList", makeList);
	   return "theme/articleDetai/makeDetail";
   }
   //冰酒品牌模块详情的跳转
   @RequestMapping("/brandDe.html")
   public String wineBrandDetail(Article article,ArticleDetail articleDetail,@RequestParam(value="id",required=false)Integer id,ModelMap modelMap){
	    article = this.articleService.findById(id);
		articleDetail =this.articleDetaiService.findyId(article.getId());
		modelMap.addAttribute("article", article);
		modelMap.addAttribute("articleDetail", articleDetail);
		//冰酒品牌相关文章推荐 列表
		List<Article> wineBrandList = this.articleService.queryMoreList("101103");
		modelMap.addAttribute("wineBrandList", wineBrandList);
	   
	   return "theme/articleDetai/brandDetail";
   }
   
   //国际动态模块详情的跳转
   @RequestMapping("/nterDe.html")
   public String nternationalDetail(Article article,ArticleDetail articleDetail,@RequestParam(value="id",required=false)Integer id,ModelMap modelMap){
	    article = this.articleService.findById(id);
		articleDetail =this.articleDetaiService.findyId(article.getId());
		modelMap.addAttribute("article", article);
		modelMap.addAttribute("articleDetail", articleDetail);
		//国际动态相关文章推荐 列表
		List<Article> nternationalList = this.articleService.queryMoreList("101104");
		modelMap.addAttribute("nternationalList", nternationalList);
	   
	   return "theme/articleDetai/nternationalDetail";
   }
   
   //行情价格牌模块详情的跳转
   @RequestMapping("/pricesDe.html")
   public String pricesDetail(Article article,ArticleDetail articleDetail,@RequestParam(value="id",required=false)Integer id,ModelMap modelMap){
	    article = this.articleService.findById(id);
		articleDetail =this.articleDetaiService.findyId(article.getId());
		modelMap.addAttribute("article", article);
		modelMap.addAttribute("articleDetail", articleDetail);
		//行情价格相关文章推荐 列表
		List<Article> pricesList = this.articleService.queryMoreList("101105");
		modelMap.addAttribute("pricesList", pricesList);
	   
	   return "theme/articleDetai/pricesDetail";
   }
   
   //名企访谈模块详情的跳转
   @RequestMapping("/superDe.html")
   public String superDetail(Article article,ArticleDetail articleDetail,@RequestParam(value="id",required=false)Integer id,ModelMap modelMap){
	    article = this.articleService.findById(id);
		articleDetail =this.articleDetaiService.findyId(article.getId());
		modelMap.addAttribute("article", article);
		modelMap.addAttribute("articleDetail", articleDetail);
		//名企访谈相关文章推荐 列表
		List<Article> superList = this.articleService.queryMoreList("101106");
		modelMap.addAttribute("superList", superList);
	   
	   return "theme/articleDetai/brandDetail";
   }
   
   //原料供应模块详情的跳转
   @RequestMapping("/supplyDe.html")
   public String supplyDetail(Article article,ArticleDetail articleDetail,@RequestParam(value="id",required=false)Integer id,ModelMap modelMap){
	    article = this.articleService.findById(id);
		articleDetail =this.articleDetaiService.findyId(article.getId());
		modelMap.addAttribute("article", article);
		modelMap.addAttribute("articleDetail", articleDetail);
		//原料供应相关文章推荐 列表
		List<Article> supplyList = this.articleService.queryMoreList("101107");
		modelMap.addAttribute("supplyList", supplyList);
	   
	   return "theme/articleDetai/supplyDetail";
   }
   
   //冰酒常识模块详情的跳转
   @RequestMapping("/commonDe.html")
   public String commonDetail(Article article,ArticleDetail articleDetail,@RequestParam(value="id",required=false)Integer id,ModelMap modelMap){
	    article = this.articleService.findById(id);
		articleDetail =this.articleDetaiService.findyId(article.getId());
		modelMap.addAttribute("article", article);
		modelMap.addAttribute("articleDetail", articleDetail);
		//冰酒常识相关文章推荐 列表
		List<Article> commonList = this.articleService.queryMoreList("101108");
		modelMap.addAttribute("commonList", commonList);
	   
	   return "theme/articleDetai/commonDetail";
   }
   
   //冰酒博客模块详情的跳转
   @RequestMapping("/bokeDe.html")
   public String bokeDetail(Article article,ArticleDetail articleDetail,@RequestParam(value="id",required=false)Integer id,ModelMap modelMap){
	    article = this.articleService.findById(id);
		articleDetail =this.articleDetaiService.findyId(article.getId());
		modelMap.addAttribute("article", article);
		modelMap.addAttribute("articleDetail", articleDetail);
		//冰酒博客相关文章推荐 列表
		List<Article> bokeList = this.articleService.queryMoreList("101109");
		modelMap.addAttribute("bokeList", bokeList);
	   
	   return "theme/articleDetai/bokeDetail";
   }
   
   
   
}
