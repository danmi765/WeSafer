
drop sequence info_comm_seq;
create sequence info_comm_seq start with 1 increment by 1;

DROP TABLE comm CASCADE CONSTRAINTS;

create table comm(
	idx number(5),				--고유번호
	indate date,				--날짜
	num number(5),				--글번호
	readCnt number(5),			--방문자
	liker number(5),			--라잌
	pictureUrl varchar2(50),	--사진명
	part1 varchar2(10),			--카테고리
	part2 varchar2(10),			--컨텐츠
	userid varchar2(10),		--아이디
	tit varchar2(50),			--제목
	cont varchar2(3000),		--내용
	primary key (idx)
);


insert into comm values(info_comm_seq.nextval, 
						sysdate, 
						1, 
						0, 
						'', 
						'',  
						'comm', 
						'notice', 
						'admin',
'공지 - 성범죄',
'성범죄는 성에 관계되는 범죄를 말하며, 타인의 자유의사와 관계없이 가해지는 강간이나 강제추행 등의 범죄를 말한다.
성범죄의 분류[편집]
강간과 추행의 죄 : 개인의 성적 자기결정의 자유를 보호하기 위한 것이며, 성풍속에 관한 죄는 사회적 법익, 즉 사회 일반의 건전한 성도덕 내지 성풍속을 보호하기 위한 것이다. 
그러나 넓게는 이러한 형법의 규정 외에도 여성 폭력범죄의 처벌 및 피해자보호 등에 관한 법률, 아동복지법, 풍속영업의 규제에 관한 법률, 윤락행위 등 방지법, 경범죄처벌법 등 특별법상 규정된 성 관련 범죄 일체를 아우른다.
성풍속에 관한 죄 : 옛날부터 처벌의 대상이 되어 왔으나, 이전에는 단순히 개인의 성적 의사결정의 자유를 보호하기 위한 개인적 범죄로서의 차원이 아니라, 음란성을 추방하여 성적 순결성을 보호하려는 사회적·국가적 이익을 
우선적으로 고려하는 차원에서 이해되었다. 이러한 시각에서 로마법에서는 강간·근친상간·매매음·간통 등을 범죄로 다루었고, 중세의 교회법과 계몽기 이후의 오스트리아·독일 등의 근대 형법에서도 마찬가지였다.'
);


insert into comm values(info_comm_seq.nextval, sysdate, 2, 0, '', '',  'comm', 'notice', 'admin',
'공지 - 강도/절도',
'강도(強盗)는 다른 사람의 재산을 빼앗는 범죄자를 말한다. 대한민국의 법(法)에서는 폭행 또는 협박으로 타인의 재물을 강취하거나 기타 재산상의 이익을 취득하거나 또는 제3자로 하여금 이를 취득하게 하는 자 라고 규정하고 있다.'
);

insert into comm values(info_comm_seq.nextval, sysdate, 3, 0, '', '',  'comm', 'notice', 'admin',
'공지 - 학교폭력',
'폭력은 신체적인 손상을 가져오고, 정신적·심리적인 압박을 가하는 물리적인
강제력을 말한다[1]. 법에서는 다른 사람에게 상해를 입히거나[2] 협박하거나 하는 등
의 행위[3] 와 함께 다른 사람을 감금하는 행위[4],
주거에 침입하는 행위[5], 기물의 파손 등에 대해서도 폭력이라 표현한다[6]. 철
학, 정치학 등의 학문에서는 다른 사람 또는 국가나 세력을 제압하는 힘을 일반적으로
지칭하기도 한다. 힘자랑이나 힘겨루기가 이에 속한다.'
);

insert into comm values(info_comm_seq.nextval, sysdate, 4, 0, '', '',  'comm', 'notice', 'admin',
'공지 - 마약/약물',
'
마약은 원래의 의미로는 양귀비의 추출물로서 환각과 중독을 일으키는 알칼로이
드만을, 즉 "아편만이 진정한 의미에서 마약이다."라고 말한다. 일반인들은 대부분의
향정신성 약품 및 중독성이 있는 알칼로이드 모두를 일컫는 말로 사용한다.
즉 한국에서는 관례적으로 인간의 중추신경계에 작용하는 것으로서 이를 사용할
경우 인체에 심각한 위해가 있다고 인정되는 물질로 분류되지 않은 민간제조약과 향정
신성의약품, 대마 등을 말한다.
일부 국내에서 마약으로 분류 된 물질 중에서는 환자의 고통을 줄이는 등 의학적
인 목적으로도 쓰이지만, 마약의 사용은 신체에 손상을 가하고 중독증세와 함께 심하
면 사망을 유발할 수 있어서 불법으로 규정하고 있다. 대한민국에서는  마약류 관리에
 관한 법률 을 통해 관리하고 있다.
'
);

insert into comm values(info_comm_seq.nextval, sysdate, 5, 0, '', '',  'comm', 'notice', 'admin',
'공지 - 살인',
'
살인은 다른 사람을 살해하는 행위이다. 고의적인 살인을 말하며 고의가 없는 과
실치사상죄와는 구분한다. 살인에 대한 처벌은 국가에 따라서는 사형도 행해진다. 사
형제 폐지론자들은 국가가 행하는 사형도 살인이라고 주장한다.
'
);



