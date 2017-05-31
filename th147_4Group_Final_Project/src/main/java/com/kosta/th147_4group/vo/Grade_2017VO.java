package com.kosta.th147_4group.vo;

public class Grade_2017VO {

	private String grName;  // 이름
	private String grGrade; // 학년
	private String grClass; // 반
	private String grNo; 	// 번호
	private String grId;	// 학번 or 교번

	public Grade_2017VO() {

	}

	public String getGrName() {
		return grName;
	}

	public void setGrName(String grName) {
		this.grName = grName;
	}

	public String getGrGrade() {
		return grGrade;
	}

	public void setGrGrade(String grGrade) {
		this.grGrade = grGrade;
	}

	public String getGrClass() {
		return grClass;
	}

	public void setGrClass(String grClass) {
		this.grClass = grClass;
	}

	public String getGrNo() {
		return grNo;
	}

	public void setGrNo(String grNo) {
		this.grNo = grNo;
	}

	public String getGrId() {
		return grId;
	}

	public void setGrId(String grId) {
		this.grId = grId;
	}

	@Override
	public String toString() {
		return "Grade_2017VO [grName=" + grName + ", grGrade=" + grGrade + ", grClass=" + grClass + ", grNo=" + grNo + ", grId=" + grId + "]";
	}

}
