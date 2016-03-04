package com.wangku.dpw.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wangku.dpw.domain.Advertise;

public interface AdvertiseDao extends BaseDao<Advertise>{

	/**
	 * 查询首页置顶的广告
	 */
	public List<Advertise> queryFlag(@Param("flag")String flag);
}
