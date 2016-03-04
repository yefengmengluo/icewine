package com.wangku.dpw.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wangku.dpw.dao.ArticleCategoryDao;
import com.wangku.dpw.domain.ArticleCategory;
import com.wangku.dpw.service.ArticleCategoryService;

import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

@Service
public class ArticleCategoryServiceImpl implements ArticleCategoryService{
    @Resource
    private ArticleCategoryDao articleCategoryDao;
	@Override
	public List<ArticleCategory> queryList(ArticleCategory articleCategory,Page<ArticleCategory> page) {
	
		return this.articleCategoryDao.queryList(articleCategory, page);
	}
	@Override
	public List<ArticleCategory> queryPage(ArticleCategory articleCategory,Page<ArticleCategory> page) {
	    List<ArticleCategory> articleCategorys = this.articleCategoryDao.queryList(articleCategory, page);
		page.setList(articleCategorys);
		page.setCount(this.articleCategoryDao.queryCount(articleCategory));
		return articleCategorys;
	}
	@Override
	public Integer save(ArticleCategory articleCategory) {
		if(articleCategory.getId()!=null){
			this.articleCategoryDao.update(articleCategory);
			
		}else{
			this.articleCategoryDao.add(articleCategory);
		}
		return articleCategory.getId();
	}

	@Override
	public void datele(List<String> codes) {
		this.articleCategoryDao.delete(codes);
		
	}

	@Override

	public ArticleCategory findbyId(Integer id) {
		
		return this.articleCategoryDao.queryById(id);
	}
    
	public String genNewcodeByCode(String code,int siteId){
		List<ArticleCategory> articleCategories = null;
		int codeDepth = 0;
		if(TOP_CATEGORY_CODE.equals(code)){
			codeDepth = CODE_DEPTH_BASENUM;
			code = "";
			Map<String ,Object> map = new HashMap<String,Object>();
			map.put("code", code);
			map.put("codeDepth", codeDepth);
			map.put("siteId", siteId);
			articleCategories = articleCategoryDao.searchListByCodeAndSiteId(map);
		}else{
			
			codeDepth = code.length()+CODE_DEPTH_BASENUM;
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("code", code);
			map.put("codeDepth", codeDepth);
			map.put("siteId", siteId);
			articleCategories = articleCategoryDao.searchListByCodeAndSiteId(map);
		}
		
		StringBuilder builder = new StringBuilder();
		builder.append(code);
		
		int size = articleCategories.size();
		size = size + 1;
		if(size<10){
			builder.append("10").append(size);		
			
		}else if(size<100){
			builder.append("1").append(size);
		}else if(size<1000){
			builder.append(size);
		}
		
		return builder.toString();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<ArticleCategory> findBySaId(int siteId) {
		return null;
	}

	@Override
	public String searchExistNames(int caSiteId, String names) {
		return null;
	}

	@Override
	public boolean saveAll(ArticleCategory articleCategory) {
		return false;
	}

	@Override
	public boolean update(ArticleCategory articleCategory) {
		return false;
	}

	@Override
	public List<ArticleCategory> findByList(int caSiteId, int caDataStatus) {
		return null;
	}

	@Override

	public List<ArticleCategory> queryList(ArticleCategory articleCategory) {
	
		return this.articleCategoryDao.queryList(articleCategory);
	}

	

}
