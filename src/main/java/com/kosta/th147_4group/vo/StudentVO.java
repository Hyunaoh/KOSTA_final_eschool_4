package com.kosta.th147_4group.vo;

public class StudentVO {

	private String stId;			// 학생 ID
	private String stPw;			// 학생 비밀번호
	private String stName;			// 학생 이름
	private String stTel;			// 학생 핸드폰번호
	private String stSite;			// 학생 주소
	private String stEmail;			// 학생 email
	private String stLevel;			// 값 : 학생

	public StudentVO() {

	}

	public StudentVO(String stId, String stPw, String stName, String stTel, String stSite, String stEmail,
			String stLevel) {
		super();
		this.stId = stId;
		this.stPw = stPw;
		this.stName = stName;
		this.stTel = stTel;
		this.stSite = stSite;
		this.stEmail = stEmail;
		this.stLevel = stLevel;
	}

	public String getStId() {
		return stId;
	}

	public void setStId(String stId) {
		this.stId = stId;
	}

	public String getStPw() {
		return stPw;
	}

	public void setStPw(String stPw) {
		this.stPw = stPw;
	}

	public String getStName() {
		return stName;
	}

	public void setStName(String stName) {
		this.stName = stName;
	}

	public String getStTel() {
		return stTel;
	}

	public void setStTel(String stTel) {
		this.stTel = stTel;
	}

	public String getStSite() {
		return stSite;
	}

	public void setStSite(String stSite) {
		this.stSite = stSite;
	}

	public String getStEmail() {
		return stEmail;
	}

	public void setStEmail(String stEmail) {
		this.stEmail = stEmail;
	}

	public String getStLevel() {
		return stLevel;
	}

	public void setStLevel(String stLevel) {
		this.stLevel = stLevel;
	}

	@Override
	public String toString() {
		return "StudentVO [stId=" + stId + ", stPw=" + stPw + ", stName=" + stName + ", stTel=" + stTel + ", stSite="
				+ stSite + ", stEmail=" + stEmail + ", stLevel=" + stLevel + "]";
	}

}
