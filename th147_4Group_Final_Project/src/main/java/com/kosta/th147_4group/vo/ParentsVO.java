package com.kosta.th147_4group.vo;

import java.sql.Timestamp;

public class ParentsVO {
	
	private int PANUM; // auto_increment [테스트]
	private String PAID;			// 학부모 아이디
	private String PAPW;			// 학부모 비밀번호
	private Timestamp PADATE; // 현재시간 컬럼추가  [테스트]
	private String PANM;			// 학부모 이름
	private String PATEL;			// 학부모 핸드폰번호
	private String PASITE;			// 학부모 주소
	private String PAEM;			// 학부모 이메일
	private String PASMS;			// 학부모 SMS 동의여부 
	private String PALEV;			// 값 : 학부모
	private String PANM_ST;		// 학부모의 자녀 이름
	
	public ParentsVO(){
		
	}

	public int getPANUM() {
		return PANUM;
	}

	public void setPANUM(int pANUM) {
		PANUM = pANUM;
	}

	public String getPAID() {
		return PAID;
	}

	public void setPAID(String pAID) {
		PAID = pAID;
	}

	public String getPAPW() {
		return PAPW;
	}

	public void setPAPW(String pAPW) {
		PAPW = pAPW;
	}

	public Timestamp getPADATE() {
		return PADATE;
	}

	public void setPADATE(Timestamp pADATE) {
		PADATE = pADATE;
	}

	public String getPANM() {
		return PANM;
	}

	public void setPANM(String pANM) {
		PANM = pANM;
	}

	public String getPATEL() {
		return PATEL;
	}

	public void setPATEL(String pATEL) {
		PATEL = pATEL;
	}

	public String getPASITE() {
		return PASITE;
	}

	public void setPASITE(String pASITE) {
		PASITE = pASITE;
	}

	public String getPAEM() {
		return PAEM;
	}

	public void setPAEM(String pAEM) {
		PAEM = pAEM;
	}

	public String getPASMS() {
		return PASMS;
	}

	public void setPASMS(String pASMS) {
		PASMS = pASMS;
	}

	public String getPALEV() {
		return PALEV;
	}

	public void setPALEV(String pALEV) {
		PALEV = pALEV;
	}

	public String getPANM_ST() {
		return PANM_ST;
	}

	public void setPANM_ST(String pANM_ST) {
		PANM_ST = pANM_ST;
	}

	

	

	

}
