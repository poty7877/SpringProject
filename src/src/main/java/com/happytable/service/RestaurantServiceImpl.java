package com.happytable.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.happytable.domain.Criteria;
import com.happytable.domain.MyResturantDTO;
import com.happytable.domain.RestaurantVO;
import com.happytable.mapper.MenuMapper;
import com.happytable.mapper.OperationsMapper;
import com.happytable.mapper.RestaurantMapper;
import com.happytable.mapper.SalesMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor

public class RestaurantServiceImpl implements RestaurantService {

	private RestaurantMapper mappr;
	private OperationsMapper mappOper;
	private SalesMapper mappSales;
	private MenuMapper mappMenu;

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

	@Override // 로그인 : id+pw ->resNum(**09/07 수정)
	public String login(String resID, String resPW) {
		log.info("RestaurantServiceImpl.login() 서비스 실행.....");
		return mappr.login(resID, resPW);
	}

	@Override
	public List<RestaurantVO> getList() {
		log.info("RestaurantServiceImpl.getList() 서비스 실행.....");
		return mappr.resList();
	}

	@Override // 로그인(계정확인용) : id+pw ->count(resNum)=> int(**09/07 추가)
	public int loginChech(String resID, String resPW) {
		log.info("loginChech()  계정확인 서비스 실행.....");
		return mappr.loginChech(resID, resPW);
	}

	@Override
	public MyResturantDTO getAllInfo(String resNum) {
		// 마이페이지-전체 정보 불러오기 ->컨트롤러에서 제어
		MyResturantDTO myRest = new MyResturantDTO();
		myRest.setRest(mappr.readByResnum(resNum));
		myRest.setOper(mappOper.read(resNum));
		myRest.setSalList(mappSales.readList(resNum));
		myRest.setMenu(mappMenu.menuListByResNum(resNum));
		myRest.setMenuCnt(mappMenu.countMenu(resNum));
		myRest.setTableCnt(mappSales.countTable(resNum));
		myRest.setOperCnt(mappOper.checkOper(resNum));

		return myRest;
	}

//2024 09 05 용상엽 추가 (페이징)
	@Override
	public List<RestaurantVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return mappr.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return mappr.getTotalCount(cri);
	}
}
