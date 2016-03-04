package com.wangku.dpw.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wangku.dpw.domain.ProSupply;
import com.wangku.dpw.util.Page;

public interface ProSupplyDao extends BaseDao<ProSupply> {
	

	public List<ProSupply> querySingle(Map<String,Object> map);
	
	public List<ProSupply> queryMoreList(@Param("classCode") String classCode);
	
	public List<ProSupply> morePage(@Param("classCode") String classCode,@Param("page") Page<ProSupply> page);
	
	public Long queryCountClassCode(@Param("classCode") String classCode);
	
	public List<ProSupply> recommendList(@Param("status") String status);
	
	
	public List<ProSupply> queryMeIdList(@Param("memberId")Integer memberId);
}
