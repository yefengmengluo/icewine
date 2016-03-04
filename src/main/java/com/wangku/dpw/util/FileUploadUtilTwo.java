package com.wangku.dpw.util;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * @Title: FileUploadUtil.java 
 * @Description: TODO  文件上传处理类，后期加入文件系统中
 * @author yangpeng 
 * @Modified yangpeng      
 * @date 2015年8月2日 下午5:13:04   
 * @version V1.0   
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
public class FileUploadUtilTwo {

	// 后期加入配置文件中，
	public static final String FILE_UPLOAD_PATH = "upload/" ;
	/***
	 * 保存文件 POST请求
	 * @param file 
	 * @return
	 */
	public static String saveFile(MultipartFile file,HttpServletRequest request) {
		String filePath = "" ;
		String dynamicPath = FileUploadUtilTwo.getFilePath()  ;
		// 判断文件是否为空
		if (!file.isEmpty()) {
			try {
				// 文件保存路径
				String basePath = request.getSession().getServletContext().getRealPath("/")  ;
				//String basePath = "E:/icewine_uploadFile/" ;
				dynamicPath += file.getOriginalFilename() ; 
				filePath = basePath + dynamicPath ;
				File f = new File(filePath) ;
				if(!f.exists()){
					f.mkdirs();
				}
				// 转存文件
				file.transferTo(new File(filePath));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(dynamicPath);
		return dynamicPath;
	}
	
	/**
	 * getFilePath(自定义文件上传路径) 
	 * @return  
	 * String 
	 * @author yangpeng
	 * @exception  
	 * @since  1.0
	 */
	public static String getFilePath(){
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss/") ;
		String path = df.format(new Date()) ;
		return FileUploadUtilTwo.FILE_UPLOAD_PATH + path ;
	}
}
