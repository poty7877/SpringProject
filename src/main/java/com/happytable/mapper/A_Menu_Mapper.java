package com.happytable.mapper;

import com.happytable.domain.A_MenuVO;

public interface A_Menu_Mapper {
	
	//C
	public void insert(A_MenuVO menu);
	//R
	public A_MenuVO read(String a_No);
	//U
	public int update(A_MenuVO menu);
	//D
	public int delete(String A_No);

}
