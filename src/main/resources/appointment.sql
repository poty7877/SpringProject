create table tb_appointment (
  resNum varchar2(20) not null,
  memUno varchar2(200) not null,
  A_Date varchar2(20) unique not null,
  A_NOP int not null,
  A_Status varchar2(20) not null,
  A_No varchar2(20) primary key,
  A_regDate date default sysdate,
  A_updateDate date default sysdate,
  A_note varchar2(2000)
);

alter table tb_appointment add A_adPay number(10);

select * from tb_appointment;
drop table tb_appointment;

create table tb_A_Menu (
	A_No varchar2(20) not null,
	menuName varchar2(20) not null,
	menuQuantity int not null,
	constraint fk_tb_A_Menu foreign key (A_no) references tb_appointment (A_no)
	on delete cascade
	
);

drop table tb_A_Menu;
alter table tb_A_Menu add constraint fk_tb_A_Menu foreign key (A_no) references tb_appointment (A_no);

create sequence seq_tb_appointment
START WITH 10000000
INCREMENT BY 1
MINVALUE 10000000
MAXVALUE 99999999
CYCLE
CACHE 20;


CREATE OR REPLACE TRIGGER trg_A_No_insert_tb_appointment
BEFORE INSERT ON tb_appointment
FOR EACH ROW
DECLARE
    v_random NUMBER;
    v_count NUMBER;
BEGIN
    LOOP
        v_random := TRUNC(DBMS_RANDOM.VALUE(10000000, 99999999));
        SELECT COUNT(*)
        INTO v_count
        FROM tb_appointment
        WHERE A_No = v_random;

        EXIT WHEN v_count = 0;
    END LOOP;

    :NEW.A_No := v_random;
END;

insert into tb_appointment (resNum, memUno, A_Date, A_NOP, A_Status, A_note, A_adPay)
		values ('1', '1', '2020/08/07', '1', '예약 중', '', '1000');
		
select * from tb_appointment; where A_No=13827672 or resNum=null or memUno=null;

update tb_appointment set A_Date='2020/08/08', A_NOP='2', A_Status='예약 중', A_note='버섯 빼주세요' where A_No=69169290;

delete from tb_appointment where A_No=69169290;

insert into tb_A_Menu (A_no, menuName, MenuQuantity) values (13827672, '디너세트C', '2');
		
select * from tb_A_Menu;
drop table tb_A_Menu;

delte from tb_A_Menu where A_no="";

update tb_A_Menu set
		MenuQuantity=3 where A_No=13827672 and MenuName='디너세트C'
		
		
select * from tb_appointment where resNum = NULL or memUno = '2' or A_No = Null;

insert into tb_oper
(resNum, openTime, endTime, adPay, adPayCond, dayoff_cate, dayoff_weekCnt, dayoff_Day, breakTime, breakTime_start, breakTime_end)
values ('10000002test', to_date('1000','HH24:MI')+1, to_date('1800', 'HH24:MI')+1,100000, 10, 'M' , '1 , 3', '일' , 0, '-', '-'); 

select*from tb_restaurant;

update tb_OPER set opentime='10:00', endtime='22:00' where resnum='10000002tes';
select * from tb_Sales;

select * from tb_sales;
insert into tb_sales (resnum, tablenum, tabletype, headcount)
		values ( '10000002tes', '3', '4인용', '12');

insert into tb_sales (resnum, tablenum, tabletype, headcount)
		values ( '10000002tes', '6', '2인용', '12');
		
insert into tb_sales (resnum, tablenum, tabletype, headcount)
		values ( '10000002tes', '2', '룸(10인)', '10');		

delete from tb_sales where headcount=3;