package com.wangku.dpw.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wangku.dpw.domain.ImgImages;
import com.wangku.dpw.service.ImgImagesService;
import com.wangku.dpw.util.Page;
/**
 * 图片库展示
 * @Title: ImgImagesController.java 
 * @Description: TODO  
 * @author wk691  
 * @Modified wk691      
 * @date 2015-11-13 上午10:06:08   
 * @version V1.0   
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
public class ImgImagesController {
	@Resource
	private ImgImagesService imgImagesService;
	
	/**
	 * 
	 * queryList(图片列表) 
	 * @param imgImages
	 * @param modelMap
	 * @param request
	 * @param response
	 * @return  
	 * String 
	 * @exception  
	 * @since  1.0
	 */
	@RequestMapping("/images.html")
	public String queryList(ImgImages imgImages,ModelMap modelMap,HttpServletRequest request,HttpServletResponse response){
		Page<ImgImages> page = new Page<ImgImages>(request,response);
		List<ImgImages> imgImagesList =this.imgImagesService.queryList(imgImages, page);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("imgImages", imgImages);
		modelMap.addAttribute("imgImagesList", imgImagesList);
		return"images/imgImages";
	}

} 
