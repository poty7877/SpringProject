package com.happytable.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.happytable.domain.ChangePw;
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
	public Map<String, Object> checkNickName(@RequestParam("nickName") String nickName, HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		boolean exists = service.checkNn(nickName);
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");

		if (loginMember != null) { // 로그인멤버가 null이 아니고
			String loginNickName = loginMember.getNickName();
			if (exists) { // 로그인멤버가 null이 아니고 , 아이디 중복이면,
				if (loginNickName.equals(nickName)) { // 로그인멤버가 null이 아니고, 아이디 중목이면서, 로그인멤버와 입력한 닉네임이 같으면
					response.put("status", "success");
					response.put("message", "현재 내 닉네임");
				} else { // 로그인멤버가 null이 아니고, 아이디 중복이면서, 로그인멤버와 입력한 닉네임이 다르면
					response.put("status", "error");
					response.put("message", "이미 사용중인 닉네임 입니다.");
				}
			} else { // 로그인멤버가 null이 아니고, 아이디 중복이 아니면
				response.put("status", "success");
				response.put("message", "사용가능한 닉네임 입니다.");
			}
		} else {
			if (exists) {
				response.put("status", "error");
				response.put("message", "이미 사용중인 닉네임 입니다.");
			} else if (!exists) {
				response.put("status", "success");
				response.put("message", "사용가능한 닉네임 입니다.");
			}
		}
		return response;

	}

	@PostMapping(value = "/checkPw", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> checkPw(@RequestParam("pw") String pw, @RequestParam("cpw") String cpw) {
		Map<String, Object> response = new HashMap<>();
		if (pw.equals(cpw)) {
			response.put("status", "success");
			response.put("message", "비밀번호가 일치합니다.");
		} else {
			response.put("status", "error");
			response.put("message", "비밀번호가 일치하지 않습니다.");
		}
		return response;
	}

	@PostMapping(value = "/updatePw", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> update(@RequestBody ChangePw request, HttpSession session) {
		Map<String, Object> response = new HashMap<>();

		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		String loginMemberPw = loginMember.getPw();
		String pw = request.getPw();
		String cpw = request.getCpw();
		String cpw2 = request.getCpw2();

		Long mno = loginMember.getMno();
		if (loginMemberPw.equals(pw) && cpw.equals(cpw2)) {
			int count = service.changePw(mno, cpw);
			
			if (count == 1) {
				response.put("status", "success");
				response.put("message", "비밀번호가 변경되었습니다.");
				loginMember = service.get(mno);
				session.setAttribute("loginMember", loginMember);
			} else {
				response.put("status", "error");
				response.put("message", "비밀번호 변경에 실패했습니다.");
			}

		} else {
			response.put("status", "error");
			response.put("message", "입력하신 정보가 틀립니다.");
		}

		return response;
	}

}
