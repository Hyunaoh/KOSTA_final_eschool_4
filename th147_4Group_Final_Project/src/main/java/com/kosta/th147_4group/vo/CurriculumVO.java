package com.kosta.th147_4group.vo;

import java.sql.Date;

public class CurriculumVO {

	private int rownum;
	private int cuRnum;
	private String cuGrade; // 학년
	private String cuClass; // 반
	private String cuTitle;	// 제목
	private String cuMessage; // 내용
	private String cuDate; // 날짜 (YYYY-MM-DD)
	private String cuName; // 교사명
	private String cuCategory; // 소분류
	private String cuBungi; // 분기(1/2/3/4)
	private int cuFlag; // 삭제여부 flag (1 : hidden상태 / 0 : 보여지는 상태)
	private String cuSubject; // 과목명 (KOREA / ENGLISH / MATH / SCIENCE / HISTORY)
	private String cuSign;
	private String cuSign2;
	private String cuSignComment1;
	private String cuSignComment2;
	private String cuSignDate; // 결재날짜 (YYYY-MM-DD HH:MM:ss) - 교감
	private String cuSignDate2; // 결재날짜 (YYYY-MM-DD HH:MM:ss) - 교장
	private Date cuSignSendDate; // 결재제출날짜 (YYYY-MM-DD HH:MM:ss)

	public CurriculumVO() {

	}
	
	public CurriculumVO(String cuGrade, String cuClass, String cuDate, String cuName, String cuCategory, String cuBungi,
			String cuSubject) {
		this.cuGrade = cuGrade;
		this.cuClass = cuClass;
		this.cuDate = cuDate;
		this.cuName = cuName;
		this.cuCategory = cuCategory;
		this.cuBungi = cuBungi;
		this.cuSubject = cuSubject;
	}


	public CurriculumVO(int rownum, int cuRnum, String cuGrade, String cuClass, String cuTitle, String cuMessage,
			String cuDate, String cuName, String cuCategory, String cuBungi, int cuFlag, String cuSubject,
			String cuSign, String cuSignComment1, String cuSignComment2, String cuSignDate, Date cuSignSendDate) {
		this.rownum = rownum;
		this.cuRnum = cuRnum;
		this.cuGrade = cuGrade;
		this.cuClass = cuClass;
		this.cuTitle = cuTitle;
		this.cuMessage = cuMessage;
		this.cuDate = cuDate;
		this.cuName = cuName;
		this.cuCategory = cuCategory;
		this.cuBungi = cuBungi;
		this.cuFlag = cuFlag;
		this.cuSubject = cuSubject;
		this.cuSign = cuSign;
		this.cuSignComment1 = cuSignComment1;
		this.cuSignComment2 = cuSignComment2;
		this.cuSignDate = cuSignDate;
		this.cuSignSendDate = cuSignSendDate;
	}


	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public Integer getCuRnum() {
		return cuRnum;
	}

	public void setCuRnum(int cuRnum) {
		this.cuRnum = cuRnum;
	}

	public String getCuGrade() {
		return cuGrade;
	}

	public void setCuGrade(String cuGrade) {
		this.cuGrade = cuGrade;
	}

	public String getCuClass() {
		return cuClass;
	}

	public void setCuClass(String cuClass) {
		this.cuClass = cuClass;
	}

	public String getCuMessage() {
		return cuMessage;
	}

	public void setCuMessage(String cuMessage) {
		this.cuMessage = cuMessage;
	}

	public String getCuName() {
		return cuName;
	}

	public void setCuName(String cuName) {
		this.cuName = cuName;
	}

	public String getCuBungi() {
		return cuBungi;
	}

	public void setCuBungi(String cuBungi) {
		this.cuBungi = cuBungi;
	}

	public int getCuFlag() {
		return cuFlag;
	}

	public void setCuFlag(int cuFlag) {
		this.cuFlag = cuFlag;
	}

	public String getCuSubject() {
		return cuSubject;
	}

	public void setCuSubject(String cuSubject) {
		this.cuSubject = cuSubject;
	}

	public String getCuSign() {
		return cuSign;
	}

	public void setCuSign(String cuSign) {
		this.cuSign = cuSign;
	}

	public String getCuSignComment1() {
		return cuSignComment1;
	}

	public void setCuSignComment1(String cuSignComment1) {
		this.cuSignComment1 = cuSignComment1;
	}

	public String getCuSignComment2() {
		return cuSignComment2;
	}

	public void setCuSignComment2(String cuSignComment2) {
		this.cuSignComment2 = cuSignComment2;
	}

	public String getCuSignDate() {
		return cuSignDate;
	}

	public void setCuSignDate(String cuSignDate) {
		this.cuSignDate = cuSignDate;
	}

	public Date getCuSignSendDate() {
		return cuSignSendDate;
	}

	public void setCuSignSendDate(Date cuSignSendDate) {
		this.cuSignSendDate = cuSignSendDate;
	}

	public String getCuTitle() {
		return cuTitle;
	}

	public void setCuTitle(String cuTitle) {
		this.cuTitle = cuTitle;
	}

	public String getCuDate() {
		return cuDate;
	}

	public void setCuDate(String cuDate) {
		this.cuDate = cuDate;
	}

	public String getCuCategory() {
		return cuCategory;
	}

	public void setCuCategory(String cuCategory) {
		this.cuCategory = cuCategory;
	}

	public String getCuSign2() {
		return cuSign2;
	}

	public void setCuSign2(String cuSign2) {
		this.cuSign2 = cuSign2;
	}

	public String getCuSignDate2() {
		return cuSignDate2;
	}

	public void setCuSignDate2(String cuSignDate2) {
		this.cuSignDate2 = cuSignDate2;
	}

	
	@Override
	public String toString() {
		return "CurriculumVO [rownum=" + rownum + ", cuRnum=" + cuRnum + ", cuGrade=" + cuGrade + ", cuClass=" + cuClass + ", cuTitle=" + cuTitle + ", cuMessage=" + cuMessage + ", cuDate=" + cuDate
				+ ", cuName=" + cuName + ", cuCategory=" + cuCategory + ", cuBungi=" + cuBungi + ", cuFlag=" + cuFlag + ", cuSubject=" + cuSubject + ", cuSign=" + cuSign + ", cuSign2=" + cuSign2
				+ ", cuSignComment1=" + cuSignComment1 + ", cuSignComment2=" + cuSignComment2 + ", cuSignDate=" + cuSignDate + ", cuSignDate2=" + cuSignDate2 + ", cuSignSendDate=" + cuSignSendDate
				+ "]";
	}

}
