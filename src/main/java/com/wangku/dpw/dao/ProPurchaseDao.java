package com.wangku.dpw.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wangku.dpw.domain.ProPurchase;

public interface ProPurchaseDao extends BaseDao<ProPurchase>{
	public void batchUpdateProduct(@Param("ids") List<Integer> ids,@Param("entity")ProPurchase proPurchase) ;
	
    public List<ProPurchase> querySingle(Map<String,Object> map);
    
    public List<ProPurchase> queryMoreList(@Param("categoryCode") String categoryCode);
    
}
