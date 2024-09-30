package com.happytable.mapper;

import com.happytable.domain.MenuImageVO;

public interface MenuImageMapper {
	
	//등록
	public int insert(MenuImageVO menuimg);
	//변경
	public int update(MenuImageVO menuimg);
	//삭제(단일메뉴 이미지)
	public int delete(int menuNum);
	
	//일괄삭제(가게 메뉴 전체 삭제)
	public int deleteAll(String resNum);
	
	//가져오기(다운로드)
	public MenuImageVO read(int menuNum);

}