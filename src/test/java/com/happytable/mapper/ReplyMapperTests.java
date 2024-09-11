package com.happytable.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.happytable.domain.Criteria;
import com.happytable.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2

public class ReplyMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		
		ReplyVO vo = new ReplyVO();
		
		vo.setBno(1L);
		vo.setReply("매퍼댓글테스트");
		vo.setReplyer("매퍼 맛집");
		log.info(vo);
		mapper.insert(vo);
		
	}

	@Test
	public void testRead() {
		
		Long targetRno = 1L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info("select + rno : " + vo);
		
	}
	
	@Test
	public void testUpdate() {
		
		Long targetRno = 1L;
		ReplyVO vo = mapper.read(targetRno); // 10번 객체를 가져와!! 게시물을 수정하려면 일단 불러와야하므로.
		
		vo.setReply("매퍼로 수정 테스트");
		int count = mapper.update(vo); // 수정된 객체를 넣고 결과를 받음.
		
		log.info("수정된 카운트 : " + count);
		log.info("수정된 객체 : " + vo);
		// INFO  org.zerock.mapper.ReplyMapperTests(testUpdate67) - 수정된 카운트 : 1
		// INFO  org.zerock.mapper.ReplyMapperTests(testUpdate68) - 수정된 객체 : ReplyVO(rno=10, bno=11, reply=매퍼로 수정 테스트, replyer= kkw, replyDate=Tue Aug 27 10:53:07 KST 2024, updateDate=Tue Aug 27 12:06:21 KST 2024)
	}
	
	@Test
	public void testDelete() {
		
		Long targetRno = 1L;
		//mapper.delete(targetRno);
		
		log.info("삭제 후 결과 : " + mapper.delete(targetRno));
	}
	
	// 번호를 이용한 객체가 리스트로 나옴
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		// INFO  org.zerock.mapper.ReplyMapperTests(testList88) - Criteria : Criteria(pageNum=1, amount=10, type=null, keyword=null)
		
		log.info("Criteria : " + cri);
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 10L);
		
		replies.forEach(reply -> log.info(reply));
		// INFO  org.zerock.mapper.ReplyMapperTests(lambda$092) - ReplyVO(rno=14, bno=10, reply=댓글10, replyer= kkw, replyDate=Tue Aug 27 10:54:22 KST 2024, updateDate=Tue Aug 27 10:54:22 KST 2024)
		// INFO  org.zerock.mapper.ReplyMapperTests(lambda$092) - ReplyVO(rno=21, bno=10, reply=댓글10, replyer= kkw, replyDate=Tue Aug 27 10:54:42 KST 2024, updateDate=Tue Aug 27 10:54:42 KST 2024)
		 
	}
	
	@Test
	public void testList2() {
		
		Criteria cri = new Criteria(2,10);
		
		//13L
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 13L);
		
		replies.forEach(reply -> log.info(reply));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
