<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>image upload : WeSafer</title> 

<!-- 다음오픈에디터 라이브러리 -->
<link href="${pageContext.request.contextPath}/daumeditor/css/popup.css" rel="stylesheet" type="text/css" charset="utf-8">
<script src="${pageContext.request.contextPath}/daumeditor/js/popup.js" type="text/javascript" charset="utf-8"></script>
 
<!-- jQuery 라이브러리 -->
<script src="http://code.jquery.com/jquery.js" type="text/javascript"></script>

<!-- jquery.form.js - ajaxSubmit() 사용 -->
<script src="${pageContext.request.contextPath}/daumeditor/js/jquery.form.js" type="text/javascript"></script>

 
<script type="text/javascript">
// <![CDATA[
	function done(fileInfo) {
		if (typeof(execAttach) == 'undefined') { //Virtual Function
	        return;
	    }
		
		var _mockdata = {
	        'imageurl': fileInfo.imageurl,
	        'filename': fileInfo.filename,
	        'filesize': fileInfo.filesize,
	        'imagealign': fileInfo.imagealign,
	        'originalurl': fileInfo.originalurl,
	        'thumburl': fileInfo.thumburl
	    };
	    execAttach(_mockdata); //다음오픈에디터에 붙이기
	    closeWindow(); //이미지 팝업 종료
	}

	function initUploader(){
	    var _opener = PopupUtil.getOpener();
	    if (!_opener) {
	        alert('잘못된 경로로 접근하셨습니다.');
	        return;
	    }
	    
	    var _attacher = getAttacher('image', _opener);
	    registerAction(_attacher);
	}
	
	$(document).ready(function (){
        	
		// 등록버튼 클릭 이벤트
		$('.submit a').on('click', function (){
			                 
			    var form = $('#daumeditorForm'); //form id값
			    var fileName = $('.file input[type=file]').val(); //파일명(절대경로명 또는 단일명)
			                 
			    form.ajaxSubmit({
			        type: 'POST',
			        url: '${pageContext.request.contextPath}/daumeditor/singleUploadImageAjax.do',
			        dataType: 'JSON', //리턴되는 데이타 타입
			        beforeSubmit: function(){
			            if(validation(fileName)){//확장자 체크 (jpg, gif, png, bmp)
			                return false;
			            }
			        },
			        success: function(fileInfo){ //fileInfo는 이미지 정보를 리턴하는 객체
			            if(fileInfo.result==-1){ //서버단에서 체크 후 수행됨
			                alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
			                return false;
			            }
			            else if(fileInfo.result==-2){ //서버단에서 체크 후 수행됨
			                alert('파일이 1MB를 초과하였습니다.');
			                return false;
			            }
			            else{
			                done(fileInfo); //첨부한 이미지를 에디터에 적용시키고 팝업창을 종료
			            }
			        }
			    });
			});
		 
		     //<input type="file">태그 기능 구현
		    $('.file input[type=file]').change(function (){
		        var inputObj = $(this).prev().prev(); //두번째 앞 형제(text) 객체
		        var fileLocation = $(this).val(); //파일경로 가져오기
		         
		        inputObj.val(fileLocation.replace('C:\\fakepath\\','')); //몇몇 브라우저는 보안을 이유로 경로가 변경되서 나오므로 대체 후 text에 경로 넣기
		    }); 
		 
		});
	
	//확장자 체크 (서버단에서도 검사함)
	function validation(fileName){
		    var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1; //.뒤부터 확장자
		    var fileNameExtension = fileName.toLowerCase().substring(fileNameExtensionIndex,fileName.length); //확장자 자르기
		     
		    if( !( (fileNameExtension=='jpg') || (fileNameExtension=='gif') || (fileNameExtension=='png') || (fileNameExtension=='bmp') ) ) {
		        alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
		        return true;
		    }
		    else{
		        return false;
		    }
		}

	

// ]]>
</script>
<style>
     
    /* css */
    .header {
        background-image: none;
        background-color: #027dfc;
    }
     
    /* 파일첨부(.file) */
    .file {
        display: inline-block;
        margin-top: 8px;
        overflow: hidden;
    }
     
    .file .file-text {
        display: inline-block;
        padding: 6px 10px 8px 10px;
        border : 1px solid #c7c7c7;
        width: 179px;
        font-size: 14px;
        color: #8a8a8a;
        float: left;
    }
     
    .file .file-text:FOCUS {
        border-color: #54c4e5;
        outline: 0;
        -webkit-box-shadow: inset 0px 1px 1px rgba(0,0,0,0.075), 0px 0px 8px rgba(102,175,233,0.6);
        box-shadow: inset 0px 1px 1px rgba(0,0,0,0.075), 0px 0px 8px rgba(102,175,233,0.6);
    }
     
    .file .file-btn {
        margin-left: 2px;
        padding: 6px 8px 4px 8px;
        height: 20px;
        line-height: 20px;
        font-size: 12px;
        font-weight: bold;
        background-color: #fff;
        border: 1px solid #989898;
        color: #989898;
        cursor: pointer;
        float: left;
    }
     
    .file .file-btn:HOVER {
        background-color: #edfbff;
        border: 1px solid #009bc8;
        color: #009bc8;
    }
     
</style>

</head>
<body onload="initUploader();">
<div class="wrapper">
	<div class="header">
		<h1>사진 첨부</h1>
	</div>	
	<div class="body">
		<dl class="alert">
    <dt> 1MB이하 (JPG,GIF,PNG,BMP)</dt>
    <dd>
        <form id="daumeditorForm" action="" enctype="multipart/form-data" method="post">
         
            <!-- 파일첨부 -->
            <div class="file">
                <input disabled="" class="file-text" type="text">
                <label class="file-btn" for="uploadInputBox">사진첨부</label>
                <input name="Filedata" id="uploadInputBox" style="display: none;" type="file"><!-- 버튼대체용(안보임) -->
            </div>
            <!-- //파일첨부 -->
             
        </form>
    </dd>
</dl>

	</div>
	<div class="footer">
		<!-- <p><a href="#" onclick="closeWindow();" title="닫기" class="close">닫기</a></p> -->
		<ul>
			<li class="submit"><a href="#" title="등록" class="btnlink">등록</a> </li>
			<li class="cancel"><a href="#" onclick="closeWindow();" title="취소" class="btnlink">취소</a></li>
		</ul>
	</div>
</div>
</body>
</html>