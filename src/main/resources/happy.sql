create table tb_member(
	memUno 		varchar2(50),
	mno			number(10, 0) unique not null,
	name		varchar2(50) not null,
	phone		varchar2(50) not null,
	email		varchar2(50) unique not null,
	regDate		Date	default sysdate,
	birth		varchar2(50) not null,
	nickName	varchar2(50) unique not null
	pw			varchar2(50) not null
);

select * from tb_member;

delete from tb_member;
alter table tb_member modify birth number(6);

alter table tb_member add constraint pk_member
primary key (memUno);

create sequence seq_member;
drop sequence tb_mno_sequence;


insert into tb_member(mno, name, phone, email, birth, nickName, pw)
values(seq_member.nextval, '1234', '1234', '1234@123', '1234', '1234', '1234');
insert into tb_member(mno, name, phone, email, birth, nickName, pw)
values(seq_member.nextval, 'ddd', 'dddddddd', 'ddd@1234', '777777', 'dadsddd', '1234');
insert into tb_member(mno, name, phone, email, birth, nickName, pw)
values(seq_member.nextval, 'ddd', 'gggggggg', 'ddd@543', '777777', 'ddddd', '1234');

select * from tb_member;
delete from tb_member;
drop trigger trg_memUno_insert_tb_member;ㅋ
drop sequence seq_member_Uno;

alter table tb_member add pw varchar2(50) not null;






CREATE SEQUENCE seq_member_Uno
START WITH 10000000
INCREMENT BY 1
MINVALUE 10000000
MAXVALUE 99999999
CYCLE
CACHE 20;

CREATE OR REPLACE TRIGGER trg_memUno_insert_tb_member
BEFORE INSERT ON tb_member
FOR EACH ROW
DECLARE
    v_random NUMBER;
    v_count NUMBER;
BEGIN
    LOOP
        v_random := TRUNC(DBMS_RANDOM.VALUE(10000000, 99999999));
        SELECT COUNT(*)
        INTO v_count
        FROM tb_member
        WHERE memUno = v_random;

        EXIT WHEN v_count = 0;
    END LOOP;

    :NEW.memUno := v_random;
END;

ALTER SEQUENCE seq_member_Uno RESTART START WITH 10000000;
SELECT * FROM user_sequences WHERE sequence_name = 'SEQ_MEMBER_UNO';

SELECT * 
FROM USER_ERRORS 
WHERE NAME = 'TRG_MEMUNO_INSERT_TB_MEMBER';


select * from tb_restaurant;
insert into tb_oper (resNum, openTime, endTime, adPay, adPayCond, dayoff_cate, dayoff_weekCnt, 
dayoff_Day, breakTime, breakTime_start, breakTime_end) values ('10000003tes', TO_DATE('2024-01-01 10:00', 'yyyy-MM-dd HH24:MI'),  TO_DATE('2024-01-01 18:00', 'yyyy-MM-dd HH24:MI'),100000, 10, 'M' , '1, 3', '일' , 0, 
'-', '-'); 

select * from tb_oper;
INSERT INTO tb_oper (
    resNum, 
    openTime, 
    endTime, 
    adPay, 
    adPayCond, 
    dayoff_cate, 
    dayoff_weekCnt, 
    dayoff_Day, 
    breakTime, 
    breakTime_start, 
    breakTime_end
) VALUES (
    '10000002tes', 
    TO_DATE('2024-01-01 10:00', 'YYYY-MM-DD HH24:MI'), 
    TO_DATE('2024-01-01 18:00', 'YYYY-MM-DD HH24:MI'), 
    100000, 
    10, 
    'M', 
    '1, 3', 
    '일', 
    0, 
    '-', 
    '-'
);

create table tb_oper(
resNum varchar2(20) primary key,
openTime varchar2(10) not null,
endTime varchar2(10) not null,
breakTime number(2),
breakTime_start varchar2(10),
breakTime_end varchar2(10),
dayoff_cate varchar2(10),
dayoff_weekCnt varchar2(10),
dayoff_Day varchar2(4),
adPay number(10),
adPayCond number(3)
);

