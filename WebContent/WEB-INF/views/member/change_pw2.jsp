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
    
    <!-- 비밀번호찾기1 시작  -->
	<div class="findpw_container change_pw_container">
		<form action="changepw2.do" method="post" name="findpw_frm_1" id="findpw_frm_1">
			<p class="findpw_1_p">변경할 비밀번호를 입력하세요.</p>
			<div class="findpw_1">
				<table class="change_pw_tb">
					<tr>
						<td>새로운 비밀번호</td>
						<td>
							<input type="hidden" value="${loginUser.userid }" name="userid" />
							<input type="password" name="psw" />
						</td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="psw_check" /></td>
					</tr>
				</table>
			</div>
			<input type="submit" value="확인" onclick="return pwcheck()" />
		</form>
	</div>
	<!-- 비밀번호찾기1 끝 -->
	
    </div> <!-- container E -->
  
  <script>
  function pwcheck(){
	  	 if(document.findpw_frm_1.psw.value == ""){
	  		alert("비밀번호를 입력하세요.");
	  		document.findpw_frm_1.psw.focus();
	  		return false;
	  	}
	  	
	  	if(document.findpw_frm_1.psw_check.value==""){
	  		alert("비밀번호를 한번 더 입력하세요.");
	  		document.findpw_frm_1.psw_check.focus();
	  		return false;
	  	}
	  	
	  	if(document.findpw_frm_1.psw.value != document.findpw_frm_1.psw_check.value){
	  		alert("비밀번호가 일치하지 않습니다.");
	  		document.findpw_frm_1.psw_check.focus();
	  		return false;
	  	}
	  	
	  	return true;  
  }
  </script>
    
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>