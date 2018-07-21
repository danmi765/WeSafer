<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>비밀번호 변경: 회원정보 수정 : WeSafer</title>
</head>
<body> 
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
	<div id="subGnb" class="myp">
		<jsp:include page="/WEB-INF/views/top/top_menu_find.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle myPt">비밀번호 변경</h3>
    
    <div id="container">
    
    ${message }
    <!-- 비밀번호찾기1 시작  -->
	<div class="findpw_container">
		<form action="changepw.do" method="post" name="" id="findpw_frm_1">
			<p class="findpw_1_p">현재 비밀번호를 입력하세요.</p>
			<div class="findpw_1">
				<input type="hidden" value="${loginUser.userid }" name="userid" />
				<input type="password" name="psw" />
			</div>
			<input type="submit" value="확인" />
		</form>
	</div>
	<!-- 비밀번호찾기1 끝 -->
	
    </div> <!-- container E -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>