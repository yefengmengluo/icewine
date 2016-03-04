package com.wangku.dpw.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wangku.dpw.domain.Advertise;
import com.wangku.dpw.domain.ImgImages;
import com.wangku.dpw.domain.MemberBasic;
import com.wangku.dpw.domain.ProSupply;
import com.wangku.dpw.service.AdvertiseService;
import com.wangku.dpw.service.ImgImagesService;
import com.wangku.dpw.service.MemberBasicService;
import com.wangku.dpw.service.ProSupplyService;
import com.wangku.dpw.util.Page;
/**
 * 采购的前台展示
 * 
 * @Title: BuyListController.java
 * @Description: TODO
 * @author 亢临丽
 * @Modified wk691
 * @date 2015-11-17 下午5:41:17
 * @version V1.0
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
@RequestMapping("front/corporation")
public class CorporationController extends IceBaseController{
	@Resource
	private MemberBasicService memberBasicService;
	@Resource
	private ImgImagesService imgImagesService;
	@Resource
	private AdvertiseService advertiseService;
	
	@Resource
	private ProSupplyService proSupplyService;
	@RequestMapping("/corIndex.html")
	public String corIndex(MemberBasic memberBasic, ModelMap modelMap,ImgImages imgImages, HttpServletRequest request) {

		// 企业会员
		List<MemberBasic> qiyehuiyuan = this.memberBasicService.querycorList("8","127");
		//图片库的查询
		if(qiyehuiyuan!=null && qiyehuiyuan.size() > 0 ){
			 //加强循环list里set字段
			 for (MemberBasic pro : qiyehuiyuan) {
				 //获取关联的图片字段，通过关联字段查询图片表
				 String lis =  pro.getPictureUrl();
				 //1.判断字段不为空 && 判断字段是数字还是一个链接形式的
				 if(StringUtils.isNotBlank(lis) && StringUtils.isNumeric(lis)){
					 imgImages = this.imgImagesService.findById(Integer.parseInt(lis));
					 //StringUtils.isNumeric(lis)当返回为false时，为数字形式
					 pro.setLocalPic(false) ;
					 //判断图片库这个条数据是否存在
				  if(imgImages!=null){					
					  pro.setImgUrl(imgImages.getImgPath()) ;
				  }
				}else if(StringUtils.isNotBlank(lis) && !StringUtils.isNumeric(lis)){
					pro.setImgUrl(lis) ;
  				  //StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
					pro.setLocalPic(true) ;
				}
			}
		 }
		
		// 用户登录信息
				// 获取当前登陆用户
				Integer memberId= super.getLoginMemberId(request);
				if (memberId == null) {
					modelMap.addAttribute("memberId", null);
				} else {
					modelMap.addAttribute("memberId", memberId);
				}
		modelMap.addAttribute("qiyehuiyuan", qiyehuiyuan);
		// 金牌供应商
		List<MemberBasic> jinpai = this.memberBasicService.querycorList("8","129");
		modelMap.addAttribute("jinpai", jinpai);
		// 最新加入企业
		List<MemberBasic> jiaru = this.memberBasicService.querycorList("8","130");
		modelMap.addAttribute("jiaru", jiaru);
		
		// 推荐供应商
		List<MemberBasic> tuijian = this.memberBasicService.querycorList("8","143");
		modelMap.addAttribute("tuijian", tuijian);
		
		//广告的展示
		List<Advertise> advs = this.advertiseService.queryFlag("8");
		modelMap.addAttribute("advs", advs);
		return "theme/Corporation/Index";
	}
	@RequestMapping("/list.html")
	public String list(MemberBasic memberBasic, ModelMap modelMap,HttpServletRequest request,
			HttpServletResponse response,ImgImages imgImages) {
		
		// 金牌供应商
		List<MemberBasic> jinpai = this.memberBasicService.querycorList("8","129");
		//图片库的查询
				if(jinpai!=null && jinpai.size() > 0 ){
					 //加强循环list里set字段
					 for (MemberBasic pro : jinpai) {
						 //获取关联的图片字段，通过关联字段查询图片表
						 String lis =  pro.getPictureUrl();
						 //1.判断字段不为空 && 判断字段是数字还是一个链接形式的
						 if(StringUtils.isNotBlank(lis) && StringUtils.isNumeric(lis)){
							 imgImages = this.imgImagesService.findById(Integer.parseInt(lis));
							 //StringUtils.isNumeric(lis)当返回为false时，为数字形式
							 pro.setLocalPic(false) ;
							 //判断图片库这个条数据是否存在
						  if(imgImages!=null){					
							  pro.setImgUrl(imgImages.getImgPath()) ;
						  }
						}else if(StringUtils.isNotBlank(lis) && !StringUtils.isNumeric(lis)){
							pro.setImgUrl(lis) ;
		  				  //StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
							pro.setLocalPic(true) ;
						}
					}
				 }
		
		modelMap.addAttribute("jinpai", jinpai);
		
		
		Page<MemberBasic> page = new Page<MemberBasic>(request, response);
		List<MemberBasic> memberBasics= memberBasicService.querycorandsupList(memberBasic,
				page);
		
	

		 if(!CollectionUtils.isEmpty(memberBasics)){
			 //加强循环list里set字段
			 for (int i = 0; i < memberBasics.size(); i++) {
				
			    MemberBasic pro=memberBasics.get(i);
			    List<ProSupply> supplys= pro.getProSupply();
			    if(supplys!=null && supplys.size() > 0 ){
					 //加强循环list里set字段
					 for (ProSupply pros : supplys) {
						 //获取关联的图片字段，通过关联字段查询图片表
					/*	String lis= pros.getPic().split(",")[0];*/
						 String lis1 =  StringUtils.isNotBlank(pros.getPic())==true?pros.getPic():"";
						 String lis=lis1.split(",") == null  ? "" : lis1.split(",")[0];
						 //1.判断字段不为空 && 判断字段是数字还是一个链接形式的
						 if(StringUtils.isNotBlank(lis) && StringUtils.isNumeric(lis)){
							 imgImages = this.imgImagesService.findById(Integer.parseInt(lis));
							 //StringUtils.isNumeric(lis)当返回为false时，为数字形式
							 pros.setLocalPic(false);
							 //判断图片库这个条数据是否存在
						  if(imgImages!=null){					
							  pros.setImgUrl(imgImages.getImgPath()) ;
						  }
						}else if(StringUtils.isNotBlank(lis) && !StringUtils.isNumeric(lis)){
							pros.setImgUrl(lis) ;
		   				  //StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
							pros.setLocalPic(true) ;
						}
					}
				 }
			}
		 }
		//图片库的查询
		
		modelMap.addAttribute("page", page);
		
		return "theme/Corporation/List";
	}
	
	
	
}
