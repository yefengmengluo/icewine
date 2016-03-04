package com.wangku.dpw.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wangku.dpw.domain.ProInvestment;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface ProInvestmentService {

	@DataSource("slave")
	public List<ProInvestment> queryList(ProInvestment proInvestment,
			Page<ProInvestment> page);

	@DataSource("slave")
	public ProInvestment findById(Integer id);

	@DataSource("master")
	public Integer save(ProInvestment proInvestment);

	@DataSource("master")
	public void delete(List<String> codes);

	// 批量修改招商数据推荐、置顶
	@DataSource("slave")
	public void findbybatchUpdateProduct(@Param("ids") List<Integer> ids,
			ProInvestment proInvestment);
	
	//前台展示数据方法
	@DataSource("slave")
	public ProInvestment queryProInveSingle(String status, String classCode);

	@DataSource("slave")
	public List<ProInvestment> queryProInveList(String status, String classCode);

	@DataSource("slave")
	public List<ProInvestment> queryMoreList(String classCode);
	
	@DataSource("slave")
	public ProInvestment findByIdCode(Integer id);
	

}
