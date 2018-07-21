<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	if(request.getAttribute("distinct") != null){
		%>
			<script>
				alert("이미 스크랩된 게시물 입니다.");
			</script>
		<%
	}
%>
    <title>뉴스 조건검색 : WeSafer</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
	<c:set var="page" value="${page}" />
	<c:set var="total_cnt" value="${totalCnt}" />  

    <div id="subGnb" class="go">
		<jsp:include page="/WEB-INF/views/top/top_menu_news.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle newsPt">뉴스검색</h3>
    
    <div class="condition">
    
    	<form name="frm" action="newsList.do?page=${i}&scVal=${scVal}&ckKey=${cateQuery}&prKey=${param.prKey}">
    		<input type="text" name="scVal" id="search_news" value="${scVal}"/>
    		<input type="submit" value="" id="search_submit" onclick="return nsCheck()"/>
    		
    		<table>
    			<tr>
    				<td>유형</td>
    				<td class="drad">
    					<span><input type="checkbox" name="ckKey" id="" value="1"/><a href="#" class="">성범죄</a></span>
    					<span><input type="checkbox" name="ckKey" id="" value="2"/><a href="#" class="">강도/절도</a></span>
    					<span><input type="checkbox" name="ckKey" id="" value="3"/><a href="#" class="">폭력</a></span>
    					<span><input type="checkbox" name="ckKey" id="" value="4"/><a href="#" class="">약물</a></span>
    					<span><input type="checkbox" name="ckKey" id="" value="5"/><a href="#" class="">살인</a></span>
    				</td>
    			</tr>
    			<tr>
    				<td>기간</td>
    				<td class="ddat">
    					<span><input type="checkbox" name="prKey" id="" value="6"/><a href="#" class="">최근 일주일간</a></span>
    					<span><input type="checkbox" name="prKey" id="" value="7"/><a href="#" class="">최근 한달간</a></span>
    					<span><input type="checkbox" name="prKey" id="" value="8"/><a href="#" class="">최근 일년</a></span>
    				</td>
    			</tr>
    		</table>
    		
    		<div class="news_btn">
    			<input type="button" value="초기화" onclick="location.href='news.do'"/>
    			<input type="submit" value="검색" onclick="return nsCheck()"/>
    			
    		</div>
    	</form>
    </div><!-- condition E -->
    
    <h4 class="news_tit4">검색결과</h4>
    <div id="container" class="list">
        <div class="comm_con">
			<c:forEach var="news" items="${newsList}">
			
        	<div class="conBox">
        	<%if(session.getAttribute("loginUser")!=null){ %>
        	<a href="myclipInsert.do?idx=${news.ono}&userid=${loginUser.userid}" class="cliplink">스크랩</a>
        	<%}
        	if(session.getAttribute("admin")!=null && session.getAttribute("loginUser")==null){ %>
        	<a href="newsDelete.do?idx=${news.ono}" class="delete_btn" onclick="if(confirm('삭제하시겠습니까?')){return true;}">X</a>
        	<%} %>
        		  <div class="opictureurl" id="opic">
        		  	<img src="upload/news/${news.opictureurl}" alt="" onerror="javascript:this.style.display='none'; javascript:$(this).parent().siblings('.a').css('width','940px')"/>
        		  </div> 
        		<div class="a">
        			<p class="news_con_tit">
        				<a href="${news.ourl}" target="_blank">${news.title}</a>
        			</p>
        			<span class="news_date">
        			${fn:substring(news.odate,0,11)}
        			</span>
        			<p class="news_con_cont">
        			<c:choose>
        			<c:when test="${fn:length(news.cont) > 50}">
           						 ${fn:substring(news.cont,0,129)}...
			        </c:when>
			        <c:otherwise>${news.cont}...</c:otherwise>
			        </c:choose>
			        </p>
        		</div>
        	</div>
			</c:forEach>
			<!-- 뉴스 검색결과 없음 출력문구 -->
        	<div class="news_none_res">
				<c:if test="${fn:length(newsList) == 0}">
					<c:if test="${!empty scVal}">
						검색결과 없음
					</c:if>
				</c:if>
        	</div>
			     <!-- paging -->
	        <table id="pagingTb" class="tb">
					<tr>
						<td>
							<c:forEach var="i" begin="1" end="${t_pages}">
								<a href="newsList.do?page=${i}&scVal=${scVal}&ckKey=${cateQuery}&prKey=${param.prKey}">
									<c:if test="${i == c_page }"><b> </c:if>
									 ${i } 
									<c:if test="${i == c_page }"></b> </c:if>
								</a>
							</c:forEach>
						</td>
					</tr>
			</table>
        </div>
     
        
        <!-- 관리자에게만 보이는 글쓰기 버튼 -->
        	<%if(session.getAttribute("admin")!=null && session.getAttribute("loginUser")==null){ %>
        <ul class="news_list_btn">
    		<li><a href="newsWrite.do">글쓰기</a></li>
    	</ul>   
    	<%} %>
    </div> <!-- container E -->

    	  
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>