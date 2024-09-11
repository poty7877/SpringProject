package com.happytable.service;

import com.happytable.domain.A_MenuVO;

public interface A_Menu_Service {
	
	public void insert(A_MenuVO menu);
	//메뉴 장바구니에 추가

	public A_MenuVO read(String A_No);
	//장바구니 메뉴 읽기

	public boolean update(A_MenuVO menu);
	//장바구니 메뉴 수량 수정

	public boolean delete(String A_No);
	//장바구니 메뉴 삭제

}
