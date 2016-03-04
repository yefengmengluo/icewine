package com.wangku.dpw.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wangku.dpw.dao.ProInvestmentJoinDao;
import com.wangku.dpw.domain.ProInvestmentJoin;
import com.wangku.dpw.service.ProInvestmentJoinService;
import com.wangku.dpw.util.Page;

@Service
public class ProInvestmentJoinServiceImpl implements ProInvestmentJoinService {
	@Resource
	private ProInvestmentJoinDao proInvestmentJoinDao;

	@Override
	public List<ProInvestmentJoin> queryList(ProInvestmentJoin proInvestmentJoin,Page<ProInvestmentJoin> page) {
		return this.proInvestmentJoinDao.queryList(proInvestmentJoin,page);
	}

	@Override
	public ProInvestmentJoin findById(Integer id) {
		return this.proInvestmentJoinDao.queryById(id);
	}

	@Override
	public Integer save(ProInvestmentJoin proInvestmentJoin) {
		if( proInvestmentJoin.getId() != null ){
			this.proInvestmentJoinDao.update(proInvestmentJoin);
		}else{
			this.proInvestmentJoinDao.add(proInvestmentJoin);
		}
		return proInvestmentJoin.getId();
	}

	@Override
	public void delete(List<String> codes) {
		this.proInvestmentJoinDao.delete(codes);
	}

}