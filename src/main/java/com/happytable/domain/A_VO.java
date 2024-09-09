package com.happytable.domain;

import lombok.Data;

@Data
public class A_VO {
	
	private String resNum;	// 레스토랑 고유 번호
	private String memUno;	// 멤버 고유 번호
	private String a_Date;		// 예약 날짜 및 시간
	private int a_NOP;	// 예약 인원수
	private String a_Status;	// 예약 상태(예약중, 예약 완료, 예약 취소, 노쇼)
	private String a_No;		// 예약 고유 번호
	private String a_Note;	// 주의사항 및 요청사항 기입
	private int a_AdPay;		// 예약 시 예약선불금
	private String resName;
		
		
}
