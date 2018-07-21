<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>회원 정보 수정 : WeSafer</title>
</head>
<body>
   
<%
	if(session.getAttribute("admin")==null && session.getAttribute("loginUser")==null){
		response.sendRedirect("login.do");
	}

	if(request.getAttribute("fail") !=null){
		%>
		<script>
			alert("정보변경에 실패하였습니다. 비밀번호를 확인해 주세요.");
		</script>
		<%
	}
	
%>  
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
	<div id="subGnb" class="myp">
		<jsp:include page="/WEB-INF/views/top/top_menu_mypage.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle myPt">정보수정</h3>
    
    <div id="container">
    	<div class="my_modi"> <!-- mt_modi S -->
    		<form action="modi.do" method="post">
	    		<table>
	    			<tr>
	    				<th>아이디</th>
	    				<td>
	    					${loginUser.userid }
	    					<input type="hidden" value="${loginUser.userid }" name="userid" />
	    				</td>
	    			</tr>
	    			<tr>
	    				<th>이름</th>
	    				<td>
	    					<input type="text" value="${loginUser.name }" name="name" maxlength="7" />
	    				</td>
	    			</tr>
	    			<tr>
	    				<th>비밀번호</th>
	    				<td>
							<input type="password" name="psw" id="userpw" />
						</td>
	    			</tr>
	    			<tr>
	    				<th>닉네임</th>
	    				<td>
	    					<input type="text" value="${loginUser.nick }" name="nick" maxlength="6" />
	    				</td>
	    			</tr>
	    			<tr>
	    				<th>생년월일</th>
	    				<td>
	    					<input type="text" value="${loginUser.birth }" name="birth" maxlength="6" />
	    				</td>
	    			</tr>
	    			<tr>
	    				<th>휴대전화번호</th>
	    				<td>
	    					<input type="text" value="${loginUser.phone }" name="phone" maxlength="12" />
	    				</td>
	    			</tr>
	    			<tr>
	    				<th>이메일</th>
	    				<td>
	    					<input type="text" value="${loginUser.email }" name="email" />
	    				</td>
	    			</tr>
	    			<tr>
	    				<th>거주지</th>
	    				<td id="ca1_c">
	    					<c:set var="mVo" value="${loginUser }" />
	    					<select name="loc" >
	    						<option value="" ${mVo.loc eq ""?"selected":n}>선택</option>
	    						<option data-target="#ca2-2" value="구로구" ${mVo.loc eq "구로구"?"selected":n}>구로구</option>
	    						<option data-target="#ca2-1" value="영등포구" ${mVo.loc eq '영등포구'?'selected':n}>영등포구</option>
								<option data-target="#ca2-3" value="금천구" ${mVo.loc eq "금천구"?"selected":n}>금천구</option>
								<option data-target="#ca2-4" value="관악구" ${mVo.loc eq "관악구"?"selected":n}>관악구</option>
	    					</select>
	    				</td>
	    			</tr>
	    			<tr>
	    				<th></th>
	    				<td id="ca2_c"></td>
	    			</tr>
	    		</table>
	    		<div class="mp_btn">
		    		<input type="button" value="암호변경" onclick="location.href='changepw.do'" />
		    		<input type="submit" value="저장하기" />
		    		<input type="button" value="취소" class="modino" />
	    		</div>
    		</form>
    	</div><!-- my_modi E -->
    	
    			
    	
    </div> <!-- container E -->
    
    <script>
    /* 회원가입 지역입력 드롭박스 */
		$(function(){
			
			
			
   		//on함수이용 미리 이벤트처리 
	 	$(document).on("change", "#ca1_c > select",function(){
			//1번셀렉터가 변경되면 2,3번은 초기화
			$("#ca2_c").empty().hide();
			$("#ca3_c").empty().hide();
			
			var target = $(this).find("option:selected").attr("data-target");
			var selector = "http://192.168.0.201:8888/WeSafer/js/loc_data.jsp " + target;
			$("#ca2_c").load(selector, function(){
				$(this).find("select").val("${mVo.loc2}");
				$(this).show();
			});
		}); 
   		
	 	$("#ca1_c > select").change();
			
		});//드롭박스 끝
   	</script>
  
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>