package com.wangku.dpw.service;

import java.util.List;
import com.wangku.dpw.domain.Article;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface ArticleService {
  @DataSource("slave")
  public List<Article> queryList(Article article,Page<Article> page);
  
  @DataSource("master")
  public Integer save(Article article);
  
  @DataSource("slave")
  public Article findById(Integer id);
    
  @DataSource("master")
  public void detelt(List<String> codes);
  
  @DataSource("slave")
  public  Article querySingle(String dataStatus,String classCode);
  
  @DataSource("slave")
  public  List<Article> queryArticleList(String dataStatus,String classCode);
  
  @DataSource("slave")
  public List<Article> queryMoreList(String classCode);
  
  @DataSource("slave")
  public List<Article> morePage(String classCode,Page<Article> page);
  
  /**
   * 
   * recommendList( 资讯推荐查询)  
   * @param dataStatus
   * @return  
   * List<Article> 
   * @author wk691
   * @exception  
   * @since  1.0
   */
  @DataSource("slave")
  public List<Article> recommendList(String dataStatus);
}
