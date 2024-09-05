package com.happytable.service;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happytable.domain.RestaurantVO;
import com.happytable.mapper.RestaurantMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class RestaurantServiceImpl implements RestaurantService{
	@Setter(onMethod_ = @Autowired)
	private RestaurantMapper mappr;

	@Override
	public int register(RestaurantVO rest) {
		log.info("RestaurantServiceImpl.register() 서비스 실행.....");
		return mappr.insert(rest);
	}

	@Override
	public RestaurantVO get(String resNum) {
		log.info("RestaurantServiceImpl.get() 서비스 실행.....");
		return mappr.readByResnum(resNum);
	}

	@Override
	public boolean modify(RestaurantVO rest) {
		log.info("RestaurantServiceImpl.modify() 서비스 실행.....");
		return mappr.update(rest) == 1;
	}

	@Override
	public boolean remove(String resNum) {
		log.info("RestaurantServiceImpl.remove() 서비스 실행.....");
		return mappr.delete(resNum) == 1;
	}

	@Override
	public int idcheck(String resID) {
		log.info("RestaurantServiceImpl.idcheck() 서비스 실행.....");
		return mappr.dupleCheck(resID);
	}

	@Override
	public RestaurantVO login(String resID, String resPW) {
		log.info("RestaurantServiceImpl.login() 서비스 실행.....");
		return mappr.login(resID, resPW);
	}

}
