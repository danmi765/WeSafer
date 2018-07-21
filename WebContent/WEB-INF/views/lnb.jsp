<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


		<!-- Local navigation bar 시작 -->
		<div id="topLnb">
       		 <ul>
		<%
		if(session.getAttribute("admin")==null && session.getAttribute("loginUser")==null){
		%>
				<li><a href="login.do" class="login">Login</a></li>
		<%	
		}else if(session.getAttribute("admin")!=null && session.getAttribute("loginUser")==null){
		%>
				<li><a href="logout.do">로그아웃</a></li>
				<li class="login">${admin.userid } 님</li>
		<%
		}else if(session.getAttribute("loginUser")!=null && session.getAttribute("admin")==null){
		%>
				<!-- <li><a href="logout.do">로그아웃</a></li> -->
				<li><a href="#" onclick="Logout()">로그아웃</a></li>
				<li class="login"><a href="mypage.do">${loginUser.nick } 님</a></li>
		<%	
		}
		%>  	
            	<li><a href="sitemap.do">SiteMap</a></li>
            	<li><a href="index.do">Home</a></li>
	        </ul>
	    </div>
		<!-- Local navigation bar 끝 -->