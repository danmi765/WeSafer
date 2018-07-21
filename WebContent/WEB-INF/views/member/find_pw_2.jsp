<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	if(request.getAttribute("findPasswordEmailvail") != null){
		%>
			<script>
				alert("등록된 정보와 일치하지 않습니다.");
			</script>
		<%
	}

%>
<title>비밀번호 찾기 : WeSafer</title>
</head>
<body> 
	
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
	<div id="subGnb" class="fi">
		<jsp:include page="/WEB-INF/views/top/top_menu_find.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle myPt">비밀번호 찾기</h3>
    
    <div id="container">
    
    	<!-- 비밀번호찾기 시작  -->
	<div class="findid_container">
		<form action="sendValidateMailPw.do" method="post" name="fi_email">
			<div class="fi_email">
				<a href="#" class="fiBtn" id="fi_email">이메일로 비밀번호 찾기 (${useremail })</a>
				<div class="vaild">
					<table>
						<tr>
							<td>이름</td>
							<td>
								<input type="text" name="name" />
								<input type="hidden" name="userid" value="${userid }" />
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" name="email" />
								<input type="button" value="인증번호 받기" onclick="pwMailCheck()" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
		<form>
			<div class="fi_phone">
				<a href="#" class="" id="fi_phone">휴대전화로 비밀번호 찾기 (${userphone })</a>
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
	<!-- 비밀번호 찾기 끝 -->
	
    </div> <!-- container E -->
  
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
 