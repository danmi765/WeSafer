<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>페이스북 페이지 : 커뮤니티 : WeSafer</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sub_gnb.jsp"></jsp:include>

<script>
var accessToken = "CAAOMJKxCUBcBADFdCdKdrv4CeZCK51GILCcOYBCZBQIv9vH494r7XUkNbDtZAuY0LEaAzVu2ZBQCEdcpKu4o509ACIq0sJggfiXiJMwpttknyzeHhaNZAbZAPwym7AMtTkY77wjpIWu7Tg4LtLoYDm8wQFPG5dqeCUBxcHIUWLNIcw5RD8NLmlmJiEuRRF2yKXAQmjFc3s0gZDZD";
window.fbAsyncInit = function() {
  FB.init({
    appId   : '998514066870295',
    xfbml   : true,
    version : 'v2.5'
  });
  write(1);
};

(function(d, s, id){
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
// Initalizing...

  function write(i) {
    FB.api(
      '/256787707994303/',
      'GET',
      {   "access_token" : accessToken,
          "fields":"feed{picture,message,created_time}"}, // 'fields' and 'access_token'
      function(response) {

        var Data = response.feed.data;
        var arr = null;
        console.log("Data length: %s", Data.length);
        clearElements();
        createPageN(Data.length);

        for (var j = 0; j < 9; j++) {// Start writing
          if (9*i!=j*i) {
              if(Data[9*(i-1)+j].picture != undefined)// if picture exist
                document.getElementById("pic"+j).src = Data[9*(i-1)+j].picture;

              if(Data[9*(i-1)+j].message != undefined)// if message exist
                document.getElementById("post"+j).innerHTML = Data[9*(i-1)+j].message;

              arr = Data[9*(i-1)+j].id.split("_");
              ref(i, j, arr, Data);
          } else { // 9*i == j*i
            break;
          }
        }
      }); // 'FB.api()' End
  }

  function ref(i, j, arr, Data) { // 본문
    arr = (Data[9*(i-1)+j].id).split("_");
    console.log("http://www.facebook.com/groups/%s/permalink/%s", arr[0], arr[1]);
      document.getElementById('ref'+j).href = "http://www.facebook.com/groups/"+arr[0]+"/permalink/"+arr[1];
      document.getElementById('ref'+j).innerHTML = "본문 보기";
  }

  function cls() { // clear everything
    for (var i = 0; i < 9; i++) {
      document.getElementById('post'+i).innerHTML = "";
      document.getElementById('pic'+i).src = "";
      document.getElementById('ref'+i).innerHTML = "";
    }
  }

  function proc(pn, att, t, i) { // Add Elements
    pn = document.createElement("b");
    att = document.createAttribute("onclick");
    att1 = document.createAttribute("id");
    att.value = "exe("+(i+1)+")";
    att1.value = i+1;
    t = document.createTextNode(i+1);

    pn.setAttributeNode(att); // Set Attribute
    pn.setAttributeNode(att1);
    pn.appendChild(t); // Set text
    document.getElementById('pages').appendChild(pn);// insert 'pn' tag in <div>
    }

    function createPageN(obN) { // make page numbers and links that numbers to trigger 'exe()' function
      //  'obN' : number of objects
      var pn = null;
      var att = null;
      var t = null;

      if (obN/9 == parseInt(obN/9)) {
        for (var i = 0; i < obN/9; i++) {
          proc(pn, att, t, i);
        }
      } else if(obN==0){
        proc(pn, att, t, 0);
      } else {
        for (var i = 0; i < parseInt(obN/9)+1; i++) {
          proc(pn, att, t, i);
        }
      }
    }

    function exe(i){ // execute 'cls()' and 'write()' functions
      cls();
      write(i);
    }

    function clearElements() { // 주의! 이것은 실험중에 있습니다. remove all elemets in <div> tag.
      var list = document.getElementById('pages');
      console.log(list.childNodes);

      while (list.hasChildNodes()) {
        list.removeChild(list.childNodes[0]);
      }
    }
  </script>

	<div id="subGnb" class="comm">
			<jsp:include page="/WEB-INF/views/top/top_menu_comm.jsp"></jsp:include>
    </div><!-- subGnb E -->
    
    <h3 class="pagetitle">페이스북 페이지</h3>
    
    <div id="container"><!-- container S -->
    	<div class="fbpage_inner">
    		<div class="fbline">
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
	    	</div>
	    	<div class="fbline">
	    		<div>
	    			<img src="" alt="" id="pic3" />
	    			<div id="post3">내용</div>
            		<a href="" id="ref3" target="_blank">본문 보기.</a>
	    		</div>
	    		<div>
	    			<img src="" alt="" id="pic4" />
	    			<div id="post4">내용</div>
            		<a href="" id="ref4" target="_blank">본문 보기.</a>
	    		</div>
	    		<div>
	    			<img src="" alt="" id="pic5" />
	    			<div id="post5">내용</div>
            		<a href="" id="ref5" target="_blank">본문 보기.</a>
	    		</div>
	    	</div>
	    	<div class="fbline">
	    		<div>
	    			<img src="" alt="" id="pic6" />
	    			<div id="post6">내용</div>
           			<a href="" id="ref6" target="_blank">본문 보기.</a>
	    		</div>
	    		<div>
	    			<img src="" alt="" id="pic7" />
	    			<div id="post7">내용</div>
          			<a href="" id="ref7" target="_blank">본문 보기.</a>
	    		</div>
	    		<div>
	    			<img src="" alt="" id="pic8" />
	    			<div id="post8">내용</div>
           			<a href="" id="ref8" target="_blank">본문 보기.</a>
	    		</div>
	    	</div>
    	</div>
    	<div id="pages">

    	</div>
    </div> <!-- container E -->
    
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>