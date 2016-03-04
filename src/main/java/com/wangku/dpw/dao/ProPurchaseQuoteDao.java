package com.wangku.dpw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wangku.dpw.domain.ProPurchaseQuote;

public interface ProPurchaseQuoteDao extends BaseDao<ProPurchaseQuote>{
	public List<ProPurchaseQuote> queryListqu(@Param("purId") Integer purId) ;
	public List<ProPurchaseQuote> queryListall(@Param("entity") ProPurchaseQuote proPurchaseQuote) ;
	
	
}
