package com.happytable.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.happytable.domain.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@AllArgsConstructor
@RequestMapping("/order")
public class A_RestController {

	@GetMapping(value = "/point", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> point(@RequestParam("point") String using_point, HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");

		boolean possible = (loginMember.getPoint() - Long.parseLong(using_point)) >= 0;

		if (possible) {
			response.put("status", "success");
			response.put("message", "사용 가능");
		} else {
			response.put("status", "error");
			response.put("message", "보유하신 포인트 내에서 입력해주세요");
		}

		return response;

	}

	@GetMapping(value = "/person", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> person(@RequestParam("person") String person,
			@RequestParam("adPayCond") String adPayCond) {
		Map<String, Object> response = new HashMap<>();

		int personB = Integer.valueOf(adPayCond);
		if (personB != 0) {
			log.info("식당 예약금 기준 사람 수 : " + personB);
			int personC = Integer.valueOf(person);
			log.info("식당 예약 사람 수 : " + personC);

			boolean possible = (personC - personB) >= 0;

			if (possible) {
				response.put("status", "success");
				response.put("message", "사용 가능");
			} else {
				response.put("status", "error");
				response.put("message", "보유하신 포인트 내에서 입력해주세요");

			}
		} else {
			response.put("message", "제한 없음.");
		}
		;

		return response;
	}

}