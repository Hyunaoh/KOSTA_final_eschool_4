package com.kosta.th147_4group.vo;

public class ScienceVO {

	private String scGrade; 			// 학년
	private String scClass; 			// 반
	private String scMessage; 			// 내용
	private String scDate; 				// 날짜
	private String scName; 				// 교사명
	private String scCategoly; 			// 소분류
	private String scBungi; 			// 분기(1/2/3/4)

	public ScienceVO() {

	}

	public ScienceVO(String scGrade, String scClass, String scMessage, String scDate, String scName, String scCategoly,
			String scBungi) {
		this.scGrade = scGrade;
		this.scClass = scClass;
		this.scMessage = scMessage;
		this.scDate = scDate;
		this.scName = scName;
		this.scCategoly = scCategoly;
		this.scBungi = scBungi;
	}

	public String getScGrade() {
		return scGrade;
	}

	public void setScGrade(String scGrade) {
		this.scGrade = scGrade;
	}

	public String getScClass() {
		return scClass;
	}

	public void setScClass(String scClass) {
		this.scClass = scClass;
	}

	public String getScMessage() {
		return scMessage;
	}

	public void setScMessage(String scMessage) {
		this.scMessage = scMessage;
	}

	public String getScDate() {
		return scDate;
	}

	public void setScDate(String scDate) {
		this.scDate = scDate;
	}

	public String getScName() {
		return scName;
	}

	public void setScName(String scName) {
		this.scName = scName;
	}

	public String getScCategoly() {
		return scCategoly;
	}

	public void setScCategoly(String scCategoly) {
		this.scCategoly = scCategoly;
	}

	public String getScBungi() {
		return scBungi;
	}

	public void setScBungi(String scBungi) {
		this.scBungi = scBungi;
	}

	@Override
	public String toString() {
		return "ScienceVO [scGrade=" + scGrade + ", scClass=" + scClass + ", scMessage=" + scMessage + ", scDate="
				+ scDate + ", scName=" + scName + ", scCategoly=" + scCategoly + ", scBungi=" + scBungi + "]";
	}

}
