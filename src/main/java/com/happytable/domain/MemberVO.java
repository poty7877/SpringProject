package com.happytable.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String memUno; // 멤버 고유 번호(8자리 랜덤, 예약 관리용)
	private Long mno; // 회원 번호 (회원 관리용)
	private String name; // 회원 이름
	private String pw;	// 회원 비밀번호
	private String phone; // 회원 핸드폰
	private String email; // 회원 이메일(아이디 대신 사용!)
	private Date regDate; // 회원 가입일
	private String birth; // 생년월일 6자리(성인 여부 확인)
	private String nickName; // 닉네임
	private int grade; // 회원 등급 점수
	
}
