package com.wangku.dpw.domain;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProSupply implements Serializable {
	/** 
	* serialVersionUID:TODO（用一句话描述这个变量表示什么） 
	* 
	* @since 1.0.0 
	*/
	private static final long serialVersionUID = -5636000371388805402L;

	private Long id;//主键ID
	private String name;//商机标题,对应(ProductAudit-Name)
	private String alias;//产品别名,对应(ProductAudit-Alias)
	private String pic;//产品图片，对应(ProductAudit-PictureURL)
	private String categoryCode;//产品分类信息，对应(ProductAudit-CategoryCode)
	private String classCode;//店铺类别,对应[ProductAudit-ClassCode]
	private String areaCode;//地区编码,对应[ProductAudit-MemberAreaCode]
	private String brandCode;//品牌编码,对应ProductAudit-BrandCode]
	private String brandName;//品牌编码名称,对应ProductAudit-BrandName]
	private String unit;//单位,对应[ProductAudit-Unit]
	private String unitCustom;//手写的单位
	private String summary;//简介,,对应[ProductAudit-Summary]
	private Integer memberId;//会员ID,,对应[ProductAudit-MemberID]
	private Integer siteId;// 站点ID
	private Integer freightId;//运费模板，对应(ProductAuditEx-FAID)
	private Integer addrId;//发货地址ID(ProductAuditEx-PAID)
	private java.math.BigDecimal priceMin;//最低价格
	private String priceInterval;//价格区间，以json格式存储如( [{"Number":1,"Price":1}] )，对应(ProductAuditEx-PriceInterval)
	private Integer storeNum;//库存,对应(ProductAudit-StoreNumber)
	private String invoiceName;//发票信息,对应(ProductAuditEx-InvoiceName)
	private String deliveryDayEnd;//发货期,发货最早时间(对应ProductAudit-DelayDay)
	private String deliveryDayBegin;//发货期最晚时间，对应(productauditEx-DelayStartDay)
	private String promotionType;//促销信息类别如(建议零售价，市场价，原价)对应(ProductAuditEx-RetailType)
	private java.math.BigDecimal promotionPrice;//优惠价格，对应(ProductAuditEx-RetailPrice)
	private Boolean promotionIsShow;//促销信息是否显示,对应(ProductAuditEx-RetailHide)
	private Boolean isForTrade;//1，为允许交易 0，为不允许交易.对应(ProductAuditEx-NetworkBuy)
	private String status;//供应信息状态,对应[productaudit-status] 
	@DateTimeFormat(pattern="yyyy-MM-dd")private java.util.Date addTime;//添加时间,对应(ProductAudit-AddTime)
	@DateTimeFormat(pattern="yyyy-MM-dd")private java.util.Date modifyTime;//修改时间，对应(ProductAudit-UpdateTime)
	@DateTimeFormat(pattern="yyyy-MM-dd")private java.util.Date expireTime;//过期时间,(ProductAudit-ExpirationTime)
	@DateTimeFormat(pattern="yyyy-MM-dd")private Date times;//
	private Integer sales;//销量
	private String source;//商机数据来源(LPT:老平台 AL:阿里巴巴,其他的以后添加,为空为新平台录入数据)
	private String priceDistrict;//区域报价
	private String priceInner;//内部价
	private String keyword;//搜索关键字
	private String extractAddr;//自提地址
	private String corporationName;//公司名称
	private ImgImages imgImages;//图片表
	private String imgUrl ; // 非数据字段  图片路径
	private boolean localPic ;  // 非数据字段  判断是否为本地图片
	private String  linkman;//联系人
	private String  telephone;//电话
	private String  department;//职位
	
	private String  memberName;//公司名称
	
	
	
 
    
	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public ImgImages getImgImages() {
		return imgImages;
	}

	public void setImgImages(ImgImages imgImages) {
		this.imgImages = imgImages;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public boolean isLocalPic() {
		return localPic;
	}

	public void setLocalPic(boolean localPic) {
		this.localPic = localPic;
	}

	// setter and getter
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	public String getAlias(){
		return alias;
	}
	
	public void setAlias(String alias){
		this.alias = alias;
	}
	public String getPic(){
		return pic;
	}
	
	public void setPic(String pic){
		this.pic = pic;
	}
	public String getCategoryCode(){
		return categoryCode;
	}
	
	public void setCategoryCode(String categoryCode){
		this.categoryCode = categoryCode;
	}
	public String getClassCode(){
		return classCode;
	}
	
	public void setClassCode(String classCode){
		this.classCode = classCode;
	}
	public String getAreaCode(){
		return areaCode;
	}
	
	public void setAreaCode(String areaCode){
		this.areaCode = areaCode;
	}
	public String getBrandCode(){
		return brandCode;
	}
	
	public void setBrandCode(String brandCode){
		this.brandCode = brandCode;
	}
	public String getBrandName(){
		return brandName;
	}
	
	public void setBrandName(String brandName){
		this.brandName = brandName;
	}
	public String getUnit(){
		return unit;
	}
	
	public void setUnit(String unit){
		this.unit = unit;
	}
	public String getUnitCustom(){
		return unitCustom;
	}
	
	public void setUnitCustom(String unitCustom){
		this.unitCustom = unitCustom;
	}
	public String getSummary(){
		return summary;
	}
	
	public void setSummary(String summary){
		this.summary = summary;
	}
    
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getSiteId(){
		return siteId;
	}
	
	public void setSiteId(Integer siteId){
		this.siteId = siteId;
	}
	public Integer getFreightId(){
		return freightId;
	}
	
	public void setFreightId(Integer freightId){
		this.freightId = freightId;
	}
	public Integer getAddrId(){
		return addrId;
	}
	
	public void setAddrId(Integer addrId){
		this.addrId = addrId;
	}
	public java.math.BigDecimal getPriceMin(){
		return priceMin;
	}
	
	public void setPriceMin(java.math.BigDecimal priceMin){
		this.priceMin = priceMin;
	}
	public String getPriceInterval(){
		return priceInterval;
	}
	
	public void setPriceInterval(String priceInterval){
		this.priceInterval = priceInterval;
	}
	public Integer getStoreNum(){
		return storeNum;
	}
	
	public void setStoreNum(Integer storeNum){
		this.storeNum = storeNum;
	}
	public String getInvoiceName(){
		return invoiceName;
	}
	
	public void setInvoiceName(String invoiceName){
		this.invoiceName = invoiceName;
	}
	public String getDeliveryDayEnd(){
		return deliveryDayEnd;
	}
	
	public void setDeliveryDayEnd(String deliveryDayEnd){
		this.deliveryDayEnd = deliveryDayEnd;
	}
	public String getDeliveryDayBegin(){
		return deliveryDayBegin;
	}
	
	public void setDeliveryDayBegin(String deliveryDayBegin){
		this.deliveryDayBegin = deliveryDayBegin;
	}
	public String getPromotionType(){
		return promotionType;
	}
	
	public void setPromotionType(String promotionType){
		this.promotionType = promotionType;
	}
	public java.math.BigDecimal getPromotionPrice(){
		return promotionPrice;
	}
	
	public void setPromotionPrice(java.math.BigDecimal promotionPrice){
		this.promotionPrice = promotionPrice;
	}
	public Boolean getPromotionIsShow(){
		return promotionIsShow;
	}
	
	public void setPromotionIsShow(Boolean promotionIsShow){
		this.promotionIsShow = promotionIsShow;
	}
	public Boolean getIsForTrade(){
		return isForTrade;
	}
	
	public void setIsForTrade(Boolean isForTrade){
		this.isForTrade = isForTrade;
	}
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	public java.util.Date getAddTime(){
		return addTime;
	}
	
	public void setAddTime(java.util.Date addTime){
		this.addTime = addTime;
	}
	public java.util.Date getModifyTime(){
		return modifyTime;
	}
	
	public void setModifyTime(java.util.Date modifyTime){
		this.modifyTime = modifyTime;
	}
	public java.util.Date getExpireTime(){
		return expireTime;
	}
	
	public void setExpireTime(java.util.Date expireTime){
		this.expireTime = expireTime;
	}
	public java.util.Date getTimes(){
		return times;
	}
	
	public void setTimes(java.util.Date times){
		this.times = times;
	}
	public Integer getSales(){
		return sales;
	}
	
	public void setSales(Integer sales){
		this.sales = sales;
	}
	public String getSource(){
		return source;
	}
	
	public void setSource(String source){
		this.source = source;
	}
	public String getPriceDistrict(){
		return priceDistrict;
	}
	
	public void setPriceDistrict(String priceDistrict){
		this.priceDistrict = priceDistrict;
	}
	public String getPriceInner(){
		return priceInner;
	}
	
	public void setPriceInner(String priceInner){
		this.priceInner = priceInner;
	}
	public String getKeyword(){
		return keyword;
	}
	
	public void setKeyword(String keyword){
		this.keyword = keyword;
	}
	public String getExtractAddr(){
		return extractAddr;
	}
	
	public void setExtractAddr(String extractAddr){
		this.extractAddr = extractAddr;
	}
	public String getCorporationName() {
		return corporationName;
	}

	public void setCorporationName(String corporationName) {
		this.corporationName = corporationName;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	
}
