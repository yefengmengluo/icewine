package com.wangku.dpw.domain;

import java.util.List;

public class MemberBasic {

	private Integer memberId;//账户id
	private String corporationName;//公司名称
	private String url;//会员域名
	private Integer siteId;//站点id
	private java.util.Date addTime;//添加时间
	private java.util.Date modifyTime;//更新时间
	private String logo;//公司logo
	private String fax;//传真
	private String enrollId;//注册类型
	private String dealInId;//经营类型
	private String categoryCode;//行业类别
	private String summary;//公司简介
	private String pictureUrl;//企业形象图
	private String regNumber;//工商注册号
	private String helpId;//生意助手号
	private String enName;//英文名称
	private String accreditNumber;//授权码
	private String status;//企业状态
	private String icp;//Icp备案号
	private String artificialPerson;//法人
	private String trafficUrl;//公司交通图
	private String trafficInfo;//公司交通指南
	private String dealInAddress;//经营详细地址
	private String dealInAreaCode;//经验地区code
	private java.util.Date times;//
	private Boolean flag;//导数更新标示
	private String orgWeb;//公司地址
	
	private MemberHot memberHot;
private String imgUrlLogo;
	
	
	
	
	

	public String getImgUrlLogo() {
		return imgUrlLogo;
	}

	public void setImgUrlLogo(String imgUrlLogo) {
		this.imgUrlLogo = imgUrlLogo;
	}
	private List<ProSupply>proSupply;
	
	
	
	
	private String imgUrl; // 非数据字段 图片路径
	private boolean localPic ;  // 非数据字段  判断是否为本地图片
	
// setter and getter
	
	
	public Integer getMemberId(){
		return memberId;
	}
	
	

	public List<ProSupply> getProSupply() {
		return proSupply;
	}



	public void setProSupply(List<ProSupply> proSupply) {
		this.proSupply = proSupply;
	}



	public MemberHot getMemberHot() {
		return memberHot;
	}

	public void setMemberHot(MemberHot memberHot) {
		this.memberHot = memberHot;
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

	public void setMemberId(Integer memberId){
		this.memberId = memberId;
	}
	public String getCorporationName(){
		return corporationName;
	}
	
	public void setCorporationName(String corporationName){
		this.corporationName = corporationName;
	}
	public String getUrl(){
		return url;
	}
	
	public void setUrl(String url){
		this.url = url;
	}
	public Integer getSiteId(){
		return siteId;
	}
	
	public void setSiteId(Integer siteId){
		this.siteId = siteId;
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
	public String getLogo(){
		return logo;
	}
	
	public void setLogo(String logo){
		this.logo = logo;
	}
	public String getFax(){
		return fax;
	}
	
	public void setFax(String fax){
		this.fax = fax;
	}
	public String getEnrollId(){
		return enrollId;
	}
	
	public void setEnrollId(String enrollId){
		this.enrollId = enrollId;
	}
	public String getDealInId(){
		return dealInId;
	}
	
	public void setDealInId(String dealInId){
		this.dealInId = dealInId;
	}
	public String getCategoryCode(){
		return categoryCode;
	}
	
	public void setCategoryCode(String categoryCode){
		this.categoryCode = categoryCode;
	}
	public String getSummary(){
		return summary;
	}
	
	public void setSummary(String summary){
		this.summary = summary;
	}
	public String getPictureUrl(){
		return pictureUrl;
	}
	
	public void setPictureUrl(String pictureUrl){
		this.pictureUrl = pictureUrl;
	}
	public String getRegNumber(){
		return regNumber;
	}
	
	public void setRegNumber(String regNumber){
		this.regNumber = regNumber;
	}
	public String getHelpId(){
		return helpId;
	}
	
	public void setHelpId(String helpId){
		this.helpId = helpId;
	}
	public String getEnName(){
		return enName;
	}
	
	public void setEnName(String enName){
		this.enName = enName;
	}
	public String getAccreditNumber(){
		return accreditNumber;
	}
	
	public void setAccreditNumber(String accreditNumber){
		this.accreditNumber = accreditNumber;
	}
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	public String getIcp(){
		return icp;
	}
	
	public void setIcp(String icp){
		this.icp = icp;
	}
	public String getArtificialPerson(){
		return artificialPerson;
	}
	
	public void setArtificialPerson(String artificialPerson){
		this.artificialPerson = artificialPerson;
	}
	public String getTrafficUrl(){
		return trafficUrl;
	}
	
	public void setTrafficUrl(String trafficUrl){
		this.trafficUrl = trafficUrl;
	}
	public String getTrafficInfo(){
		return trafficInfo;
	}
	
	public void setTrafficInfo(String trafficInfo){
		this.trafficInfo = trafficInfo;
	}
	public String getDealInAddress(){
		return dealInAddress;
	}
	
	public void setDealInAddress(String dealInAddress){
		this.dealInAddress = dealInAddress;
	}
	public String getDealInAreaCode(){
		return dealInAreaCode;
	}
	
	public void setDealInAreaCode(String dealInAreaCode){
		this.dealInAreaCode = dealInAreaCode;
	}
	public java.util.Date getTimes(){
		return times;
	}
	
	public void setTimes(java.util.Date times){
		this.times = times;
	}
	public Boolean getFlag(){
		return flag;
	}
	
	public void setFlag(Boolean flag){
		this.flag = flag;
	}
	public String getOrgWeb(){
		return orgWeb;
	}
	
	public void setOrgWeb(String orgWeb){
		this.orgWeb = orgWeb;
	}



	@Override
	public String toString() {
		return "MemberBasic [memberId=" + memberId + ", corporationName="
				+ corporationName + ", url=" + url + ", siteId=" + siteId
				+ ", addTime=" + addTime + ", modifyTime=" + modifyTime
				+ ", logo=" + logo + ", fax=" + fax + ", enrollId=" + enrollId
				+ ", dealInId=" + dealInId + ", categoryCode=" + categoryCode
				+ ", summary=" + summary + ", pictureUrl=" + pictureUrl
				+ ", regNumber=" + regNumber + ", helpId=" + helpId
				+ ", enName=" + enName + ", accreditNumber=" + accreditNumber
				+ ", status=" + status + ", icp=" + icp + ", artificialPerson="
				+ artificialPerson + ", trafficUrl=" + trafficUrl
				+ ", trafficInfo=" + trafficInfo + ", dealInAddress="
				+ dealInAddress + ", dealInAreaCode=" + dealInAreaCode
				+ ", times=" + times + ", flag=" + flag + ", orgWeb=" + orgWeb
				+ ", memberHot=" + memberHot + ", proSupply=" + proSupply
				+ ", imgUrl=" + imgUrl + ", localPic=" + localPic + "]";
	}
	
	
}
