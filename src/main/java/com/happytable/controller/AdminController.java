package com.happytable.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happytable.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor
@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private AdminService service;

	@GetMapping("/register")
	public void getList2(Model model) {
		model.addAttribute("list2", service.getList2());
	}

	@PostMapping("/register")
	public String register(Model model, RedirectAttributes rttr, String resNum) {
		service.register(resNum);
		rttr.addFlashAttribute("success", "가입승인 완료");
		return "redirect:/";
	}

	@PostMapping("/remove")
	public String remove(Model model, RedirectAttributes rttr, String resNum) {
		service.remove(resNum);
		return "";
	}

}
