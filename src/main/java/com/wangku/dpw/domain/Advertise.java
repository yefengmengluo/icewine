package com.wangku.dpw.domain;

import java.io.Serializable;

public class Advertise implements Serializable{
	/** 
	* serialVersionUID:TODO（用一句话描述这个变量表示什么） 
	* 
	* @since 1.0.0 
	*/
	private static final long serialVersionUID = -5636000371388805402L;
	private Integer id;//主键id
	private String title;//标题
	private String biref;//简介
	private String img;//图片
	private String adType;//类型
	private String flag;//显示位置
	private String content;//内容
	private String addTime;//上传时间
	private String imgUrl;//图片条状链接
	private String nature;//企业/个人类别
	private String summary;//简介
	private String replyTime;//回复时间
	
// setter and getter
	public Integer getId(){
		return id;
	}
	
	public void setId(Integer id){
		this.id = id;
	}
	public String getTitle(){
		return title;
	}
	
	public void setTitle(String title){
		this.title = title;
	}
	public String getBiref(){
		return biref;
	}
	
	public void setBiref(String biref){
		this.biref = biref;
	}
	public String getImg(){
		return img;
	}
	
	public void setImg(String img){
		this.img = img;
	}
	public String getAdType(){
		return adType;
	}
	
	public void setAdType(String adType){
		this.adType = adType;
	}
	public String getFlag(){
		return flag;
	}
	
	public void setFlag(String flag){
		this.flag = flag;
	}
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}

	public String getImgUrl(){
		return imgUrl;
	}
	
	public void setImgUrl(String imgUrl){
		this.imgUrl = imgUrl;
	}
	public String getNature(){
		return nature;
	}
	
	public void setNature(String nature){
		this.nature = nature;
	}
	public String getSummary(){
		return summary;
	}
	
	public void setSummary(String summary){
		this.summary = summary;
	}

	public String getAddTime() {
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public String getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(String replyTime) {
		this.replyTime = replyTime;
	}
	
}
