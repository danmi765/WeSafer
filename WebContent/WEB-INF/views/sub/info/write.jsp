<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fm" %>
<link href="${pageContext.request.contextPath}/daumeditor/css/editor.css" rel="stylesheet" type="text/css" charset="utf-8">
<script src="${pageContext.request.contextPath}/daumeditor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>

<title>글쓰기 : 정보 : WeSafer</title>
</head>
<body>
   
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>

    <div id="subGnb" class="info">
		<jsp:include page="/WEB-INF/views/top/top_menu.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
   <h3 class="pagetitle infoPt">글쓰기</h3>

    <div id="container">
       <fm:form modelAttribute="infoBeanObjToWrite" method="post" name="tx_editor_form" id="write_frm">
       		<table>
       			<tr>
       				<th>분류</th>
       				<td>
       					<select name="part1">
							<option>-----카테고리-----</option>
							<option value="info">정보</option>
							<option value="handle">대처방법</option>
							<option value="treat">피해예방</option>
							<option value="site">관련 사이트</option>
						</select>
						<select name="part2">
							<option>-----컨텐츠-----</option>
							<option value="rape">성범죄</option>
							<option value="robber">강도/절도</option>
							<option value="violence">폭력</option>
							<option value="drug">약물</option>
							<option value="murder">살인</option>
						</select>
       				</td>
       			</tr>
       			<tr>
       				<th>제목</th>
       				<td>
       					<input type="text" name="tit" />
       				</td>
       			</tr>
       			<tr>
       				<th>내용</th>
       				<!-- <textarea name="cont"></textarea> -->
					<td><jsp:include page="/daumeditor/editor.jsp"></jsp:include></td>
       			</tr>
       		</table>
       		<input type="hidden" name="page" value="${page}" />
       		<input type="hidden" name="userid" value="${admin.userid}" />
       		<input type="submit" value="글쓰기" class="writebtn" onclick="return info_write_check(this.form)" />
       </fm:form>
    </div> <!-- container E -->
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>