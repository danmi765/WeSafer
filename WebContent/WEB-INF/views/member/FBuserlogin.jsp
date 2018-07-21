<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>페이스북 아이디 로그인  : WeSafer</title>

    <style>
    	p.aaa{
	    	width: 410px;
			margin: 0px auto 30px;
			font-size: 1.2em;
		}
    </style>
</head>
<body style="background:#f5f1f1;">
	
		<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	    
	<h1 class="lg_h">
		<a href="index.do">WeSafer</a>
	</h1>
	
	<p class="aaa"> WeSafer 홈페이지에서 사용하는 비밀번호를 입력해 주세요.</p>
	
    <!-- 로그인시작 -->
	<div id="loginBox">
	    <form action="login.do" method="post" class="login_frm" name="login_frm">
	        <fieldset>
	            <legend>Login</legend>
	            <table>
	                <tr>
	                    <td>
	                    	<input type="hidden" name="userid" value="<%=request.getAttribute("userid") %>" />
	                    	<input type="password" name="psw" />
	                    </td>
	                </tr>
	                <tr>
	                    <td><input type="submit" value="확인" onclick="return pw_check()" /></td>
	                </tr>
	            </table>
	        </fieldset>
	    </form>
	    <p>&nbsp;</p>
    </div>
    <!-- 로그인 끝 -->
    
    <ul class="lg_f">
    	<li><a href="#">이용약관</a> |</li>
    	<li><a href="#"><b>개인정보취급방침</b></a> |</li>
    	<li><a href="#">회원정보 고객센터</a></li>
    </ul>
    
    <p class="lg_p"><b style="font-size:1.3em;color:#02436e;">WeSafer </b>CopyRight 2016 &copy; All Rights Reserved.</p>
    
    <script src="js/common.js"></script>
    <script>
    	function pw_check(){
    		if(document.login_frm.psw.value==""){
    			alert("비밀번호를 입력하세요.");
    			document.login_frm.psw.focus();
    			return false;
    		}
    		
    		return true;
    	}
    </script>