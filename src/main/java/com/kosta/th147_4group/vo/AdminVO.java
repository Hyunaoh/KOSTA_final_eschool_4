package com.kosta.th147_4group.vo;

public class AdminVO {

	private String adId;		// admin ID
	private String adPw;		// admin Pw
	private String adName;		// admin name
	private String adTel;		// admin 전번
	private String adSite;		// admin 주소
	private String adEmail;		// admin 이메일
	private String adLevel;		// 값 : admin 
	
	public AdminVO(){
		
	}

	public AdminVO(String adId, String adPw, String adName, String adTel, String adSite, String adEmail,
			String adLevel) {

		this.adId = adId;
		this.adPw = adPw;
		this.adName = adName;
		this.adTel = adTel;
		this.adSite = adSite;
		this.adEmail = adEmail;
		this.adLevel = adLevel;
	}

	public String getAdId() {
		return adId;
	}

	public void setAdId(String adId) {
		this.adId = adId;
	}

	public String getAdPw() {
		return adPw;
	}

	public void setAdPw(String adPw) {
		this.adPw = adPw;
	}

	public String getAdName() {
		return adName;
	}

	public void setAdName(String adName) {
		this.adName = adName;
	}

	public String getAdTel() {
		return adTel;
	}

	public void setAdTel(String adTel) {
		this.adTel = adTel;
	}

	public String getAdSite() {
		return adSite;
	}

	public void setAdSite(String adSite) {
		this.adSite = adSite;
	}

	public String getAdEmail() {
		return adEmail;
	}

	public void setAdEmail(String adEmail) {
		this.adEmail = adEmail;
	}

	public String getAdLevel() {
		return adLevel;
	}

	public void setAdLevel(String adLevel) {
		this.adLevel = adLevel;
	}

	@Override
	public String toString() {
		return "AdminVO [adId=" + adId + ", adPw=" + adPw + ", adName=" + adName + ", adTel=" + adTel + ", adSite="
				+ adSite + ", adEmail=" + adEmail + ", adLevel=" + adLevel + "]";
	}

}
