<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <title>그래프 : 유형별 분석통계 : WeSafer</title>
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
    
    <h3 class="pagetitle goPt">유형별 분석통계</h3>
    
    <div class="info_tablnb info_tablnb_treat">
    	<ul>
    		<li><a href="typegra.do" class="selected">그래프</a></li>
    		<li><a href="typetable.do">통계자료</a></li>
    	</ul>
    </div>
    
    <div id="container">
    
        	<img src="gochart.do" class="imgchart">

    </div> <!-- container E -->
    
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
