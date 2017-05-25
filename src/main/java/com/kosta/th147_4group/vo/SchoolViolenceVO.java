package com.kosta.th147_4group.vo;

import java.util.Date;

public class SchoolViolenceVO {

	private int svNum; 				// 게시판 순서(시퀀스 적용)
	private String svGrade; 		// 학년
	private String svSchoolClass; 	// 반
	private String svTitle;			// 게시글 제목
	private String svMessage;		// 글 내용
	private Date svDate;			// 작성 날짜
	private String svWriter;		// 작성자
	private String svCategoly;		// 소분류

	
	public SchoolViolenceVO(){}

	public SchoolViolenceVO(int svNum, String svGrade, String svSchoolClass, String svTitle, String svMessage, Date svDate, String svWriter, String svCategoly){
		this.svNum = svNum;
		this.svGrade = svGrade;
		this.svSchoolClass = svSchoolClass;
		this.svTitle = svTitle;
		this.svMessage = svMessage;
		this.svDate = svDate;
		this.svWriter = svWriter;
		this.svCategoly = svCategoly;
	}

	public int getSvNum() {
		return svNum;
	}

	public void setSvNum(int svNum) {
		this.svNum = svNum;
	}

	public String getSvGrade() {
		return svGrade;
	}

	public void setSvGrade(String svGrade) {
		this.svGrade = svGrade;
	}

	public String getSvSchoolClass() {
		return svSchoolClass;
	}

	public void setSvSchoolClass(String svSchoolClass) {
		this.svSchoolClass = svSchoolClass;
	}

	public String getSvTitle() {
		return svTitle;
	}

	public void setSvTitle(String svTitle) {
		this.svTitle = svTitle;
	}

	public String getSvMessage() {
		return svMessage;
	}

	public void setSvMessage(String svMessage) {
		this.svMessage = svMessage;
	}

	public Date getSvDate() {
		return svDate;
	}

	public void setSvDate(Date svDate) {
		this.svDate = svDate;
	}

	public String getSvWriter() {
		return svWriter;
	}

	public void setSvWriter(String svWriter) {
		this.svWriter = svWriter;
	}

	public String getSvCategoly() {
		return svCategoly;
	}

	public void setSvCategoly(String svCategoly) {
		this.svCategoly = svCategoly;
	}

	@Override
	public String toString() {
		return "SchoolViolenceVO [svNum=" + svNum + ", svGrade=" + svGrade + ", svSchoolClass=" + svSchoolClass
				+ ", svTitle=" + svTitle + ", svMessage=" + svMessage + ", svDate=" + svDate + ", svWriter=" + svWriter
				+ ", svCategoly=" + svCategoly + "]";
	}
	
	
	
	
	
}
