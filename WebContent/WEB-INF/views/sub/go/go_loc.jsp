<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>Untitled Document</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
    <div id="subGnb" class="go">
		<jsp:include page="/WEB-INF/views/top/top_menu_go.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle goPt">내주변 검색하기</h3>
    
    <div id="container">
        

		<!-- 관리자에게만 보이는 글쓰기 버튼 -->
        <ul class="info_list_btn">
    		<li><a href="#">글쓰기</a></li>
    		<li class="revision"><a href="#">글수정</a></li>
    	</ul>     
    </div> <!-- container E -->
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
