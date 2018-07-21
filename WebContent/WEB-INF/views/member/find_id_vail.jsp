<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 

<title>아이디 찾기 : WeSafer</title>
</head>
<body> 
	<script>
		alert("인증메일이 발송되었습니다. 인증번호를 입력해 주세요.");
	</script>
	
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
	<div id="subGnb" class="fi">
		<jsp:include page="/WEB-INF/views/top/top_menu_find.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle myPt">아아디 찾기</h3>
    
    <div id="container">
    
    	<!-- 아이디찾기 시작  -->
	<div class="findid_container findidvalid">
		<form action="sendValidateMail.do" method="post" name="fi_email">
			<div class="fi_email validpage">
				<a href="#" class="fiBtn" id="fi_email">이메일로 아이디 찾기</a>
				<div class="vaild">
					<table>
						<tr>
							<td>이름</td>
							<td>
								<input type="text" name="name" value="${username }" readonly />
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" name="email" value="${useremail }" readonly />
							</td>
						</tr>
						<tr>
							<td>인증번호</td>
							<td>
								<input type="text" name="validate" />
								<input type="hidden" name="validate_check" value="${vali }" />
								<input type="submit" value="인증번호 확인" />
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