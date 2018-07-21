select * from news where title like '%성%' order by odate desc;
select * from news where title like '%성%' or cont like '%성%' and cate in(1,3) and odate > (sysdate - 30) order by odate desc;
select * from news where title like '%구로%' or cont like '%구로%' and cate in(3) and odate >= (sysdate - 365) order by odate desc;
------------------------
select count(*) from news;

select * from news where title like '%여%' or cont like '%여%' and odate >= (sysdate - 7) order by odate desc;

select * from 
(select * from 
(select * from news 
where title like '%여%' or cont like '%여%' order by odate desc
) where rownum <= ? order by rownum
) where rownum <= ? order by rownum;


select * from 
(select o.*, ceil(rownum/10) page from 
(select * from news where title like '%여%' or cont like '%여%' order by odate desc) o
WHERE 1=1 AND cate in(3,5) and odate >=(sysdate -365)) where page=1;



select * from (
select * from 
	(select rownum as rnum, o.* from 
	(select cate, title, cont, ourl, odate, opictureurl from news 
		where title like '%여%' or cont like '%여%' order by odate desc
	)o 
	) where  rnum <=4
)where rnum >=2

select * from (
select * from 
	(select rownum as rnum, o.* from 
	(select cate, title, cont, ourl, odate, opictureurl from news 
		where title like '%여%' or cont like '%여%' and odate >= (sysdate - 7) order by odate desc 
	)o
	) where rnum <=4
)where rnum >=2; 


select s.* from 
(select * from news where title like '%여%' or cont like '%여%') s where  s.odate >= (sysdate - 30) order by s.odate desc;
select rownum, o.* from 
(select * from news where title like '%여%' or cont like '%여%' order by odate desc) o;
select rownum, o.* from (select * from news where title like '%여%' or cont like '%여%' order by odate desc) o where rownum<= 5;
create table news (
ono number(5) constraint news_wno_pk primary key,
cateno varchar2(5),	-- 뉴스 o
cate number(5),	-- 검색분류(value 1,2,3,4,5)
title varchar2(100),	-- 뉴스 타이틀
cont varchar2(4000),	-- 뉴스 내용
ourl varchar2(1000),
odate date,
opictureurl varchar2(50),
userid varchar2(20)
);
alter table news add(userid varchar2(30));
update news set userid='admin';
update news set opictureurl='sbs_attack.jpg' where ono=17;
select * from news where cate in(1) and (title like '%성%' or cont like '%성%');
select * from news where title like '%폭%' or cont like '%폭%';
select * from tab;
select * from news order by odate desc;

update news set odate='2016-05-03' where ono=109;
update news set opictureurl='yh_murder.jpg' where ono=107;


alter table news add constraint news_id_fk foreign key(userid) references member_t(userid);
update news set odate='2016-04-05' where ono=17; 
create sequence news_seq start with 1 increment by 1;
drop sequence news_seq;

drop table news;
purge recyclebin;


insert into news values(news_seq.nextval, 'o', '4', '머아ㅐㄴ', 
'테스트용입니다. 삭제 및 스크랩 및 스크랩삭제 등등 테스트에요', 
'', sysdate, '','admin', '', '');


insert into news values(news_seq.nextval, 'o', '1', '20대 지적장애 여성 성폭행 징역 10년 선고', 
'서울남부지방법원은 20대 지적장애인을 성폭행한 혐의로 기소된 59살 박 모 씨에게 징역 10년을 선고하고, 신상정보를 10년 동안 공개하도록 했습니다. 
재판부는 박 씨의 죄질이 매우 나쁘고 피해자의 피해 회복이 이뤄지지 않아 중형을 선고한다고 밝혔습니다. 
박 씨는 지난해 8월, 서울역 광장에서 술에 취해있던 지적장애 2급 20살 A씨를 구로구 자택으로 데려가 수차례 성폭행한 혐의로 기소됐습니다.', 
'http://www.ytn.co.kr/_ln/0103_201302202252328513', '2013.02.20', '');

