package com.wangku.dpw.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;
import com.wangku.dpw.dao.AdvertiseDao;
import com.wangku.dpw.domain.Advertise;
import com.wangku.dpw.service.AdvertiseService;
import com.wangku.dpw.util.Page;
@Service
public class AdvertiseServiceImpl implements AdvertiseService {
    @Resource
    private AdvertiseDao advertiseDao;
	@Override
	public Advertise findById(Integer id) {

		return this.advertiseDao.queryById(id);
	}

	@Override
	public Integer save(Advertise advertise) {
		if(advertise.getId()!=null){
			this.advertiseDao.update(advertise);
		}else {
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String DateTime = formatter.format(date);
			advertise.setAddTime(DateTime);
		    this.advertiseDao.add(advertise);
		}
		
		return advertise.getId();
	}

	@Override
	public void delete(List<String> codes) {
		
		this.advertiseDao.delete(codes);
		
		
	}

	@Override
	public List<Advertise> queryList(Advertise advertise, Page<Advertise> page) {
		List<Advertise> advertises=this.advertiseDao.queryList(advertise, page);
		page.setList(advertises);
		page.setCount(this.advertiseDao.queryCount(advertise));
		
		return advertises;
	}

	@Override
	public List<Advertise> queryFlag(String flag) {
		List<Advertise> advertises =this.advertiseDao.queryFlag(flag);
		return advertises;
	}
	
}
