<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

	<!-- <select name="ca1" id="ca1-1">
		<option value="영등포구" data-target="#ca2-1">영등포구</option>
		<option value="구로구" data-target="#ca2-2">구로구</option>
		<option value="금천구" data-target="#ca2-3">금천구</option>
		<option value="관악구" data-target="#ca2-4">관악구</option>
	</select> -->
	
	<select name="loc2" id="ca2-1">
		<option value="" ${mVo.loc eq ""?"selected":n}>선택</option>
		<option value="영등포동" ${mVo.loc2 eq "영등포동"?"selected":n}>영등포동</option>
		<option value="신길동" ${mVo.loc2 eq "신길동"?"selected":n}>신길동</option>
		<option value="양평동" ${mVo.loc2 eq "양평동"?"selected":n}>양평동</option>
		<option value="대림동" ${mVo.loc2 eq "대림동"?"selected":n}>대림동</option>
		<option value="도림동" ${mVo.loc2 eq "도림동"?"selected":n}>도림동</option>
		<option value="문래동" ${mVo.loc2 eq "문래동"?"selected":n}>문래동</option>
		<option value="당산동" ${mVo.loc2 eq "당산동"?"selected":n}>당산동</option>
	</select>

	<select name="loc2" id="ca2-2">
		<option value="" ${mVo.loc eq ""?"selected":n}>선택</option>
		<option value="오류1동" ${mVo.loc2 eq "오류1동"?"selected":n}>오류1동</option>
		<option value="오류2동" ${mVo.loc2 eq "오류2동"?"selected":n}>오류2동</option>
		<option value="개봉1동" ${mVo.loc2 eq "개봉1동"?"selected":n}>개봉1동</option>
		<option value="개봉2동" ${mVo.loc2 eq "개봉2동"?"selected":n}>개봉2동</option>
		<option value="개봉3동" ${mVo.loc2 eq "개봉3동"?"selected":n}>개봉3동</option>
		<option value="고척1동" ${mVo.loc2 eq "고척1동"?"selected":n}>고청1동</option>
		<option value="고척2동" ${mVo.loc2 eq "고척2동"?"selected":n}>고청2동</option>
		<option value="온수동" ${mVo.loc2 eq "온수동"?"selected":n}>온수동</option>
		<option value="궁동" ${mVo.loc2 eq "궁동"?"selected":n}>궁동</option>
		<option value="수궁동" ${mVo.loc2 eq "수궁동"?"selected":n}>수궁동</option>
		<option value="항동" ${mVo.loc2 eq "항동"?"selected":n}>항동</option>
		<option value="천왕동" ${mVo.loc2 eq "천왕동"?"selected":n}>천왕동</option>
	</select>
	
	<select name="loc2" id="ca2-3">
		<option value="" ${mVo.loc eq ""?"selected":n}>선택</option>
		<option value="가산동" ${mVo.loc2 eq "가산동"?"selected":n}>가산동</option>
		<option value="독산동1동" ${mVo.loc2 eq "독산동1동"?"selected":n}>독산동1동</option>
		<option value="독산2동" ${mVo.loc2 eq "독산2동"?"selected":n}>독산2동</option>
		<option value="독산3동" ${mVo.loc2 eq "독산3동"?"selected":n}>독산3동</option>
		<option value="독산4동" ${mVo.loc2 eq "독산4동"?"selected":n}>독산4동</option>
		<option value="시흥1동" ${mVo.loc2 eq "시흥1동"?"selected":n}>시흥1동</option>
		<option value="시흥2동" ${mVo.loc2 eq "시흥2동"?"selected":n}>시흥2동</option>
		<option value="시흥3동" ${mVo.loc2 eq "시흥3동"?"selected":n}>시흥3동</option>
		<option value="시흥4동" ${mVo.loc2 eq "시흥4동"?"selected":n}>시흥4동</option>
		<option value="시흥5동" ${mVo.loc2 eq "시흥5동"?"selected":n}>시흥5동</option>
	</select>
	
	<select name="loc2" id="ca2-4">
		<option value="" ${mVo.loc eq ""?"selected":n}>선택</option>
		<option value="난곡동" ${mVo.loc2 eq "난곡동"?"selected":n}>난곡동</option>
		<option value="난향동" ${mVo.loc2 eq "난향동"?"selected":n}>난향동</option>
		<option value="남현동" ${mVo.loc2 eq "남현동"?"selected":n}>남현동</option>
		<option value="대학동" ${mVo.loc2 eq "대학동"?"selected":n}>대학동</option>
		<option value="미성동" ${mVo.loc2 eq "미성동"?"selected":n}>미성동</option>
		<option value="보라매동" ${mVo.loc2 eq "보라매동"?"selected":n}>보라매동</option>
		<option value="봉천동" ${mVo.loc2 eq "봉천동"?"selected":n}>봉천동</option>
		<option value="삼성동" ${mVo.loc2 eq "삼성동"?"selected":n}>삼성동</option>
		<option value="서원동" ${mVo.loc2 eq "서원동"?"selected":n}>서원동</option>
		<option value="서림동" ${mVo.loc2 eq "서림동"?"selected":n}>서림동</option>
		<option value="성현동" ${mVo.loc2 eq "성현동"?"selected":n}>성현동</option>
		<option value="신원동" ${mVo.loc2 eq "신원동"?"selected":n}>수궁동</option>
		<option value="신사동" ${mVo.loc2 eq "신사동"?"selected":n}>신원동</option>
		<option value="신림동" ${mVo.loc2 eq "신림동"?"selected":n}>신림동</option>
		<option value="은천동" ${mVo.loc2 eq "은천동"?"selected":n}>은천동</option>
		<option value="인헌동" ${mVo.loc2 eq "인헌동"?"selected":n}>인헌동</option>
		<option value="조원동" ${mVo.loc2 eq "조원동"?"selected":n}>조원동</option>
		<option value="중앙동" ${mVo.loc2 eq "중앙동"?"selected":n}>중앙동</option>
		<option value="청룡동" ${mVo.loc2 eq "청룡동"?"selected":n}>청룡동</option>
		<option value="행운동" ${mVo.loc2 eq "행운동"?"selected":n}>행운동</option>
	</select>
	
	

</body>
</html>