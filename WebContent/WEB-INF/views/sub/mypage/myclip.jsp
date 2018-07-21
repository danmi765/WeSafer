<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<title>내 스크랩  : WeSafer</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
 	<c:set var="page" value="${page }" />
	<c:set var="total_cnt" value="${totalCnt }" />  

	<div id="subGnb" class="myp">
          <jsp:include page="/WEB-INF/views/top/top_menu_mypage.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle">스크랩</h3>
    
    <div id="container"><!-- container S -->
    
    	
    	
    	<!-- 게시판 겁색바 시작 -->
        <div class="comm_searchBox">
       		<form action="" method="">
       			<select id="" name="">
       				<option>분류</option>
       				<option value="">제목</option>
       				<option value="">날짜</option>
       			</select>
       			<input type="text" name="" id="" />
       			<input type="submit" value="검색" id="" />
       		</form>
       	</div>
       	<!-- 게시판 검색바 끝 -->
       	
       	<!-- 게시판 리스트 시작 -->
       		 <table id="headTb" class="tb">
				<tr>
					<td>총 게시물 수 : <c:out value="${totalCnt }" /></td>
					<td><p align="right">페이지 : <c:out value="${page }" /></p></td>
				</tr>
			</table>
	       	<table class="board notice">
	       		<thead>
	       			<tr>
	       				<th width="7%">분류</th>
	       				<th>제목</th>
	       				<th width="15%">작성자</th>
	       				<th width="15%">날짜</th>
	       				<th> </th>
	       			</tr>
	       		</thead>
	       		<c:forEach var="i" items="${rs}" varStatus="status">
	       		<tbody>
	       			<tr>
	       				<td>news</td>
	       				<td><a href="${i.ourl}" target="_blank">
							${fn:substring(i.title,0,50)}</a></td>
	       				<td>${i.userid }</td>
	       				<td>${fn:substring(i.odate,0,10)}</td>
	       				<td><a href="deleteClip.do?from_idx=${i.ono}&userid=${loginUser.userid}">X</a></td>
	       			</tr>
	       		</tbody>
	       		</c:forEach>
	       	</table>
	        <table id="pagingTb" class="tb">
				<tr>
					<td>
						<c:forEach var="i" begin="1" end="${t_pages }">
							<a href="MyclipList.do?page=${i}&userid=${userid}">
								<c:if test="${i == c_page }"><b> </c:if>
								 ${i } 
								<c:if test="${i == c_page }"></b> </c:if>
							</a>
						</c:forEach>
					</td>
				</tr>
			</table>
	    </div>      	
       	<!-- 게시판 리스트 끝 -->  
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>