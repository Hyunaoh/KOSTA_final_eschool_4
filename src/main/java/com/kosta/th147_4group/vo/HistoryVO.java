package com.kosta.th147_4group.vo;

public class HistoryVO {

	private String hiGrade; 		// 학년
	private String hiClass; 		// 반
	private String hiMessage; 		// 내용
	private String hiDate; 			// 날짜
	private String hiName; 			// 교사명
	private String hiCategoly; 		// 소분류
	private String hiBungi; 		// 분기(1/2/3/4)

	public HistoryVO() {

	}
	
	public HistoryVO(String hiGrade, String hiClass, String hiMessage, String hiDate, String hiName, String hiCategoly,
			String hiBungi) {
		
		this.hiGrade = hiGrade;
		this.hiClass = hiClass;
		this.hiMessage = hiMessage;
		this.hiDate = hiDate;
		this.hiName = hiName;
		this.hiCategoly = hiCategoly;
		this.hiBungi = hiBungi;
		
	}


	public String getHiGrade() {
		return hiGrade;
	}

	public void setHiGrade(String hiGrade) {
		this.hiGrade = hiGrade;
	}

	public String getHiClass() {
		return hiClass;
	}

	public void setHiClass(String hiClass) {
		this.hiClass = hiClass;
	}

	public String getHiMessage() {
		return hiMessage;
	}

	public void setHiMessage(String hiMessage) {
		this.hiMessage = hiMessage;
	}

	public String getHiDate() {
		return hiDate;
	}

	public void setHiDate(String hiDate) {
		this.hiDate = hiDate;
	}

	public String getHiName() {
		return hiName;
	}

	public void setHiName(String hiName) {
		this.hiName = hiName;
	}

	public String getHiCategoly() {
		return hiCategoly;
	}

	public void setHiCategoly(String hiCategoly) {
		this.hiCategoly = hiCategoly;
	}

	public String getHiBungi() {
		return hiBungi;
	}

	public void setHiBungi(String hiBungi) {
		this.hiBungi = hiBungi;
	}

	@Override
	public String toString() {
		return "HistoryVO [hiGrade=" + hiGrade + ", hiClass=" + hiClass + ", hiMessage=" + hiMessage + ", hiDate="
				+ hiDate + ", hiName=" + hiName + ", hiCategoly=" + hiCategoly + ", hiBungi=" + hiBungi + "]";
	}

}
