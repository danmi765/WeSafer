package com.wesafer.bean;

public class CrimBean {
	private String c_name;
	private String c_loc;
	private String c_date;
	private String charge;
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_loc() {
		return c_loc;
	}
	public void setC_loc(String c_loc) {
		this.c_loc = c_loc;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
	@Override
	public String toString() {
		return "CrimBean [c_name=" + c_name + ", c_loc=" + c_loc + ", c_date=" + c_date + ", charge=" + charge + "]";
	}
	
//	#map>div>div>div>div>div>table>thead>tr>th{}
	
	
	
}
