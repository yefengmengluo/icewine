package com.wangku.dpw.controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wangku.dpw.domain.ArticleCategory;
import com.wangku.dpw.service.ArticleCategoryService;
import com.wangku.dpw.util.Page;
/**
 * 资讯类别
 * @Title: ArticleCategoryController.java 
 * @Description: TODO  
 * @author mlj
 * @Modified mlj      
 * @date 2015-10-30 上午11:39:25   
 * @version V1.0   
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
@RequestMapping("/articleCategory")
public class ArticleCategoryController {
  @Resource
  private ArticleCategoryService articleCategoryService;
  /**
   * categoryList(资讯类别查询列表) 
   * @param articleCategory
   * @param request
   * @param response
   * @param modelMap
   * @return  
   * String 
   * @exception  
   * @since  1.0
   */
  @RequestMapping("/list.html")
  public String categoryList(ArticleCategory articleCategory,HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
	
	  Page<ArticleCategory> page = new Page<ArticleCategory>(request,response);
	  List<ArticleCategory> articleCategorys = this.articleCategoryService.queryPage(articleCategory, page); 
	  modelMap.addAttribute("pages", page);
	  modelMap.addAttribute("articleCategory", articleCategorys);
	  return "articleCategory/articleCategoryList";
  }
  /**
   * dateArticleCategory(删除资讯类别的方法) 
   * @param id
   * @return  
   * String 
   * @author wk691
   * @exception  
   * @since  1.0
   */
  @RequestMapping("/delete.html")
  public String dateArticleCategory(@RequestParam(value="id")String id){
	  if(id!=null&&!"".equals(id)){
		  List<String> ids = new ArrayList<>();
		   ids.add(id);
		   this.articleCategoryService.datele(ids);
	  }
	        
	  return"redirect:/articleCategory/list.html";
  }

  /**
   * addActicleCategory(添加跳转方法) 
   * @param articleCategory
   * @param modelMap
   * @return  
   * String 
   * @author wk691
   * @exception  
   * @since  1.0
   */
  
  @RequestMapping("/add.html")
  public String addActicleCategory(ArticleCategory articleCategory,ModelMap modelMap){
	  
	  
	  return"articleCategory/addArticleCategory";
  }
  /**
   * save(资讯添加保存方法) 
   * @param articleCategory
   * @return  
   * String 
   */
  @RequestMapping("/save.html")
  public String save(ArticleCategory articleCategory,HttpServletRequest request){
	  Random rand = new Random();
	  int randNum = rand.nextInt(5) + 30;
	  int number = 101100;
      int a = randNum + number;
      String code = String.valueOf(a);
	  articleCategory.setCode(code);
	  this.articleCategoryService.save(articleCategory);
	                   
	  return "redirect:/articleCategory/list.html";
  }
  /**
   * update(资讯类别修改功能) 
   * @param articleCategory
   * @param id
   * @param modelMap
   * @return  
   * String 
   */
  @RequestMapping("/update.html")
  public String update(ArticleCategory articleCategory,@RequestParam(value="id",required=false)Integer id,ModelMap modelMap){
	 
	  articleCategory =  this.articleCategoryService.findbyId(id);
	  
	  modelMap.addAttribute("articleCategory", articleCategory);
	  
	  return"articleCategory/updateArticleCategory";
  }
  
}
