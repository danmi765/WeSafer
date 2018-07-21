<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<title>글보기 : 자유게시판 : WeSafer</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>

	<div id="subGnb" class="comm">
		<jsp:include page="/WEB-INF/views/top/top_menu_comm.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle">자유 게시판</h3>
    
    <div id="container"><!-- container S -->
    	
    	<table class="board_view">
    		<tr>
    			<td class="bv_tit">
    				${rs.tit}
    				<div class="bv_wr">
    					<span><b>조회수 : </b>&nbsp;&nbsp;${rs.readCnt}</span>
    					<span><b>작성자 : </b>&nbsp;&nbsp;${rs.userid}</span>
    					<span><b>작성일 : </b>&nbsp;&nbsp;${fn:substring(rs.indate,0,10)}</span>
    				</div>	
    			</td>
    		</tr>
    		<tr>
    			<td class="bv_con">
    				<div>
							${rs.cont }
    					<div class="bw_btn">
    						<div><a href="comm_list.do?part1=${rs.part1}&part2=${rs.part2}&page=${page}">목록</a></div>

							<c:if test="${loginUser.userid == rs.userid || admin.userid == rs.userid }">
	    						<div><a href="comm_update.do?part1=${rs.part1}&part2=${rs.part2}&idx=${rs.idx}&page=${page}">수정</a></div>
	      						<div><a href="#" onclick="comm_delete_check( '${rs.part1}', '${rs.part2}', '${rs.idx}', '${page}')">삭제</a></div>
	    					</c:if>
    					</div>
    				</div>
    			</td>
    		</tr>
    	</table>
    	<%if(session.getAttribute("admin")!=null || session.getAttribute("loginUser")!=null){ %>
    	<!-- 댓글작성시작 -->
		<div class="comment_write">
			<form action="comment.do" method="post">
				<div>
					<textarea name="cont"></textarea>
				</div>
				<div>
					<input type="submit" value="작성" />
					<input type="hidden" value="${rs.idx }" name="idx" />
					<input type="hidden" value="${loginUser.userid }" name="userid" />
					<input type="hidden" value="${rs.part2}" name="part2" />
					<input type="hidden" value="${rs.part1}" name="part1" />
				</div>
			</form>
		</div>
		<%} %>
		
		<!-- 댓글보기 시작 -->
    	<ul class="comment_view">
    		<c:forEach var="cmt" items="${cmt}" varStatus="status">
				<li>
					<p>
						<span class="com_v_userid">작성자 ${cmt.userid }</span> &nbsp; 
						<span>${cmt.cdate }</span>
						<c:if test="${loginUser.userid == cmt.userid }">
						<a href="comment.do?c_no=${cmt.c_no }&idx=${rs.idx }&part2=${rs.part2}&part1=${rs.part1}">삭제</a>
						</c:if>
					</p>
					<p class="cont">${cmt.text }</p>
				</li>
			</c:forEach>
		</ul>
		
    	
    	
    	
    </div> <!-- container E -->
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>