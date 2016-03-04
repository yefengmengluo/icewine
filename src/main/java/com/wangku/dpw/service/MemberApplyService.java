package com.wangku.dpw.service;

import java.util.List;
import java.util.Map;

import com.wangku.dpw.domain.MemberApply;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

 
public interface MemberApplyService {

	@DataSource("slave")
	public List<MemberApply> queryList(MemberApply memberApply ,Page<MemberApply> page);
	
	@DataSource("slave")
	public MemberApply findById(Integer id);
	
	@DataSource("master")
	public Integer save(MemberApply memberApply);
	
	@DataSource("master")
	public void delete(List<String> codes);
	
}
