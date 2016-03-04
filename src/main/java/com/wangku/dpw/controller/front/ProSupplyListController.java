package com.wangku.dpw.controller.front; 

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.wangku.dpw.domain.Article;
import com.wangku.dpw.domain.ImgImages;
import com.wangku.dpw.domain.Member;
import com.wangku.dpw.domain.MemberBasic;
import com.wangku.dpw.domain.ProPurchase;
import com.wangku.dpw.domain.ProSupply;
import com.wangku.dpw.service.ArticleService;
import com.wangku.dpw.service.ImgImagesService;
import com.wangku.dpw.service.MemberBasicService;
import com.wangku.dpw.service.MemberService;
import com.wangku.dpw.service.ProPurchaseService;
import com.wangku.dpw.service.ProSupplyService;
import com.wangku.dpw.util.Page;

/**
 * 
 * @Title: 供应数据层 
 * @Description: TODO  
 * @author lyc       
 * @date 2015-11-13 下午2:13:25   
 * @version V1.0
 */

@Controller
@RequestMapping("font/supply")
public class ProSupplyListController extends IceBaseController{

	
	@Resource
	private  ProSupplyService prosupplyservice;
	
	@Resource
	private ImgImagesService imgImagesService;
	
	@Resource
	private MemberBasicService memberBasicService;
	
	@Resource
	private ProPurchaseService  proPurchaseService;
	
	@Resource
	private ArticleService adArticleService;
	
	@Resource
	private MemberService memberService;
	
	
 	@RequestMapping("toDetail")
	public String get(){
		return  "/theme/Supply/detail";
	}
	
	
	@RequestMapping("/Supply/Detail")
	public String getList(@RequestParam(value = "id", required = false) Integer id,ModelMap modelMap){
		ProSupply prosupply = this.prosupplyservice.findById(id);
		modelMap.addAttribute(prosupply);
		return  "/theme/Supply/detail";
	}	
	  
	
	
