package com.happytable.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.happytable.domain.RestaurantVO;

public interface RestaurantMapper { //레스토랑(기업) 회원가입용 CRUD
	//C : 레스토랑 정보등록 insert - 등록 후 resNum 생성(레스토랑명+고유번호)
	public int insert(RestaurantVO rest);
	
		
	//R : 레스토랑 정보 확인 read
	public RestaurantVO readByResnum(String resNum);
	
	//U : 레스토랑 정보 변경 update
	public int update(RestaurantVO rest);
	
	//D : 레스토랑 탈퇴 delete
	public int delete(String resNum);
	
	//R_all : 모든 레스토랑 리스트 
	public List<RestaurantVO> resList();
	
	//중복확인 : 아이디 개수 확인
	public int dupleCheck(String resID);
	
	//로그인 : id+pw ->객체
	public RestaurantVO login(@Param("resID") String resID, @Param("resPW") String resPW);

}
