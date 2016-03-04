package com.wangku.dpw.domain;

public class ProInvestmentJoin {

	private Integer id;//编号
	private Long investmentId;//招商外键ID
	private Integer memberId;//发布会员ID
	private String status;//状态
	private String joinType;//加盟类型（公司/个人）
	private String companyName;//公司名称
	private String qq;//qq
	private String phone;//联系电话
	private String linkman;//联系人
	private String email;//邮箱
	private String telephone;//手机
	private String quote;//询盘
	private Integer toMemberId;//接收者会员ID
	private String code;//其他
	private String code1;//其他
	private Integer code2;//其他
	
	private Member member;
	
	private MemberBasic memberBasic;
	
	private ProInvestment proInvestment;
	
// setter and getter
	
	
	public Integer getId(){
		return id;
	}
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public MemberBasic getMemberBasic() {
		return memberBasic;
	}

	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}

	public ProInvestment getProInvestment() {
		return proInvestment;
	}

	public void setProInvestment(ProInvestment proInvestment) {
		this.proInvestment = proInvestment;
	}

	public void setId(Integer id){
		this.id = id;
	}
	public Long getInvestmentId(){
		return investmentId;
	}
	
	public void setInvestmentId(Long investmentId){
		this.investmentId = investmentId;
	}
	public Integer getMemberId(){
		return memberId;
	}
	
	public void setMemberId(Integer memberId){
		this.memberId = memberId;
	}
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	public String getJoinType(){
		return joinType;
	}
	
	public void setJoinType(String joinType){
		this.joinType = joinType;
	}
	public String getCompanyName(){
		return companyName;
	}
	
	public void setCompanyName(String companyName){
		this.companyName = companyName;
	}
	public String getQq(){
		return qq;
	}
	
	public void setQq(String qq){
		this.qq = qq;
	}
	public String getPhone(){
		return phone;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
	public String getLinkman(){
		return linkman;
	}
	
	public void setLinkman(String linkman){
		this.linkman = linkman;
	}
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	public String getTelephone(){
		return telephone;
	}
	
	public void setTelephone(String telephone){
		this.telephone = telephone;
	}
	public String getQuote(){
		return quote;
	}
	
	public void setQuote(String quote){
		this.quote = quote;
	}
	public Integer getToMemberId(){
		return toMemberId;
	}
	
	public void setToMemberId(Integer toMemberId){
		this.toMemberId = toMemberId;
	}
	public String getCode(){
		return code;
	}
	
	public void setCode(String code){
		this.code = code;
	}
	public String getCode1(){
		return code1;
	}
	
	public void setCode1(String code1){
		this.code1 = code1;
	}
	public Integer getCode2(){
		return code2;
	}
	
	public void setCode2(Integer code2){
		this.code2 = code2;
	}
}
