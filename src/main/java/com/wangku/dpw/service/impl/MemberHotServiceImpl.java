package com.wangku.dpw.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wangku.dpw.dao.MemberHotDao;
import com.wangku.dpw.domain.MemberHot;
import com.wangku.dpw.service.MemberHotService;
import com.wangku.dpw.util.Page;

@Service
public class MemberHotServiceImpl implements MemberHotService {
	@Resource
	private MemberHotDao memberHotDao;

	@Override
	public List<MemberHot> queryList(MemberHot memberHot,Page<MemberHot> page) {
		return this.memberHotDao.queryList(memberHot,page);
	}

	@Override
	public MemberHot findById(Integer id) {
		return this.memberHotDao.queryById(id);
	}

	@Override
	public Integer save(MemberHot memberHot) {
	 
		if( memberHot.getMemberId() != null ){
			this.memberHotDao.update(memberHot);
		}else{
			this.memberHotDao.add(memberHot);
		}
		return 1;
	}

	@Override
	public void delete(List<String> codes) {
		this.memberHotDao.delete(codes);
	}

}