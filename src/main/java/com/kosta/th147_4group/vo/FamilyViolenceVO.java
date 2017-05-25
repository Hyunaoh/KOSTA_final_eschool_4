package com.kosta.th147_4group.vo;

import java.util.Date;

public class FamilyViolenceVO {

	private int fmNum; 				// 게시판 순서(시퀀스 적용)
	private String fmGrade; 		// 학년
	private String fmSchoolClass; 	// 반
	private String fmTitle;			// 게시글 제목
	private String fmMessage;		// 글 내용
	private Date fmDate;			// 작성 날짜
	private String fmWriter;		// 작성자
	private String fmCategoly;		// 소분류

	
	public FamilyViolenceVO(){}

	public FamilyViolenceVO(int fmNum, String fmGrade, String fmSchoolClass, String fmTitle, String fmMessage, Date fmDate, String fmWriter, String fmCategoly){
		this.fmNum = fmNum;
		this.fmGrade = fmGrade;
		this.fmSchoolClass = fmSchoolClass;
		this.fmTitle = fmTitle;
		this.fmMessage = fmMessage;
		this.fmDate = fmDate;
		this.fmWriter = fmWriter;
		this.fmCategoly = fmCategoly;
	}

	public int getFmNum() {
		return fmNum;
	}

	public void setFmNum(int fmNum) {
		this.fmNum = fmNum;
	}

	public String getFmGrade() {
		return fmGrade;
	}

	public void setFmGrade(String fmGrade) {
		this.fmGrade = fmGrade;
	}

	public String getFmSchoolClass() {
		return fmSchoolClass;
	}

	public void setFmSchoolClass(String fmSchoolClass) {
		this.fmSchoolClass = fmSchoolClass;
	}

	public String getFmTitle() {
		return fmTitle;
	}

	public void setFmTitle(String fmTitle) {
		this.fmTitle = fmTitle;
	}

	public String getFmMessage() {
		return fmMessage;
	}

	public void setFmMessage(String fmMessage) {
		this.fmMessage = fmMessage;
	}

	public Date getFmDate() {
		return fmDate;
	}

	public void setFmDate(Date fmDate) {
		this.fmDate = fmDate;
	}

	public String getFmWriter() {
		return fmWriter;
	}

	public void setFmWriter(String fmWriter) {
		this.fmWriter = fmWriter;
	}

	public String getFmCategoly() {
		return fmCategoly;
	}

	public void setFmCategoly(String fmCategoly) {
		this.fmCategoly = fmCategoly;
	}

	@Override
	public String toString() {
		return "FamilyViolenceVO [fmNum=" + fmNum + ", fmGrade=" + fmGrade + ", fmSchoolClass=" + fmSchoolClass
				+ ", fmTitle=" + fmTitle + ", fmMessage=" + fmMessage + ", fmDate=" + fmDate + ", fmWriter=" + fmWriter
				+ ", fmCategoly=" + fmCategoly + "]";
	}
	
	
	
}
