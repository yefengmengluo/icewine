package com.wangku.dpw.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wangku.dpw.dao.MemberDao;
import com.wangku.dpw.domain.Member;
import com.wangku.dpw.service.MemberService;
import com.wangku.dpw.util.MD5Util;
import com.wangku.dpw.util.Page;
@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDao memberDao;

	@Override
	public List<Member> queryList(Member member,Page<Member> page) {
		List<Member> members = this.memberDao.queryList(member,
				page);
		page.setList(members);
		page.setCount(this.memberDao.queryCount(member));
		return  members;
	}

	@Override
	public Member findById(Integer id) {
		
		return this.memberDao.queryById(id);
	}

	@Override
	public Integer save(Member member) {
		Date date= new Date();//创建一个时间对象，获取到当前的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间显示格式
		String str = sdf.format(date);//将当前时间格式化为需要的类型
		if( member.getMemberId() != null ){
			String pwd=member.getPassword();		  //获取密码
			member.setPassword(MD5Util.MD5(pwd));	 //密码转换MD5	
			member.setModifyTime(str);				//修改时间
			member.setTimes(str);
		    
		this.memberDao.update(member);
		}else{
		String pwd=member.getPassword();		 //获取密码
		member.setPassword(MD5Util.MD5(pwd));	//密码转换MD5
		member.setAddTime(str);				//添加时间
		member.setSiteId(10046);
		member.setTimes(str);
		this.memberDao.add(member);
		
		}
		return member.getMemberId();
	}
	
	@Override
	public Integer update(Member member) {
		Date date= new Date();//创建一个时间对象，获取到当前的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间显示格式
		String str = sdf.format(date);//将当前时间格式化为需要的类型
		if( member.getMemberId() != null ){
			String pwd=member.getPassword();		  //获取密码
			member.setPassword(MD5Util.MD5(pwd));	 //密码转换MD5	
			member.setModifyTime(str);				//修改时间
		this.memberDao.update(member);
		}
		return member.getMemberId();
	}

	@Override
	public void delete(List<String> codes) {
		this.memberDao.delete(codes);
	}

	@Override
	public Map getEntityBymap(Map map) {
		return this.memberDao.getEntityBymap(map);
	}
}