package com.wesafer.go.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wesafer.bean.CrimBean;
import com.wesafer.bean.LatlngBean;
import com.wesafer.bean.StatsBean;
import com.wesafer.go.mapper.GoMapper;

@Component
public class GoService {

		@Autowired
		private GoMapper goMapper;
		
		public String spic(){
			return this.goMapper.spic();
		}
		
		public String WholeSpic(){
			return this.goMapper.WholeSpic();
		}
		
		public ArrayList<StatsBean> yearStats(){
			return this.goMapper.yearStats();
		}
		
		public ArrayList<StatsBean> yearStatsGraph(){
			return this.goMapper.yearStatsGraph();
		}
		
		public void insertGo(String cate, String spic, String cont){
			goMapper.insertGo(cate, spic, cont);
		}
		
		// get latlng
		public ArrayList<LatlngBean> getLatlng(){
			return this.goMapper.getLatlng();
		}
		
		// get member loc2
		public String getMemberLoc2(String userid){
			return this.goMapper.getMemberLoc2(userid);
		}
		
		// get user latlng
		public String getUserLatlngX(String userid){
			return this.goMapper.getUserLatlngX(userid);
		}
		
		public String getUserLatlngY(String userid){
			return this.goMapper.getUserLatlngY(userid);
		}
		
		// get latlng by cate 
		public ArrayList<LatlngBean> getCateLatlng(String cate){
			return this.goMapper.getCateLatlng(cate);
		}
		
		//get crim
		public ArrayList<CrimBean> getCrim(String loc2){
			return this.goMapper.getCrim(loc2);
		}
		
}
