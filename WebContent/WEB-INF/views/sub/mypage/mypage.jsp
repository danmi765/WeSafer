<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>화원 정보 보기 : WeSafer</title>
</head>
<body>
   
<%
	if(session.getAttribute("admin")==null && session.getAttribute("loginUser")==null){
		%>
		<script>
			alert("로그인 후 사용 가능합니다.");
			location.href="login.do";
		</script>
		<%
	}

	if(request.getAttribute("fail") != null){
		%>
		<script>
			alert("비밀번호를 확인해 주세요.");
		</script>
		<%
	}
%>  
   
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
	<div class="outmodal">
		<div class="outBox">
			<h2 class="outBox_tit">회원탈퇴</h2>
			<!-- <p>탈퇴사유와 비밀번호를 입력해 주세요.</p> -->
			<form id="out_frm" action="delmember.do" method="post">
				<table>
					<tr>
						<td width='30%'>이유</td>
						<td>
							<textarea name="reason"></textarea>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" name="psw" />
							<input type="hidden" name="userid" value="${loginUser.userid }" />
						</td>
					</tr>
				</table>
				<input type="submit" value="Yes" onclick="return del()"/>
				<input type="reset" value="No" />
			</form>
		</div>
	</div>
	

	<div id="subGnb" class="myp">
          <jsp:include page="/WEB-INF/views/top/top_menu_mypage.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle myPt">마이페이지</h3>
    
    <div id="container">
    	<div class="my_modi"> <!-- mt_modi S -->
    		<table>
    			<tr>
    				<th>아이디</th>
    				<td>${loginUser.userid }</td>
    			</tr>
    			<tr>
    				<th>이름</th>
    				<td>${loginUser.name }</td>
    			</tr>
    			<tr>
    				<th>닉네임</th>
    				<td>${loginUser.nick }</td>
    			</tr>
    			<tr>
    				<th>생년월일</th>
    				<td>${loginUser.birth }</td>
    			</tr>
    			<tr>
    				<th>휴대전화번호</th>
    				<td>${loginUser.phone }</td>
    			</tr>
    			<tr>
    				<th>이메일</th>
    				<td>${loginUser.email }</td>
    			</tr>
    			<tr>
    				<th>거주지</th>
    				<td>${loginUser.loc }, ${loginUser.loc2 }</td>
    			</tr>
    			<tr>
    				<th>가입일자</th>
    				<td>${loginUser.joindate }</td>
    			</tr>
    			
    		</table>
    	</div><!-- my_modi E -->
    	<div class="mp_btn">
    		<form action="modi.do">
    			<input type="submit" value="정보수정" />
		    	<input type="button" value="탈퇴하기" class="outbtn" />
    		</form>
    	</div>
    </div> <!-- container E -->
  
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>