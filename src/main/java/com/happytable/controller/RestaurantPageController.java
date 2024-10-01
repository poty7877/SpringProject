package com.happytable.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.core.pattern.AbstractStyleNameConverter.Red;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happytable.domain.MenuImageVO;
import com.happytable.domain.MenuPageDTO;
import com.happytable.domain.MenuVO;
import com.happytable.domain.OperationsVO;
import com.happytable.domain.RestaurantVO;
import com.happytable.domain.SalesVO;
import com.happytable.service.MenuImageService;
import com.happytable.service.MenuService;
import com.happytable.service.OperationsService;
import com.happytable.service.RestAlrService;
import com.happytable.service.RestaurantService;
import com.happytable.service.SalesService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j2
@SessionAttributes("loginResNum") // session객체에 저장될 내용(사용자 이름, 고유번호, 로그인 여부)
@RequestMapping("/restaurant/*")
@AllArgsConstructor
public class RestaurantPageController { // jsp 페이지를 불러오는 경로만 정의

	private RestaurantService serviceRest;
	private OperationsService serviceOper;
	private SalesService serviceSal;
	private MenuService serviceMenu;
	private MenuImageService serviceMimg;

	@GetMapping({ "/register", "/delrest" }) // http://localhost/restaurant/register
	public void register() {
		log.info("RestaurantController.register() 실행-------");
	}

	// 회원가입
	@PostMapping("/register")
	public String regiRest(RestaurantVO rest, RedirectAttributes rttr) {
		String result = "";
		int cnt = serviceRest.register(rest);
		if (cnt == 1) { // 등록성공
			result = "redirect:/restaurant/restlogin";
			rttr.addFlashAttribute("result", "success");
		} else {
			result = "redirect:/restaurant/register";
			rttr.addFlashAttribute("result", "error");
		}

		return result;
	}

	@PostMapping("/login") // member 페이지 로그인용
	public String login(RestaurantVO rest, Model model, RedirectAttributes rttr, HttpSession session) { // req : 세션생성용
		String id = rest.getResID();
		String pw = rest.getResPW();
		log.info("test : 로그인 계정:" + id + "/" + pw);
		int check = serviceRest.loginChech(id, pw);

		if (check == 1) { // 계정있으면
			String resNum = serviceRest.login(id, pw);
			RestaurantVO restVO = serviceRest.get(resNum);
			// session생성
			session.setAttribute("loginMember2", restVO);// 레스토랑 이름
			rttr.addFlashAttribute("loginRes", restVO.getResName());
			session.setAttribute("loginResNum", restVO.getResNum()); // resNum
			model.addAttribute("loginResNum", restVO.getResNum());
			session.setAttribute("loggedIn2", true);

			return "redirect:/";
		} else {
			rttr.addFlashAttribute("loginError", "아이디와 비밀번호를 확인하세요");
			return "redirect:/member/login";
		}

	}

	@GetMapping("/restlogin") // http://localhost/restaurant/restlogin
	public void restlogin() {
		log.info("RestaurantController.restlogin() 실행-------");
	}

	// 레스토랑 로그인->마이페이지 **09/28 파일추가로 수정
	@GetMapping("/myrestaurant")
	public void getPostAllInfo(@ModelAttribute("loginResNum") String resNum, Model model) {
		log.info("test : 받은 resnum:" + resNum);
		RestaurantVO myrest = serviceRest.get(resNum); // **09/19수정->restaurant_tb의 cnt 결과만으로 판단하도록
		int opercnt = myrest.getCntOper();
		int salCnt = myrest.getCntTable();
		int menuCnt = myrest.getCntMenu();
		OperationsVO oper = null;
		MenuPageDTO menufile = new MenuPageDTO();// 일단 빈객체로 세팅
		menufile.setMenus(null);
		menufile.setMImgs(null);
		menufile.setMenuCnt(0);
		// List<MenuVO> menus = null;
		List<SalesVO> tables = null;
		String uploaFolder = "D:\\upload\\";

		if (opercnt != 0) {
			oper = serviceOper.get(resNum);
		}
		if (menuCnt != 0) {

			menufile = serviceMenu.getMenuList(resNum);
			menufile.setMenuCnt(serviceMenu.countMenu(resNum));
			log.info("test menu개수count:" + serviceMenu.countMenu(resNum)); // test menu개수count:0
			menufile.setMImgs(serviceMimg.getImgList(resNum));
			// menus = serviceMenu.getList(resNum);
		}
		if (salCnt != 0) {
			tables = serviceSal.getList(resNum);
		}

		model.addAttribute("myrest", myrest);
		model.addAttribute("oper", oper);
		model.addAttribute("sales", tables);
		model.addAttribute("menus", menufile.getMenus());
		model.addAttribute("menuCnt", menufile.getMenuCnt());
		model.addAttribute("menuimgs", menufile.getMImgs());
		model.addAttribute("upath", uploaFolder);

		log.info("test : 보낼 menu개수:" + menufile.getMenuCnt());
	}

