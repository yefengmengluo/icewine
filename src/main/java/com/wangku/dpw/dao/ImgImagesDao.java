package com.wangku.dpw.dao;

import org.apache.ibatis.annotations.Param;

import com.sun.tools.javac.util.List;
import com.wangku.dpw.domain.ImgImages;

public interface ImgImagesDao extends BaseDao<ImgImages> {
	
	public List<ImgImages> queryByList(@Param("id")Integer id);
	

}
