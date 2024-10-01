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

alter table tb_member add point number(30);
UPDATE tb_member SET point = 0;  -- 적절한 값으로 업데이트
ALTER TABLE tb_member MODIFY point NUMBER(30) NOT NULL;


select * from tb_member;

delete from tb_member;
alter table tb_member modify birth number(6);

alter table tb_member add constraint pk_member
primary key (memUno);

create sequence seq_member;
drop sequence seq_member;


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

select* from tb_menuimg;




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

delete trigger trg_memUno_insert_tb_member;

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
values ('admin4', 'admin4', 'test1', 'test1', '11111', 'test1', 'test1', 'test1');

insert into  tb_sales values ('10000002tes',3,'4인용',3);

insert into tb_menu values (seq_menu.nextVal, '10000002tes', 'test1', 'test1', 'test1', 4, 50000, 'test1');

116 비빔국수
117 콩국수
118 포장만두

update tb_menu set menuimg = '/resources/images/exam1/194.jpg' where menunum = 194;
update tb_menu set menuimg = '/resources/images/exam1/195.jpg' where menunum = 195;
update tb_menu set menuimg = '/resources/images/exam1/196.jpg' where menunum = 196;

update tb_menu set menuimg = '/resources/images/exam1/192.jpg' where menunum = 192;
update tb_menu set menuimg = '/resources/images/exam1/193.jpg' where menunum = 193;

update tb_menu set menuimg = '/resources/images/exam1/187.png' where menunum = 187;

update tb_menu set menuimg = '/resources/images/exam1/소양념갈비.png' where menunum = 133;
update tb_menu set menuimg = '/resources/images/exam1/한우꽃등심.png' where menunum = 134;
select * from tb_restaurant;
select * from tb_menu where resNum = '10000141adm';


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
		
		
insert into tb_reply (rno, resNum, reply, replyer, rating) values (seq_reply.nextval, '10000118adm', '새우가 톡쏘고 살짝 매콤한게 아주 맛있어요', '새우 알레르기', 5);
update tb_reply set reply = '도미솥밥 맛있어요' where rno = 92;
update tb_reply set replyer = '문지현' where rno = 92;
select * from tb_reply;
update tb_reply set rating = 5 where rno = 82;
delete from tb_reply where rno = 95

select * from tb_reply;
		
		alter table tb_reply add rating number(2) default 0;
		
create table tb_like(
	resNum varchar2(20),
	likeCount number
);

alter table tb_like add constraint fk_tb_like foreign key (resNum) references tb_restaurant (resNum); 

select * from tb_like;

select * from tb_restaurant;
select * from tb_oper;
select * from tb_sales;
select * from tb_menu;
select * from tb_appointment;
select * from tb_A_menu;
sele
select * from tb_member;

delete from tb_restaurant;


delete from tb_menu where menunum = 141;

SELECT sequence_name, last_number, increment_by, min_value, max_value from user_sequences;
select table from user;






create table tb_guest_alr(

memUno	varchar2(100),
count   number(10)


);


create table tb_res_alr(

resNum varchar2(50),
count number(10)

);


drop table tb_guest_alr;
select * from tb_res_alr;
alter table tb_guest_alr add constraint fk_tb_guest_alr foreign key (memUno) references tb_member (memUno); 



tb_reply_


CREATE OR REPLACE TRIGGER res_alr_trigger
AFTER INSERT ON tb_appointment
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    -- resNum이 이미 존재하는지 확인
    SELECT count(*) INTO v_count
    FROM tb_res_alr
    WHERE resNum = :NEW.resNum;

    IF v_count IS NOT NULL THEN
        -- 이미 존재하는 경우 count를 증가시킴
        UPDATE tb_res_alr
        SET count = count + 1
        WHERE resNum = :NEW.resNum;
    ELSE
        -- 존재하지 않는 경우 새로 삽입
        INSERT INTO tb_res_alr (resNum, count) 
        VALUES (:NEW.resNum, 0);  -- 첫 번째로 삽입하므로 count는 1
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        RAISE;
END;
/



CREATE OR REPLACE TRIGGER res_alr_trigger
AFTER INSERT ON tb_appointment
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    -- resNum이 이미 존재하는지 확인
    SELECT COUNT(*) INTO v_count
    FROM tb_res_alr
    WHERE resNum = :NEW.resNum;

    IF v_count > 0 THEN
        -- 이미 존재하는 경우 count를 증가시킴
        UPDATE tb_res_alr
        SET count = count + 1
        WHERE resNum = :NEW.resNum;
    ELSE
        -- 존재하지 않는 경우 새로 삽입
        INSERT INTO tb_res_alr (resNum, count) 
        VALUES (:NEW.resNum, 1);  -- 첫 번째로 삽입하므로 count는 1
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;




drop trigger res_alr_trigger

CREATE OR REPLACE TRIGGER guest_alr_trigger
AFTER INSERT ON tb_appointment
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    -- resNum이 이미 존재하는지 확인
    SELECT count(*) INTO v_count
    FROM tb_guest_alr
    WHERE memUno = :NEW.memUno;

    IF v_count > 0 THEN
        -- 이미 존재하는 경우 count를 증가시킴
        UPDATE tb_guest_alr
        SET count = count
        WHERE memUno = :NEW.memUno;
    ELSE
        -- 존재하지 않는 경우 새로 삽입
        INSERT INTO tb_guest_alr (memUno, count) 
        VALUES (:NEW.memUno, 0);  -- 첫 번째로 삽입하므로 count는 1
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        RAISE;
END;



CREATE OR REPLACE TRIGGER guest_update_trigger
AFTER UPDATE OF A_status ON tb_appointment
FOR EACH ROW
WHEN (NEW.A_status IN ('예약 확정', '예약 취소'))
BEGIN
    UPDATE tb_guest_alr
    SET count = count + 1
    WHERE memUno = :NEW.memUno;
END;


ALTER TRIGGER guest_update_trigger COMPILE;
/
select * from tb_guest_alr;
delete from tb_res_alr where count is null;
select * from tb_guest_alr;
select * from tb_res_alr;

drop trigger guest_update_trigger

ALTER TRIGGER HAPPY.GUEST_ALR_TRIGGER COMPILE;



