package com.kosta.th147_4group.vo;

public class KoreanVO {

	private String koGrade; 		// 학년
	private String koClass; 		// 반
	private String koMessage; 		// 내용
	private String koDate; 			// 날짜
	private String koName; 			// 교사명
	private String koCategoly; 		// 소분류
	private String koBungi; 		// 분기(1/2/3/4)

	public KoreanVO() {

	}

	public KoreanVO(String koGrade, String koClass, String koMessage, String koDate, String koName, String koCategoly,
			String koBungi) {
		this.koGrade = koGrade;
		this.koClass = koClass;
		this.koMessage = koMessage;
		this.koDate = koDate;
		this.koName = koName;
		this.koCategoly = koCategoly;
		this.koBungi = koBungi;
	}

	public String getKoGrade() {
		return koGrade;
	}

	public void setKoGrade(String koGrade) {
		this.koGrade = koGrade;
	}

	public String getKoClass() {
		return koClass;
	}

	public void setKoClass(String koClass) {
		this.koClass = koClass;
	}

	public String getKoMessage() {
		return koMessage;
	}

	public void setKoMessage(String koMessage) {
		this.koMessage = koMessage;
	}

	public String getKoDate() {
		return koDate;
	}

	public void setKoDate(String koDate) {
		this.koDate = koDate;
	}

	public String getKoName() {
		return koName;
	}

	public void setKoName(String koName) {
		this.koName = koName;
	}

	public String getKoCategoly() {
		return koCategoly;
	}

	public void setKoCategoly(String koCategoly) {
		this.koCategoly = koCategoly;
	}

	public String getKoBungi() {
		return koBungi;
	}

	public void setKoBungi(String koBungi) {
		this.koBungi = koBungi;
	}

	@Override
	public String toString() {
		return "KoreanVO [koGrade=" + koGrade + ", koClass=" + koClass + ", koMessage=" + koMessage + ", koDate="
				+ koDate + ", koName=" + koName + ", koCategoly=" + koCategoly + ", koBungi=" + koBungi + "]";
	}

}
