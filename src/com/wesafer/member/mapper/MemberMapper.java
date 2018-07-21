package com.wesafer.member.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.wesafer.bean.DelPriBean;
import com.wesafer.bean.InfoBean;
import com.wesafer.bean.LatlngBean;
import com.wesafer.bean.MemberBean;
import com.wesafer.bean.NewsBean;


@Repository
public interface MemberMapper {

	// get all members by page
	final String GET_MEMBER_PAGE = "SELECT name, userid, joindate, active FROM (SELECT CEIL(ROWNUM / 10) AS page, name, userid, joindate, active FROM (SELECT name, userid, joindate, active FROM MEMBER_T ORDER BY joindate DESC) T WHERE ROWNUM <= #{page} * 10) T WHERE page = #{page}" ;
		
		@Select(GET_MEMBER_PAGE)
		@Results(value={
				@Result(property="userid",column="userid"),
				@Result(property="psw",column="psw"),
				@Result(property="name",column="name"),
				@Result(property="phone",column="phone"),
				@Result(property="birth",column="birth"),
				@Result(property="email",column="email"),
				@Result(property="loc",column="loc"),
				@Result(property="nick",column="nick"),
				@Result(property="active",column="active"),
				@Result(property="joindate",column="joindate"),
				@Result(property="loc2",column="loc2")
		})
		ArrayList<MemberBean> getAllMember(@Param("page") String page, @Param("list") String list);
	
		
	// all member count
	final String SELECT_CNT_ALL="select count(1) from member_t";
	
	@Select(SELECT_CNT_ALL)
	int getTotalCnt();
		
	// get member by id
	final String GET_MEMBER_BY_ID = "select * from member_t where userid=#{userid}" ;
	
	@Select(GET_MEMBER_BY_ID)
	@Results(value={
			@Result(property="userid",column="userid"),
			@Result(property="psw",column="psw"),
			@Result(property="name",column="name"),
			@Result(property="phone",column="phone"),
			@Result(property="birth",column="birth"),
			@Result(property="email",column="email"),
			@Result(property="loc",column="loc"),
			@Result(property="nick",column="nick"),
			@Result(property="active",column="active"),
			@Result(property="joindate",column="joindate"),
			@Result(property="loc2",column="loc2")
	})
	MemberBean selectById(@Param("userid") String userid);
	
	
	// find password by email & phone
	final String GET_MEMBER_EMAIL="SELECT CONCAT('****', SUBSTR(EMAIL,4)) EMAIL FROM MEMBER_T WHERE USERID=#{userid}";
	final String GET_MEMBER_PHONE="SELECT CONCAT(CONCAT(CONCAT(CONCAT(substr(phone,1,3), '-**'), substr(phone,6,2)), '-**'), substr(phone,10,2)) phone FROM MEMBER_T WHERE USERID=#{userid}";

	@Select(GET_MEMBER_EMAIL)
	@Results(value={
			@Result(property="email",column="email")
			})
	String GetMemberEmail(@Param("userid") String userid);
	
	@Select(GET_MEMBER_PHONE)
	@Results(value={
			@Result(property="phone",column="phone")
			})
	String GetMemberPhone(@Param("userid") String userid);
	
	
	
	// usercheck
	final String LOGIN_USER_CHECK="select psw from member_t where userid=#{userid}";
	@Select(LOGIN_USER_CHECK)
	@Results(value={
			@Result(property="psw",column="psw")
			})
	String userCheck(@Param("userid") String userid);
	
	
	// update password
	final String UPDATE_PASSWORD="update member_t set psw=#{psw} where userid=#{userid}";
	@Update(UPDATE_PASSWORD)
	void changePassword(@Param("userid") String userid, @Param("psw") String psw);	
	
	// delete member
	final String DELETE_MEMBER = "delete from member_t where userid=#{userid}" ;
	@Delete(DELETE_MEMBER)
	void deleteMember(@Param("userid") String userid);
	
	// change active 'n'
	final String ACTIVE_NONE="update member_t set active='n' where userid=#{userid}";
	@Update(ACTIVE_NONE)
	void modiActive(@Param("userid") String userid);

