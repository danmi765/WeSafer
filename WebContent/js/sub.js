/* 뉴스검색 체크박스 */
 $(".drad a").click(function(){
	   if($(this).attr("class") == ""){
		   $(this).addClass("checkbox_selected");
		   $(this).siblings().attr("checked",true);
	   }else{
		   $(this).removeClass("checkbox_selected");
		   $(this).siblings().attr("checked",false);
	   }	   
	   return false;
});
 
 /*기간 체크박스(라디오버튼처럼)*/
 $(".ddat a").click(function(){
	 $(this).addClass("checkbox_selected");
	 $(this).siblings().attr("checked",true);
	 
	 $(this).parent().siblings().find("a").removeClass("checkbox_selected");
	 $(this).parent().siblings().find("input").attr("checked",false);
	 return false;
 });

 
 /* 뉴스 검색, 초기화 버튼*/
 $(".news_btn input[type='button']").hover(function(){
	 $(this).css({"background-image":"url(img/news_btn_resetOv.png)"});
 },function(){
	 $(this).css({"background-image":"url(img/news_btn_reset.png)"});
});
 
 $(".news_btn input[type='submit']").css({"background-image":"url(img/news_btn_submit.png)"});
 
 $(".news_btn input[type='submit']").hover(function(){
	 $(this).css({"background-image":"url(img/news_btn_submitOv.png)"});
 },function(){
	 $(this).css({"background-image":"url(img/news_btn_submit.png)"});
});
 

 /*뉴스 글쓰기 유효성검사*/
 function nWCheck(){
	 if(!$("input[name='ckKey']").is(":checked")){
	       alert("카테고리를 선택하세요.");
	       $("input[name='ckKey']").focus();
	       return false;
	    }else{
	       return true;
//	    	Editor.save();//에디터 적용함수
	    }
 }
	 
 
 
 /* 뉴스 전체버튼 클릭 */
 $("#wk>a").click(function(){
	 $("#am>a, #hy>a").addClass("checkbox_selected");
 }/*,function(){
	 $("#am>a, #hy>a").removeClass("checkbox_selected");
 }*/);
 
/* 글쓰기페이지 글쓰기버튼 */
 $("#write_frm input[type='submit']").hover(function(){
	 $(this).css({"background-image":"url(img/write_btnOv.png)"});
 },function(){
	 $(this).css({"background-image":"url(img/write_btn.png)"});
 });
 
 
 /* 페이지탭 마우스오버시 선택요소 css변경 */
 $(".info_tablnb>ul>li>a").hover(function(){
   	 $(this).addClass("selectedOv");
   	 $(".info_tablnb>ul>li>a").not(this).removeClass("selectedOv");
},function(){
   	 $(".info_tablnb>ul>li>a").removeClass("selectedOv");
});

 
 /* 마이페이지 버튼 마우스오버 */
 $(".mp_btn input").hover(function(){
	 $(this).css({"background-image":"url(img/mybtnOv.png)"});
 },function(){
	 $(this).css({"background-image":"url(img/mybtn.png)"});
 });
 
 /* 회원탈퇴버튼 */
 $("#out_frm>input[type='submit'], #out_frm>input[type='reset']").hover(function(){
	 $(this).css({"background-image":"url(img/outbtnOv.png)"});
 },function(){
	 $(this).css({"background-image":"url(img/outbtn.png)"});
 });

 $(".outmodal").hide(); //모달창 숨김
 
 $(".mp_btn .outbtn").click(function(){
	 $(".outmodal").fadeIn(300); //탈퇴버튼 클릭시 탈퇴박스생성
	 $("body").css({"overflow-y":"hidden"}); //바디스크롤제거
 });
 
 $("#out_frm input[type='reset']").click(function(){
 	$(".outmodal").fadeOut(300);  //취소버튼 누르면 탈퇴박스 숨김
	 $("body").css({"overflow-y":"visible"});//바디스크롤생성
 });
 
 /* 정보수정 취소버튼 */
 $(".modino").click(function(){
	 location.href='mypage.do';
 });
 
 
 /* 아이디찾기 체크박스 클릭시 화면변경 */
