<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>사이트맵 : WeSafer</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>

	<div id="subGnb" class="news_sg">
            <ul>
                <li><a href="#">&nbsp;</a></li>
            </ul>
    </div><!-- subGnb E -->
    
	<h3 class="pagetitle myPt">사이트맵</h3>
	
	<div id="container">
        <table class="sitemap_tb">
        	<tr>
        		<th> 정보</th>
        		<th>뉴스</th>
        		<th>분석통계</th>
        	</tr>
        	<tr>
        		<td><a href="info_list.do">- 범죄분류</a></td>
        		<td><a href="news.do">- 조건검색</a></td>
        		<td><a href="typegra.do">- 유형별 분석통계</a></td>
        	</tr>
        	<tr>
        		<td><a href="handle_list.do">- 대처방법</a></td>
        		<td><a href="map.do?cate=0">- 지도검색</a></td>
        		<td><a href="wholestats.do">- 지역별 분석통계</a></td>
        	</tr>
        	<tr>
        		<td><a href="treat_list.do">- 피해예방교육</a></td>
        		<td>&nbsp;</td>
        		<td>&nbsp;</td>
        	</tr>
        	<tr>
        		<td><a href="gosite.do">- 관련사이트</a></td>
        		<td>&nbsp;</td>
        		<td>&nbsp;</td>
        	</tr>
        </table>
        <table class="sitemap_tb sitemap_tb_d">
        	<tr>
        		<th>커뮤니티</th>
        		<th>마이페이지</th>
        	</tr>
        	<tr>
        		<td><a href="comm_list.do?part2=notice">- 공지게시판</a></td>
        		<td><a href="mypage.do">- 마이페이지</a></td>
        	</tr>
        	<tr>
        		<td><a href="comm_list.do?part2=free">- 자유게시판</a></td>
        		<td><a href="#">- 신고센터</a></td>
        	</tr>
        	<tr>
        		<td><a href="facebookpage.do">- SNS페이지</a></td>
        		<td>&nbsp;</td>
        	</tr>
        	<tr>
        		<td>&nbsp;</td>
        		<td>&nbsp;</td>
        	</tr>
        </table>
    </div> <!-- container E -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>