        
<Resource name="jdbc/myoracle"
   auth="Container"
   type="oracle.jdbc.pool.OracleDataSource"
   driverClassName="oracle.jdbc.driver.OracleDriver"
   factory="oracle.jdbc.pool.OracleDataSourceFactory"
   url="jdbc:oracle:thin:@localhost:1521:orcl2"
   user="javauser"
   password="1234"
   maxActive="20"
   maxIdle="10"
   maxWait="-1" />
   
   select * from stats_p;
   select * from news;
   drop table member_t;
   purge recyclebin;
select * from year_stats;
   delete from member_t where userid != 'admin';
   select * from member_t;
   alter table member_t modify(birth varchar2(20));
   
   alter table member_t set unused (birth);
   alter table member_t drop column birth;
   alter table member_t add(birth varchar2(20));


   
   
	create table member_t(
		name varchar2(10),
		userId varchar2(10),
		psw varchar2(10),
		birth number(10),
		phone char(13),
		email varchar2(20),
		nick varchar2(20),
		loc varchar2(15),
		primary key (userId)
	);
	
	select * from user_cons_columns

	
	
	insert into member_t values('�����','danmi765','qwert',910926,'01021081509','danmi765@naver.com','�Ѵ�','���α�');
	insert into member_t values('������','admin','qwert',000000,'00000000000','admin@naver.com','������','���α�');

	select concat(, , , , ) from member_t;
	
SELECT CONCAT('****', SUBSTR(EMAIL,4)) EMAIL, CONCAT(CONCAT(CONCAT(CONCAT(substr(phone,1,3), '-**'), substr(phone,6,2)), '-**'), substr(phone,10,2)) phone FROM MEMBER_T;

SELECT CONCAT('****', SUBSTR(EMAIL,4)) EMAIL FROM MEMBER_T;
SELECT CONCAT(CONCAT(CONCAT(CONCAT(substr(phone,1,3), '-**'), substr(phone,6,2)), '-**'), substr(phone,10,2)) phone FROM MEMBER_T;

create sequence stats.seq start with 1 increment by 1;
	insert into stats_t values(st.seq, 's', 'nc_coffee.jpg', 'tester');
