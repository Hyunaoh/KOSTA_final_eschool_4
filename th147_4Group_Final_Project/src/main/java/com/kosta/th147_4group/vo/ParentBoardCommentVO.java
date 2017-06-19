package com.kosta.th147_4group.vo;

import java.util.Date;


public class ParentBoardCommentVO {

	//댓글 달기 DTO
	private int commentNo; //댓글 갯수
	private int articleNo; //게시글 번호
	private String email; //이메일
	private String memo; //댓글 내용
	private Date regdate; //댓글 작성일
	private String user; //댓글 작성자
	private String uip; //댓글 작성자 IP
	private String uname; //댓글 작성자 이름
	
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getUip() {
		return uip;
	}

	public void setUip(String uip) {
		this.uip = uip;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMemo() {
		return memo;
	}

	public String getHtmlMemo() {
		if (memo != null) {
			return memo.replace(ParentBoardArticleVO.ENTER, "<br />");
		}
		return null;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
