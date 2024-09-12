package com.happytable.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happytable.domain.MemberVO;
import com.happytable.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import oracle.jdbc.proxy.annotation.Post;

@Log4j2
@AllArgsConstructor
@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+[]{}|;:',.<>?/";
	private static final int LENGTH = 10;
	private static Random random = new Random();

	public static String generateRandomString() {
		StringBuilder sb = new StringBuilder(LENGTH);
		for (int i = 0; i < LENGTH; i++) {
			int index = random.nextInt(CHARACTERS.length());
			sb.append(CHARACTERS.charAt(index));
		}
		return sb.toString();
	}

	private MemberService service;

	@GetMapping({ "/join", "/login", "/modify", "/remove", "/findID", "/findPW" })
	public void show() {

	}

	@PostMapping("/join")
	public String join(MemberVO memberVO, RedirectAttributes rttr, Model model) {
		log.info(memberVO);

		model.addAttribute("memberVO", memberVO);

		service.join(memberVO);
		rttr.addFlashAttribute("mno", memberVO.getMno());
		rttr.addFlashAttribute("result1", memberVO.getNickName());

		return "redirect:/";

	}

	@PostMapping("/login")
	public String login(MemberVO memberVO, Model model, RedirectAttributes rttr, HttpSession session) {
		MemberVO loginMember = service.login(memberVO);
		if (loginMember != null) {
			rttr.addFlashAttribute("result2", loginMember.getNickName());
			session.setAttribute("loginMember", loginMember);
			session.setAttribute("loggedIn", true);
		} else {
			rttr.addFlashAttribute("loginError", "아이디와 비밀번호를 확인하세요");
			return "redirect:/member/login";
		}
		return "redirect:/";
	}

	@PostMapping("/modify")
	public String modify(MemberVO memberVO, RedirectAttributes rttr, HttpSession session) {
		service.modify(memberVO);
		rttr.addFlashAttribute("result3", "success");
		session.setAttribute("loginMember", memberVO);
		return "redirect:/";
	}

	@PostMapping("/findID")
	public String findID(MemberVO memberVO, RedirectAttributes rttr) {
		MemberVO findEmail = service.findID(memberVO);
		if (findEmail == null) {
			rttr.addFlashAttribute("FindError", "아이디와 핸드폰번호를 확인하세요");
			return "redirect:/member/findID";
		} else {
			rttr.addFlashAttribute("email", findEmail.getEmail());
			return "redirect:/";
		}

	}

	@PostMapping("/findPW")
	public String findPW(MemberVO memberVO, RedirectAttributes rttr) {
		MemberVO findPw = service.findPW(memberVO);
		String randomString = generateRandomString();
		if (findPw == null) {
			rttr.addFlashAttribute("FindError", "아이디와 핸드폰번호를 확인하세요");
			return "redirect:/member/findPW";
		} else {
			findPw.setPw(randomString);
			service.modify(findPw);
			rttr.addFlashAttribute("randomPW", randomString);
			return "redirect:/";
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

	@PostMapping("/remove")
	public String remove(@RequestParam("mno") Long mno, @RequestParam("email") String email,
			@RequestParam("pw") String pw, RedirectAttributes rttr, HttpSession session) {
		MemberVO vo = (MemberVO) session.getAttribute("loginMember");
		String checkEm = vo.getEmail();
		String checkPw = vo.getPw();
		if (email.equals(checkEm) && pw.equals(checkPw)) {
			service.remove(mno);
			rttr.addFlashAttribute("result4", "success");
			session.invalidate();
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("loginError", "아이디와 비밀번호를 확인하세요");
			return "redirect:/member/remove";
		}

	}

}
