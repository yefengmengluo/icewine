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

import com.wangku.dpw.dao.ProPurchaseDao;
import com.wangku.dpw.dao.SysAreaDao;
import com.wangku.dpw.domain.ProPurchase;
import com.wangku.dpw.service.ProPurchaseService;
import com.wangku.dpw.util.Page;

@Service
public class ProPurchaseServiceImpl implements ProPurchaseService {
	@Resource
	private ProPurchaseDao proPurchaseDao;
	@Resource
	private SysAreaDao sysAreaDao;

	@Override
	public List<ProPurchase> queryList(ProPurchase proPurchase,Page<ProPurchase> page) {
		
		List<ProPurchase> proPurchases=this.proPurchaseDao.queryList(proPurchase, page);
		if(!CollectionUtils.isEmpty(proPurchases)){
			for(ProPurchase purchase : proPurchases ){
				if(!StringUtils.isEmpty(purchase.getSupplierAddr())){
					purchase.setSupplierAddr(sysAreaDao.addressFullNameHaddle(purchase.getSupplierAddr()));
				}
				if(!StringUtils.isEmpty(purchase.getDeliveryAddr())){
					purchase.setDeliveryAddr(sysAreaDao.addressFullNameHaddle(purchase.getDeliveryAddr()));
				}
			}
		}
		page.setList(proPurchases);
		page.setCount(this.proPurchaseDao.queryCount(proPurchase));
		return proPurchases;
	}
	
	
	

	@Override
	public ProPurchase findById(Integer id) {
		ProPurchase proPurchase=this.proPurchaseDao.queryById(id);
		Date Time = new Date();		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String DateTime=formatter.format(Time);
		proPurchase.setEndTime(DateTime);
		return this.proPurchaseDao.queryById(id);
	}

	@Override
	public Integer save(ProPurchase proPurchase) {
		Date date= new Date();//创建一个时间对象，获取到当前的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间显示格式
		String str = sdf.format(date);//将当前时间格式化为需要的类型
		if( proPurchase.getId() != null ){
			
			proPurchase.setModifyTime(str);
			this.proPurchaseDao.update(proPurchase);
			
		}else{
			proPurchase.setAddTime(str);
			proPurchase.setTimes(str);
			this.proPurchaseDao.add(proPurchase);
		}
		return proPurchase.getId();
	}

	@Override
	public void delete(List<String> codes) {
		this.proPurchaseDao.delete(codes);
	}

	
	@Override
	public void findbybatchUpdateProduct(@Param("ids") List<Integer> ids,
			ProPurchase proPurchase) {
		this.proPurchaseDao.batchUpdateProduct(ids, proPurchase);
	}

	@Override
	public ProPurchase queryProPurSingle(String status, String categoryCode) {
		Map<String,Object> map = new HashMap<String,Object>() ;
		map.put("dataStatus", status) ;
		map.put("categoryCode", categoryCode) ;
		List<ProPurchase> proPurchases = this.proPurchaseDao.querySingle(map) ;
		if(proPurchases!=null && proPurchases.size()>0){
			return proPurchases.get(0) ;
		}
		return new ProPurchase() ;
	}

	@Override
	public List<ProPurchase> queryProPurList(String status, String categoryCode) {
		Map<String,Object> map = new HashMap<String,Object>() ;
		map.put("status", status) ;
		map.put("categoryCode", categoryCode) ;
		List<ProPurchase> proPurchases = this.proPurchaseDao.querySingle(map) ;
		if(proPurchases!=null && proPurchases.size()>0){
			return proPurchases ;
		}
		return proPurchases ;
	}

	@Override
	public List<ProPurchase> queryMoreList(String classCode) {
		List<ProPurchase> proPurchases = this.proPurchaseDao.queryMoreList(classCode);
		if(proPurchases!=null && proPurchases.size()>0){
			return proPurchases;
		}
		return proPurchases;
	}




}