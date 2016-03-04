package com.wangku.dpw.domain;

import java.io.Serializable;

public class Article implements Serializable{
	/** 
	* serialVersionUID:TODO（用一句话描述这个变量表示什么） 
	* 
	* @since 1.0.0 
	*/
	private static final long serialVersionUID = -5636000371388805402L;
	private Integer id;//自增id
	private String title;//标题名称
	private String pictureUrl;//图片地址
	private String classCode;//类别编码
	private String author;//作者
	private String origin;//来源
	private String originType;//来源类型,调用数据字典
	private String summary;//简介
	private String dataStatus;//数据状态
	private String tag;//标签
	private String creater;//创建人
	private Integer siteId;//站点id
	private String addTime;//添加时间
	private String mdfyTime;//修改时间
	private Integer exInt;//扩展字段int类型
	private String exString;//扩展字段string类型
	private String htmlId;//html_id,为兼容老平台字段，取出文件存储位置，对应(ProductAudit-HTMLID)
	private String times;//
	private String innerweb;//站内网站
	private String innerweburl;//站内网站URL
	private String keywords;//关键词
	private String status;//资讯来源状态(1:默认后台添加;2:从单品头条添加)
	private String categoryName;//分类名称
	private String flag;//状态标识
	private String code;//分类编码
	private ImgImages imgImages;//图片表
	
	private String imgUrl ; // 非数据字段  图片路径
	private boolean localPic ;  // 非数据字段  判断是否为本地图片
	
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
	public String getPictureUrl(){
		return pictureUrl;
	}
	
	public void setPictureUrl(String pictureUrl){
		this.pictureUrl = pictureUrl;
	}
	public String getClassCode(){
		return classCode;
	}
	
	public void setClassCode(String classCode){
		this.classCode = classCode;
	}
	public String getAuthor(){
		return author;
	}
	
	public void setAuthor(String author){
		this.author = author;
	}
	public String getOrigin(){
		return origin;
	}
	
	public void setOrigin(String origin){
		this.origin = origin;
	}
	public String getOriginType(){
		return originType;
	}
	
	public void setOriginType(String originType){
		this.originType = originType;
	}
	public String getSummary(){
		return summary;
	}
	
	public void setSummary(String summary){
		this.summary = summary;
	}
	public String getDataStatus(){
		return dataStatus;
	}
	
	public void setDataStatus(String dataStatus){
		this.dataStatus = dataStatus;
	}
	public String getTag(){
		return tag;
	}
	
	public void setTag(String tag){
		this.tag = tag;
	}
	public String getCreater(){
		return creater;
	}
	
	public void setCreater(String creater){
		this.creater = creater;
	}
	public Integer getSiteId(){
		return siteId;
	}
	
	public void setSiteId(Integer siteId){
		this.siteId = siteId;
	}
    
	
	public String getAddTime() {
		if(addTime!=null&&addTime.length()>19){
			return addTime.substring(0,19);
			
		}
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public String getMdfyTime() {
		if(mdfyTime!=null&&mdfyTime.length()>19){
			return mdfyTime.substring(0, 19);
		}
		return mdfyTime;
	}

	public void setMdfyTime(String mdfyTime) {
		this.mdfyTime = mdfyTime;
	}

	public Integer getExInt() {
		return exInt;
	}

	public void setExInt(Integer exInt){
		this.exInt = exInt;
	}
	public String getExString(){
		return exString;
	}
	
	public void setExString(String exString){
		this.exString = exString;
	}
	public String getHtmlId(){
		return htmlId;
	}
	
	public void setHtmlId(String htmlId){
		this.htmlId = htmlId;
	}
    
	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public String getInnerweb(){
		return innerweb;
	}
	
	public void setInnerweb(String innerweb){
		this.innerweb = innerweb;
	}
	public String getInnerweburl(){
		return innerweburl;
	}
	
	public void setInnerweburl(String innerweburl){
		this.innerweburl = innerweburl;
	}
	public String getKeywords(){
		return keywords;
	}
	
	public void setKeywords(String keywords){
		this.keywords = keywords;
	}
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	public String getCategoryName(){
		return categoryName;
	}
	
	public void setCategoryName(String categoryName){
		this.categoryName = categoryName;
	}
	public String getFlag(){
		return flag;
	}
	
	public void setFlag(String flag){
		this.flag = flag;
	}
	public String getCode(){
		return code;
	}
	
	public void setCode(String code){
		this.code = code;
	}

	public ImgImages getImgImages() {
		return imgImages;
	}

	public void setImgImages(ImgImages imgImages) {
		this.imgImages = imgImages;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public boolean isLocalPic() {
		return localPic;
	}

	public void setLocalPic(boolean localPic) {
		this.localPic = localPic;
	}

	
    
	
}
