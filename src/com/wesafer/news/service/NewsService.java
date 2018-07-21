package com.wesafer.news.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wesafer.bean.NewsBean;
import com.wesafer.news.mapper.NewsMapper;

@Component
public class NewsService {
	
	@Autowired
	private NewsMapper newsMapper;
	
	//news_list
	public ArrayList<NewsBean> getList(String scVal, Integer pr, String cate, String page){
		String statement = "";
		
		if (cate!=null&&!cate.equals("")) {//category check
			statement += " AND cate in(" + cate + ")";
		}

		if(pr != null && pr != 0) {// period check
				if (pr == 6) {// a week
					statement += " AND odate >= (SYSDATE - 7)";
				} else if (pr == 7) {// a month
					statement += " AND odate >= (SYSDATE - 30)";
				} else if (pr == 8) {// a year
					statement += " AND odate >= (SYSDATE - 365)";
				}
		}
		
		return this.newsMapper.getList(scVal, statement, page);
	}
	
	//news research result_count
	public String getTotal_cnt_news(String scVal, Integer pr, String cate){
		String statement = "";
		
		if (cate!=null&&!cate.equals("")) {//category check
			statement += " AND cate in(" + cate + ")";
		}

		if(pr != null && pr != 0) {// period check
				if (pr == 6) {// a week
					statement += " AND odate >= (SYSDATE - 7)";
				} else if (pr == 7) {// a month
					statement += " AND odate >= (SYSDATE - 30)";
				} else if (pr == 8) {// a year
					statement += " AND odate >= (SYSDATE - 365)";
				}
		} 
		
		return this.newsMapper.total_cnt_news(scVal, statement);
	}
	
	// newsWrite
	public void newsWrite(NewsBean newsBean){
		
		newsMapper.newsWrite(newsBean);
	}
	
	//newsDelete
	public void newsDelete(int ono){
		
		this.newsMapper.newsDelete(ono);
	}
}