	// list of active 'n' members
	final String ACTIVE_NONE_MEMBER_LIST="select userid from member_t where active='n'";
	@Select(ACTIVE_NONE_MEMBER_LIST)
	@Results(value={
			@Result(property="userid", column="userid")
	})
	ArrayList<String> noneActiveMemberList();
	
	// find active 'n' members by id
	final String ACTIVE_NONE_MEMBER_BY_ID="select active from member_t where userid=#{userid}";
	@Select(ACTIVE_NONE_MEMBER_BY_ID)
	@Results(value={
			@Result(property="active", column="active")
	})
	String noneActiveMember(@Param("userid") String userid);
	
	// find active 'n' members by email
	final String ACTIVE_NONE_MEMBER_BY_EMAIL="select active from member_t where email=#{email}";
	@Select(ACTIVE_NONE_MEMBER_BY_ID)
	@Results(value={
			@Result(property="active", column="active")
	})
	String noneActiveMemberByEmail(@Param("email") String email);
	
	// modify member
	final String MODI_MEM="update member_t set name=#{name}, phone=#{phone}, email=#{email}, loc=#{loc}, birth=#{birth}, nick=#{nick}, loc2=#{loc2} where userid=#{userid}";
	@Update(MODI_MEM)
	void modiMember(@Param("userid") String userid, @Param("name") String name, @Param("phone") String phone,
			@Param("email") String email, @Param("loc") String loc, @Param("birth") String birth,
			@Param("nick") String nick, @Param("loc2") String loc2);
	
	// join member
	final String JOIN_MEMBER = "insert into member_t values(#{name},#{userid},#{psw},#{phone},#{email},#{nick},#{loc},#{birth},'y',sysdate,#{loc2})";
	@Insert(JOIN_MEMBER)
	void joinMember(@Param("userid") String userid, @Param("name") String name, @Param("psw") String psw, @Param("phone") String phone,
			@Param("email") String email, @Param("loc") String loc, @Param("birth") String birth,
			@Param("nick") String nick, @Param("loc2") String loc2);
	
	// user check by id
	final String ID_CHECK="select userid from member_t where userid=#{userid}";
	@Select(ID_CHECK)
	@Results(value={
			@Result(property="userid",column="userid")
			})
	String idCheck(@Param("userid") String userid);
	
	// user check by email
	final String EMAIL_CHECK="select userid from member_t where name=#{name} and email=#{email}";
	@Select(EMAIL_CHECK)
	@Results(value={
			@Result(property="userid",column="userid")
			})
	String emailCheck(@Param("name") String name, @Param("email") String email);
	
	// password check by name & email
	final String PASSWORD_CHECK="select psw from member_t where name=#{name} and email=#{email}";
	@Select(PASSWORD_CHECK)
	@Results(value={
			@Result(property="psw",column="psw")
			})
	String passwordCheck(@Param("name") String name, @Param("email") String email);
	
	
	// mypage_myboard list
	final String MY_ACTIVE="select * from (select idx, indate, num, readcnt, liker, pictureurl, part1, part2, userid, tit, cont, ceil(rownum/10) as page from comm where idx IN (SELECT idx FROM CMT WHERE userid = #{userid}) OR userid = #{userid}) where page=#{page}";
	@Select(MY_ACTIVE)
	@Results(value={
			@Result(property="idx",column="idx"),
			@Result(property="num",column="num"),
			@Result(property="indate",column="indate"),
			@Result(property="pictureUrl",column="pictureUrl"),
			@Result(property="part1",column="part1"),
			@Result(property="part2",column="part2"),
			@Result(property="userid",column="userid"),
			@Result(property="tit",column="tit"),
			@Result(property="cont",column="cont"),
			@Result(property="userid",column="userid"),
			@Result(property="0",column="visit"),
			@Result(property="0",column="linker")
			})
	ArrayList<InfoBean> myActive(@Param("userid") String userid, @Param("page") String page);
	