	@RequestMapping("/more/SpList")
	public String getProSupply(ProSupply prosupply, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap,ImgImages imgImages) { 
	
	 
		Page<ProSupply> page = new Page<ProSupply>(request, response);
		List<ProSupply> list = this.prosupplyservice.queryList(prosupply, page);
		List<ProSupply> HotList = this.prosupplyservice.queryProSupplyList("103");
		modelMap.addAttribute("HotList", HotList);
		 
		
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
		return "/theme/Supply/List";
	}
	/**
	 * 冰酒批发板块首页
	 * @return
	 */
	@RequestMapping("/supplyIndex.html")
	public String supplyIndex(ProSupply prosupply,ModelMap modelMap,ImgImages imgImages,MemberBasic memberBasic,HttpServletRequest request){
		// 厂家供应推荐查询
		List<ProSupply> cjgyList = this.prosupplyservice.queryProSupplyList("101");
		if (cjgyList != null && cjgyList.size() > 0) {
			// 加强循环list里set字段
			for (ProSupply pro : cjgyList) {
				// 获取关联的图片字段，通过关联字段查询图片表
				String lis = pro.getPic();
				Integer memberId = pro.getMemberId();
				
				String img=lis.split(",")[0];
				if(memberId !=null && memberId>0){
					memberBasic = this.memberBasicService.queryByMemberId(memberId);
					if (memberBasic != null) {
						pro.setMemberName(memberBasic.getCorporationName());
					}
				}
				// 1.判断字段不为空 && 判断字段是数字还是一个链接形式的
				if (StringUtils.isNotBlank(img) && StringUtils.isNumeric(img)) {
					imgImages = this.imgImagesService.findById(Integer
							.parseInt(img));
					// StringUtils.isNumeric(lis)当返回为false时，为数字形式
					pro.setLocalPic(false);
					// 判断图片库这个条数据是否存在
					if (imgImages != null) {
						pro.setImgUrl(imgImages.getImgPath());
					}
				} else if (StringUtils.isNotBlank(img)
						&& !StringUtils.isNumeric(img)) {
					pro.setImgUrl(img);
					// StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
					pro.setLocalPic(true);
				}
			}
		}
		// 用户登录信息
				// 获取当前登陆用户
				Integer mId= super.getLoginMemberId(request);
				if (mId == null) {
					modelMap.addAttribute("memId", null);
				} else {
					modelMap.addAttribute("memId", mId);
				}

		modelMap.addAttribute("cjgyList", cjgyList);
		//热销排行榜
		List<ProSupply> hotList = this.prosupplyservice.queryProSupplyList("103");
		
		if (hotList != null && hotList.size() > 0) {
			// 加强循环list里set字段
			for (ProSupply pro : hotList) {
				// 获取关联的图片字段，通过关联字段查询图片表
				String lis = pro.getPic();
				Integer memberId = pro.getMemberId();
				 String pic=lis.split(",")[0];
				if(memberId !=null && memberId>0){
					memberBasic = this.memberBasicService.queryByMemberId(memberId);
					if (memberBasic != null) {
						pro.setMemberName(memberBasic.getCorporationName());
					}
				}
				// 1.判断字段不为空 && 判断字段是数字还是一个链接形式的
				if (StringUtils.isNotBlank(pic) && StringUtils.isNumeric(pic)) {
					imgImages = this.imgImagesService.findById(Integer
							.parseInt(pic));
					// StringUtils.isNumeric(lis)当返回为false时，为数字形式
					pro.setLocalPic(false);
					// 判断图片库这个条数据是否存在
					if (imgImages != null) {
						pro.setImgUrl(imgImages.getImgPath());
					}
				} else if (StringUtils.isNotBlank(pic)
						&& !StringUtils.isNumeric(pic)) {
					pro.setImgUrl(pic);
					// StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
					pro.setLocalPic(true);
				}
			}
		}
		
		
		
		modelMap.addAttribute("hotList", hotList);
		
		return"theme/Supply/supplyIndex";
	}
	
	
	/**
	 * 冰酒批发详情页跳转
	 * @return
	 */
   @RequestMapping("/dateil.html")
   public String dateilSupply(@RequestParam(value="id",required=false)Integer id,ProSupply prosupply,ModelMap modelMap,ImgImages imgImages,MemberBasic memberBasic,Member member){
	   
	    prosupply =this.prosupplyservice.findById(id);
	    String lis= prosupply.getPic();
	    String pic= lis.split(",")[0]; 
	    imgImages=this.imgImagesService.findById(Integer.parseInt(pic));
	    modelMap.addAttribute("imgImages",imgImages );
	    modelMap.addAttribute("prosupply",prosupply );
	    
	       //热销排行榜
	  		List<ProSupply> hotList = this.prosupplyservice.queryProSupplyList("103");
	  		
	  		if (hotList != null && hotList.size() > 0) {
	  			// 加强循环list里set字段
	  			for (ProSupply pro : hotList) {
	  				// 获取关联的图片字段，通过关联字段查询图片表
	  				String liss = pro.getPic();
	  				Integer memberId = pro.getMemberId();
	  				 String picc=liss.split(",")[0];
	  				if(memberId !=null && memberId>0){
	  					memberBasic = this.memberBasicService.queryByMemberId(memberId);
	  					if (memberBasic != null) {
	  						pro.setMemberName(memberBasic.getCorporationName());
	  					}
	  				}
	  				// 1.判断字段不为空 && 判断字段是数字还是一个链接形式的
	  				if (StringUtils.isNotBlank(picc) && StringUtils.isNumeric(picc)) {
	  					imgImages = this.imgImagesService.findById(Integer
	  							.parseInt(picc));
	  					// StringUtils.isNumeric(lis)当返回为false时，为数字形式
	  					pro.setLocalPic(false);
	  					// 判断图片库这个条数据是否存在
	  					if (imgImages != null) {
	  						pro.setImgUrl(imgImages.getImgPath());
	  					}
	  				} else if (StringUtils.isNotBlank(picc)
	  						&& !StringUtils.isNumeric(picc)) {
	  					pro.setImgUrl(picc);
	  					// StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
	  					pro.setLocalPic(true);
	  				}
	  			}
	  		}
	  			  		
	  		modelMap.addAttribute("hotList", hotList);
	  		//最新求购
	  		List<ProPurchase> newqiugou = this.proPurchaseService.queryProPurList("8", "118");
			modelMap.addAttribute("newqiugous", newqiugou);
	        //相关资讯
			List<Article> commonInfo = this.adArticleService.recommendList("2"); 
			modelMap.addAttribute("commonInfo", commonInfo);
			//公司档案
			memberBasic = this.memberBasicService.queryByMemberId(prosupply.getMemberId());
			member =this.memberService.findById(memberBasic.getMemberId());
			modelMap.addAttribute("member", member);
			modelMap.addAttribute("memberBasic", memberBasic);
	        return"theme/Supply/detail";
   }
	
	
}
