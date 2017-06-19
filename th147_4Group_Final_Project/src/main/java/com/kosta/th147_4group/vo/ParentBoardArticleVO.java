package com.kosta.th147_4group.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ParentBoardArticleVO {

	//게시글 DTO
	private int articleNo; //글 번호
	private String boardCd; //게시글 종류
	private String title; //글제목
	private String content; //글내용
	private String email; //이메일
	private int hit; //조회수
	private Date regdate; //작성일
	private int attachFileNum; // 파일첨부
	private int commentNum; // 댓글 개수
	private String writer; //작성자 ID
	private String name; // 작성자 이름
	private String regip; // 등록 ip
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getRegip() {
		return regip;
	}

	public void setRegip(String regip) {
		this.regip = regip;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public int getAttachFileNum() {
		return attachFileNum;
	}

	public void setAttachFileNum(int attachFileNum) {
		this.attachFileNum = attachFileNum;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getBoardCd() {
		return boardCd;
	}

	public void setBoardCd(String boardCd) {
		this.boardCd = boardCd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getWriteDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		return sdf.format(regdate);
	}

	public String getWriteDateTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return sdf.format(regdate);
	}

	// 아래코드를 적용하여 view.jsp 에서 ${getHtmlContent}로 사용
	public static final String ENTER = System.getProperty("line.separator");

	public String getHtmlContent() {
		if (content != null) {
			return content.replaceAll(ENTER, "<br />");
		}
		return null;
	}

}
