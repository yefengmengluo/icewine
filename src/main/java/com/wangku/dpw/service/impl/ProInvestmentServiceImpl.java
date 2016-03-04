package com.wangku.dpw.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.wangku.dpw.dao.ProInvestmentDao;
import com.wangku.dpw.dao.SysAreaDao;
import com.wangku.dpw.domain.ProInvestment;
import com.wangku.dpw.domain.ProPurchase;
import com.wangku.dpw.service.ProInvestmentService;
import com.wangku.dpw.util.Page;

@Service
public class ProInvestmentServiceImpl implements ProInvestmentService {
	@Resource
	private ProInvestmentDao proInvestmentDao;

	@Resource
	private SysAreaDao sysAreaDao;

	
	@Override
	public List<ProInvestment> queryList(ProInvestment proInvestment,Page<ProInvestment> page) {
		List<ProInvestment> proInvestments=this.proInvestmentDao.queryList(proInvestment, page);
		
		if(!CollectionUtils.isEmpty(proInvestments)){
			for(ProInvestment investment : proInvestments ){
				if(!StringUtils.isEmpty(investment.getAreaCode())){
					investment.setAreaCode(sysAreaDao.addressFullNameHaddle(investment.getAreaCode()));
				}
			}
		}
		
		page.setList(proInvestments);
		page.setCount(this.proInvestmentDao.queryCount(proInvestment));
		return proInvestments;
	}
	@Override
	public ProInvestment findById(Integer id) {
		ProInvestment proInvestment=this.proInvestmentDao.queryById(id);
	if(!StringUtils.isEmpty(proInvestment.getAreaCode())){
		proInvestment.setAreaCode(sysAreaDao.addressFullNameHaddle(proInvestment.getAreaCode()));
	}
		return proInvestment;
	}
	
	@Override
	public ProInvestment findByIdCode(Integer id) {
		ProInvestment proInvestment=this.proInvestmentDao.queryById(id);
	
		return proInvestment;
	}

	@Override
	public Integer save(ProInvestment proInvestment) {
		Date date= new Date();//创建一个时间对象，获取到当前的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间显示格式
		String str = sdf.format(date);//将当前时间格式化为需要的类型
		if( proInvestment.getId() != null ){
			proInvestment.setModifyTime(str);
			this.proInvestmentDao.update(proInvestment);
		}else{
			
			proInvestment.setTimes(str);
			proInvestment.setAddTime(str);
			
			this.proInvestmentDao.add(proInvestment);
		}
		return proInvestment.getId();
	}

	@Override
	public void delete(List<String> codes) {
		this.proInvestmentDao.delete(codes);
	}
	
	
	@Override
	public void findbybatchUpdateProduct(@Param("ids") List<Integer> ids,
			ProInvestment proInvestment) {
		this.proInvestmentDao.batchUpdateProduct(ids, proInvestment);
	}

	@Override
	public ProInvestment queryProInveSingle(String status, String classCode) {
		Map<String,Object> map = new HashMap<String,Object>() ;
		map.put("dataStatus", status) ;
		map.put("classCode", classCode) ;
		List<ProInvestment> proInvestment = this.proInvestmentDao.querySingle(map) ;
		if(proInvestment!=null && proInvestment.size()>0){
			return proInvestment.get(0) ;
		}
		return new ProInvestment() ;
	}
	@Override
	public List<ProInvestment> queryProInveList(String status, String classCode) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", status);
		map.put("classCode", classCode);
        List<ProInvestment> proInvestment =this.proInvestmentDao.querySingle(map);
		if(proInvestment!=null && proInvestment.size()>0){
			return proInvestment;
		}
		return proInvestment;
	}
	@Override
	public List<ProInvestment> queryMoreList(String classCode) {
		List<ProInvestment> proInvestments = this.proInvestmentDao.queryMoreList(classCode);
		if(proInvestments!=null && proInvestments.size()>0){
			return proInvestments;
		}
		return proInvestments;
	}
}