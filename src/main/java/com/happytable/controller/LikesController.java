package com.happytable.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.happytable.domain.LikesVO;
import com.happytable.service.LikesService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@AllArgsConstructor
@RequestMapping("/likes/*")
public class LikesController {
	
	private LikesService likeS;
	
	@GetMapping(value="get", produces = MediaType.APPLICATION_JSON_VALUE)
	public int get(@RequestParam("resNum") String resNum, HttpSession session) {
		LikesVO likesVO = new LikesVO();
		likesVO.setResNum(resNum);
		int totalLikes = likeS.countLikes(likesVO);
		return totalLikes;
		
	}

	
	

}
