package com.wangku.dpw.service;

import java.util.List;

import com.wangku.dpw.domain.ProPurchaseQuote;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface ProPurchaseQuoteService {

	@DataSource("slave")
	public List<ProPurchaseQuote> queryList(ProPurchaseQuote proPurchaseQuote ,Page<ProPurchaseQuote> page);
	@DataSource("slave")
	public List<ProPurchaseQuote> queryList(ProPurchaseQuote proPurchaseQuote);
	@DataSource("slave")
	public List<ProPurchaseQuote> queryListall(ProPurchaseQuote proPurchaseQuote);
	
	@DataSource("slave")
	public ProPurchaseQuote findById(Integer id);
	
	@DataSource("master")
	public Integer save(ProPurchaseQuote proPurchaseQuote);
	
	@DataSource("master")
	public void delete(List<String> codes);
	
	@DataSource("slave")
	public List<ProPurchaseQuote> queryListqu(Integer purId);
	
	@DataSource("slave")
	public List<ProPurchaseQuote> queryListByid(ProPurchaseQuote proPurchaseQuote);
	
}
