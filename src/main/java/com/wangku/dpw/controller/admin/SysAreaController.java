package com.wangku.dpw.controller.admin;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wangku.dpw.domain.SysArea;
import com.wangku.dpw.service.SysAreaService;

@Controller
@RequestMapping("/sysArea")
public class SysAreaController {
//	private Logger logger = Logger.getLogger(this.getClass());
	@Resource
	private SysAreaService sysAreaService;
	
	@RequestMapping("/index")
	public String index(){
		return "/sysArea/index";
	}
	
	
	
	@RequestMapping("/toEdit")
	public ModelAndView toEdit(Integer id){
		SysArea sysArea = null;
		if( id != null ){
			sysArea = this.sysAreaService.findById(id);
		}
		return new ModelAndView("/sysArea/edit","sysArea",sysArea);
	}
	
	@RequestMapping("/delSysArea")
	@ResponseBody
	public String delSysArea(@RequestParam("codes[]")List<String> codes){
		this.sysAreaService.delete(codes);
		return "success";
	}

	@RequestMapping("/save")
	@ResponseBody
	public String save(SysArea sysArea){
		Integer id = this.sysAreaService.save(sysArea);
		return ""+id;
	}
	
	/**
	 * 
	 * @param areaCode 地区编码(父级)
	 * @param areaCodeLen(子级的地区编码长度)
	 * @return 子级地区列表
	 */
	@RequestMapping("/cascadeShow/{areaCode}/{areaCodeLen}/sysArea.html")
	@ResponseBody
	public List<SysArea> cascadeShow(@PathVariable String areaCode,@PathVariable Integer areaCodeLen){
//		areaCode = "101";
//		areaCodeLen = 6;
		List<SysArea> sysAreas = this.sysAreaService.cascadeShow(areaCode, areaCodeLen);
		return sysAreas;
	}
	
	
}
