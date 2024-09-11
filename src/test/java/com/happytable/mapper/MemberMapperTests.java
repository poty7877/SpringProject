package com.happytable.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.happytable.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Log4j2
public class MemberMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Test
	public void allSelectTest() {
		log.info("allSelectTest=====================");
		mapper.allSelect();
		
	}

	@Test
	public void insertTest() {
		MemberVO memberVO = new MemberVO();
		memberVO.setName("asd");
		memberVO.setPw("asdasd");
		memberVO.setPhone("asd-1234-1234");
		memberVO.setEmail("asd@naver.com");
		memberVO.setNickName("asd");
		memberVO.setBirth("asd");
		mapper.insert(memberVO);
		log.info(memberVO);
	}
	
	@Test
	public void select() {
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail("poty7877@naver.com");
		memberVO.setPw("1234");
		mapper.select(memberVO);
		log.info(memberVO);
	}
	
	@Test
	public void update() {
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail("poty7877@naver.com");
		memberVO.setPw("1234");
		MemberVO newMemberVO = mapper.select(memberVO);
		newMemberVO.setEmail("kuc00623@gmail.com");
		newMemberVO.setNickName("용상용");
		mapper.update(newMemberVO);
	}
	
	@Test
	public void delete() {
		mapper.delete(50L);
	}

}
