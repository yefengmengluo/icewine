package com.wangku.dpw.controller.front;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wangku.dpw.domain.Advertise;
import com.wangku.dpw.domain.Article;
import com.wangku.dpw.domain.ImgImages;
import com.wangku.dpw.domain.MemberBasic;
import com.wangku.dpw.domain.ProInvestment;
import com.wangku.dpw.domain.ProInvestmentJoin;
import com.wangku.dpw.domain.ProSupply;
import com.wangku.dpw.service.AdvertiseService;
import com.wangku.dpw.service.ArticleService;
import com.wangku.dpw.service.ImgImagesService;
import com.wangku.dpw.service.MemberBasicService;
import com.wangku.dpw.service.ProInvestmentJoinService;
import com.wangku.dpw.service.ProInvestmentService;
import com.wangku.dpw.service.ProSupplyService;
import com.wangku.dpw.util.Page;

/**
 * 招商的前台展示
 * 
 * @Title: ArticleController.java
 * @Description: TODO
 * @author 亢临丽
 * @Modified wk691
 * @date 2015-10-29 下午5:41:17
 * @version V1.0
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
@RequestMapping("front/proinvestment")
public class ProinvestmentListController extends IceBaseController{
	@Resource
	private ProInvestmentService proInvestmentService;

	@Resource
	private ProInvestmentJoinService proInvestmentJoinService;

	@Resource
	private ArticleService articleService;
	@Resource
	private ImgImagesService imgImagesService;
	@Resource
	private AdvertiseService advertiseService;
	@Resource
	private MemberBasicService memberBasicService;

	@Resource
	private ProSupplyService prosupplyservice;

	@RequestMapping("/proindex.html")
	public String proindex(ProInvestment proInvestment, ModelMap modelMap,
			ImgImages imgImages, HttpServletRequest request) {
		// 最新招商
		List<ProInvestment> proInvestment1 = this.proInvestmentService
				.queryProInveList("8", "123");
		if (proInvestment1 != null && proInvestment1.size() > 0) {
			// 加强循环list里set字段
			for (ProInvestment pro : proInvestment1) {

				String lis1 = StringUtils.isNotBlank(pro.getPic()) == true ? pro
						.getPic() : "";
				String lis = lis1.split(",")[0];
				// 获取关联的图片字段，通过关联字段查询图片表
				// 1.判断字段不为空 && 判断字段是数字还是一个链接形式的
				if (StringUtils.isNotBlank(lis) && StringUtils.isNumeric(lis)) {
					imgImages = this.imgImagesService.findById(Integer
							.parseInt(lis));
					// StringUtils.isNumeric(lis)当返回为false时，为数字形式
					pro.setLocalPic(false);
					// 判断图片库这个条数据是否存在
					if (imgImages != null) {
						pro.setImgUrl(imgImages.getImgPath());
					}
				} else if (StringUtils.isNotBlank(lis)
						&& !StringUtils.isNumeric(lis)) {
					pro.setImgUrl(lis);
					// StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
					pro.setLocalPic(true);
				}
			}
		}
		// 图片库的查询
		// 图片库的查询

		modelMap.addAttribute("proInvestment1", proInvestment1);
		// 合作商机
		List<ProInvestment> proInvestment2 = this.proInvestmentService
				.queryProInveList("8", "124");
		modelMap.addAttribute("proInvestment2", proInvestment2);
		// 加盟创业
		List<ProInvestment> proInvestment3 = this.proInvestmentService
				.queryProInveList("8", "125");
		modelMap.addAttribute("proInvestment3", proInvestment3);
		// 强势招商项目
		List<ProInvestment> proInlist = this.proInvestmentService
				.queryProInveList("8", "122");
		modelMap.addAttribute("proInlist", proInlist);

		// 加盟答疑
		List<Article> articleList = this.articleService.queryArticleList("2",
				"101111");
		modelMap.addAttribute("articleList", articleList);

		// 创业故事
		List<Article> articleList1 = this.articleService.queryArticleList("2",
				"101112");
		modelMap.addAttribute("articleList1", articleList1);

		// 广告的展示
		List<Advertise> advflash = this.advertiseService.queryFlag("8");
		modelMap.addAttribute("advflash", advflash);

		// 用户登录信息
		// 获取当前登陆用户
		Integer memberId= super.getLoginMemberId(request);
		if (memberId == null) {
			modelMap.addAttribute("memberId", null);
		} else {
			modelMap.addAttribute("memberId", memberId);
		}

		// 新闻资讯更多查询
		List<ProInvestment> articleMoreList = this.proInvestmentService
				.queryMoreList("101101");
		modelMap.addAttribute("articleMoreList", articleMoreList);
		return "theme/Information/Index";
	}

	@RequestMapping("/dateil.html")
	public String dateil(
			@RequestParam(value = "id", required = false) Integer id,
			ModelMap modelMap, ImgImages imgImages) throws ParseException {
		ProInvestment proInvestment = proInvestmentService.findById(id);

		if (!"".equals(proInvestment) && proInvestment != null) {
			// 加强循环list里set字段

			String lis = proInvestment.getPic();

			// 获取关联的图片字段，通过关联字段查询图片表
			// 1.判断字段不为空 && 判断字段是数字还是一个链接形式的
			if (StringUtils.isNotBlank(lis) && StringUtils.isNumeric(lis)) {
				imgImages = this.imgImagesService.findById(Integer
						.parseInt(lis));
				// StringUtils.isNumeric(lis)当返回为false时，为数字形式
				proInvestment.setLocalPic(false);
				// 判断图片库这个条数据是否存在
				if (imgImages != null) {
					proInvestment.setImgUrl(imgImages.getImgPath());
				}
			} else if (StringUtils.isNotBlank(lis)
					&& !StringUtils.isNumeric(lis)) {
				proInvestment.setImgUrl(lis);
				// StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
				proInvestment.setLocalPic(true);
			}

		}
		// 图片库的查询
		modelMap.addAttribute("imgImages", imgImages);
		modelMap.addAttribute("proInvestment", proInvestment);
		return "theme/Information/Detail";
	}

	@RequestMapping("/list.html")
	public String list(ProInvestment proInvestment, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap, ImgImages imgImages) {
		Page<ProInvestment> page = new Page<ProInvestment>(request, response);
		List<ProInvestment> proInvestment1 = proInvestmentService.queryList(
				proInvestment, page);
		Date date = new Date();// 创建一个时间对象，获取到当前的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置时间显示格式
		if (proInvestment1 != null && proInvestment1.size() > 0) {
			// 加强循环list里set字段
			for (ProInvestment pro : proInvestment1) {

				/*String lis= StringUtils.isNotBlank(pro.getPic()) == true ? pro
						.getPic() : "";*/
				String lis=pro.getPic();
				//String lis = lis1.split(",")[0];
				// 获取关联的图片字段，通过关联字段查询图片表
				// 1.判断字段不为空 && 判断字段是数字还是一个链接形式的
				if (StringUtils.isNotBlank(lis) && StringUtils.isNumeric(lis)) {
					imgImages = this.imgImagesService.findById(Integer
							.parseInt(lis));
					// StringUtils.isNumeric(lis)当返回为false时，为数字形式
					pro.setLocalPic(false);
					// 判断图片库这个条数据是否存在
					if (imgImages != null) {
						pro.setImgUrl(imgImages.getImgPath());
					}
				} else if (StringUtils.isNotBlank(lis)
						&& !StringUtils.isNumeric(lis)) {
					pro.setImgUrl(lis);
					// StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
					pro.setLocalPic(true);
				}
			}
		}
		// 图片库的查询
		List<MemberBasic> jinpai = this.memberBasicService.querycorList("8",
				"129");
		// 图片库的查询
		if (jinpai != null && jinpai.size() > 0) {
			// 加强循环list里set字段
			for (MemberBasic pro : jinpai) {
				// 获取关联的图片字段，通过关联字段查询图片表
				String lis = pro.getPictureUrl();
				// 1.判断字段不为空 && 判断字段是数字还是一个链接形式的
				if (StringUtils.isNotBlank(lis) && StringUtils.isNumeric(lis)) {
					imgImages = this.imgImagesService.findById(Integer
							.parseInt(lis));
					// StringUtils.isNumeric(lis)当返回为false时，为数字形式
					pro.setLocalPic(false);
					// 判断图片库这个条数据是否存在
					if (imgImages != null) {
						pro.setImgUrl(imgImages.getImgPath());
					}
				} else if (StringUtils.isNotBlank(lis)
						&& !StringUtils.isNumeric(lis)) {
					pro.setImgUrl(lis);
					// StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
					pro.setLocalPic(true);
				}
			}
		}
		// 热销排行榜推荐查询
		List<ProSupply> HotList = this.prosupplyservice
				.queryProSupplyList("103");
	
		

		modelMap.addAttribute("HotList", HotList);
		modelMap.addAttribute("jinpai", jinpai);
		String str = sdf.format(date);// 将当前时间格式化为需要的类型
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("str", str);
		return "theme/Information/List";
	}

	@RequestMapping("/toquote.html")
	public String toquote(ProInvestmentJoin proInvestmentJoin,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) {
		// 获取当前登陆用户
		Integer memberId= super.getLoginMemberId(request);
		if (memberId == null) {
			// TODO
			// 返回登陆页面
			return "redirect:/tologin";
		} else {
			/*proInvestmentJoin.setMemberId(member.get("memberId"));   报错*/
			proInvestmentJoinService.save(proInvestmentJoin);
			return "redirect:/front/proinvestment/list.html";
		}
	}

}
