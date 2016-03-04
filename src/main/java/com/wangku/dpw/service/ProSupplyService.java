package com.wangku.dpw.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wangku.dpw.domain.ProSupply;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

 

public interface ProSupplyService {
 
	
	@DataSource("master")
	public Integer addProSupply(ProSupply proSupply);
	
	@DataSource("master")
	public Integer save(ProSupply proSupply);
	
	@DataSource("slave")
    public  List<ProSupply> queryProSupplyList(String classCode);
 
	@DataSource("slave")
	public List<ProSupply> queryMoreList(@Param("classCode") String classCode);
	
	@DataSource("slave")
	public List<ProSupply> morePage(@Param("classCode") String classCode,@Param("page") Page<ProSupply> page);

	@DataSource("slave")
	public Long queryCountClassCode(@Param("classCode") String classCode);

	@DataSource("slave")
	public List<ProSupply> recommendList(@Param("status") String status);
	
	
	


	@DataSource("slave")
	public List<ProSupply> queryList(ProSupply prosupply,Page<ProSupply> page);
	 
	@DataSource("slave")
	public ProSupply findById(Integer id);
 
	@DataSource("master")
	public void delete(List<String> codes);
	
	@DataSource("slave")
	ProSupply querySingle(String Status, String classCode);
	
	@DataSource("slave")
	public List<ProSupply> queryMeIdList(Integer memberId);
	
}
