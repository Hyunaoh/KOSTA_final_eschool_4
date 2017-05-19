package com.kosta.th147_4group.vo;

public class Grade_2017VO {

	private String grName; // 이름
	private String grGrade; // 학년
	private String grClass; // 반
	private String grNo; // 학번

	public Grade_2017VO() {

	}

	public Grade_2017VO(String grName, String grGrade, String grClass, String grNo) {
		this.grName = grName;
		this.grGrade = grGrade;
		this.grClass = grClass;
		this.grNo = grNo;
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

	@Override
	public String toString() {
		return "Grade_2017VO [grName=" + grName + ", grGrade=" + grGrade + ", grClass=" + grClass + ", grNo=" + grNo
				+ "]";
	}

}
