<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<title>회원관리 : 관리자 : WeSafer</title>
</head>
<body>
    
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
	
	<div id="subGnb" class="news_sg">
            <ul>
                <li><a href="#">&nbsp;</a></li>
            </ul>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle myPt">회원관리</h3>
    
    <div id="container">
    	<form>
    		<table class="admin_table">
				<tr>
					<th>이름</th>
					<td>${members.name }</td>
				</tr>
				<tr>			
					<th>아이디</th>
					<td>${members.userid }</td>
				</tr>
				<tr>	
					<th>비밀번호</th>			
					<td>${members.psw }</td>
				</tr>
				<tr>	
					<th>닉네임</th>			
					<td>${members.nick }</td>
				</tr>	
				<tr>	
					<th>생년월일</th>			
					<td>${members.birth }</td>
				</tr>				
				<tr>	
					<th>이메일</th>			
					<td>${members.email }</td>
				</tr>		
				<tr>	
					<th>휴대전화</th>			
					<td>${members.phone }</td>
				</tr>	
				<tr>	
					<th>거주지</th>			
					<td>${members.loc }, ${members.loc2 }</td>
				</tr>	
				<tr>	
					<th>활동여부</th>			
					<td>${members.active }</td>
				</tr>	
				<tr>
					<th>가입일자</th>
					<td>${fn:substring(members.joindate,0,10)}</td>		
				</tr>
				<c:if test="${!empty delMember}">
					<tr>
						<th>탈퇴일자</th>
						<td>${delMember.del_date }</td>
					</tr>
					<tr>
						<th>탈퇴사유</th>
						<td>${delMember.reason}</td>
					</tr>
				</c:if>
				<tr>
					<td colspan="2" class="admintb2_a">
						<a href="adminmp.do?page=${page}">목록으로</a>
						<a class='dellink' href='admindel.do?userid=${members.userid }'>회원삭제</a>
						<c:if test="${members.active == 'n' }">
							<a href="updateActive.do?userid=${members.userid }&page=${page}">활동회원으로 변경</a>
						</c:if>
						<c:if test="${members.active == 'y' }">
							<a href="updateActiveNone.do?userid=${members.userid }&page=${page}">비활동회원으로 변경</a>
						</c:if>
						<a href="myboardAdmin.do?userid=${members.userid }&page=1">게시물보기</a>
					</td>
				</tr>
			</table>
		</form>
    	
    </div> <!-- container E -->
  
    
    
    <script>
    	$(".dellink").click(function(){
    		if(confirm("해당 회원을 삭제하시겠습니까?")){
    			return true;
    		}else{
    			return false;
    		}
    	});
    </script>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>