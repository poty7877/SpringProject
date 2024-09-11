package com.happytable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happytable.domain.MenuVO;
import com.happytable.mapper.MenuMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class MenuServiceImpl implements MenuService{
	@Setter(onMethod_ = @Autowired)
	private MenuMapper mappme;

	@Override
	public int register(MenuVO menu) {
		log.info("MenuServiceImpl.register() 서비스 실행.....");
		return mappme.insert(menu);
	}

	@Override
	public List<MenuVO> getList(String resNum) {
		log.info("MenuServiceImpl.getList() 서비스 실행.....");
		return mappme.menuListByResNum(resNum);
	}

	@Override
	public MenuVO get(int menuNum) {
		log.info("MenuServiceImpl.get() 서비스 실행.....");
		return mappme.read(menuNum);
	}

	@Override
	public boolean modify(MenuVO menu) {
		log.info("MenuServiceImpl.modify() 서비스 실행.....");
		return mappme.update(menu) == 1;
	}

	@Override
	public boolean remove(int menuNum) {
		log.info("MenuServiceImpl.remove() 서비스 실행.....");
		return mappme.delete(menuNum) == 1;
	}

	@Override
	public int removeAll(String resNum) {
		log.info("MenuServiceImpl.removeAll() 서비스 실행.....");
		return mappme.countMenu(resNum);
	}

	@Override
	public int countMenu(String resNum) {
		log.info("MenuServiceImpl.countMenu() 서비스 실행.....");
		return 0;
	}
	
	

}