insert into news values(news_seq.nextval, 'o', '1', '만취 50대男, 술 취해 자던 30대男 성폭행 "충격"', 
'만취한 50대 남성이 길에서 자던 다른 30대 남성을 성폭행한 사실이 알려져 충격을 주고 있다. 
서울 구로경찰서는 술에 취해 다른 남성을 성폭행한 혐의(성폭력 범죄의 처벌 등에 관한 특례법 위반)로 이모(51)씨를 구속했다고 30일 밝혔다. 
경찰 조사 결과 이씨는 지난 20일 오전 3시30분쯤 서울 구로구 구로역 광장에서 30대 남성 A씨를 성폭행한 것으로 드러났다. 
이씨는 당시 술에 취해 있었으며 피해자 A씨도 술에 취해 노상에서 자던 중 봉변당한 것으로 조사됐다. 
이씨는 그동안 파지를 주우며 노숙해온 것으로 알려졌다.
경찰은 근처에서 청소 중이던 환경미화원의 신고를 받고 출동해 이씨를 붙잡았다. 
경찰은 A씨가 만취해 항거불능 상태였던 만큼 이씨에 대해 준강간 혐의를 적용, 검찰에 기소의견으로 송치했다', 
'http://www.segye.com/content/html/2013/09/30/20130930003913.html?OutUrl=naver', '2013.09.30', '');

