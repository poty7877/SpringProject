package com.happytable.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happytable.mapper.RestAlrMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@AllArgsConstructor
@Log4j2
public class RestAlrServiceImpl implements RestAlrService {

	@Setter(onMethod_ = @Autowired)
	private RestAlrMapper mapper;
	
	@Override
	public Integer get(String resNum) {
	   
		return  mapper.select(resNum);
	}

	@Override
	public Integer remove(String resNum) {
		
		return mapper.delete(resNum);
	}

}
