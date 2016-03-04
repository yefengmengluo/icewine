package com.wangku.dpw.controller.front;

 
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 
 * @Title: IceBaseController.java 
 * @Description: 父  
 * @author liuyuchen  
 * @Modified   2015-11-12 上午9:26:43 
 * @date 2015-11-07 上午15:16:49   
 * @version V1.0
 */
public class IceBaseController {
	
	public Map<String, Object> requestForMap(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();

		Map map = request.getParameterMap();
		Set keSet = map.entrySet();
		for (Iterator itr = keSet.iterator(); itr.hasNext();) {
			Map.Entry me = (Map.Entry) itr.next();
			Object ok = me.getKey();
			Object ov = me.getValue();
			String[] value = new String[1];
			if (ov instanceof String[]) {
				value = (String[]) ov;
			} else {
				value[0] = ov.toString();
			}

			StringBuffer sb = new StringBuffer();
			//List li = new ArrayList();
			for (int k = 0; k < value.length; k++) {
				// System.out.println(ok + "=" + value[k]);
				sb.append(value[k]);
				//li.add(value[k]);
			}
			result.put(ok.toString(), sb.toString());
			//result.put(ok.toString(), li);
		}
		int currentPage = 1;
		if(result.containsKey("currentPage")){
			currentPage = Integer.parseInt((String) result.get("currentPage"));
		}
		result.put("currentPage", currentPage);
		int pageSize = 10;
		if(result.containsKey("pageSize")){
			pageSize = Integer.parseInt((String) result.get("pageSize"));
		}
		result.put("pageSize", pageSize);
		result.put("startPage", ((currentPage-1)*pageSize));
		return result;
	}
	
 
	
	/**
	 * 获取当前登录用户的帐号
	 * @param request
	 * @return
	 */
	public String getLoginUserName(HttpServletRequest request){
		HttpSession session = request.getSession();
		Map<String,Object> member = (Map<String,Object>)session.getAttribute("account");
		return (String)member.get("account");
	}

	/**
	 * 获取当前用户id
	 * @param request
	 * @return
	 */
	public Integer getLoginMemberId(HttpServletRequest request){
		HttpSession session = request.getSession();
//		Map<String,Object> member = (Map<String,Object>)session.getAttribute("memberId");
		return (Integer)session.getAttribute("memberId");
	}
	
	 
	
}


