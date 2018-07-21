<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

        	<ul>
                <li><a href="mypage.do">개인정보관리</a></li>
                <li><a href="#">신고센터</a></li>
                <li><a href="myboard.do?userid=${loginUser.userid }&page=1">활동현황</a></li>
                <li><a href="MyclipList.do?userid=${loginUser.userid }&page=1">스크랩</a></li>
            </ul>
