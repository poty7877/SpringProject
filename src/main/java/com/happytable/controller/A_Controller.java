package com.happytable.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happytable.domain.A_VO;
import com.happytable.domain.MyResturantDTO;
import com.happytable.domain.OperationsVO;
import com.happytable.service.A_Service;
import com.happytable.service.OperationsService;
import com.happytable.service.RestaurantService;
import com.happytable.service.SalesService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
@RequestMapping("/order/*")
public class A_Controller {
	
	private A_Service a_service;
	private RestaurantService res_Service;
	
		
	@PostMapping("/insert")
	public String insert(A_VO appoint, @RequestParam("date") String date, @RequestParam("time") String time, RedirectAttributes rttr, Model model){
		String a_Date = date + " " + time;
		appoint.setA_Date(a_Date);
		log.info("insert : " + appoint.toString());		
		model.addAttribute("resVO", res_Service.get(appoint.getResNum()));
		model.addAttribute("operVO", res_Service.get(appoint.getResNum()));
		int result = a_service.insert(appoint);
		log.info("insert result : " + result);
		rttr.addFlashAttribute("a_result", result);
		return "redirect:/";	
		
	}
	
	@GetMapping("/insert")
	public void insert(A_VO appoint, @RequestParam("resNum") String resNum, Model model) {
		MyResturantDTO oper = new MyResturantDTO();
		oper = res_Service.getAllInfo(resNum);
		String openTime = oper.getOper().getOpenTime().substring(0,2);
		String closeTime = oper.getOper().getEndTime().substring(0,2);
		int open = Integer.parseInt(openTime);
		int close = Integer.parseInt(closeTime);
		model.addAttribute("resVO", oper);
		log.info("resVO : " + oper.toString());
		model.addAttribute("open", open);
		model.addAttribute("close", close);
		
		
	} 
	
	@GetMapping({"/read", "/update", "/list"}) //예약번호로 정보 읽어오기
	public void get(A_VO appoint, Model model) {
		log.info("예약번호 : " + appoint.getA_No());
		log.info("회원번호 : " + appoint.getMemUno());
		log.info("가게번호 : " + appoint.getResNum());
		log.info("예약시간 : " + appoint.getA_Date());
		
		log.info("appoint : " + appoint);
		List<A_VO> result = new ArrayList<A_VO>();
		result = a_service.read(appoint);
				
		for(int i = 0; i<result.size(); i++) {
			String num = result.get(i).getResNum();
			String name = res_Service.get(num).getResName();
			A_VO appoint2 = result.get(i);
			appoint2.setResName(name);
			result.set(i, appoint2);
			
		}
		
		model.addAttribute("appoint", result);
		
		
		
	}
	
	
	@PostMapping("/update")
	public String update(A_VO appoint, RedirectAttributes rttr) {
		log.info("update 내용 : " + appoint.toString());
		if(a_service.update(appoint)){
			rttr.addFlashAttribute("result", "success");
		}
				
		return "redirect:/";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("a_No") String a_No, RedirectAttributes rttr) {
		
		log.info("--------------------" + a_No);
		if(a_service.delete(a_No)) {
            rttr.addFlashAttribute("result", "success");//수정 성공시 success 메시지를 보냄
    } else {
            rttr.addFlashAttribute("result", "fail");//수정 실패시 fail 메시지를 보냄
    }
		return "redirect:/";
	}
	
	

}
