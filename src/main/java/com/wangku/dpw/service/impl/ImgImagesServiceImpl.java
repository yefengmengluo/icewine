package com.wangku.dpw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wangku.dpw.dao.ImgImagesDao;
import com.wangku.dpw.domain.ImgImages;
import com.wangku.dpw.service.ImgImagesService;
import com.wangku.dpw.util.Page;

@Service
public class ImgImagesServiceImpl implements ImgImagesService {
	@Resource
	private ImgImagesDao imgImagesDao;

	@Override
	public List<ImgImages> queryList(ImgImages imgImages, Page<ImgImages> page) {
		List<ImgImages> imgImagesList =this.imgImagesDao.queryList(imgImages,page);
		page.setList(imgImagesList);
		page.setCount(this.imgImagesDao.queryCount(imgImages));
		return imgImagesList;
	}

	@Override
	public ImgImages findById(Integer id) {
		
		return this.imgImagesDao.queryById(id);
	}

	@Override
	public Integer save(ImgImages imgImages) {
		
		if(imgImages.getId()!=null){
			this.imgImagesDao.update(imgImages);
			
		}else{
			this.imgImagesDao.add(imgImages);
		}
		
		
		return imgImages.getId();
	}

	@Override
	public void delete(List<String> codes) {
		this.imgImagesDao.delete(codes);
	}

	@Override
	public List<ImgImages> queryByList(Integer id) {
		
		return this.queryByList(id);
	}

}
