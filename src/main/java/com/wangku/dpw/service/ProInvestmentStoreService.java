package com.wangku.dpw.service;

import java.util.List;

import com.wangku.dpw.domain.ProInvestmentStore;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface ProInvestmentStoreService {

	@DataSource("slave")
	public List<ProInvestmentStore> queryList(ProInvestmentStore proInvestmentStore ,Page<ProInvestmentStore> page);
	
	@DataSource("slave")
	public ProInvestmentStore findById(Integer id);
	
	@DataSource("master")
	public Long save(ProInvestmentStore proInvestmentStore);
	
	@DataSource("master")
	public void delete(List<String> codes);
	
}
