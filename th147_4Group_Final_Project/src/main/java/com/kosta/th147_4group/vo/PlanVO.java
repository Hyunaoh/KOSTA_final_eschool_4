package com.kosta.th147_4group.vo;

public class PlanVO {
	
String id;
String title;
String comment;
String start;
String end;
int seq;


public int getSeq() {
	return seq;
}
public void setSeq(int seq) {
	this.seq = seq;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getComment() {
	return comment;
}
public void setComment(String comment) {
	this.comment = comment;
}
public String getStart() {
	return start;
}
public void setStart(String start) {
	this.start = start;
}
public String getEnd() {
	return end;
}
public void setEnd(String end) {
	this.end = end;
}
@Override
public String toString() {
	return "PlanVO [id=" + id + ", title=" + title + ", comment=" + comment + ", start=" + start + ", end=" + end
			+ ", seq=" + seq + "]";
}


}
