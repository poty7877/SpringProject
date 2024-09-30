package com.happytable.service;

import java.util.List;

import com.happytable.domain.Criteria;
import com.happytable.domain.MyResturantDTO;
import com.happytable.domain.RestaurantVO;

public interface RestaurantService {
	// c : 기업회원가입
	public int register(RestaurantVO rest);

	// r: 기업회원정보 확인 -
	public RestaurantVO get(String resNum);

	// u: 기업정보 변경
	public boolean modify(RestaurantVO rest);

	// d: 기업정보 삭제(회원탈퇴)
	public boolean remove(String resNum);

	// R_all : 모든 레스토랑 리스트
	public List<RestaurantVO> getList();

	// 중복확인 : 아이디 개수 확인
	public int idcheck(String resID);

	// 로그인
	public String login(String resID, String resPW);

	// 로그인(계정확인용) : id+pw ->count(resNum)=> int(**09/07 추가)
	public int loginChech(String resID, String resPW);


	// 마이페이지 불러오기
	public MyResturantDTO getAllInfo(String resNum);

	// 2024/09/05 용상엽 추가(페이징)
	public List<RestaurantVO> getList(Criteria cri);

	public int getTotal(Criteria cri);
}
