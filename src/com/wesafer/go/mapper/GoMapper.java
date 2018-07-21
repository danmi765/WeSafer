package com.wesafer.go.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.wesafer.bean.CrimBean;
import com.wesafer.bean.LatlngBean;
import com.wesafer.bean.StatsBean;

public interface GoMapper {
		
		// 서울시통계 이미지 불러오기
		final String STATS_PIC = "select spic from stats_p where cate='10' order by sno desc";
		@Select(STATS_PIC)
		@Results(value={
				@Result(property="spic",column="spic")
		})
		String spic();
		
		// 전국통계 이미지 불러오기
		final String WHOLE_STATS_PIC = "select spic, rownum from stats_p where cate='20' and rownum=1";
		@Select(WHOLE_STATS_PIC)
		@Results(value={
				@Result(property="spic",column="spic")
		})
		String WholeSpic();
		
		// 연간 범죄발생 표
		final String YEAR_STATS = "select * from year_stats order by year desc";
		@Select(YEAR_STATS)
		@Results(value={
				@Result(property="year",column="year"),
				@Result(property="crime",column="crime"),
				@Result(property="count",column="count")
		})
		ArrayList<StatsBean> yearStats();
		
		// 그래프
		final String STATS_GRAPH = "SELECT year, crime, count AS count FROM YEAR_STATS ORDER BY year";
		@Select(STATS_GRAPH)
		@Results(value={
				@Result(property="year",column="year"),
				@Result(property="crime",column="crime"),
				@Result(property="count",column="count")
		})
		ArrayList<StatsBean> yearStatsGraph();
		
		// 글쓰기
		final String INSERT_GO="insert into stats_p values(st_seq.nextval, #{cate}, #{spic}, #{cont})";
		@Insert(INSERT_GO)
		void insertGo(@Param("cate") String cate, @Param("spic") String spic, @Param("cont") String cont);
		
		// get news latlng
		final String GET_LATLNG="select x, y, title, ourl from news where x is not null and y is not null";
		@Select(GET_LATLNG)
		@Results(value={
				@Result(property="x",column="x"),
				@Result(property="y",column="y"),
				@Result(property="title",column="title"),
				@Result(property="ourl",column="ourl")
		})
		ArrayList<LatlngBean> getLatlng();
		
		// get news latlng by cate 
		final String GET_CATE_LATLNG="select x, y, title, ourl from news where x is not null and y is not null and cate=#{cate}";
		@Select(GET_CATE_LATLNG)
		@Results(value={
				@Result(property="x",column="x"),
				@Result(property="y",column="y"),
				@Result(property="title",column="title"),
				@Result(property="ourl",column="ourl")
		})
		ArrayList<LatlngBean> getCateLatlng(@Param("cate") String cate);
		
		
		
		
		// get member loc2
		final String GET_MEMBER_LOC2="select loc2 from member_t where userid=#{userid}";
		@Select(GET_MEMBER_LOC2)
		@Results(value={
				@Result(property="loc2",column="loc2")
		})
		String getMemberLoc2(@Param("userid") String userid);
		
		// get user latlng
		final String GET_USER_LATLNG_X="select loc2, x from latlng where loc2=(select loc2 from member_t where userid=#{userid})";
		final String GET_USER_LATLNG_Y="select loc2, y from latlng where loc2=(select loc2 from member_t where userid=#{userid})";
		
		@Select(GET_USER_LATLNG_X)
		@Results(value={
				@Result(property="x",column="x")
		})
		String getUserLatlngX(@Param("userid") String userid);
		
		@Select(GET_USER_LATLNG_Y)
		@Results(value={
				@Result(property="y",column="y")
		})
		String getUserLatlngY(@Param("userid") String userid);
		
		
		// get crime
		final String GET_CRIM="select rpad(substr(c_name,1,2),5,'X') c_name, c_loc, c_date, charge from crim where loc2=#{loc2}";
		@Select(GET_CRIM)
		@Results(value={
				@Result(property="c_name",column="c_name"),
				@Result(property="c_loc",column="c_loc"),
				@Result(property="c_date",column="c_date"),
				@Result(property="charge",column="charge")
		})
		ArrayList<CrimBean> getCrim(@Param("loc2") String loc2);
		
		
		
}
