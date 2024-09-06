package com.happytable.controller;

import java.util.List;

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

	private MemberService service;

	@GetMapping({ "/join", "/login", "/modify", "/remove" })
	public void join() {

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

	@PostMapping("/remove")
	public String remove(@RequestParam("mno") Long mno, RedirectAttributes rttr, HttpSession session) {
		service.remove(mno);
		rttr.addFlashAttribute("result4", "success");
		session.invalidate();
		return "redirect:/";
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

}
