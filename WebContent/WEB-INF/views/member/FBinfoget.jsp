<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>페이스북 아이디 로그인 : WeSafer</title>
</head>
<body onload="document.fblogin_frm.submit()" >

	<!--  -->
	<form action="fblogin.do" method="post" name="fblogin_frm">
		<input type="hidden" name="userid" value="<%= request.getAttribute("userid") %>" />
		<input type="hidden" name="email" value="<%= request.getAttribute("email") %>" />
		<input type="hidden" name="name" value="<%= request.getAttribute("name") %>" />
		<input type="hidden" name="birth" value="<%= request.getAttribute("birth") %>" />
	</form>