	// reginfo-영업정보 페이지
	@GetMapping("/reginfo") // http://localhost/restaurant/reginfo
	public void reginfo() {
		log.info("영업정보등록 get() 실행-------");
	}

	@PostMapping("/reginfo")
	public String regPostInfo(OperationsVO oper, Model model) {
		log.info("영업정보등록 post() 실행-------");
		log.info("받은 영업정보 test: " + oper);
		boolean result = serviceOper.register(oper); // **09/14수정-rest tb에 개수 동시등록
		String resNum = oper.getResNum();
		if (result) {
			oper.setReg(true);
			model.addAttribute("oper", serviceOper.get(resNum));
			return "redirect:/restaurant/myrestaurant";
		} else {
			oper.setReg(false);
			return "redirect:/restaurant/reginfo";
		}
	}

	// 테이블 정보 등록 페이지
	@GetMapping("/regtable") // http://localhost/restaurant/reginfo
	public void regtable() {
		log.info("테이블정보등록 get() 실행-------");

	}

	@PostMapping("/regtablesuccess")
	public String regPostTable(SalesVO table, Model model) {
		log.info("테이블정보등록 post() 실행-------");
		log.info("받은 테이블정보 resNum: " + table.getResNum()); // test : 받은 resnum:resNum=10000014kkk
		String resNum = table.getResNum();
		model.addAttribute("sales", serviceSal.getList(resNum));
		return "redirect:/restaurant/myrestaurant";
	}

	// U-기본정보 변경
	@PostMapping("/modrest")
	public String modRest(RestaurantVO rest, RedirectAttributes rttr) {
		log.info("기본정보변경 실행-------" + rest.getResNum());
		boolean result = serviceRest.modify(rest);
		if (result) { // 변경성공시
			rttr.addFlashAttribute("result", "success");

		} else {
			rttr.addFlashAttribute("result", "변경오류. 관리자에게 문의하세요.");
		}
		log.info("rttr:" + rttr.getFlashAttributes()); // rttr:{result=success}

		return "redirect:/restaurant/myrestaurant";
	}

	// U-영업정보 변경
	@PostMapping("/modoper")
	public String modOper(OperationsVO oper, RedirectAttributes rttr) {
		log.info("영업정보변경 실행-------" + oper.getResNum());
		boolean result = serviceOper.modify(oper);
		if (result) { // 변경성공시
			rttr.addFlashAttribute("result", "success");

		} else {
			rttr.addFlashAttribute("result", "변경오류. 관리자에게 문의하세요.");
		}
		log.info("rttr:" + rttr.getFlashAttributes()); // rttr:{result=success}

		return "redirect:/restaurant/myrestaurant";
	}

	// D-영업정보 삭제
	@PostMapping("/deloper")
	public String delOper(OperationsVO oper, RedirectAttributes rttr) {
		log.info("영업정보삭제 실행-------" + oper.getResNum());
		boolean result = serviceOper.remove(oper.getResNum());
		if (result) { // 삭제성공시
			rttr.addFlashAttribute("result", "delsuccess");

		} else {
			rttr.addFlashAttribute("result", "삭제오류. 관리자에게 문의하세요.");
		}
		log.info("rttr:" + rttr.getFlashAttributes()); // rttr:{result=success}

		return "redirect:/restaurant/myrestaurant";
	}

	// 메뉴등록 페이지(리스트)
	@GetMapping("/menulist") // http://localhost/restaurant/menulist
	public void menulist(@ModelAttribute("loginResNum") String resNum, Model model) {
		log.info("메뉴리스트 get() 실행-------" + resNum);
		MenuPageDTO menus = serviceMenu.getMenuList(resNum);
		menus.setMenuCnt(serviceMenu.countMenu(resNum));
		menus.setMImgs(serviceMimg.getImgList(resNum));
		// String uploaFolder = "D:\\upload\\";
		model.addAttribute("menus", menus.getMenus());
		model.addAttribute("menuCnt", menus.getMenuCnt());
		model.addAttribute("menuimgs", menus.getMImgs());
		// model.addAttribute("upath", uploaFolder);
	}

	// 메뉴등록 페이지(단일메뉴) -페이지 연결
	@GetMapping("/regmenu")
	public void regmenu() {
		log.info("단일메뉴등록 get() 실행-------");
	}

	// 메뉴 상세보기 페이지---**이미지 파일 없는 버전
	@GetMapping("/getmenu")
	public void getmenu(@RequestParam("menuNum") int menuNum, Model model) {
		log.info("메뉴상세보기 실행-------" + menuNum);
		model.addAttribute("menu", serviceMenu.get(menuNum));
	}

	// 메뉴 수정 ---**이미지 파일 없는 버전 -->사용안함
	@PostMapping("/modmenu")
	public String modifyMenu(MenuVO menu, RedirectAttributes rttr) {
		log.info("메뉴수정하기 실행-------" + menu);

		if (serviceMenu.modify(menu)) {
			rttr.addFlashAttribute("result", "success");
		} else {
			rttr.addFlashAttribute("result", "error");
		}

		return "redirect:/restaurant/myrestaurant";
	}

