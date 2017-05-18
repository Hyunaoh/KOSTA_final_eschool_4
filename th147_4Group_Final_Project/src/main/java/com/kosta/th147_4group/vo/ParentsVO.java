package com.kosta.th147_4group.vo;

import java.sql.Timestamp;

public class ParentsVO {
	
	private int paNum; // auto_increment [테스트]
	private String paId;			// 학부모 아이디
	private String paPw;			// 학부모 비밀번호
	private Timestamp paDate; // 현재시간 컬럼추가  [테스트]
	private String paName;			// 학부모 이름
	private String paTel;			// 학부모 핸드폰번호
	private String paSite;			// 학부모 주소
	private String paEmail;			// 학부모 이메일
	private String paSms;			// 학부모 SMS 동의여부 
	private String paLevel;			// 값 : 학부모
	private String paStName;		// 학부모의 자녀 이름
	
	public ParentsVO(){ } //생성자 함수

	public int getPaNum() {
		return paNum;
	}

	public void setPaNum(int paNum) {
		this.paNum = paNum;
	}

	public String getPaId() {
		return paId;
	}

	public void setPaId(String paId) {
		this.paId = paId;
	}

	public String getPaPw() {
		return paPw;
	}

	public void setPaPw(String paPw) {
		this.paPw = paPw;
	}

	public Timestamp getPaDate() {
		return paDate;
	}

	public void setPaDate(Timestamp paDate) {
		this.paDate = paDate;
	}

	public String getPaName() {
		return paName;
	}

	public void setPaName(String paName) {
		this.paName = paName;
	}

	public String getPaTel() {
		return paTel;
	}

	public void setPaTel(String paTel) {
		this.paTel = paTel;
	}

	public String getPaSite() {
		return paSite;
	}

	public void setPaSite(String paSite) {
		this.paSite = paSite;
	}

	public String getPaEmail() {
		return paEmail;
	}

	public void setPaEmail(String paEmail) {
		this.paEmail = paEmail;
	}

	public String getPaSms() {
		return paSms;
	}

	public void setPaSms(String paSms) {
		this.paSms = paSms;
	}

	public String getPaLevel() {
		return paLevel;
	}

	public void setPaLevel(String paLevel) {
		this.paLevel = paLevel;
	}

	public String getPaStName() {
		return paStName;
	}

	public void setPaStName(String paStName) {
		this.paStName = paStName;
	}

	@Override
	public String toString() {
		return "ParentsVO [paNum=" + paNum + ", paId=" + paId + ", paPw=" + paPw + ", paDate=" + paDate + ", paName="
				+ paName + ", paTel=" + paTel + ", paSite=" + paSite + ", paEmail=" + paEmail + ", paSms=" + paSms
				+ ", paLevel=" + paLevel + ", paStName=" + paStName + "]";
	}

}
