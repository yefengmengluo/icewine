package com.wangku.dpw.domain;

public class ProPurchaseQuote {

	private Integer id;//主键ID
	private Integer purId;//采购单ID
	private Integer toMemberId;//报价接收者ID
	private java.math.BigDecimal totalPrice;//总报价价格
	private String perPrice;//如:[{"pur_detail_id":"2315243","price","140.231"},{"pur_detail_id":"2315244","price","1523"}]
	private String linkman;//联系人
	private String tel;//联系电话
	private Integer isHaveInvoice;//是否带发票
	private String nvoiceRate;//发票税点(10%)
	private String message;//留言
	private Boolean isFinalist;//是否入围
	private Boolean isRead;//是否查看
	private Boolean isFromDelete;//(发送者,未删除:0,删除:1)
	private Boolean isToDelete;//(接收者,未删除:0,删除:1)
	private String addTime;//添加时间
	private String modifyTime;//修改时间
	private Integer fromMemberId;//报价发布者ID
	private String addFile;//附加文件
	private Integer status;//1:已下单;0:未下单2:撤回3:退回 4：删除
	private Boolean dataSource;//1:电脑;2:手机
	private MemberBasic memberBasic;
	private Member member;
	private ProPurchase proPurchase;
	
	
// setter and getter
	
	
	public Integer getId(){
		return id;
	}
	
	

	public MemberBasic getMemberBasic() {
		return memberBasic;
	}

	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public ProPurchase getProPurchase() {
		return proPurchase;
	}

	public void setProPurchase(ProPurchase proPurchase) {
		this.proPurchase = proPurchase;
	}

	public void setId(Integer id){
		this.id = id;
	}
	public Integer getPurId(){
		return purId;
	}
	
	public void setPurId(Integer purId){
		this.purId = purId;
	}
	public Integer getToMemberId(){
		return toMemberId;
	}
	
	public void setToMemberId(Integer toMemberId){
		this.toMemberId = toMemberId;
	}
	public java.math.BigDecimal getTotalPrice(){
		return totalPrice;
	}
	
	public void setTotalPrice(java.math.BigDecimal totalPrice){
		this.totalPrice = totalPrice;
	}
	public String getPerPrice(){
		return perPrice;
	}
	
	public void setPerPrice(String perPrice){
		this.perPrice = perPrice;
	}
	public String getLinkman(){
		return linkman;
	}
	
	public void setLinkman(String linkman){
		this.linkman = linkman;
	}
	public String getTel(){
		return tel;
	}
	
	public void setTel(String tel){
		this.tel = tel;
	}
	public Integer getIsHaveInvoice(){
		return isHaveInvoice;
	}
	
	public void setIsHaveInvoice(Integer isHaveInvoice){
		this.isHaveInvoice = isHaveInvoice;
	}
	public String getNvoiceRate(){
		return nvoiceRate;
	}
	
	public void setNvoiceRate(String nvoiceRate){
		this.nvoiceRate = nvoiceRate;
	}
	public String getMessage(){
		return message;
	}
	
	public void setMessage(String message){
		this.message = message;
	}
	public Boolean getIsFinalist(){
		return isFinalist;
	}
	
	public void setIsFinalist(Boolean isFinalist){
		this.isFinalist = isFinalist;
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
	public String getAddTime(){
		if(addTime!=null && addTime.length()>19){
			return addTime.substring(0,19) ;
		}
		return addTime;
	}
	
	public void setAddTime(String addTime){
		this.addTime = addTime;
	}
	public String getModifyTime(){
		if(modifyTime!=null && modifyTime.length()>19){
			return modifyTime.substring(0,19) ;
		}
		return modifyTime;
	}
	
	public void setModifyTime(String modifyTime){
		this.modifyTime = modifyTime;
	}
	public Integer getFromMemberId(){
		return fromMemberId;
	}
	
	public void setFromMemberId(Integer fromMemberId){
		this.fromMemberId = fromMemberId;
	}
	public String getAddFile(){
		return addFile;
	}
	
	public void setAddFile(String addFile){
		this.addFile = addFile;
	}
	public Integer getStatus(){
		return status;
	}
	
	public void setStatus(Integer status){
		this.status = status;
	}
	public Boolean getDataSource(){
		return dataSource;
	}
	
	public void setDataSource(Boolean dataSource){
		this.dataSource = dataSource;
	}
}
