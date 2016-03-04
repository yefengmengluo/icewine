package com.wangku.dpw.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wangku.dpw.domain.SysArea;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface SysAreaService {

	@DataSource("slave")
	public List<SysArea> queryList(SysArea sysArea, Page<SysArea> page);

	@DataSource("slave")
	public SysArea findById(Integer id);

	@DataSource("master")
	public Integer save(SysArea sysArea);

	@DataSource("master")
	public void delete(List<String> codes);

	@DataSource("master")
	public List<SysArea> cascadeShow(String areaCode, Integer areaCodeLen);

	// 地址全名称处理 ,用于采购列表页的名称显示
	public String addressFullNameHaddle( String areaCode);

}
