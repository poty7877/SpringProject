package com.happytable.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happytable.domain.A_MenuVO;
import com.happytable.mapper.A_Menu_Mapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class A_Menu_ServiceImpl implements A_Menu_Service{
	
	@Setter(onMethod_ = @Autowired)
	private A_Menu_Mapper menuMapper;
	
	
	@Override
	public void insert(A_MenuVO menu) {
		log.info("insert............" + menu.toString());
		menuMapper.insert(menu);
	}

	@Override
	public A_MenuVO read(String A_No) {
		log.info("read............" + A_No);
		return menuMapper.read(A_No);
	}

	@Override
	public boolean update(A_MenuVO menu) {
		log.info("update..........." + menu.toString());
		return menuMapper.update(menu)>=1;
	}

	@Override
	public boolean delete(String A_No) {
		log.info("delete............." +A_No);
		return menuMapper.delete(A_No)>=1;
	}

}
