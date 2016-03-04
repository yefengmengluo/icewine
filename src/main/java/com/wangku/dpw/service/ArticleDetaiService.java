package com.wangku.dpw.service;

import java.util.List;

import com.wangku.dpw.domain.ArticleDetail;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface ArticleDetaiService {
  	
  @DataSource("slave")
  public List<ArticleDetail> queryList(ArticleDetail articleDetail,Page<ArticleDetail> page);
  
  @DataSource("master")
  public Integer add(ArticleDetail ArticleDetail);
  
  
  @DataSource("master")
  public Integer update(ArticleDetail ArticleDetail);
  
  @DataSource("slave")
  public ArticleDetail findyId(Integer id);
  
  @DataSource("master")
  public void datele(List<String> codes);
  
  
  
}
