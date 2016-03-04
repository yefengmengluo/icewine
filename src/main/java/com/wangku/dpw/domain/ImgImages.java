package com.wangku.dpw.domain;

import java.io.Serializable;

public class ImgImages implements Serializable{
	/** 
	* serialVersionUID:TODO（用一句话描述这个变量表示什么） 
	* 
	* @since 1.0.0 
	*/
	private static final long serialVersionUID = -5636000371388805402L;
	private Integer id;//图片ID
	private Long siteId;//站点ID
	private Long albumId;//相册ID
	private String originalIdScale;//图片编码
	private String imgName;//名称
	private String originalName;//原始名称
	private String comments;//备注
	private String imgPath;//存储路径
	private Integer imgWidth;//宽度
	private Integer imgHeight;//高度
	private Integer imgSize;//大小
	private String imgType;//图片类型
	private String checkStatus;//审核状态
	private String masterIp;//存储IP
	private Long userId;//用户id
	private java.util.Date uploadTime;//上传时间
	private String imgSourceUrl;//图片来源URL
	private Boolean delFlag;//删除标志
	private String uploadIp;//上传者IP
	private String userType;//用户类型
	private String imgSourceType;//图片来源，用于区分上传图片的来源信息，根据来源对图片进行切分
	private String fromSource;//用户来源
	private String isCut;//是否切图
	private String isWatermarked;//是否有水印
	
// setter and getter
	
	public Long getSiteId(){
		return siteId;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setSiteId(Long siteId){
		this.siteId = siteId;
	}
	public Long getAlbumId(){
		return albumId;
	}
	
	public void setAlbumId(Long albumId){
		this.albumId = albumId;
	}
	public String getOriginalIdScale(){
		return originalIdScale;
	}
	
	public void setOriginalIdScale(String originalIdScale){
		this.originalIdScale = originalIdScale;
	}
	public String getImgName(){
		return imgName;
	}
	
	public void setImgName(String imgName){
		this.imgName = imgName;
	}
	public String getOriginalName(){
		return originalName;
	}
	
	public void setOriginalName(String originalName){
		this.originalName = originalName;
	}
	public String getComments(){
		return comments;
	}
	
	public void setComments(String comments){
		this.comments = comments;
	}
	public String getImgPath(){
		return imgPath;
	}
	
	public void setImgPath(String imgPath){
		this.imgPath = imgPath;
	}
	public Integer getImgWidth(){
		return imgWidth;
	}
	
	public void setImgWidth(Integer imgWidth){
		this.imgWidth = imgWidth;
	}
	public Integer getImgHeight(){
		return imgHeight;
	}
	
	public void setImgHeight(Integer imgHeight){
		this.imgHeight = imgHeight;
	}
	public Integer getImgSize(){
		return imgSize;
	}
	
	public void setImgSize(Integer imgSize){
		this.imgSize = imgSize;
	}
	public String getImgType(){
		return imgType;
	}
	
	public void setImgType(String imgType){
		this.imgType = imgType;
	}
	public String getCheckStatus(){
		return checkStatus;
	}
	
	public void setCheckStatus(String checkStatus){
		this.checkStatus = checkStatus;
	}
	public String getMasterIp(){
		return masterIp;
	}
	
	public void setMasterIp(String masterIp){
		this.masterIp = masterIp;
	}
	public Long getUserId(){
		return userId;
	}
	
	public void setUserId(Long userId){
		this.userId = userId;
	}
	public java.util.Date getUploadTime(){
		return uploadTime;
	}
	
	public void setUploadTime(java.util.Date uploadTime){
		this.uploadTime = uploadTime;
	}
	public String getImgSourceUrl(){
		return imgSourceUrl;
	}
	
	public void setImgSourceUrl(String imgSourceUrl){
		this.imgSourceUrl = imgSourceUrl;
	}
	public Boolean getDelFlag(){
		return delFlag;
	}
	
	public void setDelFlag(Boolean delFlag){
		this.delFlag = delFlag;
	}
	public String getUploadIp(){
		return uploadIp;
	}
	
	public void setUploadIp(String uploadIp){
		this.uploadIp = uploadIp;
	}
	public String getUserType(){
		return userType;
	}
	
	public void setUserType(String userType){
		this.userType = userType;
	}
	public String getImgSourceType(){
		return imgSourceType;
	}
	
	public void setImgSourceType(String imgSourceType){
		this.imgSourceType = imgSourceType;
	}
	public String getFromSource(){
		return fromSource;
	}
	
	public void setFromSource(String fromSource){
		this.fromSource = fromSource;
	}
	public String getIsCut(){
		return isCut;
	}
	
	public void setIsCut(String isCut){
		this.isCut = isCut;
	}
	public String getIsWatermarked(){
		return isWatermarked;
	}
	
	public void setIsWatermarked(String isWatermarked){
		this.isWatermarked = isWatermarked;
	}
}
