package com.wangku.dpw.controller.front;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wangku.dpw.domain.ImgImages;
import com.wangku.dpw.domain.Member;
import com.wangku.dpw.domain.MemberBasic;
import com.wangku.dpw.domain.ProInvestment;
import com.wangku.dpw.domain.ProPurchase;
import com.wangku.dpw.domain.ProPurchaseQuote;
import com.wangku.dpw.service.ImgImagesService;
import com.wangku.dpw.service.MemberBasicService;
import com.wangku.dpw.service.MemberService;
import com.wangku.dpw.service.ProInvestmentService;
import com.wangku.dpw.service.ProPurchaseQuoteService;
import com.wangku.dpw.service.ProPurchaseService;
import com.wangku.dpw.util.FileUploadUtil;
import com.wangku.dpw.util.FileUploadUtilTwo;
import com.wangku.dpw.util.Page;

@Controller
@RequestMapping("front/member")
public class MemberCenter extends IceBaseController {
	@Resource
	private MemberBasicService memberBasicService;
	@Resource
	private MemberService memberService;
	@Resource
	private ImgImagesService imgImagesService;
	@Resource
	private ProInvestmentService proInvestmentService;
	@Resource
	private ProPurchaseService proPurchaseService;
	@Resource
	private ProPurchaseQuoteService proPurchaseQuoteService;

	// 公司详情
	@RequestMapping("/memberCenter.html")
	public String memberIndex(ImgImages imgImages, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		// 用户登录信息
		// 获取当前登陆用户
		Integer memberId = super.getLoginMemberId(request);
		if (memberId == null) {
			modelMap.addAttribute("memberId", null);
		} else {
			modelMap.addAttribute("memberId", memberId);

			MemberBasic memberBasic = memberBasicService.findById(memberId);
			Member member = memberService.findById(memberId);
			if (!"".equals(memberBasic) && memberBasic != null) {
				// 加强循环list里set字段

				String lis = memberBasic.getLogo();

				// 获取关联的图片字段，通过关联字段查询图片表
				// 1.判断字段不为空 && 判断字段是数字还是一个链接形式的
				if (StringUtils.isNotBlank(lis) && StringUtils.isNumeric(lis)) {
					imgImages = this.imgImagesService.findById(Integer
							.parseInt(lis));
					// StringUtils.isNumeric(lis)当返回为false时，为数字形式
					memberBasic.setLocalPic(false);
					// 判断图片库这个条数据是否存在
					if (imgImages != null) {
						memberBasic.setImgUrl(imgImages.getImgPath());
					}
				} else if (StringUtils.isNotBlank(lis)
						&& !StringUtils.isNumeric(lis)) {
					memberBasic.setImgUrl(lis);
					// StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
					memberBasic.setLocalPic(true);
				}

			}
			// 图片库的查询
			modelMap.addAttribute("memberBasic", memberBasic);
			modelMap.addAttribute("member", member);
		}
		return "theme/Member/indexMember";
	}

