package com.wangku.dpw.service;

import java.util.List;

import com.wangku.dpw.domain.ProSupplyQuote;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;
 

public interface ProSupplyQuoteService {

	@DataSource("slave")
	public List<ProSupplyQuote> queryList(ProSupplyQuote proSupplyQuote ,Page<ProSupplyQuote> page);
	
	@DataSource("slave")
	public ProSupplyQuote findById(Integer id);
	
	@DataSource("master")
	public Integer save(ProSupplyQuote proSupplyQuote);
	
	@DataSource("master")
	public void delete(List<String> codes);
	
}
