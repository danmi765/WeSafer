package com.wesafer.info.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.wesafer.bean.InfoBean;
import com.wesafer.bean.MemberBean;

@Repository
public interface InfoMapper {
	
	
	
	//idx 검색
	String GET_INFO_BY_IDX = "select * from ${part1} where part2=#{part2} and idx=#{idx}" ;
	@Select(GET_INFO_BY_IDX)
	@Results(value={
	
			@Result(property="idx",column="idx"),
			@Result(property="num",column="num"),
			@Result(property="readCnt",column="readCnt"),
			@Result(property="indate",column="indate"),
			@Result(property="pictureUrl",column="pictureUrl"),
			@Result(property="part1",column="part1"),
			@Result(property="part2",column="part2"),
			@Result(property="userid",column="userid"),
			@Result(property="tit",column="tit"),
			@Result(property="cont",column="cont")
	})
	InfoBean searchIdx(
						@Param("part1") String part1,
						@Param("part2") String part2,
						@Param("idx") Integer idx);
	
	// GET_INFO_BY_ALL
	String GET_INFO_BY_ALL = "select rownum, s.* from (select * from ${part1} ${part2}) s where rownum <= #{blockEndNum} order by num desc";	
	@Select(GET_INFO_BY_ALL)
	@Results(value={
	
			@Result(property="idx",column="idx"),
			@Result(property="num",column="num"),
			@Result(property="readCnt",column="readCnt"),
			@Result(property="indate",column="indate"),
			@Result(property="pictureUrl",column="pictureUrl"),
			@Result(property="part1",column="part1"),
			@Result(property="part2",column="part2"),
			@Result(property="userid",column="userid"),
			@Result(property="tit",column="tit"),
			@Result(property="cont",column="cont")
	})
	List<InfoBean> searchAll(
								@Param("part1") String part1,
								@Param("part2") String part2,
								@Param("blockStartNum") Integer blockStartNum,
								@Param("blockEndNum") Integer blockEndNum
								);

	
	// GET_KEYWORD_SEARCH
		String GET_KEYWORD_SEARCH = "select * from (select * from ${part1} ${part2} order by num desc) where cont like '%' || #{keyword} || '%' OR tit like '%' || #{keyword} || '%'";	
		@Select(GET_KEYWORD_SEARCH)
		@Results(value={
				@Result(property="idx",column="idx"),
				@Result(property="num",column="num"),
				@Result(property="readCnt",column="readCnt"),
				@Result(property="indate",column="indate"),
				@Result(property="pictureUrl",column="pictureUrl"),
				@Result(property="part1",column="part1"),
				@Result(property="part2",column="part2"),
				@Result(property="userid",column="userid"),
				@Result(property="tit",column="tit"),
				@Result(property="cont",column="cont")
		})
		List<InfoBean> searchKeyword(
										@Param("part1") String part1, 
										@Param("part2") String part2,
										@Param("keyword") String keyword);	

	
	// 글 수정
	final String MODI_INFO="update ${part1} set part2=#{part2}, tit=#{tit}, cont=#{cont} where idx=#{idx}";
	@Update(MODI_INFO)
	void update(InfoBean infoBean);
	
	
	// 글 작성
	final String INSERT_INFO="insert into ${part1}"
			+ "(idx, indate, num, readCnt, liker, pictureUrl, part1, part2, userid, tit, cont)"
			+ "	values(info_comm_seq.nextval, sysdate, #{num}, 0, 0, 0, #{part1}, #{part2},#{userid},#{tit},#{cont})";
	@Insert(INSERT_INFO)
	void insert(InfoBean infoBean);

	
	// Total CNT
	final String GET_TOTAL_CNT="select count(1) from ${part1} ${part2}";
	@Select(GET_TOTAL_CNT)
	Integer getTotalCnt(	@Param("part1") String part1,
							@Param("part2") String part2);
	
	
	// 삭제
	final String DEL_INFO="delete ${part1} where part2=#{part2} and idx=#{idx}";
	@Update(DEL_INFO)
	void delete(	@Param("part1") String part1,
					@Param("part2") String part2,
					@Param("idx") Integer idx);
	
	
	// num 업데이트
	final String UPDATE_NUM="update ${part1} set num=(num-1) where part2=#{part2} and idx > #{idx}";
	@Update(UPDATE_NUM)
	void updateNum(	@Param("part1") String part1,
					@Param("part2") String part2,
					@Param("idx") Integer idx);
	
	
	// readCnt 업데이트
	final String UPDATE_READ_CNT="update ${part1} set readcnt=(readcnt +1) where part2=#{part2} and idx = #{idx}";
	@Update(UPDATE_READ_CNT)
	void updateReadCnt(	@Param("part1") String part1,
						@Param("part2") String part2,
						@Param("idx") Integer idx);
	
	
	// front page
	final String GET_ONE = "select * from comm where part2=#{part2} and num=#{idx}"; 
	@Select(GET_ONE)
	@Results(value={
	
			@Result(property="idx",column="idx"),
			@Result(property="num",column="num"),
			@Result(property="readCnt",column="readCnt"),
			@Result(property="indate",column="indate"),
			@Result(property="pictureUrl",column="pictureUrl"),
			@Result(property="part1",column="part1"),
			@Result(property="part2",column="part2"),
			@Result(property="userid",column="userid"),
			@Result(property="tit",column="tit"),
			@Result(property="cont",column="cont")
	})
	InfoBean getOne(@Param("part2") String part2, @Param("idx") Integer idx);
}
