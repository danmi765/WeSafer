<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<title>자유게시판 : WeSafer</title>
</head>


<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>

	<!-- 메뉴 인클루드 -->
		<jsp:include page="/WEB-INF/views/top/top_menu_comm.jsp"></jsp:include>
    <!-- subGnb E -->
    
    <h3 class="pagetitle">자유 게시판</h3>
    
    <div id="container"><!-- container S -->
   	    <table id="headTb" class="tb">
			<tr>
				<td>총 게시물 수 : ${total_cnt} </td>
			</tr>
		</table>
    	<!-- 게시판 겁색바 시작 -->
		<div class="comm_searchBox">
			<form method="post">
				<select id="" name="searchCate">
					<option value="0">분류</option>
					<option value="tit">제목</option>
					<option value="cont">내용</option>
					<option value="userid">아이디</option>
				</select>
				<input type="text" name="keyword" id="" />
				<input type="submit" value="검색" onclick="return search_list(this.form, 'comm')" />
			</form>
		</div>
       	<!-- 게시판 검색바 끝 -->
       	
       	<!-- 게시판 리스트 시작 -->
       	<div class="container_inner">
	       	<table class="board notice">
	       		<thead>
	       			<tr>
	       				<th width="7%">글번호</th>
	       				<th>제목</th>
	       				<th width="15%">작성자</th>
	       				<th width="7%">조회수</th>
	       				<th width="15%">날짜</th>
	       			</tr>
	       		</thead>
	       		<c:forEach var="i" items="${rs}" varStatus="status">
	       		<tbody>
	       			<tr>
	       				<td>${i.num}</td>
	       				<td><a href="comm_view.do?part1=${i.part1}&part2=${i.part2}&idx=${i.idx}&page=${page}">
							${fn:substring(i.tit,0,50)}</a></td>
	       				<td>${i.userid }</td>
	       				<td>${i.readCnt}</td>
	       				<td>${fn:substring(i.indate,0,10)}</td>
	       			</tr>
	       		</tbody>
	    		</c:forEach>
	       	</table>
<!-- 페이징 -->
	       	<div align="center">
	       	<table id="pagingTb" class="tb">
				<tr>
					<td>
						<c:forEach var="p" begin="1" end="${total_page}">
							<a href="comm_list.do?part1=comm&part2=free&page=${p}">
								[
								<c:if test="${p == page }"><b> </c:if>
								 ${p }
								<c:if test="${p == page }"></b> </c:if>
								]
							</a>
						</c:forEach>
					</td>
				</tr>
			</table>
			</div>
<!-- 페이징 -->
	       	<ul class="pasing"></ul>
	       	<!-- 관리자와 로그인한 유저에게 보이는 버튼 -->
	       	<%if(session.getAttribute("admin")!=null || session.getAttribute("loginUser")!=null){ %>
	    	<ul class="board_list_btn">
	    		<li><a href="comm_insert.do?part1=comm&part2=free">글쓰기</a></li>
	    	</ul>
	    	<%} %>
	    </div>      	
       	<!-- 게시판 리스트 끝 -->  
    </div> <!-- container E -->
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>