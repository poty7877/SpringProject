package com.happytable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.happytable.domain.MenuPageDTO;
import com.happytable.domain.MenuVO;
import com.happytable.mapper.MenuImageMapper;
import com.happytable.mapper.MenuMapper;
import com.happytable.mapper.RestaurantMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class MenuServiceImpl implements MenuService {
	@Setter(onMethod_ = @Autowired)
	private MenuMapper mappme;
	@Setter(onMethod_ = @Autowired)
	private RestaurantMapper mappRest;
	@Setter(onMethod_ = @Autowired)
	private MenuImageMapper mappMimg;

	@Transactional
	@Override
	public int register(MenuVO menu) { // **09/14수정-rest tb에 개수 동시등록(img tb는 controller에서 등록)
		log.info("MenuServiceImpl.register() 서비스 실행.....");
		int menuCnt = mappme.insert(menu); // 1. menu_tb에 등록
		int total = mappme.countMenu(menu.getResNum()); // 2. menu_tb의 등록메뉴 개수 가져오기
		mappRest.updateMenuCnt(menu.getResNum(), total); // 3. restaurnat_tb에 업데이트
		return menuCnt;
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

	@Transactional
	@Override
	public boolean remove(MenuVO menu) { // **09/27수정-rest tb에 개수 동시등록, img_tb 동시삭제
		log.info("개별메뉴 삭제 서비스 실행.....");
		String resNum = menu.getResNum();
		int menuNum = menu.getMenuNum();
		int mcnt = mappme.delete(menuNum); // 메뉴삭제
		int imgcnt = mappMimg.delete(menuNum); // 이미지 삭제
		int cnt = mappme.countMenu(resNum); // 메뉴개수 재등록
		mappRest.updateMenuCnt(resNum, cnt);

		return mcnt == imgcnt;
	}

	@Transactional
	@Override
	public int removeAll(MenuVO menu) {// **09/27수정-rest tb에 개수 동시등록, img_tb 동시삭제
		log.info("전체메뉴 삭제 서비스 실행.....");
		String resNum = menu.getResNum();
		int delCnt = mappme.deleteAll(resNum);
		int imgcnt = mappMimg.deleteAll(resNum);
		log.info("삭제 메뉴 개수 : " + delCnt);
		log.info("삭제 이미지 개수 : " + imgcnt);
		mappRest.updateMenuCnt(resNum, 0);

		return delCnt;
	}

	@Override
	public int countMenu(String resNum) {
		log.info("MenuServiceImpl.countMenu() 서비스 실행.....");
		return 0;
	}

	@Override
	public MenuPageDTO getMenuList(String resNum) {
		log.info("DTO 활용한 리스트 넘기기 서비스 실행.....");
		return new MenuPageDTO(mappme.countMenu(resNum), mappme.menuListByResNum(resNum));
	}

}
