package com.wangku.dpw.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wangku.dpw.dao.ProPurchaseQuoteDao;
import com.wangku.dpw.domain.ProPurchaseQuote;
import com.wangku.dpw.service.ProPurchaseQuoteService;
import com.wangku.dpw.util.DataSource;
import com.wangku.dpw.util.Page;


@Service
public class ProPurchaseQuoteServiceImpl implements ProPurchaseQuoteService {
	@Resource
	private ProPurchaseQuoteDao proPurchaseQuoteDao;

	@Override
	public List<ProPurchaseQuote> queryList(ProPurchaseQuote proPurchaseQuote,Page<ProPurchaseQuote> page) {
		List<ProPurchaseQuote> proPurchaseQuotes= this.proPurchaseQuoteDao.queryList(proPurchaseQuote,page);
		 page.setList(proPurchaseQuotes);
		 
		 page.setCount(proPurchaseQuoteDao.queryCount(proPurchaseQuote));
		
		return proPurchaseQuotes;
	}
	
	

	@Override
	public ProPurchaseQuote findById(Integer id) {
		return this.proPurchaseQuoteDao.queryById(id);
	}

	@Override
	public Integer save(ProPurchaseQuote proPurchaseQuote) {
		Date date= new Date();//创建一个时间对象，获取到当前的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间显示格式
		String str = sdf.format(date);//将当前时间格式化为需要的类型
		if( proPurchaseQuote.getId() != null ){
			proPurchaseQuote.setModifyTime(str);
			this.proPurchaseQuoteDao.update(proPurchaseQuote);
		}else{
		
			proPurchaseQuote.setAddTime(str);
			this.proPurchaseQuoteDao.add(proPurchaseQuote);
		}
		return proPurchaseQuote.getId();
	}

	@Override
	public void delete(List<String> codes) {
		this.proPurchaseQuoteDao.delete(codes);
	}



	@Override
	public List<ProPurchaseQuote> queryListqu(Integer purId) {
		return this.proPurchaseQuoteDao.queryListqu(purId);
	}
	@Override
	public List<ProPurchaseQuote> queryList(ProPurchaseQuote proPurchaseQuote) {
		// TODO Auto-generated method stub
		return proPurchaseQuoteDao.queryList(proPurchaseQuote);
	}
	
	@Override
	public List<ProPurchaseQuote> queryListByid(ProPurchaseQuote proPurchaseQuote) {
		
		return proPurchaseQuoteDao.queryList(proPurchaseQuote);
	}



	@Override
	public List<ProPurchaseQuote> queryListall(ProPurchaseQuote proPurchaseQuote) {
		// TODO Auto-generated method stub
		return this.proPurchaseQuoteDao.queryListall(proPurchaseQuote);
	}

}