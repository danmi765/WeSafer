alter table info modify(cont varchar2(4000));
update comm set num=1 where part2='notice' and num>1;

drop sequence temp;
create sequence temp start with 1 increment by 1;
update (select num from comm where part2='free' order by indate) s set s.num=temp.nextval;



drop sequence info_info_seq;
create sequence info_info_seq start with 1 increment by 1;

drop table info;

create table info(
	idx number(5),				--고유번호
	indate date,				--날짜
	num number(5),				--글번호
	readCnt number(5),			--조회수
	liker number(5),			--라잌
	pictureUrl varchar2(50),	--사진명
	part1 varchar2(10),			--카테고리
	part2 varchar2(10),			--컨텐츠
	userid varchar2(10),		--아이디
	tit varchar2(50),			--제목
	cont varchar2(4000),		--내용
	primary key (idx)
);


insert into info values(info_info_seq.nextval, sysdate, 1, 0, '', '',  'info', 'rape', 'admin',
'성범죄  [ sex crime ]',
'형법은 강간과 추행의 죄(형법 2편 32장)와 성풍속에 관한 죄(2편 22장)로 구분하고 있다. 강간과 추행의 죄는 개인적 법익, 즉 개인의 성적 자기결정의 자유를 보호하기 위한 것이며, 성풍속에 관한 죄는 사회적 법익, 즉 사회 일반의 건전한 성도덕 내지 성풍속을 보호하기 위한 것이다. 그러나 넓게는 이러한 형법의 규정 외에도 여성 폭력범죄의 처벌 및 피해자보호 등에 관한 법률, 아동복지법, 풍속영업의 규제에 관한 법률, 윤락행위 등 방지법, 경범죄처벌법 등 특별법상 규정된 성 관련 범죄 일체를 아우른다.
성범죄는 고대로부터 처벌의 대상이 되어 왔으나, 이전에는 단순히 개인의 성적 의사결정의 자유를 보호하기 위한 개인적 범죄로서의 차원이 아니라, 음란성을 추방하여 성적 순결성을 보호하려는 사회적·국가적 이익을 우선적으로 고려하는 차원에서 이해되었다. 이러한 시각에서 로마법에서는 강간·근친상간·매매음(賣買淫)·간통 등을 범죄로 다루었고, 중세의 교회법과 계몽기 이후의 오스트리아·독일 등의 근대 형법에서도 마찬가지였다.
성범죄가 강간·추행의 죄와 성풍속에 관한 죄로 분리된 것은 성범죄의 자유화·합리화의 요구가 인식되기 시작한 비교적 최근에 이르러서다. 현행 형법상 강간과 추행의 죄에는 강간죄(297조), 강제추행죄(298조), 준강간·준강제추행죄(299조), 강간 등에 의한 치사상죄(301조), 미성년자 등에 대한 간음죄(302조), 업무상 위력 등에 의한 간음죄(303조), 13세 미만인 자에 대한 간음·추행죄(305조) 등이 있다. 특별형법으로는 성폭력범죄의 처벌 및 피해자보호 등에 관한 법률상의 특수강도강간(5조), 특수강간(6조) 등이 있으며, 특정강력범죄의 처벌에 관한 특례법상의 특별한 누범가중(2조 1항 3호·3조) 등이 있다.
음란물죄와 공연음란죄는 사회 일반의 건전한 성도덕을 보호하기 위한 대표적인 규정이다. 간통죄에 관하여는 대부분의 학자·실무가들은 폐지를 주장하고 있으나 이익단체, 특히 여성단체들의 거센 반발로 현재까지 존속되고 있다. 음행매개죄는 특별형법인 윤락행위 등 방지법, 아동복지법 등과 함께 성의 상품화를 방지하기 위한 것이다. 한국 형법에는 없으나, 외국의 경우 동성 간의 성교나 근친상간 등의 성행위를 처벌하는 경우도 있다.
성범죄의 원인은 크게 개인적 원인과 사회·환경적 원인으로 나눌 수 있는데, 전자는 개인적 충동에 대한 자제력 부족과 순간적인 충동의 저변에 깔려 있는 복합적인 개인의 감정 상태를 말하며, 후자는 부모의 혼인상태나 친구집단의 영향, 음란비디오 등 외설적인 필름과 간행물 등의 영향, 강간에 대한 왜곡된 통념, 범죄의 포악화 경향 등을 들 수 있다.
한국에서는 최근 강간 등 성범죄를 수사하면서 피해자에게 수치심을 주는 일체의 행위를 금지하는 '성범죄 피해자 보호지침'을 마련하는 한편, 국무총리 산하 청소년보호위원회에서는 2010년 8월 30일부터 청소년 대상 성범죄자에 대한 신상을 인터넷 홈페이지에 6개월간 공개하고, 정부 중앙청사 및 16개 시·도 게시판에도 1개월간 공개하는 등 갈수록 성범죄자에 대한 처벌이 강화되고 있는 추세다.
');


insert into info values(info_info_seq.nextval, sysdate, 2, 0, '', '', 'info', 'robber', 'admin',
'강도/절도',
'타인의 재물을 절취하는 것을 내용으로 하는 범죄로서(형법 제329조) 재산죄 중에서 재물만을 객체로 하는 순수한 재물죄(財物罪)이다. 본죄의 보호법익은 소유권인데 재물에 대한 실질적 · 경제적인 가치를 보호하는 것이 아니라, 그 재물에 대한 형식적 소유권을 보호법익으로 하고 있다.
여기에서 말하는 「타인의 재물」이란 타인이 소유하는 재물을 말하는 것으로 하늘을 나르는 새와 같이 누구의 소유에도 속하지 않는 무주물은 절도죄의 객체로 될 수 없다. 그러나 타인이 양식하고 있는 양어를 절취한다면 당연히 절도죄가 성립한다. 그리고 타인의 소유물이라 하더라도 그것을 타인이 점유하고 있지 않을 때에는 횡령죄(橫領罪) 등의 객체로 될 수 있음은 별문제로 하고 절도죄는 성립하지 않는다. 따라서 자기가 보관하고 있는 타인의 시계를 임의로 질입(質入)하였을 경우에는 횡령죄(제355조 1항)가 성립한다.
토지나 건물 등의 부동산을 그 상태대로 두고 절취할 수 있느냐에 대해서 다수설은 이를 긍정하지만 판례와 소수설은 부정한다. 부동산에 대한 절도죄를 인정하지 않는 입장에서는 경계선을 넘어서 타인의 인지의 일부를 차지하는 것에 대해서는 경계침범죄(境界侵犯罪)(제370조)가 성립한다고 한다.
');

insert into info values(info_info_seq.nextval, sysdate, 3, 0, '', '', 'info', 'violence', 'admin',
'학교폭력',
'폭력은 신체적인 손상을 가져오고, 정신적·심리적인 압박을 가하는 물리적인
강제력을 말한다[1]. 법에서는 다른 사람에게 상해를 입히거나[2] 협박하거나 하는 등
의 행위[3] 와 함께 다른 사람을 감금하는 행위[4],
주거에 침입하는 행위[5], 기물의 파손 등에 대해서도 폭력이라 표현한다[6]. 철
학, 정치학 등의 학문에서는 다른 사람 또는 국가나 세력을 제압하는 힘을 일반적으로
지칭하기도 한다. 힘자랑이나 힘겨루기가 이에 속한다.'
);

insert into info values(info_info_seq.nextval, sysdate, 4, 0, '', '', 'info', 'drug', 'admin',
'마약/약물',
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

insert into info values(info_idx_seq.nextval, sysdate, 5, 0, '', '', 'info', 'murder', 'admin',
'살인',
'
살인은 다른 사람을 살해하는 행위이다. 고의적인 살인을 말하며 고의가 없는 과
실치사상죄와는 구분한다. 살인에 대한 처벌은 국가에 따라서는 사형도 행해진다. 사
형제 폐지론자들은 국가가 행하는 사형도 살인이라고 주장한다.
'
);