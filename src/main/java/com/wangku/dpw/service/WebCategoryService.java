package com.wangku.dpw.service;

import java.util.List;
import java.util.Map;

import com.wangku.dpw.util.Page;
import com.wangku.dpw.domain.WebCategory;
import com.wangku.dpw.util.DataSource;

public interface WebCategoryService {

	@DataSource("slave")
	public List<WebCategory> queryList(WebCategory webCategory ,Page<WebCategory> page);
	
	@DataSource("slave")
	public WebCategory findById(Integer id);
	
	@DataSource("master")
	public Integer save(WebCategory webCategory);
	
	@DataSource("master")
	public void delete(List<String> codes);


	@DataSource("slave")
	public List<WebCategory> queryList(WebCategory webCategory);
	
}
