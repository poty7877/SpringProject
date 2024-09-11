create table tb_board (
  bno number(10,0),
  title varchar2(200) not null,
  content varchar2(2000) not null,
  writer varchar2(50) not null,
  regdate date default sysdate, 
  updatedate date default sysdate
);

create sequence seq_board;

select * from tb_board;
delete from tb_board;
drop table tb_board;

alter table tb_board add constraint pk_board primary key(bno); 

insert into tb_board (bno, title, content, writer)
	values (seq_board.nextval, '댓글용 제목', '댓글용 내용', '맛집');

	------------------------------------------------------ 댓글용
create table tb_reply(
	rno number(10,0), --pk, 댓글번호
	bno number(10,0), --fk, 게시글 번호
	reply varchar2(1000) not null,  -- 댓글
	replyer varchar2(200) not null,  -- 댓글 작성자
	replyDate date default sysdate, -- 댓글 작성일
	updateDate date default sysdate -- 댓글 수정일
);

select * from tb_reply;
delete from tb_reply;
drop table tb_reply; 
drop sequence seq_reply; -- 자동 생성 번호 객체 삭제
insert into tb_reply (rno, bno, reply, replyer)
  			values(seq_reply.nextval, 1, 'asdasd', 'asdsad');
create sequence seq_reply; -- 댓글용 자동번호객체 추가

alter table tb_reply add constraint pk_reply primary key(rno);
-- pk를 rno로 지정(롤이름 : pk_reply)

alter table tb_reply add constraint fk_reply_board foreign key(bno) references tb_board(bno);

insert into tb_reply (rno, bno,reply, replyer)
	values(seq_reply.nextval, 1, '맛있어요. JMT','일단입에넣어');
insert into tb_reply (rno, bno,reply, replyer)
	values(seq_reply.nextval, 1, '강추강추 드셔보셈','지구최강먹보');	
insert into tb_reply (rno, bno,reply, replyer)
	values(seq_reply.nextval, 1, '너무 맛있어서 마셨어요','목말라요라면주세요');
insert into tb_reply (rno, bno,reply, replyer)
	values(seq_reply.nextval, 1, '멍멍멍멍멍멍멍멍멍멍','맛있으면짖는다');	

select * from tb_reply;