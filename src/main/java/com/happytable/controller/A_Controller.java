package com.happytable.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
	public void insert(A_VO appoint, @RequestParam("resNum") String resNum, Model model) throws ParseException {
		MyResturantDTO oper = new MyResturantDTO();
		oper = res_Service.getAllInfo(resNum);
		log.info(oper.toString());
		String openTime = oper.getOper().getOpenTime().substring(0, 2);
		String closeTime = oper.getOper().getEndTime().substring(0, 2);
		int open = Integer.parseInt(openTime);
		int close = Integer.parseInt(closeTime);
		// 가게 허용 총인원
		int p_Cnt = 0;
		for (int i = 0; i < oper.getSalList().size(); i++) {
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
		 * model.addAttribute("s_Date", s_Date); model.addAttribute("e_Date", e_Date); *
		 * 
		 */

		// 예약 불가 날짜 출력하기
		// 1. 매월 몇주차 몇요일
		String m_w_day = "";
		if (oper.getOper().getDayoff_cate().equals("매월")) {
			LocalDate now = LocalDate.now(); // 시스템 날짜 가져오기
			Date date = java.sql.Date.valueOf(now);

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

			String n_Month = format.format(date);
			String s_Month = n_Month + "-01"; // yyyy-MM-01 스트링 완성
			date = formatter.parse(s_Month);

			LocalDate localDate = new java.sql.Date(date.getTime()).toLocalDate(); // localDate 값으로 치환

			DayOfWeek dow = localDate.getDayOfWeek();// dayofweek 객체 만들기

			int dowN = dow.getValue(); // 숫자 요일 구하기 월요일 1 일요일 7

			// 현대 달의 1일이 무슨 요일인지 확인 가능해짐 한국에서는 첫째주의 기준이 한주에 4일 이상 잇냐로 판단.
			// 즉, 일, 월, 화, 수 는 첫째주이고 목, 금 , 토 는 저번달의 마지막 주로 계산.
			// 7,1,2,3 -> 1 week 4, 5, 6 -> 0 week

			int week_N = 0; // 기준 주차
			if (4 <= dowN & dowN <= 6) {
				week_N = 0;
			} else {
				week_N = 1;
			}
			Calendar cal = Calendar.getInstance();
			// 매월 몇주차인지 스트링 잘라서 보관
			int week = 0;
			int length = oper.getOper().getDayoff_weekCnt().length();
			String day = oper.getOper().getDayoff_Day();
			day = day.replace("일", "0");
			day = day.replace("월", "1");
			day = day.replace("화", "2");
			day = day.replace("수", "3");
			day = day.replace("목", "4");
			day = day.replace("금", "5");
			day = day.replace("토", "6");
			
			
			for(int i = 0; i<length; i++) {
				String week_c = oper.getOper().getDayoff_weekCnt().substring(i, i+1);
				log.info(week_c+"주");
				week = Integer.parseInt(week_c);
				week = week - week_N;
				log.info("week : " + week);
				
				int delay = (week * 7) + Integer.parseInt(day);
				cal.setTime(date);
				cal.add(Calendar.DATE, delay);
				String r_Date = formatter.format(cal.getTimeInMillis()); // 첫번째 휴무일 날짜
				String result = "";
				 if(i==0) {
					 result = "'" + r_Date+"'";
					} else {
						result = ", '"+r_Date+"'";
					}
					m_w_day =	m_w_day + result;	
			}
			
			
			/*
			 * String week_C1 = oper.getOper().getDayoff_weekCnt().substring(0, 1); String
			 * week_C2 = oper.getOper().getDayoff_weekCnt().substring(1, 2);
			 * log.info(oper.getOper().getDayoff_weekCnt()); log.info(week_C1);
			 * log.info(week_C2); int week_d1 = Integer.parseInt(week_C1); int week =
			 * week_d1 - week_N;
			 * 
			 * 
			 * log.info("week : " + week); int delay = (week * 7) + Integer.parseInt(day);
			 * 
			 * cal.setTime(date); cal.add(Calendar.DATE, delay); String r_Date =
			 * formatter.format(cal.getTimeInMillis()); // 첫번째 휴무일 날짜 m_w_day = "'" +
			 * r_Date+"'";
			 * 
			 * if (oper.getOper().getDayoff_weekCnt().substring(1, 2) != null) { week_C2 =
			 * oper.getOper().getDayoff_weekCnt().substring(1, 2); int week_d2 =
			 * Integer.parseInt(week_C2); week = week_d2 - week_N; log.info("week : " +
			 * week); delay = (week * 7) + Integer.parseInt(day);
			 * 
			 * cal.setTime(date); cal.add(Calendar.DATE, delay); String r_Date2 =
			 * formatter.format(cal.getTimeInMillis()); // 첫번째 휴무일 날짜 m_w_day = m_w_day +
			 * ", '" + r_Date2 + "'";
			 * 
			 * }
			 */

		}

		// 2. 매주 몇요일
		String everyWeek_day = "";
		if (oper.getOper().getDayoff_cate().equals("매주")) {
			everyWeek_day = oper.getOper().getDayoff_Day();
			everyWeek_day = everyWeek_day.replace("일", "0");
			everyWeek_day = everyWeek_day.replace("월", "1");
			everyWeek_day = everyWeek_day.replace("화", "2");
			everyWeek_day = everyWeek_day.replace("수", "3");
			everyWeek_day = everyWeek_day.replace("목", "4");
			everyWeek_day = everyWeek_day.replace("금", "5");
			everyWeek_day = everyWeek_day.replace("토", "6");
		}
		;

		log.info("휴일 : " + m_w_day);
		log.info("매주 휴일 : " + everyWeek_day);
		log.info("레스토랑 정보 : " + oper.toString());

		model.addAttribute("resVO", oper);
		model.addAttribute("open", open);
		model.addAttribute("close", close);
		model.addAttribute("p_Cnt", p_Cnt);
		model.addAttribute("everyWeek_day", everyWeek_day);
		model.addAttribute("rest_day", m_w_day);

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
