<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<title>활동현황 : WeSafer</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
	<c:set var="page" value="${page }" />
	<c:set var="total_cnt" value="${totalCnt }" />  

	<div id="subGnb" class="myp">
          <jsp:include page="/WEB-INF/views/top/top_menu_mypage.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle">활동현황</h3>
    
    <div id="container"><!-- container S -->
    
    	
    	
    	<!-- 게시판 검색바 시작 -->
        <div class="comm_searchBox">
       		<form action="searchMyboard.do?page=1" method="post">
       			<select name="key">
       				<option value="board">게시글</option>
       				<option value="cmt">댓글</option>
       			</select>
       			<input type="text" name="con" />
       			<input type="hidden" name="userid" value="${loginUser.userid }" />
       			<input type="submit" value="검색" />
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
	       				<th width="15%">분류</th>
	       				<th>제목</th>
	       				<th width="15%">작성자</th>
	       				<th width="15%">날짜</th>
	       			</tr>
	       		</thead>
	       		<tbody>
					<c:forEach var="i" items="${rs}" varStatus="status">
		       			<tr>
		       				<td>
		       					<c:if test="${loginUser.userid == i.userid }">
		       					게시글
		       					</c:if>
		       					<c:if test="${loginUser.userid != i.userid }">
		       					댓글
		       					</c:if>
		       				</td>
		       				<td><a href="comm_view.do?part2=${i.part2}&idx=${i.idx}&part1=${i.part1}">
								${fn:substring(i.tit,0,50)}</a></td>
		       				<td>${i.userid }</td>
		       				<td>${fn:substring(i.indate,0,10)}</td>
		       			</tr>
	  				</c:forEach>
		       </tbody>
	       	</table>
	       	<table id="pagingTb" class="tb">
				<tr>
					<td>
						<c:forEach var="k" begin="1" end="${t_pages }">
							<a href="myboard.do?page=${k}&userid=${userid}">
								<c:if test="${k == c_page }"><b> </c:if>
								 ${k } 
								<c:if test="${k == c_page }"></b> </c:if>
							</a>
						</c:forEach>
					</td>
				</tr>
			</table>
	    </div>      	
       	<!-- 게시판 리스트 끝 -->  
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>