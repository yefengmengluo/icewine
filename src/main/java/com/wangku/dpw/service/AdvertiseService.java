package com.wangku.dpw.service;

import java.util.List;

import com.wangku.dpw.domain.Advertise;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

public interface AdvertiseService {
	
	@DataSource("slave")
	public Advertise findById(Integer id);
	
	@DataSource("master")
	public Integer save(Advertise advertise);
	
	@DataSource("master")
	public void delete(List<String> codes);
	
	/*@DataSource("slave")
	public Page<Advertise> findAdvertiseByPage(Advertise Advertise,Page<Advertise> page);
	*/
	@DataSource("slave")
	public List<Advertise> queryList(Advertise advertise,Page<Advertise> page);
	
	@DataSource("slave")
	public List<Advertise> queryFlag(String flag);
}
