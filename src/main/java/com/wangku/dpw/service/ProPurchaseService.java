package com.wangku.dpw.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wangku.dpw.domain.ProInvestment;
import com.wangku.dpw.domain.ProPurchase;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface ProPurchaseService {

	@DataSource("slave")
	public List<ProPurchase> queryList(ProPurchase proPurchase ,Page<ProPurchase> page);
	
	@DataSource("slave")
	public ProPurchase findById(Integer id);
	
	@DataSource("master")
	public Integer save(ProPurchase proPurchase);
	
	@DataSource("master")
	public void delete(List<String> codes);
	
	

	@DataSource("slave")
	public void findbybatchUpdateProduct(@Param("ids")List<Integer> ids , ProPurchase proPurchase); 
	
	
	//前台展示数据方法
	@DataSource("slave")
	public ProPurchase queryProPurSingle(String status, String classCode);

	@DataSource("slave")
	public List<ProPurchase> queryProPurList(String status, String classCode);

	@DataSource("slave")
	public List<ProPurchase> queryMoreList(String classCode);
	
	
}
