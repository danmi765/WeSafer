<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
 	if(request.getAttribute("findPasswordEmailvail") != null){
		%>
		<script>
			alert("등록된 정보가 없거나 이미 탈퇴한 회원입니다.");
		</script>
		<%
	}
 %>
<title>아이디 찾기 : WeSafer</title>
</head>
<body> 
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
	<div id="subGnb" class="fi">
		<jsp:include page="/WEB-INF/views/top/top_menu_find.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle myPt">아이디 찾기</h3>
    
    <div id="container">
    
    	<!-- 아이디찾기 시작  -->
	<div class="findid_container">
		<form action="sendValidateMail.do" method="post" name="fi_email">
			<div class="fi_email">
				<a href="#" class="fiBtn" id="fi_email">이메일로 아이디 찾기</a>
				<div class="vaild">
					<table>
						<tr>
							<td>이름</td>
							<td>
								<input type="text" name="name" />
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" name="email" />
								<input type="button" value="인증번호 받기" onclick="mailCheck()" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
		<form>
			<div class="fi_phone">
				<a href="#" class="" id="fi_phone">휴대전화로 아이디 찾기</a>
				<div class="vaild">
					<table>
						<tr>
							<td>이름</td>
							<td>
								<input type="text" name="name" />
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" name="email" />
								<input type="button" value="인증번호 받기" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
	<!-- 아이디 찾기 끝 -->
	
    </div> <!-- container E -->
  
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>