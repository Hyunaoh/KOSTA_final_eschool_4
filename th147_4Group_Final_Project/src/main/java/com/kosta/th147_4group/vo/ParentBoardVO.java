package com.kosta.th147_4group.vo;

public class ParentBoardVO {
	
	//게시판 종류 DTO
	private String boardCd; //게시글 코드 suggest, counsel
	private String boardNm; //게시판 종류 매칭 제목

	public String getBoardCd() {
		return boardCd;
	}

	public void setBoardCd(String boardCd) {
		this.boardCd = boardCd;
	}

	public String getBoardNm() {
		return boardNm;
	}

	public void setBoardNm(String boardNm) {
		this.boardNm = boardNm;
	}

}
