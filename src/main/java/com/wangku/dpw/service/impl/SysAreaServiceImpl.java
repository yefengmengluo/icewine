package com.wangku.dpw.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.wangku.dpw.dao.SysAreaDao;
import com.wangku.dpw.domain.SysArea;
import com.wangku.dpw.service.SysAreaService;
import com.wangku.dpw.util.Page;

@Service
public class SysAreaServiceImpl implements SysAreaService {
	@Resource
	private SysAreaDao sysAreaDao;

	@Override
	public List<SysArea> queryList(SysArea sysArea, Page<SysArea> page) {
		return this.sysAreaDao.queryList(sysArea, page);
	}

	@Override
	public SysArea findById(Integer id) {
		return this.sysAreaDao.queryById(id);
	}

	@Override
	public Integer save(SysArea sysArea) {
		if (sysArea.getId() != null) {
			this.sysAreaDao.update(sysArea);
		} else {
			this.sysAreaDao.add(sysArea);
		}
		return sysArea.getId();
	}

	@Override
	public void delete(List<String> codes) {
		this.sysAreaDao.delete(codes);
	}

	@Override
	public List<SysArea> cascadeShow(String areaCode, Integer areaCodeLen) {
		return this.sysAreaDao.cascadeShow(areaCode, areaCodeLen);
	}

	// 地址全名称处理 ,用于采购列表页的名称显示
	public String addressFullNameHaddle(String areaCode){
		return sysAreaDao.addressFullNameHaddle(areaCode);
	}
}