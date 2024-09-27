package com.happytable.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happytable.mapper.GuestAlrMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@AllArgsConstructor
@Log4j2
public class GuestAlrServiceImpl implements GuestAlrService {

	@Setter(onMethod_ = @Autowired)
	private GuestAlrMapper mapper;
	
	@Override
	public Integer get(String memUno) {
	   
		return  mapper.select(memUno);
	}

	@Override
	public Integer remove(String memUno) {
		
		return mapper.delete(memUno);
	}

}
