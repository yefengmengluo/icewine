package com.wangku.dpw.controller.front;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wangku.dpw.domain.Article;
import com.wangku.dpw.domain.ImgImages;
import com.wangku.dpw.service.ArticleDetaiService;
import com.wangku.dpw.service.ArticleService;
import com.wangku.dpw.service.ImgImagesService;

/**
 * 资讯的前台展示
 * 
 * @Title: ArticleController.java
 * @Description: TODO
 * @author wk691
 * @Modified wk691
 * @date 2015-10-29 下午5:41:17 
 * @version V1.0
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
@RequestMapping("front/article")
public class NewListController {
	@Resource
	private ArticleService articleService;
	@Resource
	private ArticleDetaiService articleDetaiService;
    @Resource
    private ImgImagesService imgImagesService;
	
	
	
	@RequestMapping("/list.html")
	public String indexQuery(Article article,ImgImages imgImages,@RequestParam(value = "id", required = false) Integer id,ModelMap modelMap) {
		// 新闻资讯置顶的查询
		article = this.articleService.querySingle("8", "101101");
		 String lisa =  article.getPictureUrl();
		//图片库的查询
		if(StringUtils.isNoneBlank(lisa)&& StringUtils.isNumeric(lisa)){
			 article.setLocalPic(false) ;
			imgImages = this.imgImagesService.findById(Integer.parseInt(lisa));
			
		 }else if(StringUtils.isNoneBlank(lisa)&& !StringUtils.isNumeric(lisa)){
			 article.setLocalPic(true) ;
		 }
		modelMap.addAttribute("imgImages", imgImages);
		modelMap.addAttribute("article", article);
		// 新闻资讯2 推荐查询
		List<Article> articleList = this.articleService.queryArticleList("8","101113");
		modelMap.addAttribute("articleList", articleList);
		// 酿制工艺
		List<Article> makeWineMore = this.articleService.queryArticleList("16","101102");
		modelMap.addAttribute("makeWineMores", makeWineMore);
		// 冰酒品牌
		
		List<Article> wineBrand = this.articleService.queryArticleList("16","101103");
		 if(wineBrand!=null && wineBrand.size() > 0 ){
			 for (Article article2 : wineBrand) {
				 String lis =  article2.getPictureUrl();
				 if(StringUtils.isNotBlank(lis)&& StringUtils.isNumeric(lis)){
				  article2.setLocalPic(false) ;
				  ImgImages imgs = this.imgImagesService.findById(Integer.parseInt(lis));
				  if(imgs!=null){
					  article2.setImgUrl(imgs.getImgPath()) ;
				  }
				}else if(StringUtils.isNotBlank(lis)&& !StringUtils.isNumeric(lis)){
					article2.setLocalPic(true) ;
				}
			}
		 }
		//图片库的查询
	
		 modelMap.addAttribute("wineBrands", wineBrand) ;
		// 国际动态
		List<Article> nternationalNews = this.articleService.queryArticleList("16", "101104");
		modelMap.addAttribute("nternationalNews", nternationalNews);
		// 行情价格
		List<Article> pricesNews = this.articleService.queryArticleList("16","101105");
		modelMap.addAttribute("pricesNews", pricesNews);
		// 名企访谈
		List<Article> superNews = this.articleService.queryArticleList("16","101106");
		if(superNews!=null && superNews.size() > 0 ){
			 for (Article article2 : superNews) {
				 String lis =  article2.getPictureUrl();
				 if(StringUtils.isNotBlank(lis) && StringUtils.isNumeric(lis)){
				  article2.setLocalPic(false) ; 
				  ImgImages imgs = this.imgImagesService.findById(Integer.parseInt(lis));
				  if(imgs!=null){
					  article2.setImgUrl(imgs.getImgPath()) ;
				  }
				}else if(StringUtils.isNotBlank(lis) && !StringUtils.isNumeric(lis)){
					article2.setLocalPic(true) ;
				}
			}
		 }
		modelMap.addAttribute("superNews", superNews);
		// 原料供应
		List<Article> supplys = this.articleService.queryArticleList("16","101107");
		modelMap.addAttribute("supplys", supplys);
		// 冰酒常识
		
		List<Article> commons = this.articleService.queryArticleList("16","101108");
		if(commons!=null && commons.size() > 0 ){
			 for (Article article2 : commons) {
				 String lis =  article2.getPictureUrl();
				 if(StringUtils.isNotBlank(lis)&& StringUtils.isNumeric(lis)){
					 article2.setLocalPic(false);
				  ImgImages imgs = this.imgImagesService.findById(Integer.parseInt(lis));
				  if(imgs!=null){
					  article2.setImgUrl(imgs.getImgPath()) ;
				  }else if(StringUtils.isNotBlank(lis)&& !StringUtils.isNumeric(lis)){
					  article2.setLocalPic(true);
				  }
				}
			}
		 }
		modelMap.addAttribute("commons", commons);
		// 冰酒博客
		List<Article> bokes = this.articleService.queryArticleList("16","101109");
		modelMap.addAttribute("bokes", bokes);

		return "theme/Article1/Index";
	}

	

    
}
