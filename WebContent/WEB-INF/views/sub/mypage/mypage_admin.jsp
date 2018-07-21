<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.sql.*,javax.naming.*,javax.sql.*"
    import="util.PageNumberingManager"%>
    <%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<title>회원관리 : 관리자 : WeSafer</title>
</head>
<body>
	<%
	if(session.getAttribute("admin")==null){
		response.sendRedirect("login.do");
		request.setAttribute("message","관리자만 가능한 페이지 입니다.");
	}else if(session.getAttribute("admin")==null && session.getAttribute("loginUser")!=null){
	%>
	<script>
		alert("관리자만 가능한 페이지 입니다.");
		location.href="index.do";
	</script>
	<%}	%>  
 	<c:set var="page" value="${page }" />
	<c:set var="total_cnt" value="${totalCnt }" />  
    
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
	
	<div id="subGnb" class="news_sg">
            <ul>
                <li><a href="#">&nbsp;</a></li>
            </ul>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle myPt">회원관리</h3>
    
    <div id="container">
	    <table id="headTb" class="tb">
			<tr>
				<td>총 회원 수 : <c:out value="${totalCnt }" />&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><p align="right">페이지 : <c:out value="${page }" /></p></td>
			</tr>
		</table>
		
    	<form>
    		<table class="admin_table">
	    		<tr>
					<th>이름</th>
					<th>아이디</th>
					<th>가입일자</th>
					<th>활동여부</th>
					<th> </th>
				</tr>
				<c:forEach items="${members }" var="mem">
					<tr>
						<td>${mem.name }</td>			
						<td>${mem.userid }</td>				
						<td>${fn:substring(mem.joindate,0,10)}</td>				
						<td>${mem.active }</td>
						<td>
							<a href="adminmp2.do?userid=${mem.userid }&page=${page}">자세히</a>
						</td>
					</tr>					
				</c:forEach>
			</table>
		</form>
		<table id="pagingTb" class="tb">
			<tr>
				<td>
					<c:forEach var="i" begin="1" end="${t_pages }">
						<a href="adminmp.do?page=${i}">
							<c:if test="${i == c_page }"><b> </c:if>
							 ${i } 
							<c:if test="${i == c_page }"></b> </c:if>
						</a>
					</c:forEach>
				</td>
			</tr>
		</table>
		<c:if test="${admin_search ne null}">
			<div class="admintb_allList_btn">
				<a href="adminmp.do?page=1">전체목록</a>
			</div>
		</c:if>
		<div class="admin_td_search_box">
			<form action="memberSearch.do?page=1" method="post">
				<select name="key">
					<option value="userid">아이디</option>
					<option value="name">이름</option>
				</select>
				<input type="text" name="con" />
				<input type="submit" value="검색" />
			</form>
		</div>
    	
    </div> <!-- container E -->
  
    
    
    <script>
    	$(".dellink").click(function(){
    		if(confirm("해당 회원을 삭제하시겠습니까?")){
    			return true;
    		}else{
    			return false;
    		}
    	});
    </script>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>