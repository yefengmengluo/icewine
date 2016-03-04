package com.wangku.dpw.domain;

public class ProInvestmentExtension {

	private Long id;//编号
	private Long foreignKey;//(招商)外键ID
	private Integer countNum;//统计次数(被询盘次数)
	private java.util.Date addTime;//添加时间
	
	
// setter and getter
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}
	public Long getForeignKey(){
		return foreignKey;
	}
	
	public void setForeignKey(Long foreignKey){
		this.foreignKey = foreignKey;
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
}
