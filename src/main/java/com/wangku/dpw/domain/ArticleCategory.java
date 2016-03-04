package com.wangku.dpw.domain;

import java.io.Serializable;

public class ArticleCategory implements Serializable{
	/** 
	* serialVersionUID:TODO（用一句话描述这个变量表示什么） 
	* 
	* @since 1.0.0 
	*/
	private static final long serialVersionUID = -5636000371388805402L;
	private Integer id;//主键ID
	private String platformType;//调用数据字典
	private Integer siteId;// 站点ID
	private String code;//分类编码
	private String name;//分类名称
	private String codeDepth;//分类深度
	private String dataStatus;//状态
	private Integer sort;//排序
	private String isOpen;//是否开放(0:不开放;1:是开放)
	
// setter and getter
   
	public String getPlatformType(){
		return platformType;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setPlatformType(String platformType){
		this.platformType = platformType;
	}
	public Integer getSiteId(){
		return siteId;
	}
	
	public void setSiteId(Integer siteId){
		this.siteId = siteId;
	}
	public String getCode(){
		return code;
	}
	
	public void setCode(String code){
		this.code = code;
	}
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	public String getCodeDepth(){
		return codeDepth;
	}
	
	public void setCodeDepth(String codeDepth){
		this.codeDepth = codeDepth;
	}
	public String getDataStatus(){
		return dataStatus;
	}
	
	public void setDataStatus(String dataStatus){
		this.dataStatus = dataStatus;
	}
	public Integer getSort(){
		return sort;
	}
	
	public void setSort(Integer sort){
		this.sort = sort;
	}
	public String getIsOpen(){
		return isOpen;
	}
	
	public void setIsOpen(String isOpen){
		this.isOpen = isOpen;
	}
}
