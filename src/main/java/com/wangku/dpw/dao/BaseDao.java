package com.wangku.dpw.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wangku.dpw.util.Page;


public interface BaseDao<T> {


	public Integer add(T t);
	
	public T queryById(@Param("id") Object id);

	public Integer update(T t);

	public Integer updateBySelect(T t);

	public Integer delete(@Param("codes") Object id);

	public Long queryCount(@Param("entity") T t);

	public List<T> queryList(@Param("entity") T t, @Param("page") Page<T> page);
	
	public List<T> getAll(@Param("entity") T t);
	
	void deleteAll(List<Integer> list);
	
	public List<T> queryList(@Param("entity") T t);
	
	public Map getEntityBymap(Map map);
 
	public List<T>  cascadeShow(@Param("areaCode")String areaCode , @Param("areaCodeLen") Integer areaCodeLen);
	//地址全名称处理 ,用于采购列表页的名称显示
	public String  addressFullNameHaddle(@Param("areaCode")String areaCode);

}
