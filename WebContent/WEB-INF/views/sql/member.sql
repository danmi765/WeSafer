select * from tab;
select * from member_t;
select * from member_t where userid='hkb4002';

drop table clip;
drop table comm;
drop table board;

create table board(
	b_no number(4),
	cateno varchar2(10),
	title varchar2(20),
	cont varchar2(4000),
	idx number(10) constraint brd_idx_pk primary key,
	b_date date,
	pic varchar2(1000),
	userid varchar2(10),
	constraint brd_id_fk foreign key(userid) references member_t
);

insert into board values(1, 'n', '怨듭�', '怨듭��뀒�뒪�듃', idx_seq.nextval, sysdate, '', 'admin');
insert into board values(2, 'k', '�옄�쑀', '�굹�뒗 �옄�쑀�떎!', idx_seq.nextval, sysdate, '', 'admin');
update board set b_no=2 where cateno='k';

create table cmt(
	c_no number(4) constraint cmt_id_pk primary key,
	userid varchar2(10), 
	text varchar2(1000),
	idx number(10), 
	constraint cm_idx_fk foreign key(idx) references comm,
	constraint cm_id_fk foreign key(userid) references member_t
);
alter table comm add(cont varchar2(1000));
alter table comm modify(text varchar2(1000));

select * from comm
create table clip(
	userid varchar2(10),
	s_no number(4) constraint cl_no_pk primary key,
	idx number(10),
	constraint cl_id_fk foreign key(userid) references member_t,
	constraint cl_idx_fk foreign key(idx) references board
);
select * from comm;

select owner, constraint_name, constraint_type, table_name from user_constraints;
drop sequence clip_seq;
drop sequence comm_seq;
drop sequence idx_seq;

create sequence idx_seq start with 0 increment by 1 minvalue 0;
--create sequence notice_seq start with 0 increment by 1 minvalue 0;
create sequence comm_seq start with 0 increment by 1 minvalue 0;
--create sequence free_seq start with 0 increment by 1 minvalue 0;
create sequence clip_seq start with 0 increment by 1 minvalue 0;

