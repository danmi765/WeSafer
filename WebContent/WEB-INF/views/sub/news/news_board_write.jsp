<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<title>기사작성 : 뉴스 : WeSafer</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>

	<div id="subGnb" class="go">
		<jsp:include page="/WEB-INF/views/top/top_menu_news.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle newsPt">기사쓰기</h3>
    
    <div id="container">
       <p class="write_h"><span class="rte">*</span>는 필수항목입니다.</p>
       <form:form modelAttribute="newsWrite" action="/WeSafer/newsWrite.do" method="post" id="write_frm" enctype="multipart/form-data">
       		
       		<table>
       			<tr>
       				<th>카테고리<span class="rte">*</span></th>
       				<td>
       					<input type="radio" name="ckKey" value="1" id="" /><label for="">성범죄</label>
       					<input type="radio" name="ckKey" value="2" id="" /><label for="">강도/절도</label>
       					<input type="radio" name="ckKey" value="3" id="" /><label for="">폭행</label>
       					<input type="radio" name="ckKey" value="4" id="" /><label for="">약물</label>
       					<input type="radio" name="ckKey" value="5" id="" /><label for="">살인</label>
       				</td>
       			</tr>
       			<tr>
       				<th>파일첨부</th>
       				<td>
       					<input type="file" name="opictureurl" />
       				</td>
       			</tr>
       			<tr>
       				<th>링크주소<span class="rte">*</span></th>
       				<td>
       					<input type="text" name="ourl" />
       				</td>
       			</tr>
       			<tr>
       				<th>제목<span class="rte">*</span></th>
       				<td>
       					<input type="text" name="title" id="" />
       				</td>
       			</tr>
       			<tr>
       				<th>내용<span class="rte">*</span></th>
       				<td>
       					<textarea name="cont" id="cont" ></textarea>
       				</td>
       			</tr>
       		</table>
       		<input type="submit" value="글쓰기" onclick="return nWCheck()"/>
       </form:form>
    </div> <!-- container E -->
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>