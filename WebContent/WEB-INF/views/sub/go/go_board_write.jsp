<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>자료입력 : 분석통계 : WeSafer</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>

	<div id="subGnb" class="go">
		<jsp:include page="/WEB-INF/views/top/top_menu_go.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle goPt">분석통계 글쓰기</h3>
    
    <div id="container">
       <p class="write_h"></p>
       <form action="gowrite.do" method="post" id="write_frm" enctype="multipart/form-data">
       		<table class="go_write">
       			<tr>
       				<th>분류<span class="rte">*</span></th>
       				<td>
       					<select name="cate">
       						<option value="">분류</option>
       						<option value="10">서울시통계</option>
       						<option value="20">전국통계</option>
       					</select>
       				</td>
       			</tr>
       			<tr>
       				<th>파일첨부<span class="rte">*</span></th>
       				<td>
       					<input type="file" name="statspic" />
       				</td>
       			</tr>
       			<tr>
       				<th>설명</th>
       				<td>
       					<textarea name="cont" id="contents" ></textarea>
       				</td>
       			</tr>
       		</table>
       		<input type="submit" value="글쓰기" />
       </form>
    </div> <!-- container E -->
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>