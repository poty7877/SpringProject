package com.happytable.service;

import java.util.List;

import com.happytable.domain.A_VO;

public interface A_Service {

	public int insert(A_VO appoint);
	//예약 생성
	public List<A_VO> read(A_VO appoint);
	//예약 확인
	public boolean update(A_VO appoint);
	//예약 수정
	public boolean delete(String A_no);
	//예약 삭제
}	
