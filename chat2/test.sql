create table test (
	num number primary key, -- key
	writer varchar2(10) not null, -- 작성자
	content varchar2(500) not null, -- 본문
	ip varchar2(20) not null, -- 작성자 ip
	reg_date date not null -- 작성일
);

create sequence test_seq start with 1 increment by 1 nocycle nocache;
select * from test;
select max(num) from board;
drop table test;