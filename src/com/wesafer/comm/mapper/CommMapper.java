package com.wesafer.comm.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.wesafer.bean.CommentBean;
import com.wesafer.bean.InfoBean;

@Repository
public interface CommMapper {
	

	
	// GET_COMM_BY_IDX
	String GET_COMM_BY_IDX = "select * from ${part1} where part2=#{part2} and idx=#{idx}" ;
	
	@Select(GET_COMM_BY_IDX)
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
						@Param("idx") int idx);
	
	// GET_COMM_BY_ALL
	String GET_COMM_BY_ALL = "SELECT * FROM ${part1} WHERE part2=#{part2} AND num BETWEEN #{blockStartNum} AND #{blockEndNum} order by num desc";	
	@Select(GET_COMM_BY_ALL)
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
	String GET_KEYWORD_SEARCH = "select * from ${part1} where part2=#{part2} and ${searchCate} like '%' || '${keyword}' || '%' order by num desc";	
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
									@Param("searchCate") String searchCate, 
									@Param("keyword") String keyword);	

	
	// MODI_COMM
	final String MODI_COMM="update ${part1} set part2=#{part2}, tit=#{tit}, cont=#{cont} where idx=#{idx}";
	@Update(MODI_COMM)
	void update(InfoBean infoBean);
	
	
	// INSERT_COMM
	final String INSERT_COMM="insert into ${part1}"
			+ "(idx, indate, num, readCnt, liker, pictureUrl, part1, part2, userid, tit, cont)"
			+ "	values(info_comm_seq.nextval, sysdate, #{num}, 0, 0, 0, 'comm', #{part2}, #{userid}, #{tit}, #{cont})";
	@Insert(INSERT_COMM)
	void insert(InfoBean infoBean);

	
	// TOTAL_CNT
	final String GET_TOTAL_CNT="select count(*) from ${part1} where part2=#{part2}";
	@Select(GET_TOTAL_CNT)
	int getTotalCnt(	@Param("part1") String part1,
						@Param("part2") String part2);
	
	// KEYWORD_SEARCH_CNT
	String GET_KEYWORD_SEARCH_CNT = "select count(1) from ${part1} ${part2} and cont like '%' || '${keyword}' || '%' or tit like '%' || '${keyword}' || '%'";	
	@Select(GET_KEYWORD_SEARCH_CNT)
	Integer searchKeywordTotal(
			@Param("part1") String part1, 
			@Param("part2") String part2,
			@Param("keyword") String keyword,
			@Param("page") Integer page,
			@Param("rowsPerPage") Integer rowsPerPage);	
	
	// DEL_COMM
	final String DEL_COMM="delete ${part1} where part2=#{part2} and idx=#{idx}";
	@Update(DEL_COMM)
	void delete(	@Param("part1") String part1,
					@Param("part2") String part2,
					@Param("idx") int idx);
	
	
	// UPDATE_NUM
	final String UPDATE_NUM="update ${part1} set num=(num-1) where part2=#{part2} and idx > #{idx}";
	@Update(UPDATE_NUM)
	void updateNum(	@Param("part1") String part1,
					@Param("part2") String part2,
					@Param("idx") int idx);
	
	
	// UPDATE_READ_CNT
	final String UPDATE_READ_CNT="update ${part1} set readcnt=(readcnt +1) where part2=#{part2} and idx = #{idx}";
	@Update(UPDATE_READ_CNT)
	void updateReadCnt(	@Param("part1") String part1,
						@Param("part2") String part2,
						@Param("idx") int idx);
	
	
	// front page
	final String GET_ONE = "SELECT ROWNUM, T.*  FROM (select *  from comm where part2 = 'notice' order by idx desc) T  WHERE ROWNUM = 1"; 
	@Select(GET_ONE)
	@Results(value={
	
			@Result(property="idx",column="idx"),
			@Result(property="num",column="num"),
			@Result(property="indate",column="indate"),
			@Result(property="pictureUrl",column="pictureUrl"),
			@Result(property="part1",column="part1"),
			@Result(property="part2",column="part2"),
			@Result(property="userid",column="userid"),
			@Result(property="tit",column="tit"),
			@Result(property="cont",column="cont")
	})
	InfoBean getOne(@Param("part2") String part2);
	
	// 코멘트 입력
	final String INSERT_COMMENT = "insert into cmt values(cmt_seq.nextval,#{userid},#{cont},#{idx},sysdate)";
	@Insert(INSERT_COMMENT)
	void insertComment(@Param("userid") String userid,
			@Param("cont") String cont,
			@Param("idx") int idx);
	
	// 코멘트 삭제
	final String DELETE_COMMENT = "delete from cmt where idx=#{idx} and c_no=#{c_no}";
	@Delete(DELETE_COMMENT)
	void deleteComment(@Param("idx") int idx, @Param("c_no") int c_no);
	
	// 코멘트 출력
	final String GET_COMMENT="select * from cmt where idx=#{idx} order by c_no desc";
	@Select(GET_COMMENT)
	@Results(value={
			
			@Result(property="text",column="text"),
			@Result(property="userid",column="userid"),
			@Result(property="c_no",column="c_no"),
			@Result(property="idx",column="idx"),
			@Result(property="cdate",column="cdate")
	})
	ArrayList<CommentBean> getComment(@Param("idx") int idx);
	
}








