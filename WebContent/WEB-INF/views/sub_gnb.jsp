<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	    
	    
	    <!-- Global navigation bar 시작 -->
   	<div id="sub_header">
        <div class="sub_headerInner">
            <h2><a href="index.do">주메뉴로고</a></h2>
            <ul class="sub_gnb">
                <li><a href="info_list.do?part1=info&part2=rape&page=1">정보</a> </li>
                <li><a href="news.do">뉴스</a> </li>
                <li><a href="wholestats.do">통계분석</a></li>
                <li><a href="comm_list.do?page=1">커뮤니티</a></li>
            <!-- 관리자로 로그인시 보이는 마이페이지 -->
   			<%if(session.getAttribute("admin")!=null){%>
                <li><a href="adminmp.do?page=1">회원관리</a></li>
    		<%} %>
    		
    		<!-- 일반사용자 또는 일반사용자로 로그인시 보이는 마이페이지 -->
   			<%if(session.getAttribute("admin")==null){%>
                <li><a href="mypage.do">마이페이지</a></li>
    		<%} %>
            </ul><!-- gnb E -->
        </div>
    </div>
	    <!-- Global navigation bar 끝 -->
	    