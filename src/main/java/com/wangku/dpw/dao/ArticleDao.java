package com.wangku.dpw.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wangku.dpw.domain.Article;
import com.wangku.dpw.util.Page;

public interface ArticleDao extends BaseDao<Article> {
    

	public List<Article> querySingle(Map<String,Object> map);
	
	public List<Article> queryMoreList(@Param("classCode") String classCode);
	
	public List<Article> morePage(@Param("classCode") String classCode,@Param("page") Page<Article> page);
	
	public Long queryCountClassCode(@Param("classCode") String classCode);
	
	public List<Article> recommendList(@Param("dataStatus") String dataStatus);
}
