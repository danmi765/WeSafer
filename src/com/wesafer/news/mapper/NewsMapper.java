package com.wesafer.news.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.wesafer.bean.NewsBean;

@Repository
public interface NewsMapper {

	//news search(+paging)
	final String SELECT_NEWS_LIST = "select * from (select o.*, ceil(rownum/5) page from (select * from news where title like '%'||#{scVal, jdbcType=VARCHAR}||'%' or cont like '%'||#{scVal, jdbcType=VARCHAR}||'%' order by odate desc) o WHERE 1 = 1 ${cateStatement}) where page=#{page}";

		@Select(SELECT_NEWS_LIST)
		@Results(value={
				@Result(property="cate", column="cate"),
				@Result(property="title", column="title"),
				@Result(property="cont", column="cont"),
				@Result(property="ourl", column="ourl"),
				@Result(property="odate", column="odate"),
				@Result(property="opictureurl", column="opictureurl")
		})
	ArrayList<NewsBean> getList(@Param("scVal") String scVal, @Param("cateStatement") String cateStatement , @Param("page") String page);
		
	//news_search count(paging)
	final String PAGE_NEWS_COUNT = "select count(1) count from (select * from news where title like '%'||#{scVal}||'%' or cont like '%'||#{scVal}||'%' order by odate desc) WHERE 1 = 1 ${cateStatement}";
	
	@Select(PAGE_NEWS_COUNT)
	@Result(property="count", column="count")
	String total_cnt_news(@Param("scVal") String scVal, @Param("cateStatement") String cateStatement);
	
	//news write
	final String INSERT_NEWS = "insert into news(ono, cateno, cate, title, cont, ourl, odate, opictureurl, userid) values(news_seq.nextval, 'o', #{cate, jdbcType=INTEGER}, #{title, jdbcType=VARCHAR}, #{cont, jdbcType=VARCHAR}, #{ourl, jdbcType=VARCHAR}, #{odate, jdbcType=DATE}, #{opictureurl, jdbcType=VARCHAR}, 'admin')";
		
	@Insert(INSERT_NEWS)
	void newsWrite(NewsBean newsBean);
	
	
	//news Delete
	final String DELETE_NEWS="delete from news where ono=#{idx}";
	
	@Delete(DELETE_NEWS)
	void newsDelete(@Param("idx") int ono);
	

}
