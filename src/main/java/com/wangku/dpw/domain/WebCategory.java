package com.wangku.dpw.domain;

public class WebCategory {

	private Integer id;//
	private String name;//
	private String code;//
	private String type;//
	private Integer siteId;//
	private String dataStatus;//
	private String channelType;//
	
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
	public String getCode(){
		return code;
	}
	
	public void setCode(String code){
		this.code = code;
	}
	public String getType(){
		return type;
	}
	
	public void setType(String type){
		this.type = type;
	}
	public Integer getSiteId(){
		return siteId;
	}
	
	public void setSiteId(Integer siteId){
		this.siteId = siteId;
	}
	public String getDataStatus(){
		return dataStatus;
	}
	
	public void setDataStatus(String dataStatus){
		this.dataStatus = dataStatus;
	}
	public String getChannelType(){
		return channelType;
	}
	
	public void setChannelType(String channelType){
		this.channelType = channelType;
	}
}
