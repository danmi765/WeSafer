package com.wesafer.bean;

public class LatlngBean {

		private String x;
		private String y;
		private String title;
		private String ourl;
		public String getOurl() {
			return ourl;
		}
		public void setOurl(String ourl) {
			this.ourl = ourl;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		@Override
		public String toString() {
			return  title + "," + y + "," + x + "," + ourl ;
		}
		public String getX() {
			return x;
		}
		public void setX(String x) {
			this.x = x;
		}
		public String getY() {
			return y;
		}
		public void setY(String y) {
			this.y = y;
		}
}
