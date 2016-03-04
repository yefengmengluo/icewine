package com.wangku.dpw.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wangku.dpw.domain.Member;
import com.wangku.dpw.domain.MemberBasic;
import com.wangku.dpw.service.MemberBasicService;
import com.wangku.dpw.service.MemberService;
import com.wangku.dpw.util.Page;



@Controller
@RequestMapping("/member")
public class MemberController {

	@Resource
	private MemberService   memberservice;
	@Resource
	private MemberBasicService memberBasicService;
	
	
	@RequestMapping("/addmember")
	public String addMember(){
		return "member/addMeber";
	}
	
	
	
	/**
	 * 
	 * getMemberList(查询所有会员) 
	 * (这里描述这个方法适用条件 – 可选) 
	 * @param member
	 * @param request
	 * @param response
	 * @param modelMap
	 * @return  View
	 * String 
	 * @exception  
	 * @since  1.0
	 */
	
	@RequestMapping("list.html")
	public String  getMemberList(Member member,MemberBasic memberBasic,HttpServletRequest  request,HttpServletResponse  response,ModelMap modelMap)
	{
		Page<Member> page = new Page<Member>(request,response);
		List<Member> Memberlist = this.memberservice.queryList(member, page);
		if(Memberlist!=null&&Memberlist.size()>0){
			for(Member member2 : Memberlist){
				int lis = member2.getMemberId();
				if(lis>0){
					memberBasic = this.memberBasicService.findById(lis);
					String name = memberBasic.getCorporationName();
					member2.setCompanyname(name);
			        
					
				}
			}
			
		}
		
		modelMap.addAttribute("page",page);
		modelMap.addAttribute("member",member);
		modelMap.addAttribute("list",Memberlist);
		return "member/listMember";
		
	 
	}
	/**
	 *  删除会员的方法
	 * @param memberId
	 * @return
	 */
	@RequestMapping("/detele.html")
	public String deteleMember(@RequestParam(value="memberId")String memberId){
		if(memberId!=null&&!"".equals(memberId)){
			  List<String> ids = new ArrayList<>();
			   ids.add(memberId);
			   this.memberservice.delete(ids);
			   this.memberBasicService.delete(ids);
		  }
		
		
		
		return"redirect:/member/list.html";
	}

	/**
	 * 修改会员的跳转
	 * @param memberId
	 * @param modelMap
	 * @return
	 */
	
	@RequestMapping("/update.html")
	public String  gotoupdate(Member member,MemberBasic memberBasic,@RequestParam(value="id",required=false)Integer id,ModelMap modelMap){
		member=this.memberservice.findById(id);
		memberBasic=this.memberBasicService.findById(id);
		modelMap.addAttribute("member",member);
		modelMap.addAttribute("memberBasic",memberBasic);
		return"member/memberupdate";
	}
	
	/**
	 * 修改后保存
	 * @param member
	 * @param memberBasic
	 * @return
	 */
	@RequestMapping("/save.html")
	public String saveUpdate(Member member,HttpServletRequest request){
		this.memberservice.save(member);
		return"redirect:/member/list.html";
	}
	/**
	 * 
	 * sAccount(查询账户) 
	 * (这里描述这个方法适用条件 – 可选) 
	 * @param account
	 * @return  
	 * String 
	 * @exception  
	 * @since  1.0
	 */
	
	@RequestMapping(value = "/sAccount")
	public 	@ResponseBody Map sAccount(@RequestParam(value = "param") String account){
	 	
		Map<String,String> map=new HashMap<String, String>();
		map.put("account", account);
		Map u=memberservice.getEntityBymap(map);
		if(u!=null){
			map.put("info", "抱歉，用户名已被注册，请更换!");
			map.put("status", "n");
		
		}else {
			map.put("info", "用户名称可用");
			map.put("status", "y");
		}
		return map;
	}
	
	
	
	
	
	/**
	 * 
	 * saveMember(保存会员) 
	 * (这里描述这个方法适用条件 – 可选) 
	 * @param member
	 * @param request
	 * @param files
	 * @return  
	 * String 
	 * @exception  
	 * @since  1.0
	 */
	@RequestMapping(value="/savemember",method={RequestMethod.POST})
	public String saveMember(Member member,HttpServletRequest request,@RequestParam(value="files",required=false)MultipartFile files){
		this.memberservice.save(member);
		return "/main";
		
	}
	
}
