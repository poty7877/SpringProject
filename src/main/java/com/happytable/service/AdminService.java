package com.happytable.service;

import java.util.List;

import com.happytable.domain.RestaurantVO;

public interface AdminService {
	
	public int register(String resNum);
	
	public List<RestaurantVO> getList2();

	public int remove(String resNum);
}
