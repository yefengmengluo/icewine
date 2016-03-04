package com.wangku.dpw.domain;

import java.io.Serializable;

public class ArticleDetail implements Serializable {
	/** 
	* serialVersionUID:TODO（用一句话描述这个变量表示什么） 
	* 
	* @since 1.0.0 
	*/
	private static final long serialVersionUID = -5636000371388805402L;
	private Integer articleId;//资讯id
	private String articleDetail;//资讯详细信息
	
// setter and getter
	public Integer getArticleId(){
		return articleId;
	}
	
	public void setArticleId(Integer articleId){
		this.articleId = articleId;
	}
	public String getArticleDetail(){
		return articleDetail;
	}
	
	public void setArticleDetail(String articleDetail){
		this.articleDetail = articleDetail;
	}
}
