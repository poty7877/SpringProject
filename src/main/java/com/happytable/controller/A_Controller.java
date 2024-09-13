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

	private A_Service a_service;				// 예약 서비스 메서드
	private RestaurantService res_Service;		// 레스토랑 서비스 메서드
	private MemberService mem_Service;			// 멤버 서비스 메서드

	@PostMapping("/insert")
	public String insert(A_VO appoint, @RequestParam("date") String date, @RequestParam("time") String time,
			@RequestParam("table") String table, RedirectAttributes rttr, Model model) {
		String a_Date = date + " " + time;									// date와 time값 받아서 데이터베이스에 입력할 수 있는 a_Date 형식으로 변경
		String a_Note = appoint.getA_Note() + "/ 요청테이블 : " + table;		// table 값 받아서 A_Note에 추가
		appoint.setA_Date(a_Date);											// a_Date값 appoint 객체에 추가
		appoint.setA_Note(a_Note);											// a_Note값 appoint 객체에 추가
		log.info("insert : " + appoint.toString());							// appoint 객체 출력
		int result = a_service.insert(appoint);								// appoint 객체로 insert sql 실행하여 결과값 result에 리턴값 삽입
		log.info("insert result : " + result);								// result 출력
		if (result == 1) {													// result 값 1 boolean
			rttr.addFlashAttribute("a_result", "예약이 성공하였습니다.");			// boolean true : modal에 a_result에 메세지 전달 
		} else {
			rttr.addFlashAttribute("a_result", "예약이 실패하였습니다. 가게로 문의하여 주시기 바랍니다.");
		} 																	// boolean false : modal에 a_result에 메세지 전달
		return "redirect:/";												// 데이터 삽입 후 메인화면으로 리턴

	}

	@GetMapping("/insert")
	public void insert(A_VO appoint, @RequestParam("resNum") String resNum, Model model) throws ParseException {
		MyResturantDTO oper = new MyResturantDTO();
		oper = res_Service.getAllInfo(resNum);								// resNum으로 해당되는 레스토랑 모든 정보를 불러와서 oper 객체에 저장
		log.info(oper.toString());											// oper 객체 출력 
		String openTime = oper.getOper().getOpenTime().substring(0, 2);		// openTime에 oper의 openTime(00:00)의 정보를 불러와서 앞에 2자리만 추출
		String closeTime = oper.getOper().getEndTime().substring(0, 2);		// closeTime에 oper의 endTime(00:00)의 정보를 불러와서 앞에 2자리만 추출
		int open = Integer.parseInt(openTime); 								// String openTime 을 int open으로 바뀜
		int close = Integer.parseInt(closeTime);							// String closeTime 을 int close으로 바뀜
		
		int p_Cnt = 0;														// 가게 허용 총인원 oper에 SalList의 HeadCount를 총합
		for (int i = 0; i < oper.getSalList().size(); i++) {
			p_Cnt += oper.getSalList().get(i).getHeadCount();
		}

		// 예약 불가 날짜 출력하기
		// 1. 매월 몇주차 몇요일
		String m_w_day = "";
		if (oper.getOper().getDayoff_cate().equals("매월")) {					// 매월 옵션 선택된 데이터일경우 작동
			LocalDate now = LocalDate.now(); 								// 시스템 날짜 가져오기
			Date date = java.sql.Date.valueOf(now); 						// LocalDate -> Date
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");		// formatting("yyyy-MM")
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");// formatting("yyyy-MM-dd")

			
			String n_Month = format.format(date);							// (Date)yyyy-MM-dd -> (String)yyyy-MM
			String s_Month = n_Month + "-01"; 								// yyyy-MM-01 스트링 완성
			date = formatter.parse(s_Month);								// String -> Date  

			LocalDate localDate = new java.sql.Date(date.getTime()).toLocalDate(); // localDate 값으로 치환

			DayOfWeek dow = localDate.getDayOfWeek();						// dayofweek 객체 만들기

			int dowN = dow.getValue();
			// 숫자 요일 구하기 월요일 1 일요일 7
			// 현대 달의 1일이 무슨 요일인지 확인 가능해짐 한국에서는 첫째주의 기준이 한주에 4일 이상 잇냐로 판단.
			// 즉, 일, 월, 화, 수 는 첫째주이고 목, 금 , 토 는 저번달의 마지막 주로 계산.
			// 7,1,2,3 -> 1 week 4, 5, 6 -> 0 week

			int week_N = 0; // 기준 주차
			if (4 <= dowN & dowN <= 6) {
				week_N = 0;
			} else {
				week_N = 1;
			} //if close
			Calendar cal = Calendar.getInstance();							// 매월 몇주차인지 스트링 잘라서 보관
						
			int length = oper.getOper().getDayoff_weekCnt().length();		// weekCnt()의 문자 길이를 length에 삽입
			String day = oper.getOper().getDayoff_Day();					// 요일 값을 string으로 받아 숫자 치환  
			day = day.replace("일", "0");
			day = day.replace("월", "1");
			day = day.replace("화", "2");
			day = day.replace("수", "3");
			day = day.replace("목", "4");
			day = day.replace("금", "5");
			day = day.replace("토", "6");
			
			int week = 0;													
			for(int i = 0; i<length; i++) {									// getDayoff_weekCnt() 갯수로 반복 : 00 -> 2
				String week_c = oper.getOper().getDayoff_weekCnt().substring(i, i+1); // 글자 순서대로 잘라서 사용
				log.info(week_c+"주");										// 자른 주 출력
				week = Integer.parseInt(week_c);							// string -> int
				week = week - week_N;										// yyyy-MM-01의 주와 getDayoff_weekCnt() 주 사이의 차이
				log.info("week : " + week);									// 주 차이 출력
				int delay = (week * 7) + Integer.parseInt(day);				// delay = (주 차이 * 7)[일] + 요일 숫자[일] = 1일부터 몇일 후인가 
				cal.setTime(date);											// yyyy-MM-01 cal 메서드에 데이터 세팅
				cal.add(Calendar.DATE, delay);								// yyyy-MM-01로부터 delay 후의 날짜 
				String r_Date = formatter.format(cal.getTimeInMillis()); 	// 휴무일 날짜
				
				String result = "";											// datePicker.datesDisabled의 입력은 [yyyy-MM-dd, yyyy-MM-dd, yyyy-MM-01 ***]
				 if(i==0) {													// 첫번째 휴무일은 앞에 ','가 필요가 없으므로 if문으로 진행
					 result = "'" + r_Date+"'";								// "yyyy-MM-dd"
					} else {
						result = ", '"+r_Date+"'";							// ", yyyy-MM-dd"
					}
					m_w_day =	m_w_day + result;							// "yyyy-MM-dd, yyyy-MM-dd"
					log.info("휴일 : " + m_w_day);							// 휴일 출력 
			} // for close
							
		} // if close

		// 2. 매주 몇요일
		String everyWeek_day = "";
		if (oper.getOper().getDayoff_cate().equals("매주")) {					// 매주 옵션 선택된 데이터일경우 작동
			everyWeek_day = oper.getOper().getDayoff_Day();					// 요일 값을 string으로 받아 숫자 치환
			everyWeek_day = everyWeek_day.replace("일", "0");
			everyWeek_day = everyWeek_day.replace("월", "1");
			everyWeek_day = everyWeek_day.replace("화", "2");
			everyWeek_day = everyWeek_day.replace("수", "3");
			everyWeek_day = everyWeek_day.replace("목", "4");
			everyWeek_day = everyWeek_day.replace("금", "5");
			everyWeek_day = everyWeek_day.replace("토", "6");
		}
		
		log.info("매주 휴일 : " + everyWeek_day);								// 숫자 치환된 데이터 출력
		log.info("레스토랑 정보 : " + oper.toString());							// 레스토랑 정보 데이터 출력

		model.addAttribute("resVO", oper);									// 레스토랑 정보 입력
		model.addAttribute("open", open);									// 오픈 시간
		model.addAttribute("close", close);									// 종료 시간
		model.addAttribute("p_Cnt", p_Cnt);									// 테이블 종류
		model.addAttribute("everyWeek_day", everyWeek_day);					// 매주 휴일
		model.addAttribute("rest_day", m_w_day);							// 매월 휴일							

	}

	@GetMapping({ "/read", "/update", "/list", "/readRes", "/listRes" }) 	
	public void get(A_VO appoint, Model model) {
		log.info("예약번호 : " + appoint.getA_No());							// 예약번호 출력
		log.info("회원번호 : " + appoint.getMemUno());							// 회원번호 출력							
		log.info("가게번호 : " + appoint.getResNum());							// 가게번호 출력
		log.info("예약시간 : " + appoint.getA_Date());							// 예약 날짜 출력

		log.info("appoint : " + appoint);									// appoint 객체 출력
		List<A_VO> result = new ArrayList<A_VO>();							// select sql 정보로 받은 resultset 받을 리스트 생성
		result = a_service.read(appoint);									// 리스트에 삽입

		for (int i = 0; i < result.size(); i++) {							// 리스트 모두 메서드 돌리기
			String num = result.get(i).getResNum();							// 리스트 i번째의 레스토랑 넘버 추출
			String name = res_Service.get(num).getResName();				// 추출된 레스토랑 넘버로 레스토랑 이름 검색하여 추출
			A_VO appoint2 = result.get(i);									// appoint2에 리스터 i번째 객체 담기 
			appoint2.setResName(name);										// appoint2에 추출한 레스토랑 이름 넣기
			result.set(i, appoint2);										// 리스트 i번째에 데이터 다시 셋팅.
			
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
