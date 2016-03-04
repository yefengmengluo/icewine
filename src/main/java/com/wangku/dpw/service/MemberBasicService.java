package com.wangku.dpw.service;

import java.util.List;

import com.wangku.dpw.domain.MemberBasic;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;
public interface MemberBasicService {

	@DataSource("slave")
	public List<MemberBasic> queryList(MemberBasic memberBasic ,Page<MemberBasic> page);
	
	@DataSource("slave")
	public MemberBasic findById(Integer id);
	
	@DataSource("master")
	public Integer save(MemberBasic memberBasic);
	@DataSource("master")
	public Integer add(MemberBasic memberBasic)
	;
	@DataSource("master")
	public Integer update(MemberBasic memberBasic);
	
	@DataSource("master")
	public void delete(List<String> codes);
	
	
	//前台展示数据方法
	@DataSource("slave")
	public List<MemberBasic> querycorList(String status, String webCategoryCode);
	
	@DataSource("slave")
	public List<MemberBasic> querycorandsupList(MemberBasic memberBasic,Page<MemberBasic> page);
	@DataSource("slave")
	public MemberBasic queryByMemberId(Integer memberId);
	@DataSource("slave")
	public MemberBasic findByIdCode(Integer id);
	
}
