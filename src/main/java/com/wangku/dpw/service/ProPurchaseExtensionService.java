package com.wangku.dpw.service;

import java.util.List;

import com.wangku.dpw.domain.ProPurchaseExtension;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface ProPurchaseExtensionService {

	@DataSource("slave")
	public List<ProPurchaseExtension> queryList(ProPurchaseExtension proPurchaseExtension ,Page<ProPurchaseExtension> page);
	
	@DataSource("slave")
	public ProPurchaseExtension findById(Integer id);
	
	@DataSource("master")
	public Long save(ProPurchaseExtension proPurchaseExtension);
	
	@DataSource("master")
	public void delete(List<String> codes);
	
}
