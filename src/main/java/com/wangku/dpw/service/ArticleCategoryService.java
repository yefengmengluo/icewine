package com.wangku.dpw.service;

import java.util.List;


import com.wangku.dpw.domain.ArticleCategory;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface ArticleCategoryService {
	/** 
	* TOP_CATEGORY_CODE:TODO（顶级类别编码标识） 
	* 
	* @since 1.0.0 
	*/
	public static final String TOP_CATEGORY_CODE = "0";
	
	/** 
	* CODE_DEPTH_:TODO（类别编码深度基数） 
	* 
	* @since 1.0.0 第一级类别深度为3，第二级类别深度为6，以此类推
	*/
	public static final int CODE_DEPTH_BASENUM = 3;
   
	@DataSource("slave")
	public List<ArticleCategory> queryList(ArticleCategory articleCategory,Page<ArticleCategory> page);
	
	@DataSource("slave")
	public List<ArticleCategory> queryPage(ArticleCategory articleCategory,Page<ArticleCategory> page);
	
	@DataSource("master")
	public Integer save(ArticleCategory  ArticleCategory);
	
	@DataSource("master")
	public void datele(List<String> codes);
	
	@DataSource("master")
	public ArticleCategory findbyId(Integer id);
	
	@DataSource("slave")
	public List<ArticleCategory> findBySaId(int siteId);
	
	@DataSource("master")
	public String searchExistNames(int caSiteId, String names);
	
	@DataSource("slave")
	public boolean saveAll(ArticleCategory articleCategory);
	
	@DataSource("slave")
	public boolean update(ArticleCategory articleCategory);
	
	@DataSource("slave")
	public List<ArticleCategory> findByList(int caSiteId, int caDataStatus);
	

	
	@DataSource("slave")
	public List<ArticleCategory> queryList(ArticleCategory articleCategory);
}
