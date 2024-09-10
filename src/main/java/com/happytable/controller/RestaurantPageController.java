package com.happytable.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happytable.domain.MenuVO;
import com.happytable.domain.OperationsVO;
import com.happytable.domain.RestaurantVO;
import com.happytable.domain.SalesVO;
import com.happytable.service.MenuService;
import com.happytable.service.OperationsService;
import com.happytable.service.RestaurantService;
import com.happytable.service.SalesService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/restaurant/*")
@AllArgsConstructor
public class RestaurantPageController { // jsp 페이지를 불러오는 경로만 정의

	private RestaurantService serviceRest;
	private OperationsService serviceOper;
	private SalesService serviceSal;
	private MenuService serviceMenu;

	@GetMapping("/register") // http://localhost/restaurant/register
	public void register() {
		log.info("RestaurantController.register() 실행-------");
	}

	@GetMapping("/restlogin") // http://localhost/restaurant/login public void
	public void login() { log.info("RestaurantController.restlogin() 실행-------"); }

	@GetMapping("/reginfo") // http://localhost/restaurant/reginfo
	public void reginfo() {
		log.info("RestaurantController.reginfo() 실행-------");
	}
	
	@GetMapping("/myrestaurant") // http://localhost/restaurant/myrestaurant
	public void myrestaurant() {
		log.info("RestaurantController.myrestaurant() 실행-------");
	}


	

	/*
	 * @GetMapping("/list") public void list(Model model) {
	 * model.addAttribute("list", serviceRest.getList()); log.info("list: " +
	 * model); }
	 */

	// 회원가입
	@PostMapping("/register")
	public String regiRest(RestaurantVO rest, RedirectAttributes rttr) {
		String result = "";
		int cnt = serviceRest.register(rest);
		if (cnt == 1) { // 등록성공
			result = "redirect:/restaurant/restlogin";
			rttr.addFlashAttribute("result", rest.getResNum());
		} else {
			result = "redirect:/restaurant/register";
			rttr.addFlashAttribute("error", "가입오류. 관리자에게 문의하세요.");
		}

		return result;
	}

	@PostMapping("/login") //member 페이지 로그인용
	public String login(RestaurantVO rest, RedirectAttributes rttr, Model model) {
		String id = rest.getResID();
		String pw = rest.getResPW();
		log.info("test : 로그인 계정:" + id + "/" + pw);
		int check = serviceRest.loginChech(id, pw);
		
		if(check == 1) { //계정있으면
			String resNum = serviceRest.login(id, pw);
			RestaurantVO restVO = serviceRest.get(resNum);
			rttr.addFlashAttribute("result2", restVO.getResName());
			model.addAttribute("loginMember", restVO);
			model.addAttribute("loggedIn", true);
			return "redirect:/";
		}else {
			rttr.addFlashAttribute("loginError", "아이디와 비밀번호를 확인하세요");
			return "redirect:/member/login";
		}
		
	}
	
	
	//레스토랑 로그인->마이페이지
	@PostMapping("/myrestaurant")
	public String getPostAllInfo(@ModelAttribute RestaurantVO rest, Model model) {
		String resNum = rest.getResNum();
		rest = serviceRest.get(resNum);
		int opercnt = serviceOper.countOper(resNum);
		int salCnt = serviceSal.countTable(resNum);
		int menuCnt = serviceMenu.countMenu(resNum);
		OperationsVO oper = null;
		List<MenuVO> menus = null;
		List<SalesVO> tables = null;
		
		log.info("test : 받은 resnum:" + resNum);		
		
		if(opercnt !=0) {
			oper = serviceOper.get(resNum);
			oper.setRegCnt(opercnt);
		}
		if(menuCnt !=0) {
			menus = serviceMenu.getList(resNum);
		}
		if(salCnt !=0) {
			tables = serviceSal.getList(resNum);
		}
		
		model.addAttribute("myrest", rest);
		model.addAttribute("oper", oper);
		model.addAttribute("sales", tables);
		model.addAttribute("menus", menus);
		
		return "redirect:/restaurant/myrestaurant";
	}
	
	
	

}
