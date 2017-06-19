package com.kosta.th147_4group.vo;

import java.util.Date;

public class MessageVO {

	private String meSend;			// 보낸사람
	private String meGet;			// 받은사람
	private String meMessage;		// 메세지 내용
	private Date meDate;

	public MessageVO() {

	}

	public String getMeSend() {
		return meSend;
	}

	public void setMeSend(String meSend) {
		this.meSend = meSend;
	}

	public String getMeGet() {
		return meGet;
	}

	public void setMeGet(String meGet) {
		this.meGet = meGet;
	}

	public String getMeMessage() {
		return meMessage;
	}

	public void setMeMessage(String meMessage) {
		this.meMessage = meMessage;
	}

	public Date getMeDate() {
		return meDate;
	}

	public void setMeDate(Date meDate) {
		this.meDate = meDate;
	}

	@Override
	public String toString() {
		return "MessageVO [meSend=" + meSend + ", meGet=" + meGet + ", meMessage=" + meMessage + ", meDate=" + meDate + "]";
	}
	
}
