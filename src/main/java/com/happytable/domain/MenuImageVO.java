package com.happytable.domain;

import lombok.Data;

@Data
public class MenuImageVO { //메뉴등록 이미지 - tb_menuimg
	
	public String resNum;
	public int menuNum;
	public String originName;
	public String saveName;
	public String uploadPath;
	//public Date regdate; --sysdate로 따로 받지 않음
}