INSERT INTO tb_oper (
    resNum, 
    openTime, 
    endTime, 
    adPay, 
    adPayCond, 
    dayoff_cate, 
    dayoff_weekCnt, 
    dayoff_Day, 
    breakTime, 
    breakTime_start, 
    breakTime_end
) VALUES (
    '10000002tes', 
    TO_DATE('2024-01-01 10:00', 'YYYY-MM-DD HH24:MI'), 
    TO_DATE('2024-01-01 18:00', 'YYYY-MM-DD HH24:MI'), 
    100000, 
    10, 
    'M', 
    '1, 3', 
    '일', 
    0, 
    '-', 
    '-'
);
select * from tb_oper;
drop table tb_oper;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI';
SELECT TO_DATE('2024-01-01 10:00', 'YYYY-MM-DD HH24:MI') FROM dual;
SELECT value
FROM v$nls_parameters
WHERE parameter = 'NLS_DATE_FORMAT';
select * from tb_oper;
desc tb_oper;











select * from tb_restaurant;
select * from tb_oper;
select * from tb_sales;
select * from tb_menu;

insert into tb_restaurant (resId, resPw, resName, resAddr, co_num, certify, summary, resphone) 
values ('test1', 'test1', 'test1', 'test1', '11111', 'test1', 'test1', 'test1');

insert into  tb_sales values ('10000002tes',3,'4인용',3);

insert into tb_menu values (seq_menu.nextVal, '10000002tes', 'test1', 'test1', 'test1', 4, 50000, 'test1');
select * from tb_menu where resNum = '10000002tes';
select sequence from happy;

SELECT *
  FROM all_sequences;

  
  select  * from all_all_tables;
select * from tb_reply;
drop table tbl_reply;

create table tb_reply (
	rno number(10,0),  -- 댓글 번호
	resNum varchar2(20),  -- fk(게시물번호)
 	reply varchar2(1000) not null, -- 댓글
 	replyer varchar2(50) not null, -- 댓글 작성자
	replyDate date default sysdate,
	updateDate date default sysdate );

	
create sequence seq_reply; -- 댓글용 자동번호객체 추가
drop sequence seq_reply;
alter table tb_reply add constraint pk_reply primary key (rno); 
-- pk를 rno로 지정(롤이름 : pk_reply)


-- tbl_reply의 bno(자)와 tbl_board의 bno(부)를 연결 (부모가 있어야 자식이 있다) 

-- tbl_board 초기화 -> 더미데이터 입력 -> 댓글 더미데이터 입력

delete from tbl_reply; -- 더미데이터 삭제

drop sequence seq_reply; -- 시퀀스 삭제

insert into tb_reply (rno, resNum, reply, replyer)
		values (seq_reply.nextval,  '10000002tes', '댓글11', 'kkw');
		insert into tb_reply (rno, resNum, reply, replyer)
		values (seq_reply.nextval,  '10000002tes', '댓글10', 'kkw');
		insert into tb_reply (rno, resNum, reply, replyer)
		values (seq_reply.nextval,  '10000002tes', '댓글9', 'kkw');
		insert into tb_reply (rno, resNum, reply, replyer)
		values (seq_reply.nextval,  '10000002tes', '댓글8', 'kkw');
		insert into tb_reply (rno, resNum, reply, replyer)
		values (seq_reply.nextval,  '10000002tes', '댓글7', 'kkw');
		insert into tb_reply (rno, resNum, reply, replyer)
		values (seq_reply.nextval,  '10000002tes', '댓글6', 'kkw');
		

create table tb_like(
	resNum varchar2(20),
	likeCount number
);

alter table tb_like add constraint fk_tb_like foreign key (resNum) references tb_restaurant (resNum); 

select * from tb_like;

