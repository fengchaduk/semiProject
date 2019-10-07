create table room(
studymanager number primary key,
userid VARCHAR2(20),
    constraint r foreign key (userid) references usertable (userid),
studyid number not null,
constraint ropk foreign key (studyid) references study (studyid)
);

create sequence studynum_num_seq 
start with 1 
increment by 1
nocache
nocycle;

drop table study;
drop table room;
commit;
insert into room VALUES(studynum_num_seq.nextval,'hello',null);

create table study(
   	num number ,
    foreign key (num) references study (studyid),
    studyid number primary key,
   	userid varchar2(20)not null,
    constraint room_pk foreign key (userid) references usertable (userid),
	subject varchar2(100),
	reg_date date,
	readcount number default 0, 
	semicontent varchar2(1000),
    content clob,  -- clob 엄청 큰 자료?내용?을 받을 때 사용함
	main_photo varchar2(300)
    
); --9 +1

create table room(
num number,
userid VARCHAR2(20) not null,
    constraint r foreign key (userid) references usertable (userid),
studyid number
--foreign key (studyid) references study (studyid)
);

alter table room add(
foreign key (studyid) 
references study (studyid)
on delete cascade
);

ALTER TABLE room ADD UNIQUE(studyid,userid);

select * from EMPLOYEES;
select * from study;
select * from room;
select * from usertable;
drop table room;
select num from study where studyid=50;

insert into room VALUES(50,'hello',50);
insert into room VALUES(null,'world',50);
delete from room where userid='world';
insert into study
values(study_num_seq.nextval, study_num_seq.nextval, 'hello',
'정보처리기사 필기 + 실기 60일 안에 박살 내기!!',sysdate,0,
'간략내용 테스트.......','내용 테스트.......','math_img_1.jpg');
commit;
insert into room values(select num from study where studyid=50,'hello',50);

CREATE OR REPLACE VIEW vw_emp AS 
SELECT r.num,s.studyid, r.userid, s.subject
    FROM study s, room r
    WHERE s.studyid = r.studyid;
    
    drop view vw_emp;
    select * from vw_emp;