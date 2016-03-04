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

import com.wangku.dpw.dao.ProSupplyDao;
import com.wangku.dpw.dao.SysAreaDao;
import com.wangku.dpw.domain.ProSupply;
import com.wangku.dpw.service.ProSupplyService;
import com.wangku.dpw.util.Page;

@Service
public class ProSupplyServiceImpl implements ProSupplyService {

	@Resource
	private ProSupplyDao prosupplydao;

	@Resource
	private SysAreaDao sysAreaDao;
	/*
	 * @Override public Integer addProSupply(ProSupply proSupply) { int pid =
	 * sequenceUtil.getIntSeqNextVal("seq_pro_supply"); proSupply.setAddTime(new
	 * Date()); proSupply.setStatus("ProSupplyStatus.default_status");
	 * prosupplydao.addProSupply(proSupply); // TODO Auto-generated method stub
	 * return null; return pid;
	 * 
	 * }
	 */

	@Override
	public List<ProSupply> queryList(ProSupply prosupply, Page<ProSupply> page) {
		List<ProSupply> prosupplys = this.prosupplydao.queryList(prosupply,
				page);
		if(!CollectionUtils.isEmpty(prosupplys)){
			for(ProSupply prosup : prosupplys ){
				if(!StringUtils.isEmpty(prosup.getAreaCode())){
					prosup.setAreaCode(sysAreaDao.addressFullNameHaddle(prosup.getAreaCode()));
				}
			}
		}
		page.setList(prosupplys);
		page.setCount(this.prosupplydao.queryCount(prosupply));
		return prosupplys;

	}

	@Override
	public Integer addProSupply(ProSupply proSupply) {

		return 1;

	}

	@Override
	public ProSupply findById(Integer id) {

		return prosupplydao.queryById(id);
	}

	@Override
	public void delete(List<String> codes) {

		 this.prosupplydao.delete(codes);

	}

	 
	 
	
	@Override
	public Integer save(ProSupply proSupply) {
		int result=0;
		if(proSupply.getId() != null){
			Date Time =  new Date();
			SimpleDateFormat  formatter =  new  SimpleDateFormat("yyyy-MM-DD HH:mm:ss");
			String DateTime =  formatter.format(Time);
			proSupply.setModifyTime(Time);
			 result =this.prosupplydao.update(proSupply);
			}else{
				this.prosupplydao.add(proSupply);
			}
		return result ;
		// TODO Auto-generated method stub return null;
		
	}

	@Override
	public ProSupply querySingle(String Status, String classCode) {
		Map<String,Object> map = new HashMap<String,Object>() ;
		map.put("status", Status) ;
		map.put("classCode", classCode) ;
		List<ProSupply> prosupply = this.prosupplydao.querySingle(map) ;
		if(prosupply!=null && prosupply.size()>0){
			return prosupply.get(0) ;
		}
		return new ProSupply() ;
	}

	@Override
	public List<ProSupply> queryMoreList(@Param("classCode") String classCode) {
		List<ProSupply> prosupply = this.prosupplydao.queryMoreList(classCode);
		if(prosupply!=null && prosupply.size()>0){
			return prosupply;
		}
		return prosupply;
		
	}

	@Override
	public List<ProSupply> morePage(@Param("classCode") String classCode,
			@Param("page") Page<ProSupply> page) {
		List<ProSupply> prosupplys = this.prosupplydao.morePage(classCode,page);
		page.setList(prosupplys);
		page.setCount(this.prosupplydao.queryCountClassCode(classCode));		
		return prosupplys;
		
		// TODO Auto-generated method stub return null;
		
	}

	@Override
	public Long queryCountClassCode(@Param("classCode") String classCode) {
		return null;
		
		// TODO Auto-generated method stub return null;
		
	}

	@Override
	public List<ProSupply> recommendList(@Param("status") String status) {
		List<ProSupply> prosupplys =this.prosupplydao.recommendList(status);
		if(prosupplys!=null && prosupplys.size()>0){
			return prosupplys;
		}
		return prosupplys;
		
		// TODO Auto-generated method stub return null;
		
	}
	
	@Override
	public List<ProSupply> queryProSupplyList(String classCode) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("classCode", classCode);
        List<ProSupply> prosupplys =this.prosupplydao.querySingle(map);
		if(prosupplys!=null && prosupplys.size()>0){
			return prosupplys;
			
		}
		return prosupplys;
	}

	@Override
	public List<ProSupply> queryMeIdList(Integer memberId) {
		
		return this.prosupplydao.queryMeIdList(memberId);
	}

 

}
