package com.kosta.th147_4group.vo;


public class EnglishVO {

	private String enGrade;		// 학년
	private String enClass;		// 반
	private String enMessage;	// 내용
	private String enDate;		// 날짜
	private String enName;		// 교사명
	private String enCategoly;	// 소분류
	private String enBungi;		// 분기(1/2/3/4)

	public EnglishVO() {

	}

	public EnglishVO(String enGrade, String enClass, String enMessage, String enDate, String enName, String enCategoly,
			String enBungi) {
		this.enGrade = enGrade;
		this.enClass = enClass;
		this.enMessage = enMessage;
		this.enDate = enDate;
		this.enName = enName;
		this.enCategoly = enCategoly;
		this.enBungi = enBungi;
	}

	public String getEnGrade() {
		return enGrade;
	}

	public void setEnGrade(String enGrade) {
		this.enGrade = enGrade;
	}

	public String getEnClass() {
		return enClass;
	}

	public void setEnClass(String enClass) {
		this.enClass = enClass;
	}

	public String getEnMessage() {
		return enMessage;
	}

	public void setEnMessage(String enMessage) {
		this.enMessage = enMessage;
	}

	public String getEnDate() {
		return enDate;
	}

	public void setEnDate(String enDate) {
		this.enDate = enDate;
	}

	public String getEnName() {
		return enName;
	}

	public void setEnName(String enName) {
		this.enName = enName;
	}

	public String getEnCategoly() {
		return enCategoly;
	}

	public void setEnCategoly(String enCategoly) {
		this.enCategoly = enCategoly;
	}

	public String getEnBungi() {
		return enBungi;
	}

	public void setEnBungi(String enBungi) {
		this.enBungi = enBungi;
	}

	@Override
	public String toString() {
		return "EnglishVO [enGrade=" + enGrade + ", enClass=" + enClass + ", enMessage=" + enMessage + ", enDate="
				+ enDate + ", enName=" + enName + ", enCategoly=" + enCategoly + ", enBungi=" + enBungi + "]";
	}
	

}
