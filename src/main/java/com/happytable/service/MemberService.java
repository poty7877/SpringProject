package com.happytable.service;

import java.util.List;

import com.happytable.domain.MemberVO;

public interface MemberService {

	// 회원 가입
	public int join(MemberVO memberVO);

	// 회원 로그인
	public MemberVO login(MemberVO memberVO);

	// 회원 정보 수정
	public int modify(MemberVO memberVO);

	// 회원 탈퇴
	public int remove(Long mno);

	// 전체 회원 정보확인 (관리자 사용)
	public List<MemberVO> allRead();

	// 회원 정보 확인용
	public MemberVO get(Long mno);
	
	//아이디 중복 처리용
	public MemberVO checkEm(String email);
		
		//닉네임 중복 처리용
	public MemberVO checkNn(String nickName);
}
