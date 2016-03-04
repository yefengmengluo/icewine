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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.wangku.dpw.domain.Member;
import com.wangku.dpw.domain.ProInvestment;
import com.wangku.dpw.service.MemberService;
import com.wangku.dpw.service.ProInvestmentService;
import com.wangku.dpw.util.FileUploadUtil;
import com.wangku.dpw.util.Page;
/**
 * 
  * 
  * @author： 亢临丽 2015-11-6
  * @方法名： 
  * @方法描述：招商版块
  * @param:
  * @返回值：
  *
 */
@Controller
@RequestMapping("proInvestment")
public class ProInvestmentController {
	
	@Resource
	private ProInvestmentService proInvestmentService;
	@Resource
	private MemberService memberService;
	@RequestMapping("/list.html")
	public String list(ProInvestment proInvestment,HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
		Page<ProInvestment> page=new Page<ProInvestment>(request,response);
		proInvestmentService.queryList(proInvestment, page);
		modelMap.addAttribute("page", page);
		return "/proInvestment/proInvestmentlist";
	}
	//添加招商
	@RequestMapping("/add.html")
	public String add(@RequestParam(value="id", required=false )Integer id,ModelMap modelMap){
		modelMap.addAttribute("id", id);
		return "/proInvestment/proInvestmentadd";
	}
	
	
	//操作已推荐、已置顶
	@RequestMapping("/check.html")
	public String check(ProInvestment proInvestment,HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
		Page<ProInvestment> page=new Page<ProInvestment>(request,response);
		proInvestmentService.queryList(proInvestment, page);
		modelMap.addAttribute("page", page);
		return "/proInvestment/proInvestmentlist";
	}
	//编辑招商数据
	@RequestMapping("/toEdit.html")
	public String toEdit(@RequestParam(value="id", required=false )Integer id,ModelMap modelMap){
		ProInvestment proInvestment = null;
		if( id != null ){
			proInvestment = this.proInvestmentService.findByIdCode(id);
		}
		
		Member member=this.memberService.findById(proInvestment.getMemberId());
		modelMap.addAttribute("member", member);
		modelMap.addAttribute("proInvestment", proInvestment);
		return "/proInvestment/proInvestmentupdate";
	}
	//查看招商数据
	@RequestMapping("/detail.html")
	public String detail(@RequestParam(value="id", required=false )Integer id,ModelMap modelMap){
		ProInvestment proInvestment = null;
		if( id != null ){
			proInvestment = this.proInvestmentService.findByIdCode(id);
		}
		
		Member member=this.memberService.findById(proInvestment.getMemberId());
		modelMap.addAttribute("member", member);
		modelMap.addAttribute("proInvestment", proInvestment);
		return "/proInvestment/proInvestmentdetail";
	}
	//删除数据
	@RequestMapping("/delProInvestment.html")
	public String delProInvestment(@RequestParam("id")String id){
		if(id!=null&&!"".equals(id)){
	   		 List<String> ids = new ArrayList<String>() ;
					ids.add(id);
					this.proInvestmentService.delete(ids);
	   	}   	
	   	return "redirect:/proInvestment/list.html";
	}
	//保存招商会员数据
	@RequestMapping("/save.html")
	public String save(ProInvestment proInvestment,Member member,HttpServletRequest request,@RequestParam(value="files",required=false)MultipartFile files){
		if(files!=null && files.getSize()>0){
	    	FileUploadUtil.saveFile(files, request);
	    	proInvestment.setPic(FileUploadUtil.getFilePath()+files.getOriginalFilename());
	    }
		this.proInvestmentService.save(proInvestment);
		this.memberService.save(member);
		return "redirect:/proInvestment/list.html";
	}
	
	/**
	 * 
	 * @param ids
	 * @param modelMap
	 * @param status
	 * @return
	 */
	//批量操作 推荐、置顶 按钮 
		@ResponseBody
		@RequestMapping("checkboxAll")
		public String AllCheckBox(@RequestParam(value="ids",required=false)String ids ,ModelMap modelMap,@RequestParam(value="status",required=false)String status){
			List<Integer> idsList=null;
			if(ids != "" && ids != null){
				String [] arr = ids.split(",");
				idsList = new ArrayList<Integer>() ;
				for (int i = 0; i < arr.length; i++) {
					try {
						idsList.add(Integer.parseInt(arr[i])) ;
					} catch (Exception e) {
						break ;
					}
				}
			}
			ProInvestment proInfo = new ProInvestment() ;
			proInfo.setStatus(status) ;
			this.proInvestmentService.findbybatchUpdateProduct(idsList,proInfo);
			return "" ;
		}
}