	@RequestMapping("/memberBasic.html")
	public String memberBasic(ImgImages imgImages, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		// 用户登录信息
		// 获取当前登陆用户
		Integer memberId = super.getLoginMemberId(request);
		if (memberId == null) {
			modelMap.addAttribute("memberId", null);
		} else {
			modelMap.addAttribute("memberId", memberId);
			MemberBasic memberBasic = memberBasicService.findByIdCode(memberId);
			Member member = memberService.findById(memberId);

			// 企业形象图前台展示
			if (!"".equals(memberBasic) && memberBasic != null) {
				// 加强循环list里set字段

				String lis = memberBasic.getPictureUrl();

				// 获取关联的图片字段，通过关联字段查询图片表
				// 1.判断字段不为空 && 判断字段是数字还是一个链接形式的
				if (StringUtils.isNotBlank(lis) && StringUtils.isNumeric(lis)) {
					imgImages = this.imgImagesService.findById(Integer
							.parseInt(lis));
					// StringUtils.isNumeric(lis)当返回为false时，为数字形式
					memberBasic.setLocalPic(false);
					// 判断图片库这个条数据是否存在
					if (imgImages != null) {
						memberBasic.setImgUrl(imgImages.getImgPath());
					}
				} else if (StringUtils.isNotBlank(lis)
						&& !StringUtils.isNumeric(lis)) {
					memberBasic.setImgUrl(lis);
					// StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
					memberBasic.setLocalPic(true);
				}

			}
			// 个人头像前台展示

			if (!"".equals(member) && member != null) {
				// 加强循环list里set字段

				String lis = member.getHeadPortrait().trim();

				// 获取关联的图片字段，通过关联字段查询图片表
				// 1.判断字段不为空 && 判断字段是数字还是一个链接形式的
				if (StringUtils.isNotBlank(lis) && StringUtils.isNumeric(lis)) {
					imgImages = this.imgImagesService.findById(Integer
							.parseInt(lis));
					// StringUtils.isNumeric(lis)当返回为false时，为数字形式
					member.setLocalPic(false);
					// 判断图片库这个条数据是否存在
					if (imgImages != null) {
						member.setImgUrl(imgImages.getImgPath());
					}
				} else if (StringUtils.isNotBlank(lis)
						&& !StringUtils.isNumeric(lis)) {
					member.setImgUrl(lis);
					// StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
					member.setLocalPic(true);
				}

			}

			// 企业logo前台展示

			if (!"".equals(memberBasic) && memberBasic != null) {
				// 加强循环list里set字段

				String lis = memberBasic.getLogo();

				// 获取关联的图片字段，通过关联字段查询图片表
				// 1.判断字段不为空 && 判断字段是数字还是一个链接形式的
				if (StringUtils.isNotBlank(lis) && StringUtils.isNumeric(lis)) {
					imgImages = this.imgImagesService.findById(Integer
							.parseInt(lis));
					// StringUtils.isNumeric(lis)当返回为false时，为数字形式
					memberBasic.setLocalPic(false);
					// 判断图片库这个条数据是否存在
					if (imgImages != null) {
						memberBasic.setImgUrlLogo(imgImages.getImgPath());
					}
				} else if (StringUtils.isNotBlank(lis)
						&& !StringUtils.isNumeric(lis)) {
					memberBasic.setImgUrlLogo(lis);
					// StringUtils.isNumeric(lis)当返回为true时，为链接类型字段！链接类型的字段直接取资讯表图片字段即可
					memberBasic.setLocalPic(true);
				}

			}
			// 图片库的查询

			modelMap.addAttribute("memberBasic", memberBasic);
			modelMap.addAttribute("member", member);
		}
		return "theme/Member/memberBasic";
	}

	@RequestMapping("/saveMember.html")
	public String saveMember(
			MemberBasic memberBasic,
			Member member,
			HttpServletRequest request,
			@RequestParam(value = "files", required = false) MultipartFile files,
			@RequestParam(value = "files1", required = false) MultipartFile files1,
			@RequestParam(value = "files2", required = false) MultipartFile files2) {
		if (files != null && files.getSize() > 0) {
			FileUploadUtil.saveFile(files, request);
			memberBasic.setLogo(FileUploadUtil.getFilePath()
					+ files.getOriginalFilename());
		}
		if (files1 != null && files1.getSize() > 0) {
			FileUploadUtilTwo.saveFile(files1, request);
			memberBasic.setPictureUrl(FileUploadUtilTwo.getFilePath()
					+ files1.getOriginalFilename());
		}
		if (files2 != null && files2.getSize() > 0) {
			FileUploadUtilTwo.saveFile(files2, request);
			member.setHeadPortrait(FileUploadUtilTwo.getFilePath()
					+ files2.getOriginalFilename());
		}
		this.memberBasicService.save(memberBasic);
		this.memberService.save(member);
		return "redirect:/front/member/memberCenter.html";
	}

	// 招商列表
	@RequestMapping("/list.html")
	public String list(ProInvestment proInvestment, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		// 用户登录信息
		// 获取当前登陆用户
		Integer memberId = super.getLoginMemberId(request);
		if (memberId == null) {
			modelMap.addAttribute("memberId", null);
		} else {
			modelMap.addAttribute("memberId", memberId);

			proInvestment.setMemberId(memberId);
			Page<ProInvestment> page = new Page<ProInvestment>(request,
					response);
			proInvestmentService.queryList(proInvestment, page);
			modelMap.addAttribute("page", page);
		}
		return "theme/Member/proInvesList";
	}

	// 操作已推荐、已置顶
	@RequestMapping("/check.html")
	public String check(ProInvestment proInvestment,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) {
		Page<ProInvestment> page = new Page<ProInvestment>(request, response);
		proInvestmentService.queryList(proInvestment, page);
		modelMap.addAttribute("page", page);
		return "theme/Member/proInvesList";
	}

	// 招商列表
	@RequestMapping("/proInveDetail.html")
	public String proInveDetail(
			@RequestParam(value = "id", required = false) Integer id,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) {
		ProInvestment proInvestment = null;
		if (id != null) {
			proInvestment = this.proInvestmentService.findById(id);
		}

		Member member = this.memberService
				.findById(proInvestment.getMemberId());
		modelMap.addAttribute("member", member);
		modelMap.addAttribute("proInvestment", proInvestment);
		return "theme/Member/proInvesDetail";
	}

