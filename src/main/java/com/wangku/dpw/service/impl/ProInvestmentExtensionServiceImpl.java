package com.wangku.dpw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wangku.dpw.dao.ProInvestmentExtensionDao;
import com.wangku.dpw.domain.ProInvestmentExtension;
import com.wangku.dpw.service.ProInvestmentExtensionService;
import com.wangku.dpw.util.Page;

@Service
public class ProInvestmentExtensionServiceImpl implements ProInvestmentExtensionService {
	@Resource
	private ProInvestmentExtensionDao proInvestmentExtensionDao;

	@Override
	public List<ProInvestmentExtension> queryList(ProInvestmentExtension proInvestmentExtension,Page<ProInvestmentExtension> page) {
		return this.proInvestmentExtensionDao.queryList(proInvestmentExtension,page);
	}

	@Override
	public ProInvestmentExtension findById(Integer id) {
		return this.proInvestmentExtensionDao.queryById(id);
	}

	@Override
	public Long save(ProInvestmentExtension proInvestmentExtension) {
		if( proInvestmentExtension.getId() != null ){
			this.proInvestmentExtensionDao.update(proInvestmentExtension);
		}else{
			this.proInvestmentExtensionDao.add(proInvestmentExtension);
		}
		return proInvestmentExtension.getId();
	}
	
	@Override
	public void delete(List<String> codes) {
		this.proInvestmentExtensionDao.delete(codes);
	}

}