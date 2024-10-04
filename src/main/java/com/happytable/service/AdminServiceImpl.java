package com.happytable.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.happytable.domain.RestaurantVO;
import com.happytable.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor

public class AdminServiceImpl implements AdminService {

	private AdminMapper mapper;

	@Override
	public List<RestaurantVO> getList2() {
		log.info("RestaurantServiceImpl.getList() 서비스 실행.....");
		return mapper.resList2();
	}

	@Override
	public int register(String resNum) {
		// TODO Auto-generated method stub
		return mapper.insert(resNum);
	}

	@Override
	public int remove(String resNum) {
		// TODO Auto-generated method stub
		return mapper.delete(resNum);
	}
}
