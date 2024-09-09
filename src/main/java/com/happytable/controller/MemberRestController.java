package com.happytable.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.happytable.domain.MemberVO;
import com.happytable.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@AllArgsConstructor
@RequestMapping("/member")
public class MemberRestController {

	private MemberService service;

	@PostMapping(value = "/checkEmail", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> checkEmail(@RequestParam("email") String email) {
		Map<String, Object> response = new HashMap<>();
		boolean exists = service.checkEm(email);

		if (exists) {
			response.put("status", "error");
			response.put("message", "이미 사용중인 이메일 입니다.");
		} else {
			response.put("status", "success");
			response.put("message", "사용가능한 이메일 입니다.");
		}

		return response;
	}
	
	@PostMapping(value = "/checkNickName", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> checkNickName(@RequestParam("nickName") String nickName) {
		Map<String, Object> response = new HashMap<>();
		boolean exists = service.checkNn(nickName);

		if (exists) {
			response.put("status", "error");
			response.put("message", "이미 사용중인 닉네임 입니다.");
		} else {
			response.put("status", "success");
			response.put("message", "사용가능한 닉네임 입니다.");
		}

		return response;
	}
}
