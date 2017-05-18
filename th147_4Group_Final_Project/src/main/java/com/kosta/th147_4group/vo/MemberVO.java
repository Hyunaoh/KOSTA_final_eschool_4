package com.kosta.th147_4group.vo;

import java.util.Date;

public class MemberVO {
	private int num;	
	private String id; 		// 선생님 ID
	private String pw; 		// 선생님 비밀번호
	private String name; 		// 선생님 이름
	private String tel; 		// 선생님 핸드폰번호
	private String site; 		// 선생님 주소
	private String email; 	// 선생님 email
	private String level; 	// 값 : 선생님
	private Date date;
	private String stName;
	private String sms;

	public MemberVO() {

	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getStName() {
		return stName;
	}

	public void setStName(String stName) {
		this.stName = stName;
	}

	public String getSms() {
		return sms;
	}

	public void setSms(String sms) {
		this.sms = sms;
	}

	@Override
	public String toString() {
		return "MemberVO [num=" + num + ", id=" + id + ", pw=" + pw + ", name=" + name + ", tel=" + tel + ", site="
				+ site + ", email=" + email + ", level=" + level + ", date=" + date + ", stName=" + stName + ", sms="
				+ sms + "]";
	}

	
}
