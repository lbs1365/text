create table test (
	num number primary key, -- key
	writer varchar2(10) not null, -- �ۼ���
	content varchar2(500) not null, -- ����
	ip varchar2(20) not null, -- �ۼ��� ip
	reg_date date not null -- �ۼ���
);

create sequence test_seq start with 1 increment by 1 nocycle nocache;
select * from test;
select max(num) from board;
drop table test;