package com.happytable.domain;

import java.util.List;

import lombok.Data;
import lombok.Getter;

@Data
@Getter
public class MyResturantDTO { 
	//service에서 레스토랑 전체 정보를 모아서 전달하기 위한 DTO
	//->myrestaurant 에서 전체정보 보여주기
	private OperationsVO oper; //영업정보
	private List<SalesVO> salList; //테이블 리스트
	private List<MenuVO> menu; //메뉴리스트
	private int menuCnt; //메뉴개수
	private int tableCnt; //테이블 개수

}
