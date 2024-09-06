package com.happytable.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happytable.domain.RestaurantVO;
import com.happytable.service.RestaurantService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/restaurant/*")
@AllArgsConstructor
public class RestaurantPageController { // jsp 페이지를 불러오는 경로만 정의

	private RestaurantService serviceRest;

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

	@GetMapping("regmenu") // http://localhost/restaurant/regmenu
	public void regmenu() {
		log.info("RestaurantController.regmenu() 실행-------");
	}

	@GetMapping("/myinfo") // http://localhost/restaurant/myinfo
	public void myinfo() {
		log.info("RestaurantController.myinfo() 실행-------");
	}

	@GetMapping("/myoper") // http://localhost/restaurant/myoper
	public void myoper() {
		log.info("RestaurantController.myoper() 실행-------");
	}

	@GetMapping("/mymenu") // http://localhost/restaurant/myoper
	public void mymenu() {
		log.info("RestaurantController.mymenu() 실행-------");
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
		log.info("test : 로그인 계정:" + rest.getResID() + "/" + rest.getResPW());
		RestaurantVO loginRest = serviceRest.login(rest.getResID(), rest.getResPW());

		if (loginRest.getResNum() != null) {
			rttr.addFlashAttribute("result2", loginRest.getResName());
			model.addAttribute("loginMember", loginRest);
			model.addAttribute("loggedIn", true);
			return "redirect:/restaurant/myrestaurant";
		} else {
			rttr.addFlashAttribute("loginError", "아이디와 비밀번호를 확인하세요");
			return "redirect:/member/login";
		}
	}
	
	@PostMapping("/restlogin") //restaurant 페이지 로그인용
	public String restLogin(RestaurantVO rest, RedirectAttributes rttr, Model model) {
		log.info("test : 로그인 계정:" + rest.getResID() + "/" + rest.getResPW());
		RestaurantVO loginRest = serviceRest.login(rest.getResID(), rest.getResPW());

		if (loginRest.getResNum() != null) {
			rttr.addFlashAttribute("result2", loginRest.getResName());
			model.addAttribute("loginMember", loginRest);
			model.addAttribute("loggedIn", true);
			return "redirect:/restaurant/myrestaurant";
		} else {
			rttr.addFlashAttribute("loginError", "아이디와 비밀번호를 확인하세요");
			return "redirect:/restaurant/restlogin";
		}
	}

	// 마이페이지
	@GetMapping("/myrestaurant")
	public void getAllInfo(@ModelAttribute("loginMember") RestaurantVO rest, Model model) {
		log.info("test : 보여줄 식당명:" + rest.getResNum() + "/" + rest.getResName());
		String resnum = rest.getResNum();
		serviceRest.getAllInfo(resnum);
		model.addAttribute("myrest", resnum);
	}

}
