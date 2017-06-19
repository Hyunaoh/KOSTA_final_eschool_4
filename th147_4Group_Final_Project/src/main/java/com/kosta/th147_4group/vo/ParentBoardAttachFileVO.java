package com.kosta.th147_4group.vo;

public class ParentBoardAttachFileVO {
	
	
	//학부모 마당 파일첨부 DTO
	 private int attachFileNo; //첨부파일 번호
	 private String filename;    //첨부파일 제목
	 private String filetype;     //첨부파일 타입
	 private long filesize;    //첨부파일 크기
	 private int articleNo; //게시글 글번호
	 private String uploader; // 파일 업로더 
	 
	public String getUploader() {
		return uploader;
	}
	public void setUploader(String uploader) {
		this.uploader = uploader;
	}
	public int getAttachFileNo() {
		return attachFileNo;
	}
	public void setAttachFileNo(int attachFileNo) {
		this.attachFileNo = attachFileNo;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	 
	 
	 
}
