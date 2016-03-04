package com.wangku.dpw.domain;

public class Member {
	private Integer memberId;// 会员ID
	private String account;// 账号
	private String password;// 密码
	private String email;// 邮箱
	private String mobile;// 手机
	private String channelsType;// 开通类型
	private String bindType;// 绑定类型
	private String status;// 账户状态
	private String addTime;// 注册时间
	private String modifyTime;// 更新时间
	private String regIp;// 注册Ip
	private String loginIp;// 登录Ip
	private Integer totalLogin;// 登录次数
	private Integer siteId;// 站点Id
	private String position;// 联系人职位
	private String department;// 联系人部门
	private String postCode;// 邮编
	private String telephone;// 电话
	private String qq;// QQ号
	private String sex;// 性别
	private String headPortrait;// 个人头像
	private String linkMan;// 联系人姓名
	private String nickname;// 昵称
	private String areaCode;// 地区编码
	private String address;// 详细地址
	private Long parentId;// 主账户Id
	private String roleId;// 角色
	private String memberType;// 会员类型
	private String accreditStatus;// 授权状态
	private String fromUi;// 会员注册来源
	private String expirTime;// 过期时间
	private Integer validDay;// 会员过期天数
	private String fax;// 传真
	private String times;//
	private String beginTime;// 开通时间
	private Integer orderBy;// 手动排序功能
	private String corporationName;// 会员名称
	
	private String imgUrl; // 非数据字段 图片路径
	private boolean localPic ;  // 非数据字段  判断是否为本地图片
	
	private String companyname; //公司名称
	
	

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

	public String getCorporationName() {
		return corporationName;
	}

	public void setCorporationName(String corporationName) {
		this.corporationName = corporationName;
	}

	// setter and getter
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getChannelsType() {
		return channelsType;
	}

	public void setChannelsType(String channelsType) {
		this.channelsType = channelsType;
	}

	public String getBindType() {
		return bindType;
	}

	public void setBindType(String bindType) {
		this.bindType = bindType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAddTime() {
		if (addTime != null && addTime.length() > 19) {
			return addTime.substring(0, 19);
		}
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public String getModifyTime() {
		if (modifyTime != null && modifyTime.length() > 19) {
			return modifyTime.substring(0, 19);
		}
		return modifyTime;
	}

	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getRegIp() {
		return regIp;
	}

	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public Integer getTotalLogin() {
		return totalLogin;
	}

	public void setTotalLogin(Integer totalLogin) {
		this.totalLogin = totalLogin;
	}

	public Integer getSiteId() {
		return siteId;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getHeadPortrait() {
		return headPortrait;
	}

	public void setHeadPortrait(String headPortrait) {
		this.headPortrait = headPortrait;
	}

	public String getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getAccreditStatus() {
		return accreditStatus;
	}

	public void setAccreditStatus(String accreditStatus) {
		this.accreditStatus = accreditStatus;
	}

	public String getFromUi() {
		return fromUi;
	}

	public void setFromUi(String fromUi) {
		this.fromUi = fromUi;
	}

	public String getExpirTime() {
		return expirTime;
	}

	public void setExpirTime(String expirTime) {
		this.expirTime = expirTime;
	}

	public Integer getValidDay() {
		return validDay;
	}

	public void setValidDay(Integer validDay) {
		this.validDay = validDay;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public String getBeginTime() {
		if (beginTime != null && beginTime.length() > 19) {
			return beginTime.substring(0, 19);
		}
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public Integer getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(Integer orderBy) {
		this.orderBy = orderBy;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	
}
