package com.happytable.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.happytable.domain.Criteria;
import com.happytable.domain.PageDTO;
import com.happytable.domain.RestaurantVO;
import com.happytable.service.GuestAlrService;
import com.happytable.service.ReplyService;
import com.happytable.service.RestAlrService;
import com.happytable.service.RestaurantService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Log4j2
@AllArgsConstructor
@RequestMapping("/")
@Controller
public class HomeController {

	private RestaurantService serviceRest;
	private ReplyService reply;
	
	@GetMapping() // URL http://localhost/
	public String list(Criteria cri, Model model) {
		// Criteria, PageDTO는 페이징, 검색처리 위해 추가
		
		model.addAttribute("list", serviceRest.getList(cri)); 
		// 식당 리스트를 불러와 model 영역에 list라는 이름으로 전달
		int total = serviceRest.getTotal(cri); 
		// 식당의 갯수를 가져옴
		log.info("list: " + model);
		log.info("겟리스트 : " + serviceRest.getList(cri).size());
		model.addAttribute("pageMaker", new PageDTO(cri, total)); 
		// model 영역에 pageMaker라는 이름으로 PageDTO 전달
		List<RestaurantVO> result = new ArrayList<RestaurantVO>();
		result = serviceRest.getList(cri);
		
		for(int i = 0; i<result.size(); i++) {
			RestaurantVO res = new RestaurantVO();
			res = serviceRest.getList(cri).get(i);
			String resNum = res.getResNum();
			double ave = reply.getRatingAverage(resNum);
			res.setAve(ave);
			result.set(i, res);
		}
		
		result.sort(Comparator.comparingDouble(RestaurantVO::getAve).reversed());
		
		model.addAttribute("list", result); 

		return "home";
	}

	@GetMapping("/joinType")
	public void joinType() {

	}

}