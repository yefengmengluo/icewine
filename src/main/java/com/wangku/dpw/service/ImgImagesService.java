package com.wangku.dpw.service;

import java.util.List;


import com.wangku.dpw.domain.ImgImages;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface ImgImagesService {
	
	
	@DataSource("slave")
    public List<ImgImages> queryList(ImgImages imgImages,Page<ImgImages> page);
	
	@DataSource("slave")
	public ImgImages findById(Integer id);
	
	@DataSource("slave")
	public List<ImgImages> queryByList(Integer id);
	
	@DataSource("master")
	public Integer save(ImgImages imgImages);
	
	@DataSource("master")
	public void delete(List<String> codes);
}
