package com.wangku.dpw.domain;

public class MemberHot {

	private Long memberId;//会员id
	private Integer siteId;//站点id
	private Integer originSiteId;//来源站点id
	private String webCategoryCode;//推荐置顶板块分类编码
	private Integer sort;//排序
	private Integer status;//状态
	private java.util.Date addTime;//添加时间
	private java.util.Date times;//
	
// setter and getter
	public Long getMemberId(){
		return memberId;
	}
	
	public void setMemberId(Long memberId){
		this.memberId = memberId;
	}
	public Integer getSiteId(){
		return siteId;
	}
	
	public void setSiteId(Integer siteId){
		this.siteId = siteId;
	}
	public Integer getOriginSiteId(){
		return originSiteId;
	}
	
	public void setOriginSiteId(Integer originSiteId){
		this.originSiteId = originSiteId;
	}
	public String getWebCategoryCode(){
		return webCategoryCode;
	}
	
	public void setWebCategoryCode(String webCategoryCode){
		this.webCategoryCode = webCategoryCode;
	}
	public Integer getSort(){
		return sort;
	}
	
	public void setSort(Integer sort){
		this.sort = sort;
	}
	public Integer getStatus(){
		return status;
	}
	
	public void setStatus(Integer status){
		this.status = status;
	}
	public java.util.Date getAddTime(){
		return addTime;
	}
	
	public void setAddTime(java.util.Date addTime){
		this.addTime = addTime;
	}
	public java.util.Date getTimes(){
		return times;
	}
	
	public void setTimes(java.util.Date times){
		this.times = times;
	}
}
