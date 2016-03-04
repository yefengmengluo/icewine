package com.wangku.dpw.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.wangku.dpw.dao.MemberBasicDao;
import com.wangku.dpw.dao.SysAreaDao;
import com.wangku.dpw.domain.MemberBasic;
import com.wangku.dpw.service.MemberBasicService;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;

@Service
public class MemberBasicServiceImpl implements MemberBasicService {
	@Resource
	private MemberBasicDao memberBasicDao;
	
	@Resource
	private SysAreaDao sysAreaDao;

	@Override
	public List<MemberBasic> queryList(MemberBasic memberBasic,Page<MemberBasic> page) {
		List<MemberBasic> memberBasics = this.memberBasicDao.queryList(memberBasic,
				page);
		page.setList(memberBasics);
		page.setCount(this.memberBasicDao.queryCount(memberBasic));
		return memberBasics;
	}

	@Override
	public MemberBasic findById(Integer id) {
		MemberBasic memberBasic=this.memberBasicDao.queryById(id);
		if(!StringUtils.isEmpty(memberBasic.getDealInAreaCode())){
			memberBasic.setDealInAreaCode(sysAreaDao.addressFullNameHaddle(memberBasic.getDealInAreaCode()));
		}
	
		return memberBasic;
	}
	
	@Override
	public MemberBasic findByIdCode(Integer id) {
		MemberBasic memberBasic=this.memberBasicDao.queryById(id);
		return memberBasic;
	}

	@Override
	public Integer save(MemberBasic memberBasic) {
	
		if( memberBasic.getMemberId() != null ){
			this.memberBasicDao.update(memberBasic);
		}else{
			memberBasic.setTimes(new Date());
			this.memberBasicDao.add(memberBasic);
		}
		return memberBasic.getMemberId();
	}
	
	
	
	@Override
	public Integer update(MemberBasic memberBasic) {
		if(memberBasic.getMemberId() != null){
			Date date = new Date();
			/*SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = format.format(date);*/
			memberBasic.setModifyTime( date );
			memberBasic.setTimes(date);
		    this.memberBasicDao.update(memberBasic);
		}
		return memberBasic.getMemberId();
	}
	
	
	
	

	@Override
	public void delete(List<String> codes) {
		this.memberBasicDao.delete(codes);
	}

	
	@Override
	public List<MemberBasic> querycorList(String status, String webCategoryCode) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", status);
		map.put("webCategoryCode", webCategoryCode);
        List<MemberBasic> mem =this.memberBasicDao.queryMoreList(map);
		if(mem!=null && mem.size()>0){
			return mem;
		}
		return mem;
	}

	@Override
	public List<MemberBasic> querycorandsupList(MemberBasic memberBasic,Page<MemberBasic> page) {
		
		List<MemberBasic> memberBasics = this.memberBasicDao.querycorandsupList(memberBasic,page);
		if(!CollectionUtils.isEmpty(memberBasics)){
			for(MemberBasic memberBasic1 : memberBasics ){
				if(!StringUtils.isEmpty(memberBasic1.getDealInAreaCode())){
					memberBasic1.setDealInAreaCode(sysAreaDao.addressFullNameHaddle(memberBasic1.getDealInAreaCode()));
				}
			}
		}
		page.setList(memberBasics);
		page.setCount(this.memberBasicDao.queryCount(memberBasic));
		return memberBasics;
	}

	@Override
	public MemberBasic queryByMemberId(Integer memberId) {
		
		return this.memberBasicDao.queryByMemberId(memberId);
	}

	@Override
	public Integer add(MemberBasic memberBasic) {
		// TODO Auto-generated method stub
		return this.memberBasicDao.add(memberBasic);
	}

	
	
	

}