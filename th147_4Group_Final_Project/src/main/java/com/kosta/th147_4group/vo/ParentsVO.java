package com.kosta.th147_4group.vo;

public class ParentsVO {
	
	private String paId;			// 학부모 아이디
	private String paPw;			// 학부모 비밀번호
	private String paName;			// 학부모 이름
	private String paTel;			// 학부모 핸드폰번호
	private String paSite;			// 학부모 주소
	private String paEmail;			// 학부모 이메일
	private String paSms;			// 학부모 SMS 동의여부 
	private String paLevel;			// 값 : 학부모
	private String paStName;		// 학부모의 자녀 이름
	
	public ParentsVO(){
		
	}

	public ParentsVO(String paId, String paPw, String paName, String paTel, String paSite, String paEmail, String paSms,
			String paLevel, String paStName) {

		this.paId = paId;
		this.paPw = paPw;
		this.paName = paName;
		this.paTel = paTel;
		this.paSite = paSite;
		this.paEmail = paEmail;
		this.paSms = paSms;
		this.paLevel = paLevel;
		this.paStName = paStName;
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
		return "ParentsVO [paId=" + paId + ", paPw=" + paPw + ", paName=" + paName + ", paTel=" + paTel + ", paSite="
				+ paSite + ", paEmail=" + paEmail + ", paSms=" + paSms + ", paLevel=" + paLevel + ", paStName="
				+ paStName + "]";
	}

}
