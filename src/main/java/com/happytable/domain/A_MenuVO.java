package com.happytable.domain;

import lombok.Data;

@Data
public class A_MenuVO {
	
	private String a_no;		// 예약 고유 번호
	private String menuName;	// 메뉴 이름
	private int menuQuantity;	// 메뉴 갯수

}
