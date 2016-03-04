package com.wangku.dpw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wangku.dpw.dao.ArticleDetailDao;
import com.wangku.dpw.domain.ArticleDetail;
import com.wangku.dpw.service.ArticleDetaiService;
import com.wangku.dpw.util.Page;
@Service
public class ArticleDetaiServiceImpl implements ArticleDetaiService {
    @Resource
    private ArticleDetailDao articleDetailDao;
	@Override
	public List<ArticleDetail> queryList(ArticleDetail articleDetail,Page<ArticleDetail> page) {
		List<ArticleDetail> articleDetails = this.queryList(articleDetail, page);
		page.setList(articleDetails);
		page.setCount(this.articleDetailDao.queryCount(articleDetail));
		
		return articleDetails;
	}
	@Override
	public Integer update(ArticleDetail articleDetail) {
		if (articleDetail.getArticleId() != null) {
			this.articleDetailDao.update(articleDetail);
		} 
		return articleDetail.getArticleId();
	}
	@Override
	public Integer add(ArticleDetail articleDetail) {
		
			this.articleDetailDao.add(articleDetail);
			
		return articleDetail.getArticleId();
	}

	@Override
	public ArticleDetail findyId(Integer id) {
		
		return this.articleDetailDao.queryById(id);
	}

	@Override
	public void datele(List<String> codes) {
	  
		this.articleDetailDao.delete(codes);
		
	}

	

}