/* $(".findid_container a").click(function(){
	   if($(this).attr("class") == ""){
		   $(this).addClass("fiBtn");
	   }else{
		   $(this).removeClass("fiBtn");
	   }	   
	   return false;
 });*/
 
 $(this).parent().stop().animate({"top":"0"},300);
 
 /* 아이디찾기 휴대폰, 이메일 인증 클릭 */
 $("#fi_phone").click(function(){
		$(this).parent().stop().animate({"top":"-190px"},300);
		$(this).addClass("fiBtn");
		$("#fi_email").removeClass("fiBtn");
 });
 
 $("#fi_email").click(function(){
		$("#fi_phone").parent().stop().animate({"top":"0"},300);
		$(this).addClass("fiBtn");
		$("#fi_phone").removeClass("fiBtn");
});
 
 /* 아이디찾기 이메일 인증번호 받기 버튼 클릭 */
 function mailCheck(){
	 var name = document.fi_email.name.value ;
	 var email= document.fi_email.email.value;
	 
	 if(name !=null && email!=null){
		 location.href='sendValidateMail.do?name='+name+'&email='+email;
	 }else{
		 alert("정보를 입력하세요.");
		 return false;
	 }
 }
 
 /* 비밀번호 이메일 인증번호 받기 버튼 클릭*/
 function pwMailCheck(){
	 var name = document.fi_email.name.value ;
	 var email= document.fi_email.email.value;
	 var userid= document.fi_email.userid.value;
	 
	 if(name !=null && email!=null && userid !=null){
		 location.href='sendValidateMailPw.do?name='+name+'&email='+email+'&userid='+userid;
	 }else{
		 alert("정보를 입력하세요.");
		 return false;
	 }
 }
 
 
/* ###### 시작 ######### comm 섹션 스크립스 */


// INFO WRITE  
function info_write_check(frm){
	if(frm.part1.selectedIndex < 1){
		alert("카테고리를 선택하세요");
		frm.part1.focus();
		return false;
	}
 	if(frm.part2.selectedIndex < 1){
		alert("컨텐츠를 선택하세요");
		frm.part2.focus();
		return false;
	}
	if(frm.tit.value.length==0){
		alert("제목을 입력하세요");
		frm.tit.focus();
		return false;
	}
/* 	if(frm.cont.value.length==0){
		alert("내용을 입력하세요");
		frm.cont.focus();
		return false;
	}*/
	Editor.save();//에디터 적용함수
	frm.action.value="info_insert.do";
}


//INFO UPDATE
function info_update_check(frm){
	if(frm.part1.selectedIndex < 1){
		alert("카테고리를 선택하세요");
		frm.part1.focus();
		return false;
	}
 	if(frm.part2.selectedIndex < 1){
		alert("컨텐츠를 선택하세요");
		frm.part2.focus();
		return false;
	}
	if(frm.tit.value.length==0){
		alert("제목을 입력하세요");
		frm.tit.focus();
		return false;
	}
/* 	if(frm.cont.value.length==0){
		alert("내용을 입력하세요");
		frm.cont.focus();
		return false;
	}*/
	Editor.save();//에디터 적용함수
	frm.action.value="info_update.do";
}

//COMM SEARCH
function search_list(frm, part1){
	if(frm.part2.selectedIndex < 1){
		alert("카테고리를 선택하세요");
		frm.part2.focus();
		return false;
	}
 	if(frm.keyword.value.length==0){
		alert("내용을 입력하세요");
		frm.keyword.focus();
		return false;
	}
	frm.action.value = "info_list.do";
}

//INFO DELETE
function info_delete_check(part1, part2, idx, page){
	if(confirm("삭제 하시겠습니까?")){
		location.href="info_delete.do?part1=" +part1+ "&part2=" +part2+ "&idx=" +idx+ "&page=" +page;
	}
}

//COMM WRITE
function comm_write_check(frm){
 	if(frm.tit.value.length==0){
		alert("제목을 입력하세요");
		frm.tit.focus();
		return false;
	}
/* 	if(document.tx_editor_form.cont.value.length==0){
		alert("내용을 입력하세요");
		document.tx_editor_form.cont.focus();
		return false;
	}*/
 	Editor.save();//에디터 적용함수
 	frm.action.value="comm_insert.do";
}

		
// COMM UPDATE
function comm_update_check(frm){
 	if(frm.tit.value.length==0){
		alert("제목을 입력하세요");
		frm.tit.focus();
		return false;
	}
/* 	if(frm.cont.value.length==0){
		alert("내용을 입력하세요");
		frm.cont.focus();
		return false;
	}*/
 	Editor.save()
	frm.action.value="comm_update.do";
}
		
		

//COMM SEARCH
function search_list(frm, part1){
	if(frm.searchCate.selectedIndex < 1){
		alert("카테고리를 선택하세요");
		frm.searchCate.focus();
		return false;
	}
 	if(frm.keyword.value.length==0){
		alert("내용을 입력하세요");
		frm.keyword.focus();
		return false;
	}
	frm.action.value = "comm_list.do";
}

// COMM DELETE
function comm_delete_check(part1, part2, idx, page){
	if(confirm("삭제 하시겠습니까?")){
		location.href="comm_delete.do?part1=" +part1+ "&part2=" +part2+ "&idx=" +idx+ "&page=" +page;
	}
}

/* ###### 종료 ######### comm 섹션 스크립스 */




/* map btn hover */
$(".map_btn>button.map_btn_ti").hover(function(){
	$(this).css({"border":"3px solid #feae2c"});
},function(){
	$(this).css({"border":"none"});
});
$(".map_btn>button.map_btn_news_crim").hover(function(){
	$(this).css({"border":"3px solid #feae2c"});
},function(){
	$(this).css({"border":"none"});
});