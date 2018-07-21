 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>내주변 지도보기 :: 통계분석 :: WeSafer</title>
</head>
<body>
	<%if(request.getAttribute("nouser") != null){%>
		<script>
			alert("로그인이 필요합니다.");
		</script>
	<%} %>
	<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=33300d28b6e32492c5975b99584cdd81"></script>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>
	
	<div id="subGnb" class="go">
		<jsp:include page="/WEB-INF/views/top/top_menu_news.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle goPt">내주변 지도 검색</h3>
      
    <div id="container">
    	<div id="container_inner">
    		<c:if test="${cate ne '6' }">
	    		<div class="map_loginuser_check">
	    			<c:if test="${loginUser ne null and imlatlng eq null }">
	    				<strong>${loginUser.name }</strong>님의 거주지역<strong> ${loginUser.loc } ${loginUser.loc2 }</strong>의 정보입니다.<br>
	    				<span>아래 버튼을 눌러 정보를 확인하세요.</span>
	    			</c:if>
	    			<c:if test="${loginUser ne null and imlatlng ne null }">
	    				<strong>${imlatlng}</strong>의 정보입니다.<br>
	    				<span>아래 버튼을 눌러 정보를 확인하세요.</span>
	    			</c:if>
	    			<c:if test="${loginUser eq null and imlatlng eq null  }">
	    				<span>아래 버튼을 눌러 정보를 확인하세요.</span>
	    			</c:if>
	    			<c:if test="${loginUser eq null and imlatlng ne null  }">
	    				<strong>${imlatlng}</strong>의 정보입니다.<br>
	    				<span>아래 버튼을 눌러 정보를 확인하세요.</span>
	    			</c:if>
	    		</div>
    		</c:if>
    		<div class="map_btn">
    			<button class="map_btn_ti" onclick="location.href='map.do?cate=0'">전체 뉴스 보기</button> 
    			<button class="map_btn_news_crim" onclick="location.href='map.do?cate=1'">성범죄</button>
    			<button class="map_btn_news_crim" onclick="location.href='map.do?cate=2'">살인</button>
    			<button class="map_btn_news_crim" onclick="location.href='map.do?cate=3'">강도/ 절도</button>
    			<button class="map_btn_news_crim" onclick="location.href='map.do?cate=4'">폭력</button>
    			<button class="map_btn_news_crim" onclick="location.href='map.do?cate=5'">약물</button>
    			<p>지역별 뉴스 정보를 제공합니다. 실제 발생 지역과는 다소 차이가 있을 수 있습니다. 마커를 클릭하면 뉴스를 볼 수 있습니다.</p>
    			<button class="map_btn_ti" onclick="location.href='mapCrim.do'">성범죄자 보기</button> <span>원에 마우스를 올리면 정보를 확인할 수 있습니다.</span>
    		</div>
    		
	    	<!-- 지도영역 -->
	     	<div id="map" style="width:1000px;height:1000px;"></div>
	     	
     	</div>
    </div>
    
    
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
	<% if(request.getAttribute("cate").equals("0")){%>
	<!-- 지도API -->
     	<script>
     	
     	var lat = ${lat} ;
 		var lng = ${lng} ;
			
	     	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	        mapOption = { 
	           // center: new daum.maps.LatLng(37.501126, 126.884608), // 지도의 중심좌표
	            center: new daum.maps.LatLng(lat, lng),
	            level: 5, // 지도의 확대 레벨
	            mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
	        };
		    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		    
			 // 지도 타입 변경 컨트롤을 생성한다
			var mapTypeControl = new daum.maps.MapTypeControl();
		
			// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	
		
			// 지도에 확대 축소 컨트롤을 생성한다
			var zoomControl = new daum.maps.ZoomControl();
		
			// 지도의 우측에 확대 축소 컨트롤을 추가한다
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			
			
			
	 	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
			var positions = [
				${positionString}
			];
	 		
	 	
	 		//url 배열 생성
			 var url=[];
	 		 
			 for(var j=0;j<positions.length;j++){
				url[j] = positions[j].ourl;
			}
	 		
				for (var i = 0; i < positions.length; i ++) {
				    // 마커를 생성합니다
				    var marker = new daum.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커의 위치
				        clickable: true
			   		 });				    	
			        
					 // 마커에 표시할 인포윈도우를 생성합니다 
				    var infowindow = new daum.maps.InfoWindow({
				        content: positions[i].content // 인포윈도우에 표시할 내용
				    });
					 
					function inner(i){
						window.open(url[i], "_blank", "toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes, width=800px, height=800px");
					}
				    
					// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
				    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				    daum.maps.event.addListener(marker, 'click', makeClickListener(i));
			    };//for E 
			    
				 // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			    function makeOverListener(map, marker, infowindow) {
			        return function() {
			            infowindow.open(map, marker);
			        };
			    }

			    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			    function makeOutListener(infowindow) {
			        return function() {
			            infowindow.close();
			        };
			    }
			    
			    function makeClickListener(i){
			    	return function(){
			    		inner(i);
			    	}
			    }
			    
     	</script> 
     <%} 
	
	if(request.getAttribute("cate").equals("6")){%>
     
     	<script>
     	/* 성범죄자 정보보기 지도 */
     	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	   		mapOption = { 
	        center: new daum.maps.LatLng(37.495534, 126.884615), // 지도의 중심좌표
	        level: 7,
	        draggable :false,
	        scrollwheel :false,
	        disableDoubleClick :false,
	        disableDoubleClickZoom :true,
	        keyboardShortcuts :false,
	        clickable:true
	    };  

		 var map = new daum.maps.Map(mapContainer, mapOption),
			infowindow = new daum.maps.InfoWindow({removable: true}); // 지도를 생성합니다
		/*
		 // 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new daum.maps.MapTypeControl();
	
		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	
	
		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new daum.maps.ZoomControl();
	
		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT); */
		
		
		// 지도에 표시할 원을 생성합니다
		var circles = [
			{circle: new daum.maps.Circle({//구로동
					    center : new daum.maps.LatLng(37.495534, 126.884615),  // 원의 중심좌표 입니다 
					    radius: 1800, // 미터 단위의 원의 반지름입니다 
					    strokeWeight: 5, // 선의 두께입니다 
					    strokeColor: '#75B8FA', // 선의 색깔입니다
					    strokeOpacity: 0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'solid', // 선의 스타일 입니다
					    fillColor: '#CFE7FF', // 채우기 색깔입니다
					    fillOpacity: 0.7  // 채우기 불투명도 입니다   
						})
			},
			{circle: new daum.maps.Circle({//고척동
					    center : new daum.maps.LatLng(37.503786, 126.858853),  // 원의 중심좌표 입니다 
					    radius: 1000, // 미터 단위의 원의 반지름입니다 
					    strokeWeight: 5, // 선의 두께입니다 
					    strokeColor: '#75B8FA', // 선의 색깔입니다
					    strokeOpacity: 0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'solid', // 선의 스타일 입니다
					    fillColor: '#ffff99', // 채우기 색깔입니다
					    fillOpacity: 0.7  // 채우기 불투명도 입니다   
						})
			},
			{circle: new daum.maps.Circle({//궁동
					    center : new daum.maps.LatLng(37.499769, 126.828711),  // 원의 중심좌표 입니다 
					    radius: 1000, // 미터 단위의 원의 반지름입니다 
					    strokeWeight: 5, // 선의 두께입니다 
					    strokeColor: '#75B8FA', // 선의 색깔입니다
					    strokeOpacity: 0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'solid', // 선의 스타일 입니다
					    fillColor: '#9999ff', // 채우기 색깔입니다
					    fillOpacity: 0.7  // 채우기 불투명도 입니다   
						})
			},
			{circle: new daum.maps.Circle({//가리봉동
					    center : new daum.maps.LatLng(37.483231, 126.887542),  // 원의 중심좌표 입니다 
					    radius: 500, // 미터 단위의 원의 반지름입니다 
					    strokeWeight: 5, // 선의 두께입니다 
					    strokeColor: '#75B8FA', // 선의 색깔입니다
					    strokeOpacity: 0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'solid', // 선의 스타일 입니다
					    fillColor: '#ff0000', // 채우기 색깔입니다
					    fillOpacity: 0.3  // 채우기 불투명도 입니다   
						})
			},
			{circle: new daum.maps.Circle({//개봉동
					    center : new daum.maps.LatLng(37.486618, 126.846172),  // 원의 중심좌표 입니다 
					    radius: 1000, // 미터 단위의 원의 반지름입니다 
					    strokeWeight: 5, // 선의 두께입니다 
					    strokeColor: '#75B8FA', // 선의 색깔입니다
					    strokeOpacity: 0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'solid', // 선의 스타일 입니다
					    fillColor: '#00ff00', // 채우기 색깔입니다
					    fillOpacity: 0.3  // 채우기 불투명도 입니다   
						})
			},
			{circle: new daum.maps.Circle({//신도림동
					    center : new daum.maps.LatLng(37.508957, 126.882232),  // 원의 중심좌표 입니다 
					    radius: 1000, // 미터 단위의 원의 반지름입니다 
					    strokeWeight: 5, // 선의 두께입니다 
					    strokeColor: '#75B8FA', // 선의 색깔입니다
					    strokeOpacity: 0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'solid', // 선의 스타일 입니다
					    fillColor: '#ffaaff', // 채우기 색깔입니다
					    fillOpacity: 0.7  // 채우기 불투명도 입니다   
						})
			},
			{circle: new daum.maps.Circle({//신길동
					    center : new daum.maps.LatLng(37.506061, 126.913018),  // 원의 중심좌표 입니다 
					    radius: 800, // 미터 단위의 원의 반지름입니다 
					    strokeWeight: 5, // 선의 두께입니다 
					    strokeColor: '#75B8FA', // 선의 색깔입니다
					    strokeOpacity: 0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'solid', // 선의 스타일 입니다
					    fillColor: '#feae2c', // 채우기 색깔입니다
					    fillOpacity: 0.7  // 채우기 불투명도 입니다   
						})
			}]; 
		
			var crim = [
			             {
			            	 content:'<div class ="label">12</div>',
			            	 position:new daum.maps.LatLng(37.495534, 126.884615)
			             },
			             {
			            	 content:'<div class ="label">4</div>',
			            	 position:new daum.maps.LatLng(37.503786, 126.858853)
			             },
			             {
			            	 content:'<div class ="label">2</div>',
			            	 position:new daum.maps.LatLng(37.499769, 126.828711)
			             },
			             {
			            	 content:'<div class ="label">7</div>',
			            	 position:new daum.maps.LatLng(37.483231, 126.887542)
			             },
			             {
			            	 content:'<div class ="label">6</div>',
			            	 position:new daum.maps.LatLng(37.486618, 126.846172)
			             },
			             {
			            	 content:'<div class ="label">2</div>',
			            	 position:new daum.maps.LatLng(37.508957, 126.882232)
			             },
			             {
			            	 content:'<div class ="label">1</div>',
			            	 position:new daum.maps.LatLng(37.506061, 126.913018)
			             }
			            ];
		
		

	    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
	    for(var i=0;i<circles.length;i++){

			// 지도에 원을 표시합니다 
			circles[i].circle.setMap(map); 
	    		
	    			function inner(i){
				        var contents=[${contentsString}];
			
						        infowindow.setContent(contents[i].content); 
						        infowindow.setPosition(0); 
						        infowindow.setMap(map);
			    			}//inner E
			    			
    			 // 커스텀 오버레이를 생성합니다
    			 var customOverlay = new daum.maps.CustomOverlay({
    			     position: crim[i].position,
    			     content: crim[i].content   
    			 });
			    			
    			// 커스텀 오버레이를 지도에 표시합니다
    			 customOverlay.setMap(map); 
			    			
			    daum.maps.event.addListener(circles[i].circle, 'mouseover', makeClickListener(i));
	    }//for E


	    function makeClickListener(i){
	    	return function(){
	    		inner(i);
	    	}
	    }
	    </script>
     
     <%}%>
     