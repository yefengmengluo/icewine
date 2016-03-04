package com.wangku.dpw.service;

import java.util.List;

import com.wangku.dpw.domain.ProInvestmentJoin;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface ProInvestmentJoinService {

	@DataSource("slave")
	public List<ProInvestmentJoin> queryList(ProInvestmentJoin proInvestmentJoin ,Page<ProInvestmentJoin> page);
	
	@DataSource("slave")
	public ProInvestmentJoin findById(Integer id);
	
	@DataSource("master")
	public Integer save(ProInvestmentJoin proInvestmentJoin);
	
	@DataSource("master")
	public void delete(List<String> codes);
	
}