insert into comm values(info_comm_seq.nextval, sysdate, 1, 0, '', '',  'comm', 'free', 'admin',
'게시판 - 성범죄',
'성범죄는 성에 관계되는 범죄를 말하며, 타인의 자유의사와 관계없이 가해지는 강간이나 강제추행 등의 범죄를 말한다.
성범죄의 분류[편집]
강간과 추행의 죄 : 개인의 성적 자기결정의 자유를 보호하기 위한 것이며, 성풍속에 관한 죄는 사회적 법익, 즉 사회 일반의 건전한 성도덕 내지 성풍속을 보호하기 위한 것이다. 
그러나 넓게는 이러한 형법의 규정 외에도 여성 폭력범죄의 처벌 및 피해자보호 등에 관한 법률, 아동복지법, 풍속영업의 규제에 관한 법률, 윤락행위 등 방지법, 경범죄처벌법 등 특별법상 규정된 성 관련 범죄 일체를 아우른다.
성풍속에 관한 죄 : 옛날부터 처벌의 대상이 되어 왔으나, 이전에는 단순히 개인의 성적 의사결정의 자유를 보호하기 위한 개인적 범죄로서의 차원이 아니라, 음란성을 추방하여 성적 순결성을 보호하려는 사회적·국가적 이익을 
우선적으로 고려하는 차원에서 이해되었다. 이러한 시각에서 로마법에서는 강간·근친상간·매매음·간통 등을 범죄로 다루었고, 중세의 교회법과 계몽기 이후의 오스트리아·독일 등의 근대 형법에서도 마찬가지였다.'
);


insert into comm values(info_comm_seq.nextval, sysdate, 2, 0, '', '',  'comm', 'free', 'admin',
'게시판 - 강도/절도',
'강도(強盗)는 다른 사람의 재산을 빼앗는 범죄자를 말한다. 대한민국의 법(法)에서는 폭행 또는 협박으로 타인의 재물을 강취하거나 기타 재산상의 이익을 취득하거나 또는 제3자로 하여금 이를 취득하게 하는 자 라고 규정하고 있다.'
);

insert into comm values(info_comm_seq.nextval, sysdate, 3, 0, '', '',  'comm', 'free', 'admin',
'게시판 - 학교폭력',
'폭력은 신체적인 손상을 가져오고, 정신적·심리적인 압박을 가하는 물리적인
강제력을 말한다[1]. 법에서는 다른 사람에게 상해를 입히거나[2] 협박하거나 하는 등
의 행위[3] 와 함께 다른 사람을 감금하는 행위[4],
주거에 침입하는 행위[5], 기물의 파손 등에 대해서도 폭력이라 표현한다[6]. 철
학, 정치학 등의 학문에서는 다른 사람 또는 국가나 세력을 제압하는 힘을 일반적으로
지칭하기도 한다. 힘자랑이나 힘겨루기가 이에 속한다.'
);

insert into comm values(info_comm_seq.nextval, sysdate, 4, 0, '', '',  'comm', 'free', 'admin',
'게시판 - 마약/약물',
'
마약은 원래의 의미로는 양귀비의 추출물로서 환각과 중독을 일으키는 알칼로이
드만을, 즉 "아편만이 진정한 의미에서 마약이다."라고 말한다. 일반인들은 대부분의
향정신성 약품 및 중독성이 있는 알칼로이드 모두를 일컫는 말로 사용한다.
즉 한국에서는 관례적으로 인간의 중추신경계에 작용하는 것으로서 이를 사용할
경우 인체에 심각한 위해가 있다고 인정되는 물질로 분류되지 않은 민간제조약과 향정
신성의약품, 대마 등을 말한다.
일부 국내에서 마약으로 분류 된 물질 중에서는 환자의 고통을 줄이는 등 의학적
인 목적으로도 쓰이지만, 마약의 사용은 신체에 손상을 가하고 중독증세와 함께 심하
면 사망을 유발할 수 있어서 불법으로 규정하고 있다. 대한민국에서는  마약류 관리에
 관한 법률 을 통해 관리하고 있다.
'
);

insert into comm values(info_comm_seq.nextval, sysdate, 5, 0, '', '',  'comm', 'free', 'admin',
'게시판 - 살인',
'
살인은 다른 사람을 살해하는 행위이다. 고의적인 살인을 말하며 고의가 없는 과
실치사상죄와는 구분한다. 살인에 대한 처벌은 국가에 따라서는 사형도 행해진다. 사
형제 폐지론자들은 국가가 행하는 사형도 살인이라고 주장한다.
'
);

select * from comm order by idx desc

update member_t set userid='aaaa' where userid='aaaaaaaa';
update member_t set userid='bbbb' where userid='bbbbb';
update member_t set psw='aaaa' where userid='aaaa';
update member_t set psw='bbbb' where userid='bbbb';

update member_t set psw='aaaa' where userid='admin';
update member_t set active='y' where userid='aaaa';
update member_t set active='y' where userid='bbbb';

update member_t set psw='aaaa' where userid='aaaa';
update member_t set psw='bbbb' where userid='bbbb';

select * from MEMBER_T 