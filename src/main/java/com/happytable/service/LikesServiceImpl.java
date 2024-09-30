package com.happytable.service;

import org.springframework.stereotype.Service;

import com.happytable.domain.LikesVO;
import com.happytable.mapper.LikesMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@AllArgsConstructor
@Log4j2
public class LikesServiceImpl implements LikesService{

	LikesMapper likeMapper;
	
	@Override
	public void insertLikes(LikesVO likes) {
		log.info("insertLikes" + likes.toString());
		likeMapper.insertLikes(likes);
	}

	@Override
	public LikesVO selectLikes(LikesVO likes) {
		log.info("selectLikes" + likes.toString());
		return likeMapper.selectLikes(likes);
		
	}

	@Override
	public int countLikes(LikesVO likes) {
		log.info("countLikes" + likes.toString());
		
		return likeMapper.countLikes(likes);
		
	}

	@Override
	public void updateLikes(LikesVO likes) {
		log.info("updateLikes" + likes.toString());
		likeMapper.updateLikes(likes);
		
	}
	
	
}
