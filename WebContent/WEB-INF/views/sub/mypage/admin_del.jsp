<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>Insert title here</title>
</head>
<body onload="document.del_frm.submit()">


	<form action="admindel.do" method="post" name="del_frm">
		<input type="hidden" value="${userid }" name="userid" />
	</form>
	
