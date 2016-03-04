package com.wangku.dpw.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wangku.dpw.domain.ProInvestment;

public interface ProInvestmentDao extends BaseDao<ProInvestment>{
	public void batchUpdateProduct(@Param("ids") List<Integer> ids,@Param("entity")ProInvestment proInvestment) ;
    public List<ProInvestment> querySingle(Map<String,Object> map);
	public List<ProInvestment> queryMoreList(@Param("classCode") String classCode);
}
