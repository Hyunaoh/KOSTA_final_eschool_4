package com.kosta.th147_4group.vo;

public class TeacherVO {

	private String teId; 		// 선생님 ID
	private String tePw; 		// 선생님 비밀번호
	private String teName; 		// 선생님 이름
	private String teTel; 		// 선생님 핸드폰번호
	private String teSite; 		// 선생님 주소
	private String teEmail; 	// 선생님 email
	private String teLevel; 	// 값 : 선생님

	public TeacherVO() {

	}

	public TeacherVO(String teId, String tePw, String teName, String teTel, String teSite, String teEmail,
			String teLevel) {
		this.teId = teId;
		this.tePw = tePw;
		this.teName = teName;
		this.teTel = teTel;
		this.teSite = teSite;
		this.teEmail = teEmail;
		this.teLevel = teLevel;
	}

	public String getTeId() {
		return teId;
	}

	public void setTeId(String teId) {
		this.teId = teId;
	}

	public String getTePw() {
		return tePw;
	}

	public void setTePw(String tePw) {
		this.tePw = tePw;
	}

	public String getTeName() {
		return teName;
	}

	public void setTeName(String teName) {
		this.teName = teName;
	}

	public String getTeTel() {
		return teTel;
	}

	public void setTeTel(String teTel) {
		this.teTel = teTel;
	}

	public String getTeSite() {
		return teSite;
	}

	public void setTeSite(String teSite) {
		this.teSite = teSite;
	}

	public String getTeEmail() {
		return teEmail;
	}

	public void setTeEmail(String teEmail) {
		this.teEmail = teEmail;
	}

	public String getTeLevel() {
		return teLevel;
	}

	public void setTeLevel(String teLevel) {
		this.teLevel = teLevel;
	}

	@Override
	public String toString() {
		return "TeacherVO [teId=" + teId + ", tePw=" + tePw + ", teName=" + teName + ", teTel=" + teTel + ", teSite="
				+ teSite + ", teEmail=" + teEmail + ", teLevel=" + teLevel + "]";
	}

}
