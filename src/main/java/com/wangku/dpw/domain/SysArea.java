package com.wangku.dpw.domain;

public class SysArea {

	private Integer id;//主键id
	private String name;//地区名称
	private String areaCode;//地区编码
	private Integer areaCodeLen;//编码长度
	private String realCode;//法定的地区编码
	private String postcode;//邮编
	private String initials;//首字母拼音
	private String spell;//全拼
	private String status;//状态'delete','forbidden','retrieve' 删除,禁用,回收
	private Integer sort;//排序
	private java.util.Date addTime;//添加时间
	private java.util.Date updateTime;//修改时间
	
// setter and getter
	public Integer getId(){
		return id;
	}
	
	public void setId(Integer id){
		this.id = id;
	}
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	public String getAreaCode(){
		return areaCode;
	}
	
	public void setAreaCode(String areaCode){
		this.areaCode = areaCode;
	}
	public Integer getAreaCodeLen(){
		return areaCodeLen;
	}
	
	public void setAreaCodeLen(Integer areaCodeLen){
		this.areaCodeLen = areaCodeLen;
	}
	public String getRealCode(){
		return realCode;
	}
	
	public void setRealCode(String realCode){
		this.realCode = realCode;
	}
	public String getPostcode(){
		return postcode;
	}
	
	public void setPostcode(String postcode){
		this.postcode = postcode;
	}
	public String getInitials(){
		return initials;
	}
	
	public void setInitials(String initials){
		this.initials = initials;
	}
	public String getSpell(){
		return spell;
	}
	
	public void setSpell(String spell){
		this.spell = spell;
	}
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	public Integer getSort(){
		return sort;
	}
	
	public void setSort(Integer sort){
		this.sort = sort;
	}
	public java.util.Date getAddTime(){
		return addTime;
	}
	
	public void setAddTime(java.util.Date addTime){
		this.addTime = addTime;
	}
	public java.util.Date getUpdateTime(){
		return updateTime;
	}
	
	public void setUpdateTime(java.util.Date updateTime){
		this.updateTime = updateTime;
	}
}
