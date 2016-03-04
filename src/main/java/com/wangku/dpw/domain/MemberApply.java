package com.wangku.dpw.domain;

public class MemberApply {

	private Long memberId;//账户Id
	private String applyInfo;//请求内容
	private String refuseCause;//拒绝
	private java.util.Date addTime;//添加时间
	private java.util.Date modifyTime;//更新时间
	private Integer siteId;//站点ID
	
// setter and getter
	public Long getMemberId(){
		return memberId;
	}
	
	public void setMemberId(Long memberId){
		this.memberId = memberId;
	}
	public String getApplyInfo(){
		return applyInfo;
	}
	
	public void setApplyInfo(String applyInfo){
		this.applyInfo = applyInfo;
	}
	public String getRefuseCause(){
		return refuseCause;
	}
	
	public void setRefuseCause(String refuseCause){
		this.refuseCause = refuseCause;
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
	public Integer getSiteId(){
		return siteId;
	}
	
	public void setSiteId(Integer siteId){
		this.siteId = siteId;
	}
}
