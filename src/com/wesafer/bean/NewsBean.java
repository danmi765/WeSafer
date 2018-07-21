package com.wesafer.bean;

import java.sql.Date;


public class NewsBean {
	private int ono;	//�?번호(index)
	private String cateno;	//게시?��분류 '?��?�� : o'	
	private int cate; 	//분류?���? (value 1:?��범죄,2:강도/?��?��,3:?��?��,4:?���?,5:?��?��)
	private String title;	//?��?�� ???��??
	private String cont;	//?��?�� ?��?��
	private String ourl;	//기사 링크 주소
	private Date odate;	//?���?
	private String opictureurl;	//기사 ?���?
	private String userid;	//admin
	
	
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public String getCateno() {
		return cateno;
	}
	public void setCateno(String cateno) {
		this.cateno = cateno;
	}
	public int getCate() {
		return cate;
	}
	public void setCate(int cate) {
		this.cate = cate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getOurl() {
		return ourl;
	}
	public void setOurl(String ourl) {
		this.ourl = ourl;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date date) {
		this.odate = date;
	}
	public String getOpictureurl() {
		return opictureurl;
	}
	public void setOpictureurl(String opictureurl) {
		this.opictureurl = opictureurl;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

	
}
