create table userTable(
usernum number primary key,
userid VARCHAR2(20),
username VARCHAR2(20),
userpassword varchar2(20),
useremail varchar2(100),
content varchar2(1000),
mypicture varchar2(400)
);

drop table usertable;

select * from usertable;

insert into usertable values(11,'hello','홍길동','hello','hello@naver.com','나는 홍길동 입니다',null);

commit;
----------------------------------------------------------------------------------
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
); --9

create sequence study_num_seq 
start with 1 
increment by 1
nocache
nocycle;

select * from study;

delete from study where num=9;
drop sequence study_num_seq;  --시퀀스 삭제

drop table study; --테이블 삭제

insert into study
values(study_num_seq.nextval, study_num_seq.nextval, 'User01',
'정보처리기사 필기 + 실기 60일 안에 박살 내기!!',sysdate,0,
'간략내용 테스트.......','내용 테스트.......','math_img_1.jpg');

commit;

insert into board(num, ref, userid, subject, reg_date,
						semicontent, content, main_photo) 
						values (board_num_seq.nextval, board_num_seq.nextval, ?, ?, sysdate, 
						?, ?, ?);   --8
                        
                        insert into board(num, ref, userid, subject, reg_date,
						semicontent, content, main_photo) 
						values (board_num_seq.nextval, board_num_seq.nextval, 2, 3, sysdate, 
						2, 4, 5);