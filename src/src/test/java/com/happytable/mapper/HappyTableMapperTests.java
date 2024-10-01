package com.happytable.mapper;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.happytable.domain.A_VO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class HappyTableMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private A_Mapper mapper;


	@Test
	public void testGetList() {
		A_VO appoint = new A_VO();
		appoint.setA_No("13827672");
		

		mapper.read(appoint);

	}

	@Test
	public void testInsert() {


			A_VO appoint = new A_VO();
			appoint.setMemUno("5");
			appoint.setResNum("5");
			appoint.setA_Date("2024-11-13");
			appoint.setA_Status("예약중");
			appoint.setA_NOP(2);
			mapper.insert(appoint);

			log.info(appoint.toString());

	}

	
	@Test
	public void testRead() {

		// 존재하는 게시물 번호로 테스트
		A_VO appoint = new A_VO();
		appoint.setMemUno("1");
		
		List<A_VO> appointResult = mapper.read(appoint);

		log.info(appointResult.toString());

	}

	@Test
	public void testDelete() {
				
		log.info("DELETE COUNT: " + mapper.delete(""));
				
	}

	@Test
	public void testUpdate() {

		A_VO appoint = new A_VO();
		// 실행전 존재하는 번호인지 확인할 것
		appoint.setA_Date("2024-09-03");
		appoint.setA_NOP(900);
		appoint.setA_Status("예약 cancle");
		appoint.setA_No("13827672");

		int count = mapper.update(appoint);
		log.info("UPDATE COUNT: " + count);

	}

}
