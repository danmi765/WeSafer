<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.naming.*,javax.sql.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>통계자료 : 유형별 분석통계 : WeSafer</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
    <div id="subGnb" class="go">
		<jsp:include page="/WEB-INF/views/top/top_menu_go.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle goPt">유형별 분석통계</h3>
    
    <div class="info_tablnb info_tablnb_treat">
    	<ul>
    		<li><a href="typegra.do">그래프</a></li>
    		<li><a href="typetable.do" class="selected">통계자료</a></li>
    	</ul>
    </div>
    
    <div id="container">
    
       	<table class="go_gotb">
       		<thead>
       			<tr>
       				<th>연도</th>
       				<th>범죄분류</th>
       				<th>발생 수</th>
       			</tr>
       		</thead>
       		<tbody>
	       		<c:forEach var="stats" items="${stats }">
	       			<tr>
	       				<td>${stats.year }</td>
	       				<td>${stats.crime }</td>
	       				<td>${stats.count }</td>
	       			</tr>
	       		</c:forEach>
       		</tbody>
       	</table>
       

		<!-- 관리자에게만 보이는 글쓰기 버튼 -->
		<%if(session.getAttribute("admin")!=null && session.getAttribute("loginUser")==null){ %>
        <ul class="info_list_btn">
    		<li><a href="#">추가</a></li>
    		<li><a href="#">수정</a></li>
    	</ul>     
    	<%} %>
    </div> <!-- container E -->
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
