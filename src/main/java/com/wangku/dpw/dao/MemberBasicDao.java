package com.wangku.dpw.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wangku.dpw.domain.MemberBasic;
import com.wangku.dpw.util.Page;

public interface MemberBasicDao extends BaseDao<MemberBasic>{
	 public List<MemberBasic> queryMoreList(Map<String,Object> map);
	 public List<MemberBasic> querycorandsupList(@Param("entity") MemberBasic memberBasic, @Param("page") Page<MemberBasic> page);
	 public MemberBasic queryByMemberId(@Param("memberId")Integer memberId);
}