insert into news values(news_seq.nextval, 'o', '1', '법원, 처조카 수차례 성폭행한 30대男 징역 10년 선고 ', 
'처조카를 성폭행해 집행유예를 선고 받았던 30대 남성이 처조카를 또다시 성폭행 한 뒤 임신까지 시켰다. 
법원은 이 남성에게 징역 10년의 중형을 선고했다.서울 북부지법 형사 13부(부장 이효두)는 지난해 3~4월 처조카인 이모(17)양을 네 차례에 걸쳐 성폭행한 혐의(아동,청소년의 성보호에 관한 법률 위반 상 위계 등 간음)로 재판에 넘겨진 오모(39)씨에게 징역 10년을 선고했다고 1일 밝혔다. 
법원은 또 오씨에게 성폭력 치료 프로그램 120시간 이수와 개인정보 공개,고지 10년을 명령했다.
오씨는 지난해 3월 "저녁을 사주겠다"며 이양을 자신의 차에 태운 뒤 서울 정릉동 집으로 데려가 성폭행한 혐의를 받고있다. 
그는 이후에도 이양을 네 차례 더 성폭행해 임신까지 시키고 낙태수술도 받게했다고 한다. 
이양은 "제발 좀 그만 하라"고 반항했지만 오씨는 번번이 강제로 이양을 추행했다.
법원 판결문에 따르면 오씨는 이양의 이모와 결혼하기 전인 2010년 6월에도 당시 12세였던 이양을 성폭행했다. 
당시 이양의 외할머니와 이모가 "오씨의 잘못을 조용히 덮자"며 이양에게 "처벌불원서"를 쓰게해 집행유예를 받았다.
이 일로 오씨는 징역 2년에 집행유예 3년을 선고 받았다. 
재판부는 "참회는커녕 피해자가 적극적으로 거부하는 태도를 보이지 않았다는 식의 변명을 한다"며 "엄한 처벌이 필요하다"고 양형 이유를 설명했다.
', 'http://news.joins.com/article/19511429', '2016.02.01', '');

insert into news values(news_seq.nextval, 'o', '4', '마약 탄 음료수 먹이고 내기골프...8억 뜯은 일당 구속', 
'서울 구로경찰서는 내기골프 상대에게 마약을 탄음료수를 먹이고 판돈 수억원을 가로챈 혐의로 이모(52)씨 등 5명에 대해 구속영장을 신청했다고 25일 밝혔다. 
이씨 등은 지난 2008년 1월부터 3년 동안서울 구로구의 한 실내 스크린 골프장에서 송모씨와 40여차례 내기골프를 하면서 송씨에게 향정신성 의약품인 졸피뎀을 섞은 음료수를 마시게 해 집중력을 잃게 하는 수법으로 8억5천여만원을 챙긴 혐의를 받고 있다. 
조사결과 이들은 송씨가 현금이 많고 골프를 잘 쳐 도박을 제의하면 쉽게 응할 것으로 보고 접근했으며 홀마다 5~100만원씩 돈을 걸고 내기골프를 한 것으로 드러났다.
이들은 송씨에게 보여줄 도박자금을 준비하려고 100만원권과 500만원권 자기앞수표 7천만원을 컬러복사해 위조한 것으로 조사됐다.',
'http://www.nocutnews.co.kr/news/4201065', '2011.05.25', '');

insert into news values(news_seq.nextval, 'o', '1', '동물용 약물 먹여 성폭행한 공무원 등 항소심 징역 12년', 
'무단 반출한 동물용 마취제 등을 여성에게 먹여 정신을 잃게 하고서 성폭행한 30대 계약직 공무원과 그의 고교 동창 등 2명에게 항소심 법원도 중형을 선고했다.
서울고법 춘천 제1형사부(심준보 부장판사)는 성폭력범죄의 처벌 등에 관한 법률 위반(강간 등 상해) 등의 혐의로 기소된 A(33)씨와 B(33)씨 등 2명이 "형량이 무겁다"며 낸 항소를 기각하고 원심과 같은 징역 12년을 선고했다고 14일 밝혔다.
또 A씨 등에게 200시간의 성폭력 치료 프로그램 이수와 10년간 신정 정보 공개를 명령한 원심도 유지했다.
계약직 공무원인 A씨는 지난해 7월 26일 자정께 원주의 한 술집에서 고교 동창생인 B씨, B씨의 직장 동료 C(24,여)씨와 함께 술을 마셨다.
당시 이들은 A씨의 직장에서 무단 반출한 동물용 마취제 등을 C씨의 술잔에 몰래 넣었다.
C씨가 이를 마시고 정신을 잃자 A씨와 B씨는 인근 여관으로 C씨를 데리고 가 강제로 성폭행했다.
A씨는 자신의 스마트폰 카메라로 성폭행 장면을 동영상과 사진으로 촬영하기도 했다.
재판부는 "약물로 정신을 잃게 한 뒤 피해자를 성폭행한 피고인들의 범행은 한 여성의 존엄성을 극도로 훼손했을 뿐만 아니라 자칫 약물의 부작용으로 피해자에게 치명적인 결과를 가져올 수 있었던 만큼 엄벌이 불가피하다"고 판시했다.
이어 "피고인 A씨는 공복으로서 책임과 윤리를 망각하고 약물을 빼돌려 범행한데다 성폭행 장면을 촬영하는 추가 범행까지 저질렀다"며 "피해자가 심각한 정신적·육체적 고통을 겪은 점을 고려하면 피고인들의 원심 형량은 부당하다고 볼 수 없다"고 덧붙였다.
', 'http://www.yonhapnews.co.kr/bulletin/2015/08/14/0200000000AKR20150814025500062.HTML?input=1195m', '2015.08.14', 'yh_drug.jpg');

insert into news values(news_seq.nextval,'o', '3', '서울 구로구 아파트단지서 잇단 "벽돌 폭행"...경찰 수사', 
'서울 구로구의 한 아파트단지에서 벽돌로 여학생을 위협하거나 폭행한 사건이 연이어 발생했다.   
구로경찰서는 길에서 담배를 피운다는 이유로 여자 고등학생 두 명을 벽돌로 위협한 혐의(폭력행위등처벌에관한법률 위반)로 한모(19)군을 불구속 입건했다고 28일 밝혔다.  
경찰에 따르면 한군은 지난 10일 밤 10시40분쯤 구로구 개봉동의 한 아파트단지 안 놀이터에서 담배를 피우고 있던 고등학생 권모(17)양 등 두 명을 벽돌로 내려치려 한 혐의다.   
한군은 경찰조사에서 "여자 고등학생들이 길에서 담배를 피우는 모습이 불쾌해 범행을 저질렀다"고 진술했다.  
경찰은 한군을 불구속기소 의견으로 검찰에 송치할 예정이다.   
한편 경찰은 지난달 31일 같은 아파트단지에서 길을 걷던 김모(16)양의 머리를 시멘트 조각으로 내리치고 달아난 남성을 추적 중이다. 
괴한에게 "묻지마 폭행"을 당한 김양은 머리가 약 5cm가량 찢어져 인근 병원에서 치료를 받았다.   
경찰은 인근 폐쇄회로(CC)TV를 확보해 용의자가 후드 티를 입고 있었던 것을 확인하고 현재 추적 중이다.  
경찰 관계자는 "김양을 때리고 달아난 괴한과 한군은 동일인물이 아닌 것으로 밝혀졌다"며 "현재 CCTV 분석을 통해 용의자를 계속해서 추적하고 있다"고 말했다.
', 'http://news1.kr/articles/?2207373', '2015.04.28','');

insert into news values(news_seq.nextval, 'o', '5', '"커피숍 女주인 살해"...13년만에 범인 잡혀', 
'경찰이 진화한 감식 기술을 이용해 자칫 영구미제로 남을 뻔했던 13년 전 커피숍 여주인 살인사건 살해범을 붙잡았다.
서울 구로경찰서는 지난 2000년 서울 대림동 한 커피숍에서 여주인을 살해한 혐의로 고모(40)씨를 검거했다고 27일 밝혔다.
고 씨는 2000년 10월 29일 오후 3시쯤 서울 영등포구 대림동의 한 커피숍에 들어가 커피숍 여주인 손모(55)씨를 흉기로 살해한 혐의를 받고 있다. 
고 씨는 차를 주문하지 않고 계속 물만 가져다 달라고 했다가 손 씨로부터 "재수 없다"는 말을 듣자 홧김에 범행을 저지른 것으로 조사됐다. 
경찰은 사건 발생 당시 커피숍 계산대 위에 놓여있던 물컵에서 쪽지문 8점을 검출했으나, 지문 상태가 희미하고 극히 일부만 채취돼 그동안 수사에 난항을 겪어왔다.
그러다 경찰은 올해 1월 진화한 감식 기술을 활용해 중요미제사건 지문에 대한 정밀 재감정을 벌였고, 그 결과 수감 중이던 고 씨를 검거할 수 있었다.
고 씨는 경찰 조사에서 "범행 후 피해자의 모습이 꿈에 자주 나타나 불면증에 시달렸고 피해자와 그 가족들을 위해 하루도 빠짐없이 기도하며 지냈다"며 "범행을 자백하고 나니 마음이 평온해진 것 같다"고 말했다.
한편 고 씨는 지난 2006년 서울 금천구 한 빌라에서 귀금속을 훔치다 빌라 주인 김모(33)씨와 마주치자 흉기로 찔러 살해하려 한 혐의로 실형 8년을 선고받아 현재 교도소에 수감중이다.', 
'http://www.nocutnews.co.kr/news/1041214', '2013.05.27', 'nc_coffee.jpg');

insert into news values(news_seq.nextval, 'o', '5', '왜 여자친구와 그 친구까지?...살해동기 "침묵"', 
'자신의 여자 친구 등 여성 2명을 살해한 20대가 경찰과 대치 끝에 붙잡혔다.
이 20대는 범행 후 112에 전화를 걸어 자신이 "사람을 죽였다"고 신고했지만 범행 동기에 대해서는 입을 다물고 있다.
경북 포항 북부경찰서는 30일 여자 친구인 김모(27)씨와 김 씨의 친구를 흉기로 찔러 숨지게 한 혐의로 안모(24)씨를 붙잡아 조사하고 있다.
앞서 안 씨는 이날 오전 112에 전화를 걸어 "내가 여자친구와 그 친구를 죽였다"고 신고했고 경찰은 오전 7시쯤 포항시 북구 죽도동 한 빌라에서 안 씨를 체포했다.
경찰과 소방당국은 집 현관문을 강제로 열고 안 씨를 체포하는 과정에서 집 안 거실과 방에서 흉기에 목이 찔린 채 숨진 김 씨와 친구 시신을 발견했다.
또 7살 남자 어린이를 발견해 아동보호시설로 옮겼는데 아이는 특별한 외상이 없는 것으로 알려졌다. 
이남자 어린이는 김 씨와 함께 숨진 친구의 아들로 밝혀졌다.
용의자 안 씨는 체포 과정에서 음독 자살을 시도해 병원으로 이송된 후 위 세척으로 의식을 되찾았지만 범행 동기에 대해서는 입을 다물고 있다고 경찰은 밝혔다.
', 'http://news.kbs.co.kr/news/view.do?ncd=3256533&ref=A', '2016.03.30', 'kbs_murder.jpg');

insert into news values(news_seq.nextval, 'o', '3', '"날 무시해?"...지인 야구방망이로 폭행 20대 실형', 
'김씨는 지난 2013년 6월 28일 오전 4시30분께 서울시 구로구의 한 포장마차 앞에서 지인(23)의 팔과 머리 등을 야구방망이로 마구 때린 혐의로 기소됐다.
재판부는 "피고인은 2012년 폭력 혐의로 집행유예를 받고서 이 기간에 또다시 범행을 저질렀다"면서 "당시 술과 마약 때문에 심신장애 상태에서 폭력을 휘둘렀다고 주장하나 상황을 대부분 기억하는 점 등을 고려하면 의사를 결정할 능력이 없거나 미약한 상태에서 범행을 했다는 피고인의 주장은 받아들이지 않는다"고 밝혔다.', 
'http://www.newsis.com/ar_detail/view.html?ar_id=NISX20151029_0010380563&cID=10808&pID=10800', '2015.10.29', '');

insert into news values(news_seq.nextval, 'o', '5', '"딸 학대" 이유로 동거남 살해한 30대 구속영장 신청 ', 
'전 남편과 사이에서 낳은 딸을 학대한다는 이유로 동거남을 살해한 30대 여성에게 경찰이 구속영장을 신청했다. 
18일 서울 양천경찰서는 전날 오전 2시께 양천구 신월동 자택에서 동거남 천모(37)씨를 목 졸라 살해한 혐의로 정모(35)씨에게 구속영장을 신청했다고 밝혔다. 
경찰 조사 결과 정씨는 지난 2011년 전 남편과 사별한 후 중학교 동창 천씨를 만나 2012년부터 함께 살았다. 
그러나 정씨는 전 남편 사이에서 낳은 딸을 천씨가 때리고 구박하자 천씨를 살해하기로 결심한 것으로 밝혀졌다. 
사건 발생 당시 정씨의 딸 A(7)양은 옆방에서 자고 있었던 것으로 확인됐다. 
정씨는 천씨를 살해한뒤 서울 구로구의 친정에 딸을 맡기고 이날 오전 6시쯤 집으로 돌아와 경찰에 연락해 "동거 중인 천씨를 살해했다"고 자백했다. 
경찰조사에서 정씨는 천씨가 딸을 자주 때렸고 초등학교에 입학할 딸에게 필요한 옷과 가방도 사주지 않았다고 진술했다. 
', 'http://www.vop.co.kr/A00000994364.html', '2016.02.19', '');

insert into news values(news_seq.nextval, 'o', '2', '"女속옷만 보면 참을 수 없어" 40대 상습 절도범 구속 ', 
'여성의 속옷을 훔쳤다가 집행유예를 선고받은 40대가 같은 범행을 반복해 또다시 쇠고랑을 찼다.
서울 구로경찰서는 절도 혐의로 김모(42)씨를 구속했다고 28일 밝혔다.
김씨는 작년 11월 오토바이를 타고 구로구 주택가를 돌며 빨래건조대에 놓인 여성용 스타킹과 속옷 등 191점을 훔친 혐의를 받고 있다.
조사 결과 김씨는 같은 범행으로 집행유예를 선고받은 당일 충동을 이기지 못하고 범행을 반복한 것으로 드러났다.
김씨는 여성 속옷을 훔친 혐의로 재판에 넘겨져 작년 11월7일 서울남부지법에서 징역 4월에 집행유예 1년을 선고받았다.
법원 선처로 철창신세를 면한 김씨는 범행을 뉘우치는 대신 법원을 나서고서 다시 여성의 속옷에 손을 댔다가 꼬리를 잡혔다.
김씨는 평소 충동 조절 장애로 한 정신과에서 치료를 받고 있던 것으로 조사됐다.
김씨는 경찰에서 "훔친 속옷은 방안에 걸어 놓고 보고 만졌다"며 "여성 속옷만 보면 참을 수 없었다"고 진술한 것으로 전해졌다.
', 'http://www.yonhapnews.co.kr/bulletin/2016/03/28/0200000000AKR20160328187000004.HTML?input=1195m', '2016.03.28', 'yh_still.jpg');

insert into news values(news_seq.nextval, 'o', '2', '"잠시 한눈파는 사이에"...여성 가방 골라 훔친 30대男 "구속"', 
'서울 강남경찰서는 사람들이 북적거리는 곳을 돌아다니며 한눈을 팔고 있는 사람들의 물건을 훔친 혐의(상습절도)로 최모(35)씨를 구속했다고 10일 밝혔다.
경찰에 따르면 최씨는 지난해 8월 말부터 올해 2월 말까지 서울 강남구, 광진구, 마포구, 구로구 등의 혼잡한 곳을 돌아다니며 11차례에 걸쳐 400만원 상당의 금품을 훔친 혐의를 받고 있다.
최씨는 옆을 지나가는 척 하면서 다른 일에 정신이 팔린 사람들이 탁자나 의자 위에 올려 둔 가방이나 휴대폰 등을 채간 뒤 달아났다. 
주로 여성이 대상이었다. 
올해 1월30일 오후 3시20분께에는 강남구 삼성동 코엑스 영화관 매표소 인근에서 영화 팸플릿을 보고있던 A씨가 옆에 놔둔 가방을 훔치기도 했다. 
최씨는 의류매장에 들어가 진열된 옷을 훔쳐 달아나기도 했다.
최씨는 지갑이나 가방 안에 들어있던 현금을 썼을 뿐 아니라 신용카드로 200여만원을 결제하기도 했다.
또 다시 코엑스에서 범행 대상을 물색하다가 경찰에 붙잡힌 최씨는 소매치기로 이미 5건의 수배가 걸려있었다.
절도 등 전과 12범인 최씨는 절도로 징역을 살다가 2013년 출소한 뒤 생활비가 없자 또 다시 물건을 훔치기 시작한 것으로 조사됐다.
경찰 관계자는 "수십년 전 가족과 헤어져 혼자 생활한 최씨가 생계유지에 어려움을 겪어 습관적으로 절도를 해온 것으로 보인다"고 전했다.
', 'http://www.newsis.com/ar_detail/view.html?ar_id=NISX20160309_0013945573&cID=10201&pID=10200', '2016.03.10', '');

insert into news values(news_seq.nextval, 'o', '1', '여중생 조카를 모텔로 유인해 필로폰 투약하고 강제추행한 40대 실형', 
'여중생인 조카에게 필로폰을 투약하고 강제추행한 인면수심의 40대 남성이 실형을 선고받았다.
인천지법 형사13부(재판장 김상동)는 성폭력범죄의 처벌 등에 관한 특례법 위반 혐의 등으로 기소된 A(48)씨에 대해 징역 4년을 선고하고, 성폭력 치료프로그램 40시간 이수를 명령했다고 7일 밝혔다.
A씨는 지난 2012년 7월 인천 남구의 한 모텔에서 조카 B(당시 13세) 양에게 1회용 주사기로 필로폰을 투약하고 강제추행한 혐의 등으로 재판에 넘겨졌다.
경찰 조사 결과 A씨는 B양에게 "가출한 엄마를 만나게 해주겠다"고 모텔로 유인하고, "엄마가 영양제를 넣어주라고 했다"며 필로폰을 강제로 투약한 것으로 드러났다.
재판부는 "A씨는 미성년자인 조카에게 필로폰을 투약한 뒤 강제추행해 죄질이 나쁘다"며 "마약류 관련 범죄로 3차례 징역형을 받은 전력과 B양의 정신적 충격이 상당한 것으로 보이는 점 등을 고려했다"고 양형 이유를 밝혔다.', 
'http://news.chosun.com/site/data/html_dir/2015/11/07/2015110701052.html', '2015.11.07', '');
