package com.wangku.dpw.domain;

public class ProSupplyQuote {

	private Long id;//主键ID
	private Long supId;//供应产品ID
	private String title;//询盘标题
	private String subject;//询盘主题
	private String corpName;//公司名称
	private Long fromMemberId;//询盘发送者iD
	private Long toMemberId;//询盘接受者ID
	private String email;//邮箱
	private String tel;//电话号码
	private String mobile;//手机号码
	private Boolean isRead;//1为已读，0为未读
	private Boolean isFromDelete;//(发送者,未删除:0,删除:1)
	private Boolean isToDelete;//(接收者,未删除:0,删除:1)
	private String replyContent;//回复的内容
	private java.util.Date addTime;//添加时间
	private java.util.Date replyTime;//回复时间
	private String linkMan;//联系人
	private String typeId;//	询盘类型(1.供应;2招商)
	
// setter and getter
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}
	public Long getSupId(){
		return supId;
	}
	
	public void setSupId(Long supId){
		this.supId = supId;
	}
	public String getTitle(){
		return title;
	}
	
	public void setTitle(String title){
		this.title = title;
	}
	public String getSubject(){
		return subject;
	}
	
	public void setSubject(String subject){
		this.subject = subject;
	}
	public String getCorpName(){
		return corpName;
	}
	
	public void setCorpName(String corpName){
		this.corpName = corpName;
	}
	public Long getFromMemberId(){
		return fromMemberId;
	}
	
	public void setFromMemberId(Long fromMemberId){
		this.fromMemberId = fromMemberId;
	}
	public Long getToMemberId(){
		return toMemberId;
	}
	
	public void setToMemberId(Long toMemberId){
		this.toMemberId = toMemberId;
	}
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	public String getTel(){
		return tel;
	}
	
	public void setTel(String tel){
		this.tel = tel;
	}
	public String getMobile(){
		return mobile;
	}
	
	public void setMobile(String mobile){
		this.mobile = mobile;
	}
	public Boolean getIsRead(){
		return isRead;
	}
	
	public void setIsRead(Boolean isRead){
		this.isRead = isRead;
	}
	public Boolean getIsFromDelete(){
		return isFromDelete;
	}
	
	public void setIsFromDelete(Boolean isFromDelete){
		this.isFromDelete = isFromDelete;
	}
	public Boolean getIsToDelete(){
		return isToDelete;
	}
	
	public void setIsToDelete(Boolean isToDelete){
		this.isToDelete = isToDelete;
	}
	public String getReplyContent(){
		return replyContent;
	}
	
	public void setReplyContent(String replyContent){
		this.replyContent = replyContent;
	}
	public java.util.Date getAddTime(){
		return addTime;
	}
	
	public void setAddTime(java.util.Date addTime){
		this.addTime = addTime;
	}
	public java.util.Date getReplyTime(){
		return replyTime;
	}
	
	public void setReplyTime(java.util.Date replyTime){
		this.replyTime = replyTime;
	}
	public String getLinkMan(){
		return linkMan;
	}
	
	public void setLinkMan(String linkMan){
		this.linkMan = linkMan;
	}
	public String getTypeId(){
		return typeId;
	}
	
	public void setTypeId(String typeId){
		this.typeId = typeId;
	}
}
