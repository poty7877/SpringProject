package com.happytable.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happytable.domain.MemberVO;
import com.happytable.domain.RestaurantVO;
import com.happytable.service.GuestAlrService;
import com.happytable.service.MemberService;
import com.happytable.service.RestAlrService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor
@Controller
@RequestMapping("/member/*")
public class MemberController {

	// 랜덤글자 생성시에 사용할 글자들 입력
	private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcde"
			+ "fghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+[]{}|;:',.<>?/";
	// 랜덤글자의 최대 길이
	private static final int LENGTH = 10;
	// 랜덤 변수
	private static Random random = new Random();

	// 랜덤한 글자를 생성하는 메서드
	public static String generateRandomString() {
		// Length 길이만큼의 StringBuilder 생성
		StringBuilder sb = new StringBuilder(LENGTH);
		// i가 length보다 작을때
		for (int i = 0; i < LENGTH; i++) {
			// Character에서 랜덤한 인덱스 선택
			int index = random.nextInt(CHARACTERS.length());
			// 선택한 인덱스를 sb에 추가
			sb.append(CHARACTERS.charAt(index));
		}
		// 완성된 랜덤 문자열 반환
		return sb.toString();
	}

	private MemberService service;
	private GuestAlrService gaservice;
	private RestAlrService raservice;

	@GetMapping({ "/join", "/login", "/modify", "/remove", "/findID", "/findPW", "/changePw" })
	public void show() {

	}

	@PostMapping("/join") // URL : http://localhost/member/join
	public String join(MemberVO memberVO, RedirectAttributes rttr, Model model) {
		log.info(memberVO); // memberVO 로그
		model.addAttribute("memberVO", memberVO); // model 영역에 memberVO라는 이름으로 memberVO 객체 추가
		service.join(memberVO); // 회원가입 메서드 실행
		rttr.addFlashAttribute("mno", memberVO.getMno()); // 홈으로 redirect할때 멤버의 Mno를 가져감
		rttr.addFlashAttribute("result1", memberVO.getNickName()); // 홈으로 redirect할때 멤버의 NickName을 가져감
		return "redirect:/"; // 홈으로 redirect
	}

	@PostMapping("/login") // URL : http://localhost/member/login
	public String login(MemberVO memberVO, Model model, RedirectAttributes rttr, HttpSession session) {
		MemberVO loginMember = service.login(memberVO); // 로그인 메서드 실행 (id,pw로 객체찾기)
		if (loginMember != null) { // 일치하는 객체가 있어, loginMember가 null이 아니면,

			rttr.addFlashAttribute("result2", loginMember.getNickName()); // 홈으로 redirect할때 멤버의 NickName을 가져감
			session.setAttribute("loginMember", loginMember); // 세션에 loginMember객체를 추가
			session.setAttribute("loggedIn", true); // 세션에 로그인한 상태를 유지하는 값 추가

		} else { // 일치하는 객체가 없어 loginMember가 null이면
			rttr.addFlashAttribute("loginError", "이메일,비밀번호 입력오류."); // member/login으로 redirect할때 에러메시지 가져감
			return "redirect:/member/login"; // member/login으로 redirect
		}
		return "redirect:/"; // 홈으로 redirect
	}

	@PostMapping("/modify") // URL : http://localhost/member/modify
	public String modify(MemberVO memberVO, RedirectAttributes rttr, HttpSession session) {
		service.modify(memberVO); // 회원정보수정 메서드 실행
		rttr.addFlashAttribute("result3", "success"); // 홈으로 redirect할때 성공메시지 가져감
		session.setAttribute("loginMember", memberVO);
		// 세션에 loginMember의 객체가 저장되어있음, 그 정보를 수정된 정보로 업데이트
		return "redirect:/"; // 홈으로 redirect
	}

	@PostMapping("/findID") // URL : http://localhost/member/findID
	public String findID(MemberVO memberVO, RedirectAttributes rttr) {
		MemberVO findEmail = service.findID(memberVO); // 객체이용해서 ID찾는 메서드 실행
		if (findEmail == null) { // 정보가 일치하지않아 객체가 없으면,
			rttr.addFlashAttribute("FindError", "아이디와 핸드폰번호를 확인하세요"); // findID로 redirect 할때 에러메시지 가져감
			return "redirect:/member/findID"; // findID로 redirect
		} else { // 정보가 일치해서 객체를 찾았으면,
			rttr.addFlashAttribute("email", findEmail.getEmail()); // 홈으로 redirect 할때 id 가져감
			return "redirect:/"; // 홈으로 redirect
		}

	}

	@PostMapping("/findPW")
	public String findPW(MemberVO memberVO, RedirectAttributes rttr) {
		MemberVO findPw = service.findPW(memberVO); // 객체이용해서 PW찾는 메서드 실행
		String randomString = generateRandomString(); // 메서드를이용해 랜덤으로 10글자 생성하여 변수에 저장
		if (findPw == null) { // 정보가 일치하지않아 객체가 없으면,
			rttr.addFlashAttribute("FindError", "입력하신 정보를 다시 확인하세요"); // findPW로 redirect 할때 에러메시지 가져감
			return "redirect:/member/findPW"; // findPW로 redirect
		} else { // 정보가 일치해서 객체를 찾았으면,
			findPw.setPw(randomString); // 찾은 객체의 비밀번호를 랜덤 글자로 변경
			service.modify(findPw); // 메서드 이용해서 DB의 정보 변경
			rttr.addFlashAttribute("randomPW", randomString); // 홈으로 redirect할때 변경된 pw 가져감
			return "redirect:/"; // 홈으로 redirect
		}

	}

	@GetMapping("/all")
	public void all() {
		service.allRead();
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@PostMapping("/remove") // URL : http://localhost:/member/remove
	public String remove(@RequestParam("mno") Long mno, @RequestParam("email") String email,
			@RequestParam("pw") String pw, RedirectAttributes rttr, HttpSession session) {
		// 로그인한 객체를 세션에서 가져와 vo에 저장
		MemberVO vo = (MemberVO) session.getAttribute("loginMember");
		// 2차 인증을 위해 로그인한 객체의 id,pw를 새로운 변수에 저장
		String checkEm = vo.getEmail();
		String checkPw = vo.getPw();
		// 프론트화면에서 입력한 id,pw와 로그인한 객체의 id,pw정보가 일치하면
		if (email.equals(checkEm) && pw.equals(checkPw)) {
			service.remove(mno); // mno를 이용한 삭제 메서드 실행
			rttr.addFlashAttribute("result4", "success"); // 홈으로 redirect할때 success 메시지를 가져감
			// 회원탈퇴를 했으므로 세션초기화.(세션에 저장된 로그인멤버를 지우기 위함)
			session.invalidate();
			return "redirect:/"; // 홈으로 redirect

		} else { // 정보가 일치하지 않으면
			// member/remove로 redirect할때 error메시지를 가져감
			rttr.addFlashAttribute("loginError", "아이디와 비밀번호를 확인하세요");
			return "redirect:/member/remove"; // member/remove로 redirect
		}

	}



}
