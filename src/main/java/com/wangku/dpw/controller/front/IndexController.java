package com.wangku.dpw.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wangku.dpw.domain.Advertise;
import com.wangku.dpw.domain.Article;
import com.wangku.dpw.domain.ImgImages;
import com.wangku.dpw.domain.Member;
import com.wangku.dpw.domain.ProInvestment;
import com.wangku.dpw.domain.ProPurchase;
import com.wangku.dpw.domain.ProSupply;
import com.wangku.dpw.service.AdvertiseService;
import com.wangku.dpw.service.ArticleService;
import com.wangku.dpw.service.ImgImagesService;
import com.wangku.dpw.service.MemberBasicService;
import com.wangku.dpw.service.MemberService;
import com.wangku.dpw.service.ProInvestmentService;
import com.wangku.dpw.service.ProPurchaseService;
import com.wangku.dpw.service.ProSupplyService;
import com.wangku.dpw.util.Page;

/**
 * 首页的数据展示
 * @Title: IndexController.java
 * @Description: TODO
 * @author wk691
 * @Modified wk691
 * @date 2015-11-10 下午7:23:57
 * @version V1.0
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
@Controller
@RequestMapping("/")
public class IndexController extends IceBaseController{
	@Resource
	private ArticleService articleService;
	@Resource
	private AdvertiseService advertiseService;
	@Resource
	private ProPurchaseService proPurchaseService;
    @Resource
    private ImgImagesService imgImagesService;
    @Resource
    private ProInvestmentService proInvestmentService;
    @Resource
    private MemberBasicService memberBasicService;
    @Resource
    private MemberService memberService;
    @Resource
	private ProSupplyService prosupplyservice;
	/**
	 * indexInit(首页)
	 * @return String
	 * @author wk691
	 * @exception
	 * @since 1.0
	 */
	@RequestMapping("/index.html")
	public String indexInit(Advertise advertise,ModelMap modelMap,ImgImages imgImages,HttpServletRequest request ) {
		//广告的展示
//		advertise.setAdType(resourceType);
		List<Advertise> advertises = this.advertiseService.queryFlag("16");
		modelMap.addAttribute("advertises", advertises);
		//冰酒商讯
		List<Article> iceWineArticles =this.articleService.queryMoreList("101110");
		modelMap.addAttribute("iceWineArticles", iceWineArticles);
		//冰酒博客
		List<Article> bokes = this.articleService.queryArticleList("16","101109");
		modelMap.addAttribute("bokes", bokes);
		
		
		// 用户登录信息
		// 获取当前登陆用户
		Integer memberId= super.getLoginMemberId(request);
		if (memberId == null) {
			modelMap.addAttribute("memberId", null);
		} else {
			modelMap.addAttribute("memberId", memberId);
			Member mem=memberService.findById(memberId);
			modelMap.addAttribute("mem", mem);
		}
		 
		// 厂家供应推荐查询
			List<ProSupply> cjgyList = this.prosupplyservice
					.queryProSupplyList("101");
			if (cjgyList != null && cjgyList.size() > 0) {
				// 加强循环list里set字段
				for (ProSupply pro : cjgyList) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
					lis.split(",");
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

			modelMap.addAttribute("cjgyList", cjgyList);
			
			// 经销商推荐查询
			List<ProSupply> JxsList = this.prosupplyservice
					.queryProSupplyList("102");
			if (JxsList != null && JxsList.size() > 0) {
				// 加强循环list里set字段
				for (ProSupply pro : JxsList) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
					lis.split(",");
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
			modelMap.addAttribute("JxsList", JxsList);
			
			// 热销排行榜推荐查询
			List<ProSupply> HotList = this.prosupplyservice
					.queryProSupplyList("103");
			if (HotList != null && HotList.size() > 0) {
				// 加强循环list里set字段
				for (ProSupply pro : HotList) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
					lis.split(",");
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

			modelMap.addAttribute("HotList", HotList);
			
			// 首页特惠特价查询
			List<ProSupply> thtjList = this.prosupplyservice
					.queryProSupplyList("104");
			if (thtjList != null && thtjList.size() > 0) {
				// 加强循环list里set字段
				for (ProSupply pro : thtjList) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
					lis.split(",");
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
			modelMap.addAttribute("thtjList", thtjList);

			// 首页热销热卖查询
			List<ProSupply> rxrmList = this.prosupplyservice
					.queryProSupplyList("105");
			if (rxrmList != null && rxrmList.size() > 0) {
				// 加强循环list里set字段
				for (ProSupply pro : rxrmList) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
					lis.split(",");
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
			modelMap.addAttribute("rxrmList", rxrmList);

			// 首页冰酒批发查询
			List<ProSupply> bjpfList = this.prosupplyservice
					.queryProSupplyList("106");
			if (bjpfList != null && bjpfList.size() > 0) {
				// 加强循环list里set字段
				for (ProSupply pro : bjpfList) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
					lis.split(",");
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
			modelMap.addAttribute("bjpfList", bjpfList);

			// 首页冰酒零售查询
			List<ProSupply> bjlsList = this.prosupplyservice
					.queryProSupplyList("107");
			if (bjlsList != null && bjlsList.size() > 0) {
				// 加强循环list里set字段
				for (ProSupply pro : bjlsList) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
					lis.split(",");
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
			modelMap.addAttribute("bjlsList", bjlsList);

			// 首页冰白葡萄酒批发查询
			List<ProSupply> bbptjList = this.prosupplyservice
					.queryProSupplyList("108");
			if (bbptjList != null && bbptjList.size() > 0) {
				// 加强循环list里set字段
				for (ProSupply pro : bbptjList) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
					lis.split(",");
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
			modelMap.addAttribute("bbptjList", bbptjList);

			// 首页冰红葡萄酒批发查询
			List<ProSupply> bhptjList = this.prosupplyservice
					.queryProSupplyList("109");
			if (bhptjList != null && bhptjList.size() > 0) {
				// 加强循环list里set字段
				for (ProSupply pro : bhptjList) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
					lis.split(",");
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
			modelMap.addAttribute("bhptjList", bhptjList);

			// 首页冰酒品种查询
			List<ProSupply> bjpzList = this.prosupplyservice
					.queryProSupplyList("110");
			if (bjpzList != null && bjpzList.size() > 0) {
				// 加强循环list里set字段
				for (ProSupply pro : bjpzList) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
					lis.split(",");
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
			modelMap.addAttribute("bjpzList", bjpzList);

			// 首页冰酒产地查询
			List<ProSupply> bjcdList = this.prosupplyservice
					.queryProSupplyList("111");
			if (bjcdList != null && bjcdList.size() > 0) {
				// 加强循环list里set字段
				for (ProSupply pro : bjcdList) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
					lis.split(",");
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
			modelMap.addAttribute("bjcdList", bjcdList);

			// 首页冰酒品牌查询
			List<ProSupply> bjppList = this.prosupplyservice
					.queryProSupplyList("112");
			if (bjppList != null && bjppList.size() > 0) {
				// 加强循环list里set字段
				for (ProSupply pro : bjppList) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
					lis.split(",");
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
			modelMap.addAttribute("bjppList", bjppList);
			
			// 首页供应1查询
			List<ProSupply> sygyList = this.prosupplyservice
					.queryProSupplyList("113");
			modelMap.addAttribute("sygyList", sygyList);

			// 首页供应2查询
			List<ProSupply> sygy2List = this.prosupplyservice
					.queryProSupplyList("114");
			modelMap.addAttribute("sygy2List", sygy2List);

			// 首页热销排行榜查询
			List<ProSupply> syrxphbList = this.prosupplyservice
					.queryProSupplyList("115");
			if (syrxphbList != null && syrxphbList.size() > 0) {
				// 加强循环list里set字段
				for (ProSupply pro : syrxphbList) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
					lis.split(",");
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
			modelMap.addAttribute("syrxphbList", syrxphbList);

			// 招商热销排行榜查询
			List<ProSupply> zsrxphbList = this.prosupplyservice
					.queryProSupplyList("126");
			modelMap.addAttribute("zsrxphbList", zsrxphbList);

			// 首页求购1
			List<ProPurchase> qiugou = this.proPurchaseService.queryProPurList("8",
					"121");
			modelMap.addAttribute("qiugou", qiugou);

			// 首页求购1
			List<ProPurchase> qiugou1 = this.proPurchaseService.queryProPurList(
					"8", "119");
			modelMap.addAttribute("qiugou1", qiugou1);

			// 首页代理1
			List<ProInvestment> proInvestment2 = this.proInvestmentService
					.queryProInveList("8", "144");

			if (proInvestment2 != null && proInvestment2.size() > 0) {
				// 加强循环list里set字段
				for (ProInvestment pro : proInvestment2) {
					// 获取关联的图片字段，通过关联字段查询图片表
					String lis = pro.getPic();
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
			modelMap.addAttribute("proInvestment2", proInvestment2);
			// 首页代理2
			List<ProInvestment> proInvestment3 = this.proInvestmentService
					.queryProInveList("8", "145");
			modelMap.addAttribute("proInvestment3", proInvestment3);
		return "theme/index";
	}
	
	
	/**
	 * 最新留言页面
	 * @param resourceType
	 * @param advertise
	 * @param request
	 * @param response
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/indexmessage.html")
    public String detail(@RequestParam(value="resourceType",required=true)String resourceType, Advertise advertise,HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
		advertise.setAdType(resourceType);
		Page<Advertise> page = new Page<>(request,response);
	    List<Advertise> advertises = this.advertiseService.queryList(advertise, page);
		modelMap.addAttribute("page",page);
		modelMap.addAttribute("advertises",advertises);
	
		return"theme/ajaxpage/indexmessage";
}
	
	/**
	 * 单品通推荐(广告数据)
	 * @param resourceType
	 * @param advertise
	 * @param request
	 * @param response
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/indexsku.html")
	public String indexSku(@RequestParam(value="resourceType",required=true)String resourceType,Advertise advertise,ModelMap modelMap){
		advertise.setAdType(resourceType);
		List<Advertise> skulist = this.advertiseService.queryFlag("1");
		modelMap.addAttribute("skulist", skulist);
		return"theme/ajaxpage/indexadver";
	}
	
	/**
	 * 会员退出登录
	 * @param request
	 * @return
	 */
	
	@RequestMapping("/memExit.html")
	public String memExit(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("memberId");
		session.invalidate();
		return"theme/index";
	}
}
