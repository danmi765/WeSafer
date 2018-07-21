package com.wesafer.bean;

public class TablestatsBean {
	private String sno;
	private String cate;
	private String spic;
	private String cont;
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getSpic() {
		return spic;
	}
	public void setSpic(String spic) {
		this.spic = spic;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	@Override
	public String toString() {
		return "TablestatsVO [sno=" + sno + ", cate=" + cate + ", spic=" + spic + ", cont=" + cont + "]";
	}
}
