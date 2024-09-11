package com.happytable.service;

import static org.junit.Assert.assertNotNull;

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
public class HappyTableServiceTests {
	
	@Setter(onMethod_= @Autowired)
	private A_Service as;
	
	@Test
	public void testExist() {
		
		log.info(as);
		assertNotNull(as);
	}
	
	@Test
	public void testInsert() {
		A_VO appoint = new A_VO();
		appoint.setA_Date("2024-09-09");
		appoint.setMemUno("3");
		appoint.setResNum("3");
		appoint.setA_Status("예약중");
		appoint.setA_NOP(3);
		
		as.insert(appoint);
		
		log.info("생성된 게시물의 갯수 : " + appoint.getMemUno());
	}
	
	@Test
	public void testRead() {
		A_VO appoint = new A_VO();
		appoint.setMemUno("3");
		
		log.info(as.read(appoint));
	}
	
	@Test
	public void tesdDelete() {
		log.info(as.delete("77911929"));
	}

}
