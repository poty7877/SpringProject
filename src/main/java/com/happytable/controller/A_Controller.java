package com.happytable.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happytable.domain.A_VO;
import com.happytable.service.A_Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
@RequestMapping("/order/*")
public class A_Controller {
	
	private A_Service a_service;
	
		
	@PostMapping("/insert")
	public String insert(A_VO appoint, RedirectAttributes rttr){
		log.info("insert : " + appoint.toString());
		a_service.insert(appoint);
		rttr.addFlashAttribute("result", appoint.getA_No());
		return "redirect:/order/list";	
		
	}
	
	@GetMapping({"/read", "/update", "/list"}) //예약번호로 정보 읽어오기
	public void get(A_VO appoint, Model model) {
		log.info("예약번호 : " + appoint.getA_No());
		log.info("회원번호 : " + appoint.getMemUno());
		log.info("가게번호 : " + appoint.getResNum());
		log.info("예약시간 : " + appoint.getA_Date());
		
		model.addAttribute("appoint", a_service.read(appoint));
	}
	
	@PostMapping("/update")
	public String update(A_VO appoint, RedirectAttributes rttr) {
		if(a_service.update(appoint)){
			rttr.addFlashAttribute("result", "success");
		}
				
		return "redirect:/order/list";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("a_No") String a_No, RedirectAttributes rttr) {
		
		log.info("--------------------" + a_No);
		if(a_service.delete(a_No)) {
            rttr.addFlashAttribute("result", "success");//수정 성공시 success 메시지를 보냄
    } else {
            rttr.addFlashAttribute("result", "fail");//수정 실패시 fail 메시지를 보냄
    }
		return "redirect:/order/list";
	}
	
	

}
