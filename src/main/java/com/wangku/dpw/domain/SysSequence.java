package com.wangku.dpw.domain;

public class SysSequence {

	private String seqName;//序列名称不能重复
	private Long seqCurrentVal;//前当值
	private Integer seqIncreFactor;//增长因子，该值越大性能越好
	
// setter and getter
	public String getSeqName(){
		return seqName;
	}
	
	public void setSeqName(String seqName){
		this.seqName = seqName;
	}
	public Long getSeqCurrentVal(){
		return seqCurrentVal;
	}
	
	public void setSeqCurrentVal(Long seqCurrentVal){
		this.seqCurrentVal = seqCurrentVal;
	}
	public Integer getSeqIncreFactor(){
		return seqIncreFactor;
	}
	
	public void setSeqIncreFactor(Integer seqIncreFactor){
		this.seqIncreFactor = seqIncreFactor;
	}
}
