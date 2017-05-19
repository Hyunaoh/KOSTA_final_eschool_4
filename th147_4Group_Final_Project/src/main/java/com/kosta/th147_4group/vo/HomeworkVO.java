package com.kosta.th147_4group.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class HomeworkVO {

	private String seq;
	private String hw_id;
	private String hw_title;
	private String hw_writer;
	private Date hw_ymd;
	private String hw_filesrc;
	private String hw_filesrc2;
	private int hw_hit;
	private String hw_content;
	
	//다중파일 업로드... setter, getter 구현
	//다중 파일 업로드 upload CommonsMultipartFile 하나 이상 필요

	private List<CommonsMultipartFile> files;
	public String gethw_filesrc2() {
		return hw_filesrc2;
	}
	public void sethw_filesrc2(String hw_filesrc2){
		this.hw_filesrc2 =hw_filesrc2;
	}
	public List<CommonsMultipartFile> getFiles(){
		return files;
		
	}
	public void setFiles(List<CommonsMultipartFile>files){
		this.files=files;
	}
	/////////////////////////////////////////////////////////////////////////////
	//단일 파일 처리 upload => MultipartFile 인터페이스 사용을 위해서 사용
		
	private CommonsMultipartFile file;
	public CommonsMultipartFile getFile(){
		return file;
	}
	public void setFile(CommonsMultipartFile file){
		this.file=file;
	}
///////////////////////////////////////////////////////////////////////////////////////
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getHw_id() {
		return hw_id;
	}
	public void setHw_id(String hw_id) {
		this.hw_id = hw_id;
	}
	public String getHw_title() {
		return hw_title;
	}
	public void setHw_title(String hw_title) {
		this.hw_title = hw_title;
	}
	public String getHw_writer() {
		return hw_writer;
	}
	public void setHw_writer(String hw_writer) {
		this.hw_writer = hw_writer;
	}
	public Date getHw_ymd() {
		return hw_ymd;
	}
	public void setHw_ymd(Date hw_ymd) {
		this.hw_ymd = hw_ymd;
	}
	public String getHw_filesrc() {
		return hw_filesrc;
	}
	public void setHw_filesrc(String hw_filesrc) {
		this.hw_filesrc = hw_filesrc;
	}
	public int getHw_hit() {
		return hw_hit;
	}
	public void setHw_hit(int hw_hit) {
		this.hw_hit = hw_hit;
	}
	public String getHw_content() {
		return hw_content;
	}
	public void setHw_content(String hw_content) {
		this.hw_content = hw_content;
	}
	@Override
	public String toString() {
		return "HomeworkVO [seq=" + seq + ", hw_id=" + hw_id + ", hw_title=" + hw_title + ", hw_writer=" + hw_writer
				+ ", hw_ymd=" + hw_ymd + ", hw_filesrc=" + hw_filesrc + ", hw_filesrc2=" + hw_filesrc2 + ", hw_hit="
				+ hw_hit + ", hw_content=" + hw_content + ", files=" + files + ", file=" + file + "]";
	}
}
	