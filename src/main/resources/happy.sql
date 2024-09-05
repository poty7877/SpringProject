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