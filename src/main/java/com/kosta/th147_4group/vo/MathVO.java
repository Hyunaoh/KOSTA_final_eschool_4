package com.kosta.th147_4group.vo;

public class MathVO {

	private String maGrade; 		// 학년
	private String maClass; 		// 반
	private String maMessage; 		// 내용
	private String maDate; 			// 날짜
	private String maName; 			// 교사명
	private String maCategoly; 		// 소분류
	private String maBungi; 		// 분기(1/2/3/4)

	public MathVO(){
		
	}

	public MathVO(String maGrade, String maClass, String maMessage, String maDate, String maName, String maCategoly,
			String maBungi) {
		
		this.maGrade = maGrade;
		this.maClass = maClass;
		this.maMessage = maMessage;
		this.maDate = maDate;
		this.maName = maName;
		this.maCategoly = maCategoly;
		this.maBungi = maBungi;
		
	}



	public String getMaGrade() {
		return maGrade;
	}

	public void setMaGrade(String maGrade) {
		this.maGrade = maGrade;
	}

	public String getMaClass() {
		return maClass;
	}

	public void setMaClass(String maClass) {
		this.maClass = maClass;
	}

	public String getMaMessage() {
		return maMessage;
	}

	public void setMaMessage(String maMessage) {
		this.maMessage = maMessage;
	}

	public String getMaDate() {
		return maDate;
	}

	public void setMaDate(String maDate) {
		this.maDate = maDate;
	}

	public String getMaName() {
		return maName;
	}

	public void setMaName(String maName) {
		this.maName = maName;
	}

	public String getMaCategoly() {
		return maCategoly;
	}

	public void setMaCategoly(String maCategoly) {
		this.maCategoly = maCategoly;
	}

	public String getMaBungi() {
		return maBungi;
	}

	public void setMaBungi(String maBungi) {
		this.maBungi = maBungi;
	}

	@Override
	public String toString() {
		return "MathVO [maGrade=" + maGrade + ", maClass=" + maClass + ", maMessage=" + maMessage + ", maDate=" + maDate
				+ ", maName=" + maName + ", maCategoly=" + maCategoly + ", maBungi=" + maBungi + "]";
	}
	
}
