package com.wangku.dpw.service;

import java.util.List;
import java.util.Map;

import com.wangku.dpw.domain.Member;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface MemberService {

	@DataSource("slave")
	public List<Member> queryList(Member member ,Page<Member> page);
	
	@DataSource("slave")
	public Member findById(Integer id);
	
	@DataSource("slave")
	public Map getEntityBymap(Map map);
	
	@DataSource("master")
	public Integer save(Member member);
	
	@DataSource("master")
	public Integer update(Member member);
	
	@DataSource("master")
	public void delete(List<String> codes);
	
	
	
}
