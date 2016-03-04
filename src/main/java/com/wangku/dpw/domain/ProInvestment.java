package com.wangku.dpw.domain;

public class ProInvestment {

	private Integer id;// 主键ID
	private String name;// 招商标题
	private String alias;// 类目名称
	private String pic;// 产品图片
	private String categoryCode;// 产品分类目录编码
	private String classCode;// 所属类别
	private String areaCode;// 区域编码
	private String brandCode;// 品牌编码,对应ProductAudit-BrandCode]
	private String brandName;// 品牌名称
	private String summary;// 产品摘要
	private Integer memberId;// 会员ID
	private Integer siteId;// 站点ID
	private String cause;// 打回原因
	private String status;// 招商信息状态
	private String addTime;// 添加时间
	private String modifyTime;// 修改时间
	private String expireTime;// 过期时间
	private String times;//
	private String certificate;// 证书图片
	private java.util.Date brandCreateTime;// 品牌创立时间
	private String brandExperience;// 品牌历程
	private String category;// 主营类目
	private java.math.BigDecimal guaranteeSum;// 保证金额
	private java.math.BigDecimal basicInvestment;// 基本投资额
	private Member member;
	private MemberBasic memberBasic;
	
	private String imgUrl; // 非数据字段 图片路径
	private boolean localPic ;  // 非数据字段  判断是否为本地图片
	

	public boolean isLocalPic() {
		return localPic;
	}

	public void setLocalPic(boolean localPic) {
		this.localPic = localPic;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public MemberBasic getMemberBasic() {
		return memberBasic;
	}

	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public java.util.Date getBrandCreateTime() {
		return brandCreateTime;
	}

	public void setBrandCreateTime(java.util.Date brandCreateTime) {
		this.brandCreateTime = brandCreateTime;
	}

	public String getBrandExperience() {
		return brandExperience;
	}

	public void setBrandExperience(String brandExperience) {
		this.brandExperience = brandExperience;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public java.math.BigDecimal getGuaranteeSum() {
		return guaranteeSum;
	}

	public void setGuaranteeSum(java.math.BigDecimal guaranteeSum) {
		this.guaranteeSum = guaranteeSum;
	}

	public java.math.BigDecimal getBasicInvestment() {
		return basicInvestment;
	}

	public void setBasicInvestment(java.math.BigDecimal basicInvestment) {
		this.basicInvestment = basicInvestment;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	// setter and getter
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getPic() {
		
			
		
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		if (classCode == "") {

		}
		this.classCode = classCode;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getBrandCode() {
		return brandCode;
	}

	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getSiteId() {
		return siteId;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAddTime() {
		if (addTime != null && addTime.length() > 19) {
			return addTime.substring(0, 19);
		}
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public String getModifyTime() {
		if (modifyTime != null && modifyTime.length() > 19) {
			return modifyTime.substring(0, 19);
		}
		return modifyTime;
	}

	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getExpireTime() {
		if (expireTime != null && expireTime.length() > 19) {
			return expireTime.substring(0, 19);
		}
		return expireTime;
	}

	public void setExpireTime(String expireTime) {
		this.expireTime = expireTime;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}
}
