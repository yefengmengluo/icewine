package com.wangku.dpw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wangku.dpw.dao.ProInvestmentStoreDao;
import com.wangku.dpw.domain.ProInvestmentStore;
import com.wangku.dpw.service.ProInvestmentStoreService;
import com.wangku.dpw.util.Page;

@Service
public class ProInvestmentStoreServiceImpl implements ProInvestmentStoreService {
	@Resource
	private ProInvestmentStoreDao proInvestmentStoreDao;

	@Override
	public List<ProInvestmentStore> queryList(ProInvestmentStore proInvestmentStore,Page<ProInvestmentStore> page) {
		return this.proInvestmentStoreDao.queryList(proInvestmentStore,page);
	}

	@Override
	public ProInvestmentStore findById(Integer id) {
		return this.proInvestmentStoreDao.queryById(id);
	}

	@Override
	public Long save(ProInvestmentStore proInvestmentStore) {
		if( proInvestmentStore.getId() != null ){
			this.proInvestmentStoreDao.update(proInvestmentStore);
		}else{
			this.proInvestmentStoreDao.add(proInvestmentStore);
		}
		return proInvestmentStore.getId();
	}

	@Override
	public void delete(List<String> codes) {
		this.proInvestmentStoreDao.delete(codes);
	}

}