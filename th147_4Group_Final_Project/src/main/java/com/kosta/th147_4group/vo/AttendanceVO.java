package com.kosta.th147_4group.vo;

import java.sql.Timestamp;

public class AttendanceVO {

	private String atName;			// 출석부 이름
	private String atAttendance;	// 등교 여부
	private String atAttendance2;	// 하교 여부
	private String atDate;		// 등교 날짜 (yyyy-MM-dd)
	private String atGrade;		//학년
	private String atClass;		//반
	private String atNum; 		//학번
	private String atLevel;		//직급
	private String atTeacher;  //담당교사
	private String atFlag; 		//무쓸모구분
	
	public AttendanceVO(){
		
	}

	public String getAtName() {
		return atName;
	}

	public void setAtName(String atName) {
		this.atName = atName;
	}

	public String getAtAttendance() {
		return atAttendance;
	}

	public void setAtAttendance(String atAttendance) {
		this.atAttendance = atAttendance;
	}

	public String getAtAttendance2() {
		return atAttendance2;
	}

	public void setAtAttendance2(String atAttendance2) {
		this.atAttendance2 = atAttendance2;
	}

	public String getAtDate() {
		return atDate;
	}

	public void setAtDate(String atDate) {
		this.atDate = atDate;
	}

	public String getAtGrade() {
		return atGrade;
	}

	public void setAtGrade(String atGrade) {
		this.atGrade = atGrade;
	}

	public String getAtClass() {
		return atClass;
	}

	public void setAtClass(String atClass) {
		this.atClass = atClass;
	}

	public String getAtNum() {
		return atNum;
	}

	public void setAtNum(String atNum) {
		this.atNum = atNum;
	}

	public String getAtLevel() {
		return atLevel;
	}

	public void setAtLevel(String atLevel) {
		this.atLevel = atLevel;
	}

	public String getAtTeacher() {
		return atTeacher;
	}

	public void setAtTeacher(String atTeacher) {
		this.atTeacher = atTeacher;
	}

	public String getAtFlag() {
		return atFlag;
	}

	public void setAtFlag(String atFlag) {
		this.atFlag = atFlag;
	}

	@Override
	public String toString() {
		return "AttendanceVO [atName=" + atName + ", atAttendance=" + atAttendance + ", atAttendance2=" + atAttendance2
				+ ", atDate=" + atDate + ", atGrade=" + atGrade + ", atClass=" + atClass + ", atNum=" + atNum
				+ ", atLevel=" + atLevel + ", atTeacher=" + atTeacher + ", atFlag=" + atFlag + "]";
	}

		
}
