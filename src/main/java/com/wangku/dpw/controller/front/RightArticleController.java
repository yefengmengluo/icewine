package com.wangku.dpw.controller.front;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wangku.dpw.domain.Article;
import com.wangku.dpw.domain.ImgImages;
import com.wangku.dpw.domain.MemberBasic;
import com.wangku.dpw.domain.ProPurchase;
import com.wangku.dpw.service.ArticleService;
import com.wangku.dpw.service.ImgImagesService;
import com.wangku.dpw.service.MemberBasicService;
import com.wangku.dpw.service.ProPurchaseService;

/**
 *资讯右部导航数据展示
 * @Title: LeftArticleController.java 
 * @Description: TODO  
 * @author mlj  
 * @Modified mlj   
 * @date 2015-11-10 下午3:40:50   
 * @version V1.0   
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
@RequestMapping("/common")
public class RightArticleController {
	
	@Resource
	private ArticleService articleService;
	@Resource
	private ImgImagesService imgImagesService;
	@Resource
	private ProPurchaseService proPurchaseService;
	@Resource
	private MemberBasicService memberBasicService;
	
	
	@RequestMapping("/right.html")
	public String leftList(Article article,ModelMap modelMap,ImgImages imgImages,ProPurchase proPurchase ){
		//资讯频道精选展示
		List<Article> articles =this.articleService.recommendList("8");
		 if(articles!=null && articles.size() > 0 ){
			 //加强循环list里set字段
			 for (Article article2 : articles) {
				 //获取关联的图片字段，通过关联字段查询图片表
				 String lis =  article2.getPictureUrl();
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
		modelMap.addAttribute("articles", articles);
	    //右半部分最新求购
		List<ProPurchase> newqiugou = this.proPurchaseService.queryProPurList("8", "118");
		modelMap.addAttribute("newqiugous", newqiugou);
		// 金牌供应商
		List<MemberBasic> jinpai = this.memberBasicService.querycorList("8","129");
		modelMap.addAttribute("jinpai", jinpai);
		
		return"theme/ajaxpage/right";
	}
	//判断数据是数字还是字符窜
	public static void main(String[] args) {
		System.out.println(StringUtils.isNumeric("12354"));
	}

	

}
