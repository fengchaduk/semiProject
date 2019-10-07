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
insert into userTable values(11, 'world', '조형원', 'world', 'world@world.com', 'Hi', null);
commit;
drop table usertable;
select*from usertable;
----------------------------------------------------------------------------study--------

create table study(
   	num number ,
    studyid number primary key,
   	userid varchar2(20)not null,
    constraint room_pk foreign key (userid) references usertable (userid),
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

delete from study where num=19;
drop sequence study_num_seq;  --시퀀스 삭제

drop table study; --테이블 삭제

insert into study
values(study_num_seq.nextval, study_num_seq.nextval, 'hello',
'정보처리기사 필기 + 실기 60일 안에 박살 내기!!',sysdate,0,
'간략내용 테스트.......','내용 테스트.......','math_img_1.jpg');

commit;

------------------------------room---------------------------------------------------------
create table room(
roomnum number not null,
userid VARCHAR2(20) not null,
    constraint r foreign key (userid) references usertable (userid),
studyid number,
foreign key (studyid) references study (studyid) on delete cascade
);

alter table room add(
foreign key (studyid) 
references study (studyid)
on delete cascade
);

ALTER TABLE room ADD UNIQUE(studyid,userid);

create sequence room_num_seq 
start with 1 
increment by 1
nocache
nocycle;

drop table room;
drop table study;

commit;

insert into room VALUES(room_num_seq.nextval, 'hello',86);
select min(roomnum) from room where userId='hello' and studyid=86;

select*from usertable;
select*from study;
select*from room;
delete from room where studyid=86;
---------------------------------chat------------------------------------------------------
drop table chat;

create table chat(
chatNum number primary key,
studyid number,
userid Varchar2(20),
today date,
content varchar2(1000));

create sequence chat_num_seq
start with 1
increment by 1
nocache
nocycle;

select * from chat;
insert into chat values(chat_num_seq.nextval,3,'hello', sysdate, '세번째 뎃글');
insert into chat values(chat_num_seq.nextval,3,'abcd' ,sysdate,'abcd댓글');

select * from freeboard;

select * from study;
select * from room;
commit;

select * from Chat where studyid=3;