	// 保存招商会员数据
	@RequestMapping("/proInvsave.html")
	public String save(ProInvestment proInvestment, Member member,
			HttpServletRequest request,
			@RequestParam(value = "files", required = false) MultipartFile files,ModelMap modelMap) {
		if (files != null && files.getSize() > 0) {
			FileUploadUtil.saveFile(files, request);
			proInvestment.setPic(FileUploadUtil.getFilePath()
					+ files.getOriginalFilename());
		}
		//用户登录信息
		// 获取当前登陆用户
		Integer memberId = super.getLoginMemberId(request);
		if (memberId == null) {
			modelMap.addAttribute("memberId", null);
		} else {
			modelMap.addAttribute("memberId", memberId);
			proInvestment.setMemberId(memberId);
		this.proInvestmentService.save(proInvestment);
		this.memberService.save(member);}
		return "redirect:/front/member/list.html";
	}

	// 删除数据
	@RequestMapping("/delProInvestment.html")
	public String delProInvestment(@RequestParam("id") String id) {
		if (id != null && !"".equals(id)) {
			List<String> ids = new ArrayList<String>();
			ids.add(id);
			this.proInvestmentService.delete(ids);
		}
		return "redirect:/front/member/list.html";
	}

	// 添加招商
	@RequestMapping("/addProInve.html")
	public String addProInve() {

		return "theme/Member/proInvesadd";
	}

	// 采购列表
	@RequestMapping("/buylist.html")
	public String buylist(ProPurchase proPurchase, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		// 用户登录信息
		// 获取当前登陆用户
		Integer memberId = super.getLoginMemberId(request);
		if (memberId == null) {
			modelMap.addAttribute("memberId", null);
		} else {
			modelMap.addAttribute("memberId", memberId);

			proPurchase.setMemberId(memberId);
			Page<ProPurchase> page = new Page<ProPurchase>(request, response);
			proPurchaseService.queryList(proPurchase, page);
			modelMap.addAttribute("page", page);
		}
		return "theme/Member/buyList";
	}

	// 采购保存
	@RequestMapping("/buysave.html")
	public String buysave(
			ProPurchase proPurchase,
			HttpServletRequest request,
			@RequestParam(value = "files", required = false) MultipartFile files,
			ModelMap modelMap) throws Exception {
		if (files != null && files.getSize() > 0) {
			FileUploadUtil.saveFile(files, request);
			proPurchase.setPicture(FileUploadUtil.getFilePath()
					+ files.getOriginalFilename());
		}
		// 用户登录信息
		// 获取当前登陆用户
		Integer memberId = super.getLoginMemberId(request);
		if (memberId == null) {
			modelMap.addAttribute("memberId", null);
		} else {

			modelMap.addAttribute("memberId", memberId);
			proPurchase.setMemberId(memberId);
			this.proPurchaseService.save(proPurchase);
		}
		return "redirect:/front/member/buylist.html";
	}

	// 采购详情
	@RequestMapping("/buydetail.html")
	public String buydetail(Integer id, ModelMap modelMap) {
		ProPurchase proPurchaseVO = proPurchaseService.findById(id);
		modelMap.addAttribute("proPurchase", proPurchaseVO);
		return "theme/Member/buyupdate";
	}

	// 收到的采购单详情
	@RequestMapping("/quotedetail.html")
	public String quotedetail(Integer id, ModelMap modelMap) {
		ProPurchaseQuote proPurchaseQuote = proPurchaseQuoteService
				.findById(id);

		ProPurchase proPurchase = proPurchaseService.findById(proPurchaseQuote
				.getPurId());
		MemberBasic memberBasic = memberBasicService.findById(proPurchaseQuote
				.getFromMemberId());
		Member member = memberService.findById(proPurchaseQuote
				.getFromMemberId());
		modelMap.addAttribute("proPurchase", proPurchase);
		modelMap.addAttribute("proPurchaseQuote", proPurchaseQuote);
		modelMap.addAttribute("memberBasic", memberBasic);
		modelMap.addAttribute("member", member);
		return "theme/Member/buyDetail";
	}

	// 发出的采购单详情
	@RequestMapping("/memquotedetail.html")
	public String memquotedetail(Integer id, ModelMap modelMap) {
		ProPurchaseQuote proPurchaseQuote = proPurchaseQuoteService
				.findById(id);
		ProPurchase proPurchase = proPurchaseService.findById(proPurchaseQuote
				.getPurId());

		MemberBasic memberBasic = memberBasicService.findById(proPurchaseQuote
				.getFromMemberId());
		Member member = memberService.findById(proPurchaseQuote
				.getFromMemberId());
		modelMap.addAttribute("member", member);
		modelMap.addAttribute("memberBasic", memberBasic);

		modelMap.addAttribute("proPurchase", proPurchase);
		modelMap.addAttribute("proPurchaseQuote", proPurchaseQuote);
		return "theme/Member/membuyDetail";
	}

	// 采购单添加跳转页面
	@RequestMapping("/buyadd.html")
	public String buyadd() {
		return "theme/Member/buyadd";
	}

	// 采购删除
	@RequestMapping("/buydetele.html")
	public String buydetele(@RequestParam("id") String id) {
		if (id != null && !"".equals(id)) {
			List<String> ids = new ArrayList<String>();
			ids.add(id);
			this.proPurchaseService.delete(ids);
		}
		return "redirect:/front/member/buylist.html";
	}

	// 采购数据是否通过
	@RequestMapping("/buycheck.html")
	public String buycheck(ProPurchase proPurchase, HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		Page<ProPurchase> page = new Page<ProPurchase>(request, response);
		proPurchaseService.queryList(proPurchase, page);
		modelMap.addAttribute("page", page);
		return "theme/Member/buyList";
	}

	// 会员收到的报价
	@RequestMapping("/buyQuote.html")
	public String buyQuote(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		ProPurchaseQuote proPurchaseQuote = new ProPurchaseQuote();
		// 用户登录信息
		// 获取当前登陆用户
		Integer memberId = super.getLoginMemberId(request);
		if (memberId == null) {
			modelMap.addAttribute("memberId", null);
		} else {

			modelMap.addAttribute("memberId", memberId);
			proPurchaseQuote.setToMemberId(memberId);
			if (!CollectionUtils.isEmpty(proPurchaseQuoteService
					.queryList(proPurchaseQuote))) {
				List<ProPurchaseQuote> proPurchaseQuote1 = proPurchaseQuoteService
						.queryList(proPurchaseQuote);
				for (int i = 0; i < proPurchaseQuote1.size(); i++) {
					ProPurchaseQuote propur = proPurchaseQuote1.get(i);
					if (propur.getStatus() == 4) {

						proPurchaseQuote1.remove(i);
					}
				}

				modelMap.addAttribute("proPurchaseQuote1", proPurchaseQuote1);
			}
		}
		return "theme/Member/buyQuote";
	}

	// 会员主动发出的报价
	@RequestMapping("/membuyQuote.html")
	public String membuyQuote(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		ProPurchaseQuote proPurchaseQuote = new ProPurchaseQuote();
		// 用户登录信息
		// 获取当前登陆用户
		Integer memberId = super.getLoginMemberId(request);
		if (memberId == null) {
			modelMap.addAttribute("memberId", null);
		} else {

			modelMap.addAttribute("memberId", memberId);

			proPurchaseQuote.setFromMemberId(memberId);
			if (!CollectionUtils.isEmpty(proPurchaseQuoteService
					.queryListall(proPurchaseQuote))) {

				List<ProPurchaseQuote> proPurchaseQuote1 = proPurchaseQuoteService
						.queryListall(proPurchaseQuote);
				for (int i = 0; i < proPurchaseQuote1.size(); i++) {
					ProPurchaseQuote propur = proPurchaseQuote1.get(i);
					if (propur.getStatus() == 4) {

						proPurchaseQuote1.remove(i);
					}
				}

				modelMap.addAttribute("proPurchaseQuote1", proPurchaseQuote1);
			}
		}
		return "theme/Member/MembuyQuote";
	}

	// 会员审核报价单
	@RequestMapping("/checkQuote.html")
	public String checkQuote(@RequestParam("id") Integer id,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) {
		ProPurchaseQuote proPurchaseQuote = proPurchaseQuoteService
				.findById(id);
		proPurchaseQuote.setStatus(4);
		proPurchaseQuoteService.save(proPurchaseQuote);
		return "redirect:/front/member/buyQuote.html";
	}

	// 会员审核报价单
	@RequestMapping("/memcheckQuote.html")
	public String memcheckQuote(@RequestParam("id") Integer id,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) {
		ProPurchaseQuote proPurchaseQuote = proPurchaseQuoteService
				.findById(id);
		proPurchaseQuote.setStatus(4);
		proPurchaseQuoteService.save(proPurchaseQuote);
		return "redirect:/front/member/membuyQuote.html";
	}
}
