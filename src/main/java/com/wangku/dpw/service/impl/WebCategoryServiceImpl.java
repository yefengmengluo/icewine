package com.wangku.dpw.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wangku.dpw.dao.WebCategoryDao;
import com.wangku.dpw.domain.WebCategory;
import com.wangku.dpw.service.WebCategoryService;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

@Service
public class WebCategoryServiceImpl implements WebCategoryService {
	@Resource
	private WebCategoryDao webCategoryDao;

	@Override
	public List<WebCategory> queryList(WebCategory webCategory,Page<WebCategory> page) {
		return this.webCategoryDao.queryList(webCategory,page);
	}

	@Override
	public WebCategory findById(Integer id) {
		return this.webCategoryDao.queryById(id);
	}

	@Override
	public Integer save(WebCategory webCategory) {
		if( webCategory.getId() != null ){
			this.webCategoryDao.update(webCategory);
		}else{
			this.webCategoryDao.add(webCategory);
		}
		return webCategory.getId();
	}

	@Override
	public void delete(List<String> codes) {
		this.webCategoryDao.delete(codes);
	}

	@Override
	public List<WebCategory> queryList(WebCategory webCategory) {
		
		return this.webCategoryDao.queryList(webCategory);
		
	}

}