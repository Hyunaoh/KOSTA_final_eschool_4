package com.kosta.th147_4group.vo;

import java.sql.Timestamp;

public class AttendanceVO {

	private String atName;			// 출석부 이름
	private String atAttendance;	// 등교 여부
	private String atAttendance2;	// 하교 여부
	private Timestamp atDate;		// 등교 날짜 (yyyy-MM-dd)
	
	public AttendanceVO(){
		
	}

	public AttendanceVO(String atName, String atAttendance, String atAttendance2, Timestamp atDate) {
		this.atName = atName;
		this.atAttendance = atAttendance;
		this.atAttendance2 = atAttendance2;
		this.atDate = atDate;
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

	public Timestamp getAtDate() {
		return atDate;
	}

	public void setAtDate(Timestamp atDate) {
		this.atDate = atDate;
	}

	@Override
	public String toString() {
		return "AttendanceVO [atName=" + atName + ", atAttendance=" + atAttendance + ", atAttendance2=" + atAttendance2
				+ ", atDate=" + atDate + "]";
	}


}
