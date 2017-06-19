package com.kosta.th147_4group.vo;

import java.util.Date;

public class FamilyViolenceVO {

	private int fvRownum; // rownum 물리적 컬럼
	private int fvNum; // 게시판 순서(시퀀스 적용)
	private String fvGrade; // 학년
	private String fvSchoolClass; // 반
	private String fvTitle; // 게시글 제목
	private String fvMessage; // 글 내용
	private Date fvDate; // 작성 날짜
	private String fvWriter; // 작성자
	private String fvCategoly; // 소분류
	private int fvHit; // 조회수
	private int fvFlag; // flag로 delete 대신 update 쿼리 사용
	
	public FamilyViolenceVO() {}
	
	public FamilyViolenceVO(int fvRownum, int fvNum, String fvGrade, String fvSchoolClass, String fvTitle, String fvMessage, Date fvDate, String fvWriter, String fvCategoly, int fvHit) {
		this.fvRownum = fvRownum;
		this.fvNum = fvNum;
		this.fvGrade = fvGrade;
		this.fvSchoolClass = fvSchoolClass;
		this.fvTitle = fvTitle;
		this.fvMessage = fvMessage;
		this.fvDate = fvDate;
		this.fvWriter = fvWriter;
		this.fvCategoly = fvCategoly;
		this.fvHit = fvHit;
		this.fvFlag = fvFlag;
	}

	public int getFvRownum() {
		return fvRownum;
	}

	public void setFvRownum(int fvRownum) {
		this.fvRownum = fvRownum;
	}

	public int getFvNum() {
		return fvNum;
	}

	public void setFvNum(int fvNum) {
		this.fvNum = fvNum;
	}

	public String getFvGrade() {
		return fvGrade;
	}

	public void setFvGrade(String fvGrade) {
		this.fvGrade = fvGrade;
	}

	public String getFvSchoolClass() {
		return fvSchoolClass;
	}

	public void setFvSchoolClass(String fvSchoolClass) {
		this.fvSchoolClass = fvSchoolClass;
	}

	public String getFvTitle() {
		return fvTitle;
	}

	public void setFvTitle(String fvTitle) {
		this.fvTitle = fvTitle;
	}

	public String getFvMessage() {
		return fvMessage;
	}

	public void setFvMessage(String fvMessage) {
		this.fvMessage = fvMessage;
	}

	public Date getFvDate() {
		return fvDate;
	}

	public void setFvDate(Date fvDate) {
		this.fvDate = fvDate;
	}

	public String getFvWriter() {
		return fvWriter;
	}

	public void setFvWriter(String fvWriter) {
		this.fvWriter = fvWriter;
	}

	public String getFvCategoly() {
		return fvCategoly;
	}

	public void setFvCategoly(String fvCategoly) {
		this.fvCategoly = fvCategoly;
	}

	public int getFvHit() {
		return fvHit;
	}

	public void setFvHit(int fvHit) {
		this.fvHit = fvHit;
	}

	public int getFvFlag() {
		return fvFlag;
	}

	public void setFvFlag(int fvFlag) {
		this.fvFlag = fvFlag;
	}

	@Override
	public String toString() {
		return "FamilyViolenceVO [fvRownum=" + fvRownum + ", fvNum=" + fvNum + ", fvGrade=" + fvGrade
				+ ", fvSchoolClass=" + fvSchoolClass + ", fvTitle=" + fvTitle + ", fvMessage=" + fvMessage + ", fvDate="
				+ fvDate + ", fvWriter=" + fvWriter + ", fvCategoly=" + fvCategoly + ", fvHit=" + fvHit + ", fvFlag="
				+ fvFlag + "]";
	}
	
}
