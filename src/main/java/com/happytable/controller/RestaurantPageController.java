package com.happytable.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	@GetMapping("/restlogin") // http://localhost/restaurant/login
	public void login() {
		log.info("RestaurantController.restlogin() 실행-------");
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

	@PostMapping("/login") // member 페이지 로그인용
	public String login(RestaurantVO rest, RedirectAttributes rttr, Model model, HttpSession session) {
		String id = rest.getResID();
		String pw = rest.getResPW();
		log.info("test : 로그인 계정:" + id + "/" + pw);
		int check = serviceRest.loginChech(id, pw);

		if (check == 1) { // 계정있으면
			String resNum = serviceRest.login(id, pw);
			RestaurantVO restVO = serviceRest.get(resNum);
			rttr.addFlashAttribute("result2", restVO.getResName());
			session.setAttribute("loginMember2", restVO);
			session.setAttribute("loggedIn2", true);
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("loginError", "아이디와 비밀번호를 확인하세요");
			return "redirect:/member/login";
		}

	}

	// 레스토랑 로그인->마이페이지
	@GetMapping("/myrestaurant")
	public void getPostAllInfo(@ModelAttribute RestaurantVO rest, Model model, RedirectAttributes rttr) {
		String resNum = rest.getResNum();
		log.info("test : 받은 resnum:" + resNum);
		int opercnt = serviceOper.countOper(resNum);
		int salCnt = serviceSal.countTable(resNum);
		int menuCnt = serviceMenu.countMenu(resNum);
		OperationsVO oper = null;
		List<MenuVO> menus = null;
		List<SalesVO> tables = null;
		RestaurantVO myrest = serviceRest.get(resNum);

		if (opercnt != 0) {
			oper = serviceOper.get(resNum);
			oper.setRegCnt(opercnt);
		}
		if (menuCnt != 0) {
			menus = serviceMenu.getList(resNum);
		}
		if (salCnt != 0) {
			tables = serviceSal.getList(resNum);
		}

		model.addAttribute("myrest", myrest);
		model.addAttribute("oper", oper);
		model.addAttribute("sales", tables);
		model.addAttribute("menus", menus);
		rttr.addAttribute("resNum", resNum);

	}

	// reginfo-영업정보 페이지
	@GetMapping("/reginfo") // http://localhost/restaurant/reginfo
	public void reginfo() {
		log.info("영업정보등록 get() 실행-------");
	}

	@PostMapping("/reginfo")
	public String regPostInfo(OperationsVO oper, RedirectAttributes rttr) {
		log.info("영업정보등록 post() 실행-------");
		log.info("받은 영업정보 test: " + oper);
		int result = serviceOper.register(oper);
		if (result == 1) {
			oper.setReg(true);
			return "redirect:/restaurant/myrestaurant";
		} else {
			oper.setReg(false);
			rttr.addFlashAttribute("error", "가입오류. 관리자에게 문의하세요.");
			return "redirect:/restaurant/reginfo";
		}
	}

	// 테이블 정보 등록 페이지
	@GetMapping("/regtable") // http://localhost/restaurant/reginfo
	public void regtable(@ModelAttribute("resNum") String resNum) {
		log.info("테이블정보등록 get() 실행-------");
	}

	// 메뉴등록 페이지
	@GetMapping("/regmenu") // http://localhost/restaurant/reginfo
	public void regmenu(@ModelAttribute("resNum") String resNum) {
		log.info("메뉴등록 get() 실행-------");
	}
///////////////////////////////////////////////////////////////////////////////////////////////////

	@GetMapping("/get")
	public void get(@RequestParam("resNum") String resNum, Model model) {
		log.info(resNum);
		model.addAttribute("resVO", serviceRest.get(resNum));
		model.addAttribute("operVO", serviceOper.get(resNum));
		model.addAttribute("menuList", serviceMenu.getList(resNum));
	}
}
