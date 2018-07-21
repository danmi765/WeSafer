<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fm" %>
<link href="${pageContext.request.contextPath}/daumeditor/css/editor.css" rel="stylesheet" type="text/css" charset="utf-8">
<script src="${pageContext.request.contextPath}/daumeditor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>

<title>글쓰기 : 공지게시판 : WeSafer</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>

	<!-- 메뉴 인클루드 -->
	<div id="subGnb" class="comm">
		<jsp:include page="/WEB-INF/views/top/top_menu_comm.jsp"></jsp:include>
    </div><!-- subGnb E -->
	<!-- subGnb E -->

	<h3 class="pagetitle">공지 게시판</h3>

	<div id="container">
		<p class="write_h">
			<span class="rte">*</span>는 필수항목입니다.
		</p>
		<fm:form modelAttribute="infoBeanObjToWrite" enctype="multipart/form-data" method="post" name="tx_editor_form"  id="write_frm">
			<table>
				<tr>
					<th>제목<span class="rte">*</span></th>
					<td><input type="text" name="tit" id="" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<!-- <td><textarea name="cont"></textarea></td> -->
					<td><jsp:include page="/daumeditor/editor.jsp"></jsp:include></td>
				</tr>
			</table>
			<input type="hidden" name="page" value="${page}" />
			<input type="hidden" name="userid" value="${admin.userid}" />
			<input type="submit" value="글쓰기" class="writebtn" onclick="return comm_write_check(this.form)" />
		</fm:form>
	</div>
	<!-- container E -->

	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>