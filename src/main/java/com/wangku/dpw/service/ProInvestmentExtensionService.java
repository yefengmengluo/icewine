package com.wangku.dpw.service;

import java.util.List;

import com.wangku.dpw.domain.ProInvestmentExtension;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface ProInvestmentExtensionService {

	@DataSource("slave")
	public List<ProInvestmentExtension> queryList(ProInvestmentExtension proInvestmentExtension ,Page<ProInvestmentExtension> page);
	
	@DataSource("slave")
	public ProInvestmentExtension findById(Integer id);
	
	@DataSource("master")
	public Long save(ProInvestmentExtension proInvestmentExtension);
	
	@DataSource("master")
	public void delete(List<String> codes);
	
}