	// clip check
	final String CLIP_CHECK="SELECT * FROM ( SELECT T.* FROM (select N.ono from news N, myclip S where N.ono = S.from_idx AND S.userid = #{userid} ORDER BY clipdate DESC ) T) where ono=#{ono}";
	@Select(CLIP_CHECK)
	@Results(value={
			@Result(property="ono",column="ono")
	})
	String clipCheck(@Param("userid") String userid, @Param("ono") String ono);
	
	// insert clip
	final String INSERT_CLIP = "insert into myClip values(#{userid},'','',#{idx},'',sysdate)";
	@Insert(INSERT_CLIP)
	void insertMyClip(@Param("userid") String userid, @Param("idx") int idx);
	
	// go clip board page
	final String MOVE_CLIP="SELECT * FROM ( SELECT T.* , ceil(rownum/10) as page FROM (select N.ono, N.cateno, N.cate, N.title, N.cont, N.ourl, N.odate, N.opictureurl, N.userid, S.clipdate from news N, myclip S where N.ono = S.from_idx AND S.userid = #{userid} ORDER BY clipdate DESC  ) T) WHERE page = #{page}";
	@Select(MOVE_CLIP)
	@Results(value={
			@Result(property="ono",column="ono"),
			@Result(property="odata",column="odata"),
			@Result(property="userid",column="userid")
	})
	ArrayList<NewsBean> goMyClip(@Param("userid") String userid, @Param("page") String page);
	
	// clip board all count
	final String MYCLIP_COUNT="select count(1) as count from news where ono in(select from_idx from myClip where userid=#{userid})";
	@Select(MYCLIP_COUNT)
	@Results(value={
			@Result(property="count",column="count")
	})
	String myclipCount(@Param("userid") String userid);
	
	// myboard all count
	final String MYPAGE_COUNT="SELECT count(1) as count  FROM COMM WHERE idx IN (SELECT idx FROM CMT WHERE userid = #{userid}) OR userid = #{userid}";
	@Select(MYPAGE_COUNT)
	@Results(value={
			@Result(property="count",column="count")
	})
	String mypageCount(@Param("userid") String userid);
	
	// 탈퇴사유 입력
	final String DEL_PRI="insert into del_pri values(#{userid}, sysdate, #{reason})";
	@Insert(DEL_PRI)
	void del_pri(@Param("userid") String userid, @Param("reason") String reason);
	
	// 탈퇴기록 삭제
	final String DEL_PRI_DELETE="delete from del_pri where userid=#{userid}";
	@Delete(DEL_PRI_DELETE)
	void del_pri_delete(@Param("userid") String userid);
	
	// 탈퇴회원 정보 출력
	final String DEL_MEMBER="select * from del_pri where userid=#{userid}";
	@Select(DEL_MEMBER)
	@Results(value={
			@Result(property="userid",column="userid"),
			@Result(property="del_date",column="del_date"),
			@Result(property="reason",column="reason")
	})
	DelPriBean delMember(@Param("userid") String userid);
	
	
	// update member active
	final String UPDATE_ACTIVE="update member_t set active='y' where userid=#{userid}";
	@Update(UPDATE_ACTIVE)
	void updateMemberActive(@Param("userid") String userid);
	
	final String UPDATE_ACTIVE_NONE="update member_t set active='n' where userid=#{userid}";
	@Update(UPDATE_ACTIVE_NONE)
	void updateMemberActiveNone(@Param("userid") String userid);
	
	// member search
	final String SEARCH_MEMBERS_BY_ID="select * from (select name, userid, psw, phone, email, nick, loc, birth, active, joindate, loc2, ceil(rownum/10) as page from member_t where userid like #{userid}) where page=#{page}";
	final String SEARCH_MEMBERS_BY_NAME="select * from (select name, userid, psw, phone, email, nick, loc, birth, active, joindate, loc2, ceil(rownum/10) as page from member_t where name like #{name}) where page=#{page}";
	
	@Select(SEARCH_MEMBERS_BY_ID)
	@Results(value={
			@Result(property="userid",column="userid"),
			@Result(property="psw",column="psw"),
			@Result(property="name",column="name"),
			@Result(property="phone",column="phone"),
			@Result(property="birth",column="birth"),
			@Result(property="email",column="email"),
			@Result(property="loc",column="loc"),
			@Result(property="nick",column="nick"),
			@Result(property="active",column="active"),
			@Result(property="joindate",column="joindate"),
			@Result(property="loc2",column="loc2")
	})
	ArrayList<MemberBean> searchMembersById(@Param("userid") String userid, @Param("page") String page);
	
