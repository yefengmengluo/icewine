package com.wangku.dpw.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wangku.dpw.domain.Article;
import com.wangku.dpw.domain.ArticleCategory;
import com.wangku.dpw.domain.ArticleDetail;
import com.wangku.dpw.domain.ImgImages;
import com.wangku.dpw.service.ArticleCategoryService;
import com.wangku.dpw.service.ArticleDetaiService;
import com.wangku.dpw.service.ArticleService;
import com.wangku.dpw.service.ImgImagesService;
import com.wangku.dpw.util.FileUploadUtil;
import com.wangku.dpw.util.Page;
/**
 * 资讯管理
 * @Title: ArticleController.java 
 * @Description: TODO  
 * @author mlj
 * @Modified mlj   
 * @date 2015-10-26 下午5:48:21   
 * @version V1.0   
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
@RequestMapping("/article")
public class ArticleController {
	@Resource
	private ArticleService articleService;
    @Resource
    private ArticleDetaiService articleDetaiService;
    @Resource
    private ArticleCategoryService articleCategoryService;
    
    @Resource
    private ImgImagesService imgImagesService;
	/**
	 * articleList(资讯的查询方法）
	 * @param article
	 * @param request
	 * @param response
	 * @param modelMap
	 * @return String
	 * @since 1.0
	 */
	@RequestMapping("/list.html")
	public String articleList(Article article,HttpServletRequest request,HttpServletResponse response,@RequestParam(value="dataStatus",required=false)Integer dataStatus,ModelMap modelMap){
		Page<Article> page = new Page<Article>(request,response);
		
		List<Article> articleList = this.articleService.queryList(article, page);	
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("article", article);
		modelMap.addAttribute("articleList", articleList);
		return"article/articlelist";
	}
	
	
	/**
	 * articleDatele(删除资讯的方法) 
	 * @param id
	 * @return  
	 * String 
	 * @exception  
	 * @since  1.0
	 */
	@RequestMapping("/detele.html")
	public String articleDatele(@RequestParam(value="id")String id){
		if(id!=null&&!"".equals(id)){
		 List<String> ids = new ArrayList<String>();
		   ids.add(id);
			this.articleService.detelt(ids);	
		}
		return"redirect:/article/list.html";
	}
	
	
	/**
	 * articleAdd(添加资讯的跳转) 
	 * @param id
	 * @param request
	 * @param modelMap
	 * @return  
	 * String 
	 * @exception  
	 * @since  1.0
	 */
	@RequestMapping("/add.html")
	public String articleAdd(ArticleCategory articleCategory,@RequestParam(value="id", required=false )Integer id,HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
		if(id!=null&&id>0){
			Article article = this.articleService.findById(id);
			modelMap.addAttribute("articles", article);
		}
		//资讯类别的查询
        List<ArticleCategory> articleCategories = this.articleCategoryService.queryList(articleCategory, null);
        modelMap.addAttribute("types", articleCategories);
		return"article/articleadd";
	}
		
	
	/**
	 * articleSave(保存资讯的方法) 
	 * @param article
	 * @param request
	 * @param files
	 * @return  
	 * String 
	 * @author wk691
	 * @exception  
	 * @since  1.0
	 */
	@RequestMapping("/addSave.html")
	public String articleSave(Article article,ArticleDetail articleDetail, HttpServletRequest request,@RequestParam(value="files",required=false)MultipartFile files){
		if(files!=null&&files.getSize()>0){
			FileUploadUtil.saveFile(files, request);
			article.setPictureUrl(FileUploadUtil.getFilePath()+files.getOriginalFilename());
		}
		this.articleService.save(article);	
	    //资讯详情的添加
        String datial =request.getParameter("articleDetail");
		articleDetail.setArticleDetail(datial);
		articleDetail.setArticleId(article.getId());		
		this.articleDetaiService.add(articleDetail);
		return"redirect:/article/list.html";
	}
	
	
	
	/**
	 * articleUpdate(修改资讯的方法) 
	 * @param id
	 * @param modelMap
	 * @return  
	 * String 
	 * @exception  
	 * @since  1.0
	 */
	@RequestMapping("/update.html")
	public String articleUpdate(ImgImages imgImages,ArticleCategory articleCategory,@RequestParam(value="id",required=false)Integer id,ModelMap modelMap){
		
		Article article = this.articleService.findById(id);		
		ArticleDetail articleDetail =this.articleDetaiService.findyId(id);
		//对数据进行为空的判断
		if(StringUtils.isNoneBlank(article.getPictureUrl())){
			imgImages = this.imgImagesService.findById(Integer.parseInt(article.getPictureUrl()));
		}
		//资讯类别的查询
		System.out.println(article.getPictureUrl());
		List<ArticleCategory> articleCategories = this.articleCategoryService.queryList(new ArticleCategory(), null);
	    modelMap.addAttribute("categorys", articleCategories);
        System.out.println(articleCategories);
		modelMap.addAttribute("imgImages", imgImages);
		modelMap.addAttribute("articles", article);
		modelMap.addAttribute("articleDetails", articleDetail);
		return"article/articleupdate";
	}
	
	
	@RequestMapping("/addUpdate.html")
	public String articleUpdate(Article article,ArticleDetail articleDetail, HttpServletRequest request,@RequestParam(value="files",required=false)MultipartFile files){
		if(files!=null&&files.getSize()>0){
			FileUploadUtil.saveFile(files, request);
			article.setPictureUrl(FileUploadUtil.getFilePath()+files.getOriginalFilename());
		}
		this.articleService.save(article);	
	    //资讯详情的添加
        String datial =request.getParameter("articleDetail");
		articleDetail.setArticleDetail(datial);
		/*articleDetail.setArticleId(article.getId());	*/	
		this.articleDetaiService.update(articleDetail);
		return"redirect:/article/list.html";
	}
	
}
