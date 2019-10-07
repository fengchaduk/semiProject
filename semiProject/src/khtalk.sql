----------------------------------------------------------------------usertable---------
create table userTable(
usernum number,
userid VARCHAR2(20) primary key,
username VARCHAR2(20),
userpassword varchar2(20),
useremail varchar2(100),
content varchar2(1000),
mypicture varchar2(400)
);
insert into userTable values(1, 'hello', '홍길동', 'hello', 'hello@hello.com', 'Hi', null);
commit;
drop table usertable;
select*from usertable;
----------------------------------------------------------------------------study--------
create table study(
   	num number,
    ref number,
   	userid varchar2(20),
	subject varchar2(100),
	reg_date date,
	readcount number default 0, 
	semicontent varchar2(1000),
    content clob,  -- clob 엄청 큰 자료?내용?을 받을 때 사용함
	main_photo varchar2(300)
);
create sequence study_num_seq 
start with 1 
increment by 1
nocache
nocycle;

select * from study;

insert into study
values(study_num_seq.nextval, study_num_seq.nextval, 'User01',
'정보처리기사 필기 + 실기 60일 안에 박살 내기!!',sysdate,0,
'간략내용 테스트.......','내용 테스트.......','math_img_1.jpg');

------------------------------------------------------------------------notice-------

create table notice(
   	num number,
   	writer varchar2(20),
	subject varchar2(50),
	reg_date date,
	readcount number default 0,
    content clob
);

create sequence notice_num_seq 
start with 1 
increment by 1
nocache
nocycle;

insert into notice
values(notice_num_seq.nextval, '운영자', '제목111111',sysdate,0,'내용 test.......!!');


-----------------------------------------------------------------------freeboard------------
create table freeboard(
   	num number,
   	writer varchar2(20),
    password varchar2(20),
	subject varchar2(50),
	reg_date date,
	readcount number default 0, 
	ref number, 
	re_step number, 
	re_level number, 
	content varchar2(100),
	ip varchar2(20),
    upload varchar2(300)
);

create sequence freeboard_num_seq 
start with 1 increment by 1
nocache
nocycle;

insert into freeboard 
values(freeboard_num_seq.nextval, '홍길동','1234','제목1',sysdate,0,freeboard_num_seq.nextval,
0,0,'내용 테스트.......','127.0.0.1','sample.txt');

commit;

select b.* 
		from(select studyid as rm, a.* 
		from(select *from study
		order by studyid desc)a)b
		where b.studyid>=1 and b.studyid<=5;
        
       select b.*
			from(select rownum as rm, a.*
			from(select *from notice
			order by num desc)a)b
			where b.rm>=1 and b.rm<10;
        
        
        select studyid from room where userid='world';
        
        select * from room;









