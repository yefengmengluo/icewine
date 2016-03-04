package com.wangku.dpw.dao;

import com.wangku.dpw.domain.SysArea;

public interface SysAreaDao extends BaseDao<SysArea> {
	// 地址全名称处理 ,用于采购列表页的名称显示
	public String addressFullNameHaddle(String areaCode);
}
