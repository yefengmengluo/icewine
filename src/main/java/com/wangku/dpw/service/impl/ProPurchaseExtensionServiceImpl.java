package com.wangku.dpw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wangku.dpw.dao.ProPurchaseExtensionDao;
import com.wangku.dpw.domain.ProPurchaseExtension;
import com.wangku.dpw.service.ProPurchaseExtensionService;
import com.wangku.dpw.util.Page;

@Service
public class ProPurchaseExtensionServiceImpl implements ProPurchaseExtensionService {
	@Resource
	private ProPurchaseExtensionDao proPurchaseExtensionDao;

	@Override
	public List<ProPurchaseExtension> queryList(ProPurchaseExtension proPurchaseExtension,Page<ProPurchaseExtension> page) {
		return this.proPurchaseExtensionDao.queryList(proPurchaseExtension,page);
	}

	@Override
	public ProPurchaseExtension findById(Integer id) {
		return this.proPurchaseExtensionDao.queryById(id);
	}

	@Override
	public Long save(ProPurchaseExtension proPurchaseExtension) {
		if( proPurchaseExtension.getId() != null ){
			this.proPurchaseExtensionDao.update(proPurchaseExtension);
		}else{
			this.proPurchaseExtensionDao.add(proPurchaseExtension);
		}
		return proPurchaseExtension.getId();
	}

	@Override
	public void delete(List<String> codes) {
		this.proPurchaseExtensionDao.delete(codes);
	}

}