package com.wesafer.bean;

public class CommentBean {
	private String text;
	private String userid;
	private Integer c_no;
	private Integer idx;
	private String cdate;
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Integer getC_no() {
		return c_no;
	}
	public void setC_no(Integer c_no) {
		this.c_no = c_no;
	}
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	@Override
	public String toString() {
		return "CommentVO [text=" + text + ", userid=" + userid + ", c_no=" + c_no + ", idx=" + idx + ", cdate=" + cdate
				+ "]";
	}
	
}
