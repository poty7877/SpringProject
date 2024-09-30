package com.happytable.mapper;

import com.happytable.domain.LikesVO;

public interface LikesMapper {
	
	// 회원이 새로운 가게에 접속시 데이터 만듬
	public void insertLikes(LikesVO likes);
	
	// 회원이 기존에 방문했던 가게라면 기존에 만들어논 데이터 불러옴
	public LikesVO selectLikes(LikesVO likes);
	
	// 가게 번호로 총 좋아요 갯수 가져옴
	public int countLikes(LikesVO likes);
	
	// 좋아요 클릭시 데이터 업데이트
	public void updateLikes(LikesVO likes);

}
