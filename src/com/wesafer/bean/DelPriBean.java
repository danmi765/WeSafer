package com.wesafer.bean;

public class DelPriBean {

		private String userid;
		private String reason;
		private String del_date;
		@Override
		public String toString() {
			return "DelPriBean [userid=" + userid + ", reason=" + reason + ", del_date=" + del_date + "]";
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public String getReason() {
			return reason;
		}
		public void setReason(String reason) {
			this.reason = reason;
		}
		public String getDel_date() {
			return del_date;
		}
		public void setDel_date(String del_date) {
			this.del_date = del_date;
		}
}
