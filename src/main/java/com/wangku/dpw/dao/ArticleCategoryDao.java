package com.wangku.dpw.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wangku.dpw.domain.ArticleCategory;

public interface ArticleCategoryDao extends BaseDao<ArticleCategory>{
	List<ArticleCategory> findBySaId(int id);

	List<ArticleCategory> searchExistNames(Map<String, Object> map);

	List<ArticleCategory> searchListByCodeAndSiteId(Map<String, Object> map);

	void saveBatch(@Param("list")List<ArticleCategory> list);

	void updateById(ArticleCategory articleCategory);

	List<ArticleCategory> findByList(Map<String, Integer> map);
}
