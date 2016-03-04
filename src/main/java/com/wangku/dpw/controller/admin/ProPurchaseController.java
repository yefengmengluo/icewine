package com.wangku.dpw.controller.admin;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.wangku.dpw.domain.ProPurchase;
import com.wangku.dpw.service.ProPurchaseService;
import com.wangku.dpw.util.FileUploadUtil;
import com.wangku.dpw.util.Page;
/**
 * 
  * @author： 亢临丽 2015-10-22
  * @方法名： 
  * @方法描述：
  * @param:
  * @返回值：
  *
 */
@Controller
@RequestMapping("Purchase")
public class ProPurchaseController {
	@Resource
	private ProPurchaseService proPurchaseService;
	@RequestMapping("/list.html")
	public String list(ProPurchase proPurchase,HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
		Page<ProPurchase> page=new Page<ProPurchase>(request,response);
		proPurchaseService.queryList(proPurchase, page);
		modelMap.addAttribute("page", page);
		return "proPurchase/purchaselist";
	}
	@RequestMapping("/check.html")
	public String check(ProPurchase proPurchase,HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
		
		Page<ProPurchase> page=new Page<ProPurchase>(request,response);
		proPurchaseService.queryList(proPurchase, page);
		modelMap.addAttribute("page", page);
		return "proPurchase/purchaselist";
	}
	
   @RequestMapping("/toEdit.html")
	public String toEdit(Integer id,ModelMap modelMap){
	    ProPurchase proPurchaseVO=proPurchaseService.findById(id);
	    modelMap.addAttribute("proPurchase",proPurchaseVO);
		return "proPurchase/purchaseupdate";
	}
   
   @RequestMapping("/detail.html")
	public String detail(Integer id,ModelMap modelMap){
	    ProPurchase proPurchaseVO=proPurchaseService.findById(id);
	    modelMap.addAttribute("proPurchase",proPurchaseVO);
		return "proPurchase/purchasedetail";
	}
   
   @RequestMapping("/add.html")
	public String add(Integer id,ModelMap modelMap){
	    
		return "proPurchase/purchaseadd";
	}
	
   @RequestMapping("/detele.html")
   public String deteleproPurchase(@RequestParam("id")String id){
   	if(id!=null&&!"".equals(id)){
   		 List<String> ids = new ArrayList<String>() ;
				ids.add(id);
				this.proPurchaseService.delete(ids);
   	}   	
   	return "redirect:/Purchase/list.html";
   }

	@RequestMapping("/save.html")
	public String save(ProPurchase proPurchase,HttpServletRequest request,@RequestParam(value="files",required=false)MultipartFile files) throws Exception{
		if(files!=null && files.getSize()>0){
	    	FileUploadUtil.saveFile(files, request);
	    	proPurchase.setPicture(FileUploadUtil.getFilePath()+files.getOriginalFilename());
	    }
		this.proPurchaseService.save(proPurchase);
		return "redirect:/Purchase/list.html";
	}	
	
	//批量操作 推荐、置顶 按钮 
			
			@RequestMapping("checkboxAll")
			public String AllCheckBox(@RequestParam(value="ids",required=false)String ids ,ModelMap modelMap,@RequestParam(value="status",required=false)String status){
				List<Integer> idsList=null;
				if(ids != "" && ids != null){
					String [] arr = ids.split(",") ;
					idsList = new ArrayList<Integer>() ;
					for (int i = 0; i < arr.length; i++) {
						try {
							idsList.add(Integer.parseInt(arr[i])) ;
						} catch (Exception e) {
							break ;
						}
					}
				}
				ProPurchase proInfo = new ProPurchase() ;
				proInfo.setStatus(status);
				this.proPurchaseService.findbybatchUpdateProduct(idsList,proInfo);
				return "redirect:/Purchase/list.html" ;
			}
}