	// 메뉴삭제 ---**이미지 파일 없는 버전-->사용안함
	@PostMapping("/delmenu")
	public String deleteMenu(MenuVO menu, RedirectAttributes rttr) {
		log.info("메뉴삭제하기 실행-------" + menu);
		boolean rst = serviceMenu.remove(menu);
		if (rst) {
			rttr.addFlashAttribute("result", "delsuccess");
		} else {
			rttr.addFlashAttribute("result", "error");
		}

		return "redirect:/restaurant/myrestaurant";
	}

	// 메뉴등록 페이지(단일메뉴-이미지 등록 포함) -페이지 연결 **0925
	@GetMapping("/regmenufile")
	public void regmenufile() {
		log.info("단일메뉴 이미지등록 get() 실행-------");
	}

	// 메뉴이미지 미리보기 불러오기
	@GetMapping("/preimgview")
	@ResponseBody
	public ResponseEntity<byte[]> getPreview(String fileName) {
		log.info("파일명:" + fileName);
		String uploaFolder = "D:\\upload";
		File file = new File(uploaFolder + fileName);
		log.info("전체 파일경로 : " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			log.error(e.getMessage());
			// e.printStackTrace();
		}
		return result;
	}

	// 중복파일 방지 : 저장파일명 생성
	private String makeNewName(String originName) {
		String ext = originName.substring(originName.lastIndexOf(".")); // 확장자
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		return now + ext;

	}

	@PostMapping("/preimgsave")
	public void previewSave(MultipartFile preview, Model model) {
		String uploaFolder = "D:\\upload";
		log.info("------------------------");
		log.info("업로드 파일명 : " + preview.getOriginalFilename());
		log.info("업로드 파일크기 : " + preview.getSize());

		try {
			File savePreview = new File(uploaFolder, preview.getOriginalFilename());
			preview.transferTo(savePreview);
		} catch (IllegalStateException | IOException e) {
			log.error(e.getMessage());
			// e.printStackTrace();
		}
	}

	// 메뉴 상세보기 페이지---**0929 이미지 파일 포함
	@GetMapping("/getmenufile")
	public void getmenufile(@RequestParam("menuNum") int menuNum, Model model) {
		log.info("메뉴상세보기 실행-------" + menuNum);
		model.addAttribute("menu", serviceMenu.get(menuNum));
		model.addAttribute("menuImg", serviceMimg.getImage(menuNum));
	}

///////////////////////////////////////////////////////////////////////////////////////////////////

	@GetMapping("/get")
	// URL : http://localhost:/restaurant/get?resNum=
	public void get(@RequestParam("resNum") String resNum, Model model) {
		log.info(resNum);
		MenuPageDTO menufile = new MenuPageDTO();// 일단 빈객체로 세팅
		menufile = serviceMenu.getMenuList(resNum);
		menufile.setMenuCnt(serviceMenu.countMenu(resNum));
		log.info("test menu개수count:" + serviceMenu.countMenu(resNum)); // test menu개수count:0
		menufile.setMImgs(serviceMimg.getImgList(resNum));
		// 모델영역에 식당기본정보, 가게정보, 메뉴리스트 저장
		model.addAttribute("resVO", serviceRest.get(resNum));
		model.addAttribute("operVO", serviceOper.get(resNum));
		model.addAttribute("menus", menufile.getMenus());
		model.addAttribute("menuCnt", menufile.getMenuCnt());
		model.addAttribute("menuimgs", menufile.getMImgs());
		
	}

	// 2024-09-24 용상엽 추가
	@PostMapping("/delrest")
	public String delrest(HttpSession session, @RequestParam("resID") String resID, @RequestParam("resPW") String resPW,
			@RequestParam("co_Num") String co_Num, RedirectAttributes rttr, Model model, MenuVO menu) {

		RestaurantVO resVO = (RestaurantVO) session.getAttribute("loginMember2");
		String resNum = resVO.getResNum();
		String id = resVO.getResID();
		String pw = resVO.getResPW();
		String num = resVO.getCo_Num();

		if (id.equals(resID) && pw.equals(resPW) && num.equals(co_Num)) {
			;

			serviceMenu.removeAll(resNum);
			serviceOper.remove(resNum);
			serviceSal.removeAll(resNum);
			boolean count = serviceRest.remove(resNum);
			if (count) {
				rttr.addFlashAttribute("result7", "회원탈퇴가 완료되었습니다.</br>감사합니다.");
				session.removeAttribute("loginMember2");
				session.removeAttribute("loginResNum");
				session.removeAttribute("loggedIn2");
				session.invalidate();
				return "redirect:/";
			} else {
				rttr.addFlashAttribute("error", "입력오류 : 정보를 확인하세요");
				return "redirect:/restaurant/delrest";
			}

		} else {
			rttr.addFlashAttribute("error", "입력오류 : 정보를 확인하세요");
			return "redirect:/restaurant/delrest";
		}

	}
}
