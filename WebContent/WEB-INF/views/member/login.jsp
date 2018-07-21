<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getAttribute("changePassword") != null){
		%>
		<script>
			alert("비밀번호 변경이 완료되었습니다. 로그인 해주세요.");
		</script>
		<%
	}
	
	if(request.getAttribute("EmailValidate")!=null&&request.getAttribute("EmailValidate").equals("success")){
		%>
		<script>
			alert("회원님의 정보가 이메일로 발송되었습니다.");
		</script>
		<%
	}
	
	if(request.getAttribute("EmailValidate")!=null&&request.getAttribute("EmailValidate").equals("fail")){
		%>
		<script>
			alert("인증번호를 확인해 주세요.");
			history.back();
		</script>
		<%
	}
	
	
%>  
<title>로그인  : WeSafer</title>
</head>
<body style="background:#f5f1f1;">
	
		<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	    
	<h1 class="lg_h">
		<a href="index.do">WeSafer</a>
	</h1>
	
		<p class="loginCh">${message }</p>

    <!-- 로그인시작 -->
	<div id="loginBox">
	    <form action="login.do" method="post" class="login_frm" name="login_frm">
	        <fieldset>
	            <legend>Login</legend>
	            <table>
	                <tr>
	                    <td><input type="text" name="userid" value="${userid }" /></td>
	                </tr>
	                <tr>
	                    <td><input type="password" name="psw" /></td>
	                </tr>
	                <tr>
	                    <td><input type="submit" value="로그인" onclick="return loginCheck()" /></td>
	                </tr>
	                <tr>
	                    <td><input type="button" value="페이스북 아이디 로그인" onclick="Login()" /></td>
	                </tr>
	            </table>
	        </fieldset>
	    </form>
	    <ul class="login_con">
	        <li><a href="findid.do">아이디찾기 |</a></li>
	        <li><a href="findpw.do">&nbsp;비밀번호찾기 |</a></li>
	        <li><a href="join.do">&nbsp;회원가입</a></li>
	    </ul>
    </div>
    <!-- 로그인 끝 -->
    
    <ul class="lg_f">
    	<li><a href="#" onclick="agreement()">이용약관</a> |</li>
    	<li><a href="#" onclick="personal()"><b>개인정보취급방침</b></a></li>
    </ul>
    
    <p class="lg_p"><b style="font-size:1.3em;color:#02436e;">WeSafer </b>CopyRight 2016 &copy; All Rights Reserved.</p>
    
  
    
   