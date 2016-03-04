package com.wangku.dpw.util;
import java.lang.reflect.Method;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.MethodSignature;

/**


/**
 * 
 * @Title: ReplicationDataSourceAspect.java 
 * @Description: TODO  加载数据源
 * @author yangpeng 
 * @Modified yangpeng      
 * @date 2015年7月20日 上午9:47:21   
 * @version V1.0   
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
public class ReplicationDataSourceAspect {

	
	public void before(JoinPoint joinpoint){
		Object target = joinpoint.getTarget() ;
		String method = joinpoint.getSignature().getName() ;
		
		Class<?>[] clazz = target.getClass().getInterfaces() ;
		Class<?>[] parameterTypes = ((MethodSignature)joinpoint.getSignature()).getMethod().getParameterTypes() ;
		try {
			Method m = clazz[0].getMethod(method, parameterTypes) ;
			if(m!=null && m.isAnnotationPresent(DataSource.class)) {
				DataSource source = m.getAnnotation(DataSource.class) ;
				ReplicationDataSourceHolder.putDataSource(source.value());
			}
		} catch (Exception e) {
		}
 	}
}
