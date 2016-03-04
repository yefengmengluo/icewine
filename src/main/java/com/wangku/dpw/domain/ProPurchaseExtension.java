package com.wangku.dpw.domain;

public class ProPurchaseExtension {

	private Long id;//编号
	private Integer purId;//(采购)外键ID
	private Integer countNum;//统计次数(被报价次数)
	private java.util.Date addTime;//添加时间
	private Long fileId;//对应系统文件表的主键字段
	private Integer siteId;//站点ID
	private String status;//采购附件状态
	
// setter and getter
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}
	public Integer getPurId(){
		return purId;
	}
	
	public void setPurId(Integer purId){
		this.purId = purId;
	}
	public Integer getCountNum(){
		return countNum;
	}
	
	public void setCountNum(Integer countNum){
		this.countNum = countNum;
	}
	public java.util.Date getAddTime(){
		return addTime;
	}
	
	public void setAddTime(java.util.Date addTime){
		this.addTime = addTime;
	}
	public Long getFileId(){
		return fileId;
	}
	
	public void setFileId(Long fileId){
		this.fileId = fileId;
	}
	public Integer getSiteId(){
		return siteId;
	}
	
	public void setSiteId(Integer siteId){
		this.siteId = siteId;
	}
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
}
