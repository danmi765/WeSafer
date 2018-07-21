<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<script type="text/javascript">
<%if(request.getAttribute("fbuser") != null){%>
	alert("페이스북 로그인이 성공적으로 완료되었습니다~ \n회원정보를 수정해주세요!! ");
	location.href='modi.do';
<%}%>

	/* 페이스북 페이지 리스트 시작 */
var accessToken = "CAAOMJKxCUBcBADFdCdKdrv4CeZCK51GILCcOYBCZBQIv9vH494r7XUkNbDtZAuY0LEaAzVu2ZBQCEdcpKu4o509ACIq0sJggfiXiJMwpttknyzeHhaNZAbZAPwym7AMtTkY77wjpIWu7Tg4LtLoYDm8wQFPG5dqeCUBxcHIUWLNIcw5RD8NLmlmJiEuRRF2yKXAQmjFc3s0gZDZD";
window.fbAsyncInit = function() {
    FB.init({
        appId   : '998514066870295',
        xfbml   : true,
        version : 'v2.5'
    });
    write(1);// 초기화 완료후 최신글을 쓴다.
};

(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
// Initalizing...
function write(i) { // 글 입력.
      FB.api(
          '/256787707994303/',
          'GET',
          {   "access_token" : accessToken,
              "fields":"feed{picture,message,created_time}"},
              function(response) {
                var Data = response.feed.data;
                var arr = null;
                cls(); // clear everything
                for (var j = 0; j < 4; j++) {// Start writing
                  if (4*i!=j*i) {
                    if (Data[4*(i-1)+j].picture != undefined) {
                        document.getElementById("pic"+j).src = Data[4*(i-1)+j].picture;
                        document.getElementById("post"+j).innerHTML = Data[4*(i-1)+j].message;
                        arr = (Data[4*(i-1)+j].id).split("_");
                        ref(i, j, arr, Data);
                    } else if (Data[4*(i-1)+j].message != undefined) {
                        document.getElementById("post"+j).src = Data[9*(i-1)+j].message;
                        ref(i, j, arr, Data);
                      } else {
                        console.log("어떠한 사진과 글도 없습니다. Post가 없음으로 종료 합니다.\nShutting Down...");
                        break;
                      }
                    } else { // 9*i == j*i
                      break;
                   }
                }// END
        });
    }// Generate Pages

  function cls() { // clear everything. post와 pic에 있는 값들을 비움.
      for (var i = 0; i < 4; i++) {
  			document.getElementById('post'+i).innerHTML = "";
  			document.getElementById('pic'+i).src = "";
  		}
  }

  function ref(i, j, arr, Data) {// 본문으로 link
		arr = (Data[4*(i-1)+j].id).split("_");
		console.log("http://www.facebook.com/groups/%s/permalink/%s", arr[0], arr[1]);
		if(document.getElementById('ref'+j) != null){// tag exist?
			document.getElementById('ref'+j).href = "http://www.facebook.com/groups/"+arr[0]+"/permalink/"+arr[1];
			document.getElementById('ref'+j).innerHTML = "본문 보기";
		}
	}
</script>
<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=33300d28b6e32492c5975b99584cdd81"></script>
<title>WeSafer</title>
</head>
<body>
	<c:if test="${message == 'FaceBooKLoginUser' }">
		<script>
			alert("페이스북 로그인이 성공적으로 완료되었습니다. \n 회원정보를 수정해 주세요!");
			location.href='modi.do';
		</script>
	</c:if>
	
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/index_gnb.jsp"></jsp:include>
	<div id="container">
        <ul class="bb1">
            <li> 
                <div class="bb1a">
                    <a href="#">
                        <!--<img src="img/bb1a.jpg" alt="" />-->
                        <div class="bb1a_icon" style="wisth:334px;height:205px;"><!--<img src="img/bb1a_icon.png" alt="" />--></div>
                        <div class="bb1a_tit">관련정보</div>
                        <div class="bb1a_con">범죄관련 정보입니다.</div>
                    </a>
                </div>
            </li>
            <li>
                <div class="bb1b">
                    <!--<img src="img/bb1b.jpg" alt="" />-->
                    <ul class="bb1b_con">
                        <li><a href="info_list.do?part1=info&page=1">범죄분류</a></li>
                        <li><a href="info_list.do?part1=handle&page=1">대처방법</a></li>
                        <li><a href="info_list.do?part1=treat&page=1">예방교육</a></li>
                    </ul>
                    <div class="bb1b_tit">관련정보</div>
                    <div class="bb1b_more"><a href="info_list.do?part1=info&page=1">더보기</a></div>
                </div>
            </li>
        </ul>
        
         <ul class="bb2">
            <li> 
                <div class="bb2a">
                    <!--<img src="img/bb2.jpg" alt="" />-->
                        <div class="bb2a_tit">뉴스검색</div>
                        <div class="bb2a_con">
                            <form method="get" name="frm" action="newsList.do">
                                <input type="text" name="scVal" style="width:255px;height:30px;" />
                                <input type="submit" value="" onclick="return nsCheck()"/>
                            </form>
                            <p>&#35;구로구&nbsp;&nbsp;&#35;살인&nbsp;&nbsp;&#35;강도</p>
                        </div>
                </div>
            </li>
        </ul>
        
       <ul class="bb3">
            <li> 
                <div class="bb3a">
                	<p id="bb3a_title"></p>
               		<div id="index_map" style="width:335px;height:395px;border:none;"></div>
                    <!-- <a href="map.do?cate=0">
                        <div class="bb3a_tit">지역검색</div>
                        <div class="bb3a_con">
				                            지역별 범죄 통계자료<br>
				                            및 안전지역을 한눈에 <br>
				                            볼 수 있습니다.
                        </div>
                    </a> -->
                </div>
            </li>
            <!-- <li>
                <div class="bb3b">
                	<a href="map.do?cate=0">
                   		<img src="img/bb3b.jpg" alt="" />
                    </a>
                </div>
            </li> -->
        </ul>
       <!-- <p>&nbsp;</p>-->
        <ul class="bb4">
            <li> 
                <div class="bb4a" style="overflow:hidden;">
                     	<div>
					      	<img src="" alt="" id="pic0" />
					      	<div id="post0">내용</div>
					      	<a href="" id="ref0" target="_blank">본문 보기.</a>
					    </div>
					    <div>
						      <img src="" alt="" id="pic1" />
						      <div id="post1">내용</div>
						      <a href="" id="ref1" target="_blank">본문 보기.</a>
					    </div>
					    <div>
						      <img src="" alt="" id="pic2" />
						      <div id="post2">내용</div>
						      <a href="" id="ref2" target="_blank">본문 보기.</a>
					    </div>
					    <div>
						      <img src="" alt="" id="pic3" />
						      <div id="post3">내용</div>
						      <a href="" id="ref3" target="_blank">본문 보기.</a>
					    </div>
            
                    <!--<a href="#">
                        <img src="img/bb4.jpg" alt="" />
                        <div class="bb3a_tit">지역검색</div>
                        <div class="bb3a_con">Contents</div>
                    </a>-->
                </div>
            </li>
        </ul>
        
        <ul class="bb5">
            <li> 
                <div class="bb5a">
                    <a href="#">
                        <!--<img src="img/bb5.jpg" alt="" />-->
                        <div class="bb5a_tit">분석통계</div>
                        <div class="bb5a_con"><img src="img/bb5a_icon.png" alt="" /></div>
                    </a>
                </div>
            </li>
            <li>
                <div class="bb5b">
                    <!--<img src="img/bb5b.jpg" alt="" />-->
                    <div class="bb5b_tit">분석통계</div>
                    <div class="bb5b_more"><a href="wholestats.do">더보기</a></div> 
                    <ul class="bb5b_con">
                        <li><a href="typegra.do">유형별</a></li>
                        <li><a href="wholestats.do">지역별</a></li>
                    </ul>
                </div>
            </li>
        </ul>
        
        <ul class="bb6">
            <li> 
                <div class="bb6a">
                    <a href="#">
                       <!-- <img src="img/bb6a.jpg" alt="" />-->
                        <div class="bb6a_tit">커뮤니티</div>
                        <div class="bb6a_con">커뮤니티 공간입니다.</div>
                    </a>
                </div>
            </li>
            <li>
                <div class="bb6b">
                    <ul class="bb6b_con">
                        <li><a href="comm_list.do?part1=comm&part2=notice">공지사항</a></li>
                        <li><a href="comm_list.do?part1=comm&part2=free">자유게시판</a></li>
                        <li><a href="facebookpage.do">페이스북</a></li>
                    </ul>
                </div>
            </li>
        </ul>
        
       
    </div> <!-- container E -->
	 <div class="front_notice">
        <div class="noticeInner">
            <div class="notice_title">공지사항</div>
            <div class="notice_cont">
                <a href="comm_view.do?part1=comm&part2=notice&idx=${rs.idx }">${rs.tit }</a>
                <p class="f_not_more"><a href="comm_list.do?part1=comm&part2=notice">더보기</a><p>
            </div>
        </div>
    </div>
    <div class="site">
        <div class="siteInner">
            <div class="site_title">관련사이트</div>
            <div class="site_cont">
            	<ul>
            		<li>
            			<a href="#"><img src="img/auth/1s.jpg" /></a>
            		</li>
            		<li>
            			<a href="#"><img src="img/auth/2s.jpg" /></a>
            		</li>
            		<li>
            			<a href="#"><img src="img/auth/3s.jpg" /></a>
            		</li>
            		<li>
            			<a href="#"><img src="img/auth/4s.jpg" /></a>
            		</li>
            		<li>
            			<a href="#"><img src="img/auth/5s.jpg" /></a>
            		</li>
            		<li>
            			<a href="#"><img src="img/auth/6s.jpg" /></a>
            		</li>
            		<li>
            			<a href="#"><img src="img/auth/7s.jpg" /></a>
            		</li>
            		<li>
            			<a href="#"><img src="img/auth/8s.jpg" /></a>
            		</li>
            		<li>
            			<a href="#"><img src="img/auth/9s.jpg" /></a>
            		</li>
            	</ul>
            </div>
        </div>
    </div>
   
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/index_js.jsp"></jsp:include>
   
  
    
