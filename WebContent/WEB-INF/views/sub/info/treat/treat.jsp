<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<title>피해예방 : WeSafer</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>


    <div id="subGnb" class="info">
		<jsp:include page="/WEB-INF/views/top/top_menu.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle infoPt">피해예방교육</h3>
    
    <div id="container">
   	    <table id="headTb" class="tb">
			<tr>
				<td>총 게시물 수 : <c:out value="${total_cnt }" /></td>
			</tr>
		</table>
    	<!-- 게시판 겁색바 시작 -->
        <div class="comm_searchBox">
       		<form method="post" name="searchFrm" id="searchFrm">
       			<select id="" name="part2">
       				<option value="0">전체</option>
       				<option value="rape">성범죄</option>
       				<option value="robber">강조/절도</option>
       				<option value="violence">학교폭력</option>
       				<option value="drug">약물</option>
       				<option value="murder">살인</option>
       			</select>
       			<input type="text" name="keyword" />
       			<input type="submit" value="검색"  onclick="return search_list(this.form,'info')" />
       		</form>
       	</div>
       	<!-- 게시판 검색바 끝 -->
       	
       	<!-- 게시판 리스트 시작 -->
       	<div class="container_inner">
	       <table class="board info_t">
	       		<thead>
	       			<tr>
	       				<th width="7%">글번호</th>
	       				<th>제목</th>
	       				<th width="15%">작성자</th>
	       				<th width="7%">조회수</th>
	       				<th width="15%">날짜</th>
	       			</tr>
	       		</thead>
	       		<c:forEach var="i" items="${rs}">
	       		<tbody>
	       			<tr>
	       				<td>${i.num}</td>
	       				<td><a href="info_view.do?part1=${i.part1}&part2=${i.part2}&idx=${i.idx}&page=${page}">
							${fn:substring(i.tit,0,50)}</a></td>
	       				<td>${i.userid }</td>
	       				<td>${i.readCnt }</td>
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
							<a href="info_list.do?part1=handle&page=${p}">
								[
								<c:if test="${p == Page }"><b> </c:if>
								 ${p } 
								<c:if test="${p == Page }"></b> </c:if>
								]
							</a>
						</c:forEach>
					</td>
				</tr>
			</table>
			</div>
<!-- 페이징 -->	       	
	       	<ul class="pasing"></ul>
	       	<!-- 관리자에게만 보이는 글쓰기 버튼 -->
	       	<%if(session.getAttribute("admin")!=null && session.getAttribute("loginUser")==null){ %>
       		 <ul class="board_list_btn">
				<li><a href="info_insert.do">글쓰기</a></li>
    		</ul>
    		<%} %>
       	</div>
       	<!-- 게시판 리스트 끝 -->  
            
    </div> <!-- container E -->
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>