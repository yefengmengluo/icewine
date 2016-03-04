package com.wangku.dpw.util;
public class ReplicationDataSourceHolder {

	public static final ThreadLocal<String> thread = new ThreadLocal<String>() ;
	
	public static String getDataSource(){
		return thread.get() ;
	}
	
	public static void putDataSource(String dataSourceName){
		thread.set(dataSourceName);
	}
}
