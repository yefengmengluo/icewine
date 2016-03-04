package com.wangku.dpw.util;

import java.util.HashMap;
import java.util.Map;


public class ResourceType {
	
	public static final Map<String,String> type = new HashMap<String,String>();
	
	
	static{
		//advertise
		type.put("advertise", "广告");
		type.put("message", "我要留言");
		
	}
	
    public static Map<String,String> getType(){
    	
    	
    	return type;
    } 
}
