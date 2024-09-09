package com.happytable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
	

	
	//아이디 중복체크
	@PostMapping(value ="/idcheck", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> idCheck(@RequestBody RestaurantVO vo) {
		String resID = vo.getResID();
		log.info("받은 아이디 : "+resID);
		int cnt = serviceRest.idcheck(resID);
		log.info("중복검색결과 : "+cnt);		

		return (cnt>0)? new ResponseEntity<>("false", HttpStatus.OK) :
			new ResponseEntity<>("true", HttpStatus.OK);
		//0개보다 많이 검색되면 false 값을 result로 보낸다.
	}
	
	
	//로그인(restlogin)
	@PostMapping(value = "/restlogin", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> restAjaxLogin(@RequestBody RestaurantVO rest){
		String id = rest.getResID();
		String pw = rest.getResPW();
		log.info("test : 로그인 계정:" + id + "/" + pw);
		int check = serviceRest.loginChech(id, pw);
		
		if(check == 1) {
			String resNum = serviceRest.login(rest.getResID(), rest.getResPW());
			log.info("resNum" + resNum);
			return new ResponseEntity<>(resNum, HttpStatus.OK);
		}else {
			String resNum = "NotFoundAccount";
			log.info("resNumTest" + resNum);
			return new ResponseEntity<>(resNum, HttpStatus.OK); //204(콘텐츠 없음)
		}
		
	}
	

	
	

}
