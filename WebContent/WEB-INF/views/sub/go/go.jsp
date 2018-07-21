<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.naming.*,javax.sql.*"%>
<title>전국통계 : 지역별 분석통계 : WeSafer</title>
	<Style>
		.imgchart{margin:30px auto 0; display:block;}
	</Style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
    <div id="subGnb" class="go">
		<jsp:include page="/WEB-INF/views/top/top_menu_go.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle goPt">지역별 분석통계</h3>
    
    <div class="info_tablnb info_tablnb_treat">        
    	<ul>
    		<li><a href="wholestats.do" class="selected">전국통계</a></li>
    		<li><a href="seoul.do">서울시통계</a></li>
    	</ul>
    </div>
    
    <div id="container" class=" go_container">
    	
    	<img src='upload/news/${spic }' alt='전국 통계' />
    	
    	<!-- 관리자에게만 보이는 글쓰기 버튼 -->
    	<%if(session.getAttribute("admin")!=null && session.getAttribute("loginUser")==null){ %>
        <ul class="info_list_btn">
    		<li><a href="gowrite.do">등록</a></li>
    		<li class="revision"><a href="#">수정</a></li>
    		<li class="revision"><a href="#">삭제</a></li>
    	</ul>  
    	<%} %>
    </div> <!-- container E -->
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
