package com.wangku.dpw.controller.front;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wangku.dpw.domain.Advertise;
import com.wangku.dpw.domain.ImgImages;
import com.wangku.dpw.domain.MemberBasic;
import com.wangku.dpw.domain.ProInvestment;
import com.wangku.dpw.domain.ProPurchase;
import com.wangku.dpw.domain.ProPurchaseQuote;
import com.wangku.dpw.service.AdvertiseService;
import com.wangku.dpw.service.ImgImagesService;
import com.wangku.dpw.service.MemberBasicService;
import com.wangku.dpw.service.MemberService;
import com.wangku.dpw.service.ProPurchaseQuoteService;
import com.wangku.dpw.service.ProPurchaseService;
import com.wangku.dpw.util.Page;

/**
 * 采购的前台展示
 * 
 * @Title: BuyListController.java
 * @Description: TODO
 * @author 亢临丽
 * @Modified wk691
 * @date 2015-10-29 下午5:41:17
 * @version V1.0
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
@RequestMapping("front/proPurchase")
public class BuyListController extends IceBaseController {
	@Resource
	private ProPurchaseService proPurchaseService;
	@Resource
	private ProPurchaseQuoteService proPurchaseQuoteService;

	@Resource
	private MemberService memberService;

	@Resource
	private AdvertiseService advertiseService;

	@Resource
	private MemberBasicService memberBasicService;
	
	@Resource
	private ImgImagesService imgImagesService;

	@RequestMapping("/buyindex.html")
	public String buyindex(ProInvestment proInvestment, ModelMap modelMap,
			@RequestParam(value = "id", required = false)Integer id,HttpServletRequest request) {

		// 供应商
		List<MemberBasic> gongyingshang = this.memberBasicService.querycorList(
				"8", "128");
		modelMap.addAttribute("gongyingshang", gongyingshang);

		// 零售商
		List<MemberBasic> lingxiaoshang = this.memberBasicService.querycorList(
				"8", "128");
		modelMap.addAttribute("lingxiaoshang", lingxiaoshang);

		// 诚信榜
		List<MemberBasic> chengxin = this.memberBasicService.querycorList("8",
				"142");
		modelMap.addAttribute("chengxin", chengxin);

		// 推荐供应商
		List<MemberBasic> tuijian = this.memberBasicService.querycorList("8",
				"143");
		modelMap.addAttribute("tuijian", tuijian);
		// 冰酒预购
		List<ProPurchase> yugou = this.proPurchaseService.queryProPurList("8",
				"120");
		modelMap.addAttribute("yugou", yugou);

		// 大宗采购
		List<ProPurchase> dazongcaigou = this.proPurchaseService
				.queryProPurList("8", "119");
		modelMap.addAttribute("dazongcaigou", dazongcaigou);

		// 当日求购
		List<ProPurchase> dangriqiugou = this.proPurchaseService
				.queryProPurList("8", "118");
		modelMap.addAttribute("dangriqiugou", dangriqiugou);

		// 紧急求购
		List<ProPurchase> jinjiqiugou = this.proPurchaseService
				.queryProPurList("8", "117");
		modelMap.addAttribute("jinjiqiugou", jinjiqiugou);

		// 广告的展示
		List<Advertise> advertises = this.advertiseService.queryFlag("16");
		modelMap.addAttribute("advertises", advertises);

		// 广告的展示 采购专场
		List<Advertise> zhengzaiqiugou = this.advertiseService.queryFlag("8");

		modelMap.addAttribute("zhengzaiqiugou", zhengzaiqiugou);

		// 广告的展示
		List<Advertise> advflash = this.advertiseService.queryFlag("8");
		modelMap.addAttribute("advflash", advflash);
		
		//用户登录信息
		// 获取当前登陆用户
		Integer memberId= super.getLoginMemberId(request);
				if (memberId == null) {
					modelMap.addAttribute("memberId", null);
				} else {
					
					modelMap.addAttribute("memberId", memberId);
				}

		return "theme/Buy/Index";
	}

	@RequestMapping("/dateil.html")
	public String dateil(
			@RequestParam(value = "id", required = false) Integer id,
			HttpServletRequest request, HttpServletResponse response,
			ProPurchaseQuote proPurchaseQuote, ModelMap modelMap)
			throws ParseException {
		ProPurchase proPurchase = proPurchaseService.findById(id);
		Date date = new Date();// 创建一个时间对象，获取到当前的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置时间显示格式
		String str = sdf.format(date);// 将当前时间格式化为需要的类型

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dt1 = df.parse(str);
		Date dt2 = df.parse(proPurchase.getEndTime());
		if (dt1.getTime() > dt2.getTime()) {
			modelMap.addAttribute("days", 0);
		} else if (dt1.getTime() < dt2.getTime()) {
			long diff = dt2.getTime() - dt1.getTime();// 差值是微秒级别
			long days = diff / (1000 * 60 * 60 * 24);
			modelMap.addAttribute("days", days);

		}
		// 报价单
		// proPurchaseQuote.setPurId(id);
		List<ProPurchaseQuote> queryListqu = proPurchaseQuoteService
				.queryListqu(id);
		if (!queryListqu.equals("")) {
			// 已报名的企业
			modelMap.addAttribute("queryListqu", queryListqu);
		}
		List<ProPurchaseQuote> proPurchaseQuotes = proPurchaseQuoteService
				.queryList(proPurchaseQuote);
		List<ProPurchaseQuote> pur = new ArrayList<ProPurchaseQuote>();
		if (proPurchaseQuotes != null && !"".equals(proPurchaseQuotes)) {
			for (int i = 0; i < proPurchaseQuotes.size(); i++) {
				String endTime = proPurchaseQuotes.get(i).getProPurchase()
						.getEndTime();
				if (endTime != null && !"".equals(endTime)) {
					Date dt3 = df.parse(endTime);
					if (dt1.getTime() < dt3.getTime()) {
						pur.add(proPurchaseQuotes.get(i));
					}
				}
			}
		}
		// 该公司详情发布采购单个数以及采购单详情
		Integer memId = proPurchase.getMemberId();
		ProPurchaseQuote proPurchaseQuote2 = new ProPurchaseQuote();
		proPurchaseQuote2.setFromMemberId(memId);
		List<ProPurchaseQuote> proPurchaseQuotes2 = proPurchaseQuoteService
				.queryListByid(proPurchaseQuote2);
		int number = proPurchaseQuotes2.size();
		if (number != 0) {
			modelMap.addAttribute("number", number);
		}
		if (!pur.equals("")) {
			// 相关采购单推荐
			modelMap.addAttribute("proPurchaseQuotes", pur);
		}
		// 该公司采购其他产品信息
		modelMap.addAttribute("proPurchaseQuotes2", proPurchaseQuotes2);

		// 产品详情
		modelMap.addAttribute("proPurchase", proPurchase);
		return "theme/Buy/Detail";
	}

	@RequestMapping("/list.html")
	public String list(ProPurchase proPurchase, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap,ImgImages imgImages)
			throws ParseException {
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
		Page<ProPurchase> page = new Page<ProPurchase>(request, response);
		List<ProPurchase> pList = proPurchaseService.queryList(proPurchase,
				page);
		// 立即报价处理
		Date date = new Date();// 创建一个时间对象，获取到当前的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置时间显示格式
		String str = sdf.format(date);// 将当前时间格式化为需要的类型
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dt1 = df.parse(str);
		List<ProPurchase> pro = new ArrayList<ProPurchase>();
		for (int i = 0; i < pList.size(); i++) {
			String time = pList.get(i).getEndTime();
			Date endTime = df.parse(time);
			if (dt1.getTime() < endTime.getTime()) {
				pro.add(pList.get(i));
			}
		}
		modelMap.addAttribute("pro", pro);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("str", str);
		return "theme/Buy/List";
	}

	
	
	
	
	@RequestMapping("/toquote.html")
	public String toquote(ProPurchaseQuote proPurchaseQuote,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) {
		// 获取当前登陆用户
		Integer memberId= super.getLoginMemberId(request);
		if (memberId == null) {
			// 返回登陆页面
			return "redirect:/tologin";
		} else {
			proPurchaseQuote.setFromMemberId(memberId);
			int times = proPurchaseService
					.findById(proPurchaseQuote.getPurId()).getQuoteTimes() + 1;
			ProPurchase proPurchase = new ProPurchase();
			proPurchase.setQuoteTimes(times);
			proPurchase.setId(proPurchaseQuote.getPurId());
			proPurchaseService.save(proPurchase);
			proPurchaseQuoteService.save(proPurchaseQuote);
			return "redirect:/front/proPurchase/list.html";
		}
	}
}
