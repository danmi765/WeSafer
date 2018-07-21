create table stats_p(
sno number(5) constraint st_no_pk primary key,	-- 번호
cate number(5),	-- 분류(value 1, 2, 3, 4, 5)
spic varchar2(100),	-- 사진
cont varchar2(1000)
);


create sequence st_seq start with 0 increment by 1 minvalue 0;

insert into news values(st_seq.nextval, '', '', '');
insert into stats_p values(st_seq.nextval, '10', 'map2.jpg', 'tester2');
insert into stats_p values(st_seq.nextval, '20', 'map.jpg', 'tester2');

delete from stats_p where cate='20'
select * from comm;

cmt_seq


insert into cmt values(cmt_seq.nextval, 'danmi765', '댓글 테스트3', '7',sysdate);