package com.wangku.dpw.domain;

public class ProPurchase {

	private Integer id;// 主键ID
	private Integer memberId;// 用户ID
	private String title;// 采购单标题
	private String picture;// 采购单图片
	private String summary;// 采购单摘要
	private String deliveryAddr;// 收货地址
	private String supplierAddr;// 供应商地址
	private String requirement;// 提供样品或样品图片

	private String linkman;// 联系人
	private String tel;// 联系电话
	private Boolean showContact;// 0为可见，1为不可见
	private String endTime;// 报价截止日期
	private String addTime;// 添加时间
	private String modifyTime;// 修改时间
	private Integer quoteTimes;// 报价次数
	private String status;// 采购状态
	private Integer siteId;// 站点ID
	private String times;//
	private String source;// 采购数据来源(LPT:老平台 AL:阿里巴巴,其他的以后添加,为空为新平台录入数据)
	private java.math.BigDecimal purchaseAmount;// 采购规模
	private String purchaseAmountUnit;// 采购规模单位
	private String invoiceRequest;// 发票要求
	private String sampleRequest;// 样品要求
	private String telAreaCode;// 固定电话区号
	private String telFixedNumber;// 固定电话固定号码
	private String dataType;// 采购单类型(0:采购;1:询盘;2:一键搬家;3:指定商机询价;4:主动报价询盘)
	private String isPush;// 未推送:-1;已推送:1
	private Integer pushCount;// 推送次数
	private String isContact;// 未联系:0;已联系:1
	private Integer purQuantity;// 采购数量
	private String unit;// 单位
	private java.math.BigDecimal unitPrice;// 目标单价
	private String categoryCode;// 所属行业
	private String code;// 其他
	private Member member;
	private MemberBasic memberBasic;
	private ProPurchaseQuote proPurchaseQuote;



	public MemberBasic getMemberBasic() {
		return memberBasic;
	}

	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}

	public ProPurchaseQuote getProPurchaseQuote() {
		return proPurchaseQuote;
	}

	public void setProPurchaseQuote(ProPurchaseQuote proPurchaseQuote) {
		this.proPurchaseQuote = proPurchaseQuote;
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

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getDeliveryAddr() {
		return deliveryAddr;
	}

	public void setDeliveryAddr(String deliveryAddr) {
		this.deliveryAddr = deliveryAddr;
	}

	public String getSupplierAddr() {
		return supplierAddr;
	}

	public void setSupplierAddr(String supplierAddr) {
		this.supplierAddr = supplierAddr;
	}

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Boolean getShowContact() {
		return showContact;
	}

	public void setShowContact(Boolean showContact) {
		this.showContact = showContact;
	}

	public String getEndTime() {
		if (endTime != null && endTime.length() > 19) {
			return endTime.substring(0, 19);
		}
		return endTime;
	}

	public void setEndTime(String endTime) {

		this.endTime = endTime;
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

	public Integer getQuoteTimes() {

		return quoteTimes;
	}

	public void setQuoteTimes(Integer quoteTimes) {
		this.quoteTimes = quoteTimes;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getSiteId() {
		return siteId;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public java.math.BigDecimal getPurchaseAmount() {
		return purchaseAmount;
	}

	public void setPurchaseAmount(java.math.BigDecimal purchaseAmount) {
		this.purchaseAmount = purchaseAmount;
	}

	public String getPurchaseAmountUnit() {
		return purchaseAmountUnit;
	}

	public void setPurchaseAmountUnit(String purchaseAmountUnit) {
		this.purchaseAmountUnit = purchaseAmountUnit;
	}

	public String getInvoiceRequest() {
		return invoiceRequest;
	}

	public void setInvoiceRequest(String invoiceRequest) {
		this.invoiceRequest = invoiceRequest;
	}

	public String getSampleRequest() {
		return sampleRequest;
	}

	public void setSampleRequest(String sampleRequest) {
		this.sampleRequest = sampleRequest;
	}

	public String getTelAreaCode() {
		return telAreaCode;
	}

	public void setTelAreaCode(String telAreaCode) {
		this.telAreaCode = telAreaCode;
	}

	public String getTelFixedNumber() {
		return telFixedNumber;
	}

	public void setTelFixedNumber(String telFixedNumber) {
		this.telFixedNumber = telFixedNumber;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getIsPush() {
		return isPush;
	}

	public void setIsPush(String isPush) {
		this.isPush = isPush;
	}

	public Integer getPushCount() {
		return pushCount;
	}

	public void setPushCount(Integer pushCount) {
		this.pushCount = pushCount;
	}

	public String getIsContact() {
		return isContact;
	}

	public void setIsContact(String isContact) {
		this.isContact = isContact;
	}

	public Integer getPurQuantity() {
		return purQuantity;
	}

	public void setPurQuantity(Integer purQuantity) {
		this.purQuantity = purQuantity;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public java.math.BigDecimal getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(java.math.BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
