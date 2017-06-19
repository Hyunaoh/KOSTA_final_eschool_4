package com.kosta.th147_4group.vo;

import java.util.Date;

public class StudentProposalVO {

	private int stRownum; // rownum 물리적 컬럼
	private int stNum; // 게시판 순서(시퀀스 적용)
	private String stGrade; // 학년
	private String stSchoolClass; // 반
	private String stTitle; // 게시글 제목
	private String stMessage; // 글 내용
	private Date stDate; // 작성 날짜
	private String stWriter; // 작성자
	private String stCategoly; // 소분류
	private int stHit; // 조회수
	private int stFlag; // flag로 delete 대신 update 쿼리 사용
	
	public StudentProposalVO() {
		
	}

	public StudentProposalVO(int stRownum, int stNum, String stGrade, String stSchoolClass, String stTitle, String stMessage, Date stDate, String stWriter, String stCategoly, int stHit) {
		this.stRownum = stRownum;
		this.stNum = stNum;
		this.stGrade = stGrade;
		this.stSchoolClass = stSchoolClass;
		this.stTitle = stTitle;
		this.stMessage = stMessage;
		this.stDate = stDate;
		this.stWriter = stWriter;
		this.stCategoly = stCategoly;
		this.stHit = stHit;
		this.stFlag = stFlag;
	}

	public int getStRownum() {
		return stRownum;
	}

	public void setStRownum(int stRownum) {
		this.stRownum = stRownum;
	}

	public int getStNum() {
		return stNum;
	}

	public void setStNum(int stNum) {
		this.stNum = stNum;
	}

	public String getStGrade() {
		return stGrade;
	}

	public void setStGrade(String stGrade) {
		this.stGrade = stGrade;
	}

	public String getStSchoolClass() {
		return stSchoolClass;
	}

	public void setStSchoolClass(String stSchoolClass) {
		this.stSchoolClass = stSchoolClass;
	}

	public String getStTitle() {
		return stTitle;
	}

	public void setStTitle(String stTitle) {
		this.stTitle = stTitle;
	}

	public String getStMessage() {
		return stMessage;
	}

	public void setStMessage(String stMessage) {
		this.stMessage = stMessage;
	}

	public Date getStDate() {
		return stDate;
	}

	public void setStDate(Date stDate) {
		this.stDate = stDate;
	}

	public String getStWriter() {
		return stWriter;
	}

	public void setStWriter(String stWriter) {
		this.stWriter = stWriter;
	}

	public String getStCategoly() {
		return stCategoly;
	}

	public void setStCategoly(String stCategoly) {
		this.stCategoly = stCategoly;
	}

	public int getStHit() {
		return stHit;
	}

	public void setStHit(int stHit) {
		this.stHit = stHit;
	}

	public int getStFlag() {
		return stFlag;
	}

	public void setStFlag(int stFlag) {
		this.stFlag = stFlag;
	}

	@Override
	public String toString() {
		return "StudentProposalVO [stRownum=" + stRownum + ", stNum=" + stNum + ", stGrade=" + stGrade + ", stSchoolClass=" + stSchoolClass + ", stTitle=" + stTitle + ", stMessage=" + stMessage
				+ ", stDate=" + stDate + ", stWriter=" + stWriter + ", stCategoly=" + stCategoly + ", stHit=" + stHit + ", stFlag=" + stFlag + "]";
	}

}
