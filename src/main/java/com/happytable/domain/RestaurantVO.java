package com.happytable.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class RestaurantVO {
	private String resID; //레스토랑 id
	private String resPW; //레스토랑 pw
	private String resNum; //고유번호
	private String resName; //레스토랑 이름
	private String resAddr; //주소
	private String co_Num; //사업자번호
	private String certify; //인증정보(선택사항)
	private String summary; //홍보문구	
	private Date regDate; //가입일
	private String resPhone; //전화번호

}
