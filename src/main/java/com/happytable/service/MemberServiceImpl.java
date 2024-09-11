package com.happytable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happytable.domain.MemberVO;
import com.happytable.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@AllArgsConstructor
@Log4j2
public class MemberServiceImpl implements MemberService {

	MemberMapper mapper;

	@Override
	public int join(MemberVO memberVO) {
		// 회원가입
		log.info("MemberServiceImpl.join() 메서드 실행");
		return mapper.insert(memberVO);
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		// 회원 정보
		log.info("MemberServiceImpl.login() 메서드 실행");
		return mapper.select(memberVO);
	}

	@Override
	public int modify(MemberVO memberVO) {
		// 회원 정보 수정
		log.info("MemberServiceImpl.modify() 메서드 실행");
		return mapper.update(memberVO);
	}

	@Override
	public int remove(Long mno) {
		// 회원 탈퇴
		log.info("MemberServiceImpl.remove() 메서드 실행");
		return mapper.delete(mno);
	}

	@Override
	public List<MemberVO> allRead() {
		log.info("MemberServiceImpl.allRead() 메서드 실행");
		return mapper.allSelect();
	}

	@Override
	public MemberVO get(Long mno) {
		log.info("MemberServiceImpl.get()메서드 실행");
		return mapper.read(mno);
	}

	@Override
	public boolean checkEm(String email) {
		log.info("MemberServiceImpl.checkEm()메서드 실행");
		MemberVO member = mapper.checkEm(email);
		return member != null;

	}

	@Override
	public boolean checkNn(String nickName) {
		log.info("MemberServiceImpl.checkNn()메서드 실행");
		MemberVO member = mapper.checkNn(nickName);
		return member != null;
	}

	@Override
	public MemberVO findID(MemberVO memberVO) {
		log.info("MemberServiceImpl.findID()메서드 실행");
		return mapper.findID(memberVO);
	}

	@Override
	public MemberVO findPW(MemberVO memberVO) {
		log.info("MemberServiceImpl.findPW()메서드 실행");
		return mapper.findPW(memberVO);
	}

	@Override
	public MemberVO getMem(String memUno) {
		// 조용재 삽입
		log.info("MemberSErviceImpl.getMem 메서드 실행");
		return mapper.readMem(memUno);
	}

}
