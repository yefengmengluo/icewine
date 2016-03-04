package com.wangku.dpw.controller.front;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wangku.dpw.domain.ImgImages;
import com.wangku.dpw.domain.ProSupply;
import com.wangku.dpw.domain.WebCategory;
import com.wangku.dpw.service.ImgImagesService;
import com.wangku.dpw.service.ProSupplyService;
import com.wangku.dpw.service.WebCategoryService;
import com.wangku.dpw.util.FileUploadUtil;
import com.wangku.dpw.util.Page;

/**
 * 会员供应数据
 * @author mlj
 *2015-11-25
 */
@Controller
@RequestMapping("front/member/supply")
public class UserSupplyController {
	@Resource
	private ProSupplyService proSupplyService;
	@Resource
	private ImgImagesService imgImagesService;
	@Resource
	private WebCategoryService webcategoryservice;
	/**
	 * 产品列表
	 * @return
	 */
	@RequestMapping("/list.html")
	public String getProSupply(ProSupply prosupply, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap,ImgImages imgImages) { 		 
		Page<ProSupply> page = new Page<ProSupply>(request, response);
		List<ProSupply> list = this.proSupplyService.queryList(prosupply, page);				 
		
		 if(list!=null && list.size() > 0 ){
			 //加强循环list里set字段
			 for (ProSupply article2 : list) {
				 //获取关联的图片字段，通过关联字段查询图片表
				 String lis =  article2.getPic();
				 //1.判断字段不为空 && 判断字段是数字还是一个链接形式的
				 if(StringUtils.isNotBlank(lis) && StringUtils.isNumeric(lis)){
					 imgImages = this.imgImagesService.findById(Integer.parseInt(lis));
					 //StringUtils.isNumeric(lis)当返回为false时，为数字形式
					 article2.setLocalPic(false) ;
					 //判断图片库这个条数据是否存在
				  if(imgImages!=null){					
 					  article2.setImgUrl(imgImages.getImgPath()) ;
				  }
				}else if(StringUtils.isNotBlank(lis) && !StringUtils.isNumeric(lis)){
   				   article2.setImgUrl(lis) ;
   				  //StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
					article2.setLocalPic(true) ;
				}
			}
		 }
		 
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("list", list);
		return"theme/userCenterSupply/supplylist";
	}
	/**
	 *删除方法
	 * @param id
	 * @return
	 */
    @RequestMapping("/detele.html")
	public String deteleSupply(@RequestParam(value="id")String id){
    	if(id!=null&&!"".equals(id)){
   		 List<String> ids = new ArrayList<String>();
   		   ids.add(id);
   			this.proSupplyService.delete(ids);	
   		}
		
		return"redirect:/front/member/supply/list.html";
	}
    /**
     * 修改的方法
     * @param prosupply
     * @param id
     * @param modelMap
     * @return
     */
    @RequestMapping("/update.html")
    public String updateSupply(ProSupply prosupply,@RequestParam(value="id",required=false)Integer id,ModelMap modelMap ){
    	prosupply=this.proSupplyService.findById(id);
    	
    	modelMap.addAttribute("prosupply", prosupply);
    	return"theme/userCenterSupply/supplyUpdate";
    }
    
    
    /**
     * 产品添加跳转
     * @param prosupply
     * @param modelMap
     * @return
     */
    @RequestMapping("/add.html")
	public String addsupply(ProSupply prosupply,ModelMap modelMap){	
    	
    	 List<WebCategory> webcategory = this.webcategoryservice.queryList(new WebCategory());
		 modelMap.addAttribute("category", webcategory);
		return"theme/userCenterSupply/supplyadd";
	}
    /**
     * 保存产品方法
     * @param proSupply
     * @param files
     * @param request
     * @return
     */
    @RequestMapping("/save.html")
    public String saveSupply(ProSupply proSupply,@RequestParam(value="files",required=false)MultipartFile files,HttpServletRequest request,ModelMap modelMap){
		if(files!=null&&files.getSize()>0){
			FileUploadUtil.saveFile(files, request);
			proSupply.setPic(FileUploadUtil.getFilePath()+files.getOriginalFilename());
		}
		 
		this.proSupplyService.save(proSupply);
		
    	return"redirect:/front/member/supply/list.html";
    }
    
}
