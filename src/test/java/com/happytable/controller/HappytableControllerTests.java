package com.happytable.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j2
public class HappytableControllerTests {
		
	
		@Setter(onMethod_ = { @Autowired })
		private WebApplicationContext ctx;

		private MockMvc mockMvc;

		@Before
		public void setup() {
			this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		}
		@Test
		public void testList() throws Exception{
			
			log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/order/list")
						.param("resNum", "1")
						.param("memUno", "")
						.param("a_No", ""))
				.andReturn().getModelAndView().getModelMap());
				
			
		}
		
		@Test
		public void testInsert() throws Exception{
			
			String resultPage = mockMvc
					.perform(MockMvcRequestBuilders.post("/order/insert")
					.param("resNum", "1")
					.param("memUno", "2")
					.param("a_Status", "예약 중")
					.param("a_Date", "2000-01-03"))
					.andReturn().getModelAndView().getViewName();
						
			log.info(resultPage);
		}
		
		@Test
		public void testUpdate() throws Exception{
			String resultPage = mockMvc
					.perform(MockMvcRequestBuilders.post("/order/update")
					.param("a_Status", "예약 확인")
					.param("a_Date", "2000-01-04")
					.param("a_No", "34653258"))
					.andReturn().getModelAndView().getViewName();
						
			log.info(resultPage);
		}
		
		@Test
		public void testDelete() throws Exception{
			String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/order/delete")
					.param("a_No", "13827672")).andReturn()
					.getModelAndView().getViewName();
			
			log.info(resultPage);

		}

	}





