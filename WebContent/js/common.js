

/* 메인주메뉴 마우스오버 */
$(".gnb>li>a").eq(0).hover(function(){
    $(this).css({"color":"#9db6ff"});
},function(){
    $(this).css({"color":"#fff"});
});

$(".gnb>li>a").eq(1).hover(function(){
    $(this).css({"color":"#fc9dff"});
},function(){
    $(this).css({"color":"#fff"});
});

$(".gnb>li>a").eq(2).hover(function(){
    $(this).css({"color":"#edff9d"});
},function(){
    $(this).css({"color":"#fff"});
});

$(".gnb>li>a").eq(3).hover(function(){
    $(this).css({"color":"#ffaf9d"});
},function(){
    $(this).css({"color":"#fff"});
});

$(".gnb>li>a").eq(4).hover(function(){
    $(this).css({"color":"#abff9d"});
},function(){
    $(this).css({"color":"#fff"});
});


/* 서브 주메뉴 마우스오버 */
/*$(".sub_gnb>li>a").eq(0).hover(function(){
    $(this).css({"background-image":"url(../img/sub_gnb_bg4.png)"});
},function(){
    $(this).css({"color":"#000","background-image":"none"});
});

$(".sub_gnb>li>a").eq(1).hover(function(){
    $(this).css({"background-image":"url(../img/sub_gnb_bg4.png)"});
},function(){
    $(this).css({"color":"#000","background-image":"none"});
});

$(".sub_gnb>li>a").eq(2).hover(function(){
    $(this).css({"background-image":"url(../img/sub_gnb_bg4.png)"});
},function(){
    $(this).css({"color":"#000","background-image":"none"});
});

$(".sub_gnb>li>a").eq(3).hover(function(){
    $(this).css({"background-image":"url(../img/sub_gnb_bg4.png)"});
},function(){
    $(this).css({"color":"#000","background-image":"none"});
});

$(".sub_gnb>li>a").eq(4).hover(function(){
    $(this).css({"background-image":"url(../img/sub_gnb_bg4.png)"});
},function(){
    $(this).css({"color":"#000","background-image":"none"});
});
*/


/* 로그인 아이디 체크 */
function loginCheck(){
	if(document.login_frm.userid.value.length==0){
		alert("아이디를 입력하세요.");
		document.login_frm.userid.focus();
		return false;
	};
	
	if(document.login_frm.userpw.value.length==0){
		alert("비밀번호를 입력하세요.");
		document.login_frm.userpw.focus();
		return false;
	};
	return true;
}

/* 중복체크 */
function idCheck(){
	if(document.join_frm.userid.value==""){
		alert('아이디를 입력하세요');
		document.join_frm.userid.focus();
		return false;
	}
	
	var titleCheck = document.join_frm.userid.value;
    var languageCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

    if (languageCheck.test(titleCheck)) {
             alert("ID에 한글이 포함되어 있습니다.");
        return false;
    } 
    
    if(!languageCheck.test(titleCheck)){
    	var url="idCheck.do?userid="+titleCheck;
    	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=300");
    }
}


/* 개인정보처리방침 팝업 */

function personal(){
	
	window.open("personal.do", "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=650, height=600");
	return false;
}

/* 이용약관 팝업 */
function agreement(){
	var url = "agreement.do";
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=650, height=600");
	return false;
}
















