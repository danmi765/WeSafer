<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<title>약물 : 범죄분류 : WeSafer</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp" ></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>

    <div id="subGnb" class="info">
		<jsp:include page="/WEB-INF/views/top/top_menu.jsp"></jsp:include>
    </div><!-- subGnb E -->
    <h3 class="pagetitle infoPt">범죄분류</h3>
    
    <!-- 페이지 탭 시작 -->
		<jsp:include page="/WEB-INF/views/sub/info/sub_menu.jsp"></jsp:include>
    <!-- 페이지 탭 끝 -->
    
    <div id="container"><!-- container S -->
      	<c:forEach var="i" items="${rs}">
	        <div style="cursor:hand;" class="info_info">
		        <ul class="record">
					<li ><h2> ■&nbsp; ${i.tit} </h2></li>
				</ul>
				<ul class="record">
					<li> ${i.cont}
				</ul>
			</div>
 	    	<!-- 관리자에게만 보이는 글쓰기 버튼 --> 
	    	<%if(session.getAttribute("admin")!=null && session.getAttribute("loginUser")==null){ %>
	        <ul class="info_list_btn">
				<li><a href="info_update.do?part1=${i.part1}&part2=${i.part2}&idx=${i.idx}&page=${page}">글수정</a></li>
				<li><a href="info_delete.do?part1=${i.part1}&part2=${i.part2}&idx=${i.idx}&page=${page}">글삭제</a></li>
				<li><a href="info_insert.do">글쓰기</a></li>
	    	</ul>
	    	<%} %>
	   	</c:forEach>
    </div> <!-- container E -->
   
   
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>