package com.happytable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happytable.domain.RestaurantVO;
import com.happytable.service.MenuService;
import com.happytable.service.OperationsService;
import com.happytable.service.RestaurantService;
import com.happytable.service.SalesService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/restaurant/*")
public class RestaurantController {
	@Setter(onMethod_ = @Autowired)
	private RestaurantService serviceRest;
	@Setter(onMethod_ = @Autowired)
	private OperationsService serviceOper;
	@Setter(onMethod_ = @Autowired)
	private SalesService serviceSal;
	@Setter(onMethod_ = @Autowired)
	private MenuService serviceMenu;
	


	@PostMapping("/register")
	public String registerRest(RestaurantVO rest, RedirectAttributes rttr) {
		String result = "";
		log.info("등록레스토랑 : " + rest);
		int insertCnt = serviceRest.register(rest);
		log.info("등록결과 : " + insertCnt);
		if(insertCnt==1) { //등록성공
			rttr.addFlashAttribute("result", rest.getResNum());
			result = "redirect:/restaurant/myrestaurant";
		} else { //가입실패
			rttr.addFlashAttribute("error", "가입오류. 관리자에게 문의하세요.");
			result = "redirect:/restaurant/register";
		}
		
		return result;
	}
	
	//아이디 중복체크
	@PostMapping("/idcheck")
	public String idCheck(String resID, RedirectAttributes rttr) {
		log.info("받은 아이디 : "+resID);
		int cnt = serviceRest.idcheck(resID);
		if(cnt>0) {//중복아이디 존재
			rttr.addFlashAttribute("result", false);
		}else {
			rttr.addFlashAttribute("result", true);
		}

		return "redirect:/restaurant/register";
	}

}
