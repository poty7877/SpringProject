package com.happytable.service;

import com.happytable.domain.RestaurantVO;

public interface RestaurantService {
	//c : 기업회원가입
	public int register(RestaurantVO rest);
	
	//r: 기업회원정보 확인 - 
	public RestaurantVO get(String resNum);
	
	//u: 기업정보 변경
	public boolean modify(RestaurantVO rest);
	
	//d: 기업정보 삭제(회원탈퇴)
	public boolean remove(String resNum);
	
	//중복확인 : 아이디 개수 확인
	public int idcheck(String resID);
	
	//로그인
	public RestaurantVO login(String resID, String resPW);

}
