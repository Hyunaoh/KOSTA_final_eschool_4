package com.kosta.th147_4group.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class HomeworkVO {

	private String hwNo;
	private String hwId;
	private String hwTitle;
	private String hwWriter;
	private String hwContent;
	private Date hwYmd;
	private String hwHit;
	private  String hwDeleteflag;
	public String getHwNo() {
		return hwNo;
	}
	public void setHwNo(String hwNo) {
		this.hwNo = hwNo;
	}
	public String getHwId() {
		return hwId;
	}
	public void setHwId(String hwId) {
		this.hwId = hwId;
	}
	public String getHwTitle() {
		return hwTitle;
	}
	public void setHwTitle(String hwTitle) {
		this.hwTitle = hwTitle;
	}
	public String getHwWriter() {
		return hwWriter;
	}
	public void setHwWriter(String hwWriter) {
		this.hwWriter = hwWriter;
	}
	public String getHwContent() {
		return hwContent;
	}
	public void setHwContent(String hwContent) {
		this.hwContent = hwContent;
	}
	public Date getHwYmd() {
		return hwYmd;
	}
	public void setHwYmd(Date hwYmd) {
		this.hwYmd = hwYmd;
	}
	public String getHwHit() {
		return hwHit;
	}
	public void setHwHit(String hwHit) {
		this.hwHit = hwHit;
	}
	public String getHwDeleteflag() {
		return hwDeleteflag;
	}
	public void setHwDeleteflag(String hwDeleteflag) {
		this.hwDeleteflag = hwDeleteflag;
	}
	@Override
	public String toString() {
		return "HomeworkVO [hwNo=" + hwNo + ", hwId=" + hwId + ", hwTitle=" + hwTitle + ", hwWriter=" + hwWriter
				+ ", hwContent=" + hwContent + ", hwYmd=" + hwYmd + ", hwHit=" + hwHit + ", hwDeleteflag="
				+ hwDeleteflag + "]";
	}
}