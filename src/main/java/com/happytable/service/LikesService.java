package com.happytable.service;

import com.happytable.domain.LikesVO;

public interface LikesService {

	public void insertLikes(LikesVO likes);
	public LikesVO selectLikes(LikesVO likes);
	public int countLikes(LikesVO likes); 
	public void updateLikes(LikesVO likes); 
	
	
}
