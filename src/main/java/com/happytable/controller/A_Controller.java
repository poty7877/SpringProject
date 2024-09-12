package com.happytable.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import com.happytable.service.A_Service;
import com.happytable.service.MemberService;
import com.happytable.service.RestaurantService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
@RequestMapping("/order/*")
public class A_Controller {

	private A_Service a_service;
	private RestaurantService res_Service;
	private MemberService mem_Service;

	@PostMapping("/insert")
	public String insert(A_VO appoint, @RequestParam("date") String date, @RequestParam("time") String time,
			@RequestParam("table") String table, RedirectAttributes rttr, Model model) {
		String a_Date = date + " " + time;
		String a_Note = appoint.getA_Note() + "/ 요청테이블 : " + table;
		appoint.setA_Date(a_Date);
		appoint.setA_Note(a_Note);
		log.info("insert : " + appoint.toString());
		model.addAttribute("resVO", res_Service.get(appoint.getResNum()));
		model.addAttribute("operVO", res_Service.get(appoint.getResNum()));
		int result = a_service.insert(appoint);
		log.info("insert result : " + result);
		if (result == 1) {
			rttr.addFlashAttribute("a_result", "예약이 성공하였습니다.");
		} else {
			rttr.addFlashAttribute("a_result", "예약이 실패하였습니다. 가게로 문의하여 주시기 바랍니다.");
		}
		return "redirect:/";

	}

	@GetMapping("/insert")
	public void insert(A_VO appoint, @RequestParam("resNum") String resNum, Model model) {
		MyResturantDTO oper = new MyResturantDTO();
		oper = res_Service.getAllInfo(resNum);
		log.info(oper.toString());
		String openTime = oper.getOper().getOpenTime().substring(0, 2);
		String closeTime = oper.getOper().getEndTime().substring(0, 2);
		int open = Integer.parseInt(openTime);
		int close = Integer.parseInt(closeTime);
		//가게 허용 총인원
		int p_Cnt = 0;
		for(int i=0; i<oper.getSalList().size(); i++) {
			p_Cnt += oper.getSalList().get(i).getHeadCount();
		}
		
		/*
		 * //예약 기간 오늘 기준으로 한정 Date now = new Date(); SimpleDateFormat format = new
		 * SimpleDateFormat("yyyy-MM-dd"); Calendar cal = Calendar.getInstance();
		 * cal.setTime(now); cal.add(Calendar.DATE, 1); String s_Date =
		 * format.format(cal.getTimeInMillis()); //예약 시작 날짜 cal.add(Calendar.DATE, 6);
		 * String e_Date = format.format(cal.getTimeInMillis()); //예약 마지막 날짜
		 * 
		 * log.info("오늘 + 1 : "+s_Date); log.info("오늘 + 7 : "+e_Date);
		 * log.info("resVO : " + oper.toString());
		 */
		
		
		// 모델에 값 삽입
		/*
		 * model.addAttribute("s_Date", s_Date); model.addAttribute("e_Date", e_Date);		 * 
		 * 
		 */
		
		// 예약 불가 날짜 출력하기
		// 1. 매월 몇주차 몇요일
				
		// 2. 매주 몇요일
		String everyWeek_day = "";
		if(oper.getOper().getDayoff_cate().equals("매주")) {
		everyWeek_day = oper.getOper().getDayoff_Day();
		everyWeek_day = everyWeek_day.replace("일", "0");
		everyWeek_day = everyWeek_day.replace("월", "1");
		everyWeek_day = everyWeek_day.replace("화", "2");
		everyWeek_day = everyWeek_day.replace("수", "3");
		everyWeek_day = everyWeek_day.replace("목", "4");
		everyWeek_day = everyWeek_day.replace("금", "5");
		everyWeek_day = everyWeek_day.replace("토", "6");
		};		
		
		model.addAttribute("resVO", oper);
		model.addAttribute("open", open);
		model.addAttribute("close", close);
		model.addAttribute("p_Cnt", p_Cnt);
		model.addAttribute("everyWeek_day", everyWeek_day);

	}

	@GetMapping({ "/read", "/update", "/list", "/readRes", "/listRes" }) // 예약번호로 정보 읽어오기
	public void get(A_VO appoint, Model model) {
		log.info("예약번호 : " + appoint.getA_No());
		log.info("회원번호 : " + appoint.getMemUno());
		log.info("가게번호 : " + appoint.getResNum());
		log.info("예약시간 : " + appoint.getA_Date());

		log.info("appoint : " + appoint);
		List<A_VO> result = new ArrayList<A_VO>();
		result = a_service.read(appoint);

		for (int i = 0; i < result.size(); i++) {
			String num = result.get(i).getResNum();
			String name = res_Service.get(num).getResName();
			A_VO appoint2 = result.get(i);
			appoint2.setResName(name);
			result.set(i, appoint2);
		}

		for (int i = 0; i < result.size(); i++) {
			String num = result.get(i).getMemUno();
			String NickName = mem_Service.getMem(num).getNickName();
			A_VO appoint2 = result.get(i);
			appoint2.setUserName(NickName);
			result.set(i, appoint2);
		}

		model.addAttribute("appoint", result);

	}

	@PostMapping("/update")
	public String update(A_VO appoint, RedirectAttributes rttr) {
		log.info("update 내용 : " + appoint.toString());
		if (a_service.update(appoint)) {
			rttr.addFlashAttribute("a_result", "변경되었습니다.");
		} else {
			rttr.addFlashAttribute("a_result", "변경이 실패하였습니다. 개발자에게 연락하지마세요");
		}

		return "redirect:/";
	}

	@PostMapping("/delete")
	public String delete(@RequestParam("a_No") String a_No, RedirectAttributes rttr) {
		A_VO appoint = new A_VO();
		appoint.setA_No(a_No);
		List<A_VO> result = new ArrayList<A_VO>();
		result = a_service.read(appoint);
		log.info("--------------------" + a_No);
		log.info("예약상태 : " + result.get(0).getA_Status());

		if (result.get(0).getA_Status().equals("예약 확정")) {
			rttr.addFlashAttribute("a_result", "예약 확정 상태입니다. <br> 가게로 전화하여 취소를 진행해주시기 바랍니다.");
		} else {
			if (a_service.delete(a_No)) {
				rttr.addFlashAttribute("a_result", "예약이 취소되었습니다.");// 수정 성공시 success 메시지를 보냄
			} else {
				rttr.addFlashAttribute("a_result", "가게로 문의하여 주시기바랍니다. 취소가 실패하였습니다.");// 수정 실패시 fail 메시지를 보냄
			}
			
		}
		return "redirect:/";
	}

}
