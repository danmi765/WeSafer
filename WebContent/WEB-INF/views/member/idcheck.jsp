<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>아이디 중복체크 : WeSafer</title>
	<link rel="stylesheet" href="css/idcheck.css" />
</head>
<body>

	<h2 class="ic_tit">아이디 중복확인</h2>
	
	<form action="idCheck.do" method="get" name="frm">
	
		<div class="ic_in">
			<input type="text" name="userid" maxlength="12" style="padding:5px 10px;" />
			<input type="submit" value="중복체크" style="padding:2px 10px;" />
		</div>
		
		<div class="ic_po">
			<c:if test="${res==1 }">
				<script>
					opener.document.join_frm.userid.value="";
				</script>
				<p class="ic_po_inner">
					<span class="usedid">${userid}</span>는 이미 사용중인 아이디 입니다.
				</p>
			</c:if>	
			
			<c:if test="${res==-1 }">
				<p class="ic_po_inner">
					<span class="unusedid">${userid }</span>는 사용 가능한 아이디 입니다.
				</p>
				<div class="usebtn">
					<input type="button" value="사용" onclick="idok()" />
				</div>
			</c:if>
		</div>
	</form>



<script type="text/javascript">

//사용버튼 클릭시 창닫기
function idok(){
	opener.join_frm.userid.value="${userid}";
	opener.join_frm.redi.value="${userid}";
	self.close();
}

</script>