package com.wangku.dpw.controller.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wangku.dpw.domain.Advertise;
import com.wangku.dpw.service.AdvertiseService;
import com.wangku.dpw.util.FileUploadUtil;
import com.wangku.dpw.util.Page;
import com.wangku.dpw.util.ResourceType;

/**
 * @Title: 广告模块管理
 * @Description: TODO  
 * @author mlj
 * @Modified wk691      
 * @date 2015-10-21 下午5:45:45   
 * @version V1.0   
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
@RequestMapping("/advertise")
public class AdvertiseController {
@Resource
private AdvertiseService advertiseService;

	 /**
     * queryList(查询广告的方法) 
     * @param advertise
     * @param request
     * @param response
     * @param modelMap
	 * @param type 
     * @return  
     * String 
     * @exception  
     * @since  1.0
     */
	@RequestMapping("/list.html")
	public String queryPage(@RequestParam(value="resourceType",required=true)String resourceType, HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
		Advertise advertise = new Advertise();
		advertise.setAdType(resourceType);
		Page<Advertise> page = new Page<Advertise>(request, response);
		List<Advertise> advertiselist = this.advertiseService.queryList(advertise, page);
		modelMap.addAttribute("page",page );		
		modelMap.addAttribute("advertise",advertise );
		modelMap.addAttribute("advertiselist",advertiselist );
		return "advertise/advertiselist";

	}
	/**
	 * addAdvertise(添加广告) 
	 * @param id
	 * @param request
	 * @param modelMap
	 * @return  
	 * String 
	 */
    @RequestMapping("/add.html")
	public String addAdvertise(@RequestParam(value="id", required=false )Integer id,@RequestParam(value="resourceType",required=true)String resourceType,HttpServletRequest request,ModelMap modelMap ){
    	
		if(id!=null&&id>0){

			Advertise advertise = this.advertiseService.findById(id);

			modelMap.addAttribute("advertises", advertise);
		}	
		modelMap.addAttribute("advertise",ResourceType.type) ;
		
		return"advertise/advertiseadd";
	}
    /**
     * saveAdvertise(保存广告) 
     * @param advertise
     * @param type 
     * @return  
     * String 
     */
    @RequestMapping("/save.html")
    public String saveAdvertise(Advertise advertise,HttpServletRequest request,@RequestParam(value="files",required=false)MultipartFile files){
	    if(files!=null && files.getSize()>0){
	    	FileUploadUtil.saveFile(files, request);
	    	advertise.setImg(FileUploadUtil.getFilePath()+files.getOriginalFilename());
	    }
	    
	   this.advertiseService.save(advertise);
	   String type = advertise.getAdType().toLowerCase().toString();
	   
	   return"redirect:/advertise/list.html?resourceType="+type;
	   
	   
   }
    /**
     * deteleAdvertise(删除广告的方法) 
     * @param id
     * @param type 
     * @return  
     * String 
     */
    @RequestMapping("/detele.html")
    public String deteleAdvertise(@RequestParam(value="resourceType",required=true)String resourceType,@RequestParam("id")String id){
    	if(id!=null&&!"".equals(id)){
    		 List<String> ids = new ArrayList<String>() ;
				ids.add(id);
				this.advertiseService.delete(ids);
    	} 
    	String type = resourceType.toLowerCase().toString() ;
    	return"redirect:/advertise/list.html?resourceType="+type;
    }
    /**   
     * updateAdver(修改广告的方法) 
     * @return  
     * String 
     * @exception  
     * @since  1.0
     */
    @RequestMapping("/update.html")
    public String updateAdver(@RequestParam(value="id",required=false)Integer id,ModelMap modelMap,@RequestParam(value="resourceType",required=true)String resourceType){
    	modelMap.addAttribute("advertise",ResourceType.type) ;
    	Advertise advertise = this.advertiseService.findById(id);
    	modelMap.addAttribute("advertises", advertise);
    	
       return"advertise/advertiseupdate";	
    }
    /**
     * queryList(查询留言管理的方法) 
     * @param advertise
     * @param request
     * @param response
     * @param modelMap
	 * @param type 
     * @return  
     * String 
     * @exception  
     * @since  1.0
     */
	@RequestMapping("/messagelist.html")
	public String messagePage(@RequestParam(value="resourceType",required=true)String resourceType, HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
		Advertise advertise = new Advertise();
		advertise.setAdType(resourceType);
		Page<Advertise> page = new Page<Advertise>(request, response);
		List<Advertise> advertiselist = this.advertiseService.queryList(advertise, page);
		modelMap.addAttribute("page",page );		
		modelMap.addAttribute("advertise",advertise );
		modelMap.addAttribute("advertiselist",advertiselist );
		return "message/messagelist";

	}
	
	 /**
     * deteleAdvertise(删除留言的方法) 
     * @param id
     * @param type 
     * @return  
     * String 
     */
    @RequestMapping("/deteleMessage.html")
    public String deteleMessage(@RequestParam(value="resourceType",required=true)String resourceType,@RequestParam("id")String id){
    	if(id!=null&&!"".equals(id)){
    		 List<String> ids = new ArrayList<String>() ;
				ids.add(id);
				this.advertiseService.delete(ids);
    	} 
    	String type = resourceType.toLowerCase().toString() ;
    	return"redirect:/advertise/messagelist.html?resourceType="+type;
    }
    
     /**
      * 回复留言的页面跳转
      * @return
      */     
     @RequestMapping("/reply.html")
     public String replyMessage(@RequestParam(value="id",required=false)Integer id,ModelMap modelMap,@RequestParam(value="resourceType",required=true)String resourceType){
     	modelMap.addAttribute("advertise",ResourceType.type) ;
     	Advertise advertise = this.advertiseService.findById(id);
     	modelMap.addAttribute("advertises", advertise);
     	
     	return"message/replaymessage";
     }
     /**
      * 
      * @param advertise
      * @param request
      * @return
      */
	@RequestMapping("/saveReply.html")
	public String saveReply(Advertise advertise, HttpServletRequest request) {
         //回复时间
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String DateTime = formatter.format(date);
		advertise.setReplyTime(DateTime);
		
		this.advertiseService.save(advertise);
		
		String type = advertise.getAdType().toLowerCase().toString();

		return "redirect:/advertise/messagelist.html?resourceType=" + type;

	}
    
     
}
