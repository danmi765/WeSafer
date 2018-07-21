<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	if(request.getAttribute("noneActiveMember") != null){
		%>
			<script>
				alert("등록된 아이디가 없거나 이미 탈퇴한 회원입니다.");
			</script>
		<%
	}
%>
<title>비밀번호 찾기 : WeSafer</title>
 </head>
 <body>
	
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
	
	<!-- 페이지 텝메뉴 -->
	<div id="subGnb" class="fi">
		<jsp:include page="/WEB-INF/views/top/top_menu_find.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle myPt">비밀번호 찾기</h3>
    
    <div id="container">
    <!-- 비밀번호찾기1 시작  -->
	<div class="findpw_container">
		<form action="findpw.do" method="post" name="" id="findpw_frm_1">
			<p class="findpw_1_p">찾으려는 아이디를 입력하세요.</p>
			<div class="findpw_1">
				<input type="text" name="userid" />
			</div>
			<input type="submit" value="다음" />
		</form>
	</div>
	<!-- 비밀번호찾기1 끝 -->
	
    </div> <!-- container E -->
  
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>