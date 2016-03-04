package com.wangku.dpw.domain;

public class ProInvestmentStore {

	private Long id;//编号
	private Long investmentId;//招商外键ID
	private Long memberId;//会员ID
	private String status;//状态(DELETE、UNDELETE)
	private java.util.Date storeTime;//收藏时间
	
// setter and getter
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}
	public Long getInvestmentId(){
		return investmentId;
	}
	
	public void setInvestmentId(Long investmentId){
		this.investmentId = investmentId;
	}
	public Long getMemberId(){
		return memberId;
	}
	
	public void setMemberId(Long memberId){
		this.memberId = memberId;
	}
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	public java.util.Date getStoreTime(){
		return storeTime;
	}
	
	public void setStoreTime(java.util.Date storeTime){
		this.storeTime = storeTime;
	}
}
