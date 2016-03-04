package com.wangku.dpw.service;

import java.util.List;
import java.util.Map;

import com.wangku.dpw.util.Page;
import com.wangku.dpw.domain.MemberHot;
import com.wangku.dpw.util.DataSource;

public interface MemberHotService {

	@DataSource("slave")
	public List<MemberHot> queryList(MemberHot memberHot ,Page<MemberHot> page);
	
	@DataSource("slave")
	public MemberHot findById(Integer id);
	
	@DataSource("master")
	public Integer save(MemberHot memberHot);
	
	@DataSource("master")
	public void delete(List<String> codes);
	
}
