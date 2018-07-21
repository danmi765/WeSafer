<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fm" %>
<link href="${pageContext.request.contextPath}/daumeditor/css/editor.css" rel="stylesheet" type="text/css" charset="utf-8">
<script src="${pageContext.request.contextPath}/daumeditor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>

<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>

    <div id="subGnb" class="info">
		<jsp:include page="/WEB-INF/views/top/top_menu.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
   <h3 class="pagetitle infoPt">수정하기</h3>

    <div id="container">
    	<fm:form modelAttribute="boardBeanObjToWrite" name="tx_editor_form" method="post"  id="write_frm">
       		<table>
       			<tr>
       				<th>분류</th>
       				<td>
       					<select name="part1">
							<option>-----카테고리-----</option>
							<option value="info"	<c:if test="${rs.part1 eq 'info'}">selected</c:if>>정보</option>
							<option value="handle"	<c:if test="${rs.part1 eq 'handle'}">selected</c:if>>대처방법</option>
							<option value="treat" 	<c:if test="${rs.part1 eq 'treat'}">selected</c:if>>피해예방</option>
							<option value="site" 	<c:if test="${rs.part1 eq 'site'}">selected</c:if>>관련 사이트</option>
						</select>
						<select name="part2">
							<option>-----컨텐츠-----</option>
							<option value="rape" 	<c:if test="${rs.part2 eq 'rape'}">selected</c:if>>성범죄</option>
							<option value="robber" 	<c:if test="${rs.part2 eq 'robber'}">selected</c:if>>강도/절도</option>
							<option value="violence"<c:if test="${rs.part2 eq 'violence'}">selected</c:if>>폭력</option>
							<option value="drug" 	<c:if test="${rs.part2 eq 'drug'}">selected</c:if>>약물</option>
							<option value="murder" 	<c:if test="${rs.part2 eq 'murder'}">selected</c:if>>살인</option>
						</select>
       				</td>
       			</tr>
       			<tr>
       				<th>제목</th>
       				<td> 				
       					<input type="text" name="tit" value="${rs.tit}" />
       				</td>
       			</tr>
<%--        			<tr>
       				<th>내용</th>
       				<td><textarea > ${rs.cont} </textarea>
					</td>
       			</tr> --%>
       			<tr>
       				<th>내용</th>
       				<td><jsp:include page="/daumeditor/editor.jsp" />
						<script>
					        //'수정하기' 모드일 때, 다음과 같이 데이터를 다음오픈에디터에 대입할 수 있다.
					        if('${rs!=null}'=='true') Editor.modify({'content': '${rs.cont}'});
						</script>
					</td>
       			</tr>
       		</table>
       		<input type="hidden" name="page" value="${page}"/>
       		<input type="hidden" name="idx" value="${rs.idx}"/>
       		<input type="submit" value="전송" class="writebtn" onclick="return info_update_check(this.form)"  />
       	</fm:form>
    </div> <!-- container E -->
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
