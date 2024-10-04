package com.happytable.mapper;

import java.util.List;

import com.happytable.domain.RestaurantVO;

public interface AdminMapper {
	
	
	public int insert(String resNum);
	
	//R_all : 모든 레스토랑 리스트 
	public List<RestaurantVO> resList2();
	
	public int delete(String resNum);

}
