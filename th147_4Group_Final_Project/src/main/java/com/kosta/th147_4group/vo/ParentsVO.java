package com.kosta.th147_4group.vo;

import java.sql.Timestamp;

public class ParentsVO {
	
	
	
	// 부모 데이터
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
	
	
	// 게시판 DTO
	int bId; //글번호
	String bName; //작성자
	String bTitle; //제목
	String bContent; //내용
	Timestamp bDate; //생성날짜
	int bHit; //조회수
	int bGroup;  //댓글 그룹 
	int bStep; //댓글 스텝 
	int bIndent; //댓글 들여쓰기
	
	//페이징 처리 DTO
	int totalPage;
	int totalRecord;
	int startNum;
	int endNum;
	int curPage = 1;
	int pageBlock = 0;
	int blockCount = 5;
	int startPage = 1;
	int startBlock = 0;
	
	
	
	
	//게시판 필드 G&S
	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Timestamp getbDate() {
		return bDate;
	}

	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}

	public int getbHit() {
		return bHit;
	}

	public void setbHit(int bHit) {
		this.bHit = bHit;
	}

	public int getbGroup() {
		return bGroup;
	}

	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}

	public int getbStep() {
		return bStep;
	}

	public void setbStep(int bStep) {
		this.bStep = bStep;
	}

	public int getbIndent() {
		return bIndent;
	}

	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	// 부모 데이터 Getter&Setter
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
