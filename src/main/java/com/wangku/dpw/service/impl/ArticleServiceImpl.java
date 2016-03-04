package com.wangku.dpw.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wangku.dpw.dao.ArticleDao;
import com.wangku.dpw.domain.Article;
import com.wangku.dpw.service.ArticleService;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;
@Service
public class ArticleServiceImpl implements ArticleService {
    @Resource
    private ArticleDao articleDao;
    
	@Override
	public List<Article> queryList(Article article, Page<Article> page) {
      List<Article> articles = this.articleDao.queryList(article, page);
      page.setList(articles);
      page.setCount(this.articleDao.queryCount(article));
	  return articles;
	}
    
	@Override
	public List<Article> morePage(String classCode, Page<Article> page) {
		List<Article> articles = this.articleDao.morePage(classCode,page);
		page.setList(articles);
		page.setCount(this.articleDao.queryCountClassCode(classCode));		
		return articles;
	}
	
	@Override
	public Integer save(Article article) {
      if(article.getId()!=null){
			Date Time = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String DateTime = formatter.format(Time);
			article.setMdfyTime(DateTime); 
			article.setTimes(DateTime);
		    article.setStatus("1");
    	    this.articleDao.update(article); 
      }else{
    	  Date time = new Date();
    	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	  String Datetime = formatter.format(time);
    	  article.setAddTime(Datetime);
    	  article.setTimes(Datetime);
    	  article.setStatus("1");
    
    	  this.articleDao.add(article); 
    	
   }
		return article.getId();
	}
    
	
	@Override
	public Article findById(Integer id) {
	
		return this.articleDao.queryById(id);
	}

	
	@Override
	public void detelt(List<String> codes) {
		
	  this.articleDao.delete(codes);
		
	}


	@Override
	public Article querySingle(String dataStatus, String classCode) {
		Map<String,Object> map = new HashMap<String,Object>() ;
		map.put("dataStatus", dataStatus) ;
		map.put("classCode", classCode) ;
		List<Article> articles = this.articleDao.querySingle(map) ;
		if(articles!=null && articles.size()>0){
			return articles.get(0) ;
		}
		return new Article() ;
	}


	@Override
	public List<Article> queryArticleList(String dataStatus, String classCode) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("dataStatus", dataStatus);
		map.put("classCode", classCode);
        List<Article> articles =this.articleDao.querySingle(map);
		if(articles!=null && articles.size()>0){
			return articles;
			
		}
		return articles;
	}
	@Override
	public List<Article> queryMoreList(String classCode) {
		List<Article> articles = this.articleDao.queryMoreList(classCode);
		if(articles!=null && articles.size()>0){
			return articles;
		}
		return articles;
	}

	@Override
	public List<Article> recommendList(String dataStatus) {
		List<Article> articles =this.articleDao.recommendList(dataStatus);
		if(articles!=null && articles.size()>0){
			return articles;
		}
		return articles;
	}


	
}