	@Select(SEARCH_MEMBERS_BY_NAME)
	@Results(value={
			@Result(property="userid",column="userid"),
			@Result(property="psw",column="psw"),
			@Result(property="name",column="name"),
			@Result(property="phone",column="phone"),
			@Result(property="birth",column="birth"),
			@Result(property="email",column="email"),
			@Result(property="loc",column="loc"),
			@Result(property="nick",column="nick"),
			@Result(property="active",column="active"),
			@Result(property="joindate",column="joindate"),
			@Result(property="loc2",column="loc2")
	})
	ArrayList<MemberBean> searchMembersByName(@Param("name") String name, @Param("page") String page);
	
	// search member count
	final String SEARCH_MEMBERS_BY_ID_COUNT="select count(1) as count from member_t where userid like #{userid}";
	final String SEARCH_MEMBERS_BY_NAME_COUNT="select count(1) as count from member_t where name like #{name}";
	
	@Select(SEARCH_MEMBERS_BY_ID_COUNT)
	@Results(value={
			@Result(property="count",column="count")
	})
	String searchMemberByIdCount(@Param("userid") String userid);
	
	@Select(SEARCH_MEMBERS_BY_NAME_COUNT)
	@Results(value={
			@Result(property="count",column="count")
	})
	String searchMemberByNameCount(@Param("name") String name);
	
	
	//search myboard
	final String SEARCH_MYBOARD="select * from comm where userid=#{userid}";
	@Select(SEARCH_MYBOARD)
	@Results(value={
			@Result(property="idx",column="idx"),
			@Result(property="num",column="num"),
			@Result(property="indate",column="indate"),
			@Result(property="pictureUrl",column="pictureUrl"),
			@Result(property="part1",column="part1"),
			@Result(property="part2",column="part2"),
			@Result(property="userid",column="userid"),
			@Result(property="tit",column="tit"),
			@Result(property="cont",column="cont"),
			@Result(property="userid",column="userid"),
			@Result(property="0",column="visit"),
			@Result(property="0",column="linker")
	})
	ArrayList<InfoBean> searchMyboard(@Param("userid") String userid);
	
	final String SEARCH_MYBOARD_COUNT ="select count(1) as count from comm where userid=#{userid}";
	@Select(SEARCH_MYBOARD_COUNT)
	@Results(value={
			@Result(property="count",column="count")
	})
	String searchMyboardCount(@Param("userid") String userid);
	
	final String SEARCH_MYBOARD_CMT="select * from comm where idx IN (SELECT idx FROM CMT WHERE userid = #{userid})";
	@Select(SEARCH_MYBOARD_CMT)
	@Results(value={
			@Result(property="idx",column="idx"),
			@Result(property="num",column="num"),
			@Result(property="indate",column="indate"),
			@Result(property="pictureUrl",column="pictureUrl"),
			@Result(property="part1",column="part1"),
			@Result(property="part2",column="part2"),
			@Result(property="userid",column="userid"),
			@Result(property="tit",column="tit"),
			@Result(property="cont",column="cont"),
			@Result(property="userid",column="userid"),
			@Result(property="0",column="visit"),
			@Result(property="0",column="linker")
	})
	ArrayList<InfoBean> searchMyboardCmt(@Param("userid") String userid);
	
	final String SEARCH_MYBOARD_CMT_COUNT="select count(1) as count from comm where idx IN (SELECT idx FROM CMT WHERE userid = #{userid})";
	@Select(SEARCH_MYBOARD_CMT_COUNT)
	@Results(value={
			@Result(property="count",column="count")
	})
	String searchMyboardCmtCount(@Param("userid") String userid);
	
	//delete clip
	final String DELETE_CLIP="delete from myclip where from_idx=#{from_idx}";
	@Delete(DELETE_CLIP)
	void deleteClip(@Param("from_idx") String from_idx);
	

	
}
