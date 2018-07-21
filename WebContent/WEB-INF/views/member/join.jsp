<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>회원가입 : WeSafer</title>
    <script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
</head>
<body style="background:#f5f1f1;">
	
		<jsp:include page="/WEB-INF/views/lnb.jsp"></jsp:include>
    
    <h1 class="join_h">
		<a href="index.do">WeSafer</a>
	</h1>
	    
	    
	<form action="join.do" method="post" id="join_frm" name="join_frm">
		<table>
			<tr>
				<td>
					<input type="text" name="userid" id="userid" placeholder="아이디" maxlength="12" />
					<input type="hidden" name="redi" />
					<input type="button" value="중복체크" id="id_check" onclick="idCheck()" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="psw" id="psw" placeholder="비밀번호" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="psw_check" id="psw_check" placeholder="비밀번호 확인" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="nick" id="nick" placeholder="닉네임" maxlength="6" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="name" id="name" placeholder="이름" maxlength="7" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="birth" id="birth" placeholder="생년월일 (예:910926)" maxlength="6" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="phone" id="phone" placeholder="핸드폰 ('-'없이 입력하세요.)" maxlength="12" /><!-- 
					<label for="phone_agree">문자 수신동의</label>
					<input type="checkbox" name="" id="phone_agree" /> -->
				</td>
			</tr>
			<tr>
				<td>
					<input type="email" value="" name="email" id="email" placeholder="이메일" /><!-- 
					<label for="email_agree">이메일 수신동의</label>
					<input type="checkbox" name="" id="email_agree" /> -->
				</td>
			</tr>
			<tr>
				<td id="ca1_c">
					<select name="loc" id="ca1-1">
						<option value="">거주지 선택</option>
						<option value="영등포구" data-target="#ca2-1">영등포구</option>
						<option value="구로구"   data-target="#ca2-2">구로구</option>
						<option value="금천구"   data-target="#ca2-3">금천구</option>
						<option value="관악구"   data-target="#ca2-4">관악구</option>
					</select>
				</td>
			</tr>
			<tr>
				<td id="ca2_c"></td>
			</tr>
			<tr>
				<td colspan="2" class="jlt">
					<input type="submit" value="가입하기" onclick="return joinCheck()" />
				</td>
			</tr>
		</table>
	</form>
	
	<ul class="lg_f">
    	<li><a href="#" onclick="agreement()">이용약관</a> |</li>
    	<li><a href="#" onclick="personal()"><b>개인정보취급방침</b></a> </li>
    </ul>
    
    <p class="lg_p"><b style="font-size:1.3em;color:#02436e;">WeSafer </b>CopyRight 2016 &copy; All Rights Reserved.</p>
	
	
	

   <script>
   		/* 회원가입 지역입력 드롭박스 */
   		$(function(){
   			
	   		//on함수이용 미리 이벤트처리 
		 	$(document).on("change", "#ca1_c > select",function(){
				//1번셀렉터가 변경되면 2,3번은 초기화
				$("#ca2_c").empty().hide();
				$("#ca3_c").empty().hide();
				
				var target = $(this).find("option:selected").attr("data-target");
				var selector = "http://192.168.0.201:8888/WeSafer/js/loc_data.jsp " + target;
				$("#ca2_c").load(selector, function(){
					$(this).show();
				});
			}); 
   			
   		});//드롭박스 끝
   
   
   
		   /* 회원가입 유효성검사 */
	function joinCheck(){
		   $("#join_frm").validate({
		   	/* debug:true, */
		   	rules:{
		   		name:"required",
		   		userid:{
		   			required:true,
		   			minlength:4
		   		},
		   		psw:{
		   			required:true,
		   			minlength:8,
		   			maxlength:16
		   		},
		   		psw_check:{
		   			required:true,
		   			equalTo:"#psw"
		   		},
		   		nick:{
		   			required:true,
		   			minlength:2
		   		},
		   		birth:{
		   			required:true,
		   			digits:true,
		   			minlength:6,
		   			maxlength:6
		   		},
		   		phone:{
		   			required:true,
		   			digits:true
		   		},
		   		eamil:{
		   			required:true,
		   			email:true
		   		}
		   	}, 
		
		   	 messages:{
		   		name:"이름은 필수 입력 항목입니다.",
		   		userid:{
		   			required:"아이디를 입력해 주세요.",
		   			minlength:"아이디는 최소 {0}글자 입니다."
		   		},
		   		psw:{
		   			required:"비밀번호를 입력해 주세요.",
		   			minlength:"비밀번호는 최소 {0}글자 입니다.",
		   			maxlength:"비밀번호는 최대 {0}글자 입니다."
		   		},
		   		psw_check:{
		   			required:"비밀번호를 한번 더 입력해 주세요.",
		   			equalTo:"비밀번호가 틀립니다."
		   		},
		   		nick:{
		   			required:"별명을 입력해 주세요.",
		   			minlength:"별명은 최소 {0}글자 입니다."
		   		},
		   		birth:{
		   			required:"생년월일을 입력해 주세요.",
		   			digits:"숫자로만 입력해 주세요.",
		   			minlength:"최소 {0}글자 입니다.",
		   			maxlength:"최대 {0}글자 입니다."
		   		},
		   		phone:{
		   			required:"휴대전화 번호를 입력해 주세요.",
		   			digits:"숫자로만 입력해 주세요."
		   		},
		   		eamil:{
		   			required:"이메일을 입력해 주세요.",
		   			email:"이메일 형식에 맞지 않습니다."
		   		}
		   	} 
		 }); 
		   
		   if(document.join_frm.redi.value.length == 0){
			   alert("중복체크를 해주세요!");
			   join_frm.userid.focus();
			   return false;
		   }
			
	}
   </script>