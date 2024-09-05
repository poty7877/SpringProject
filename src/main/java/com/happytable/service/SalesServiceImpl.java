package com.happytable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happytable.domain.SalesVO;
import com.happytable.mapper.SalesMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class SalesServiceImpl implements SalesService{
	@Setter(onMethod_ = @Autowired)
	private SalesMapper mappsal;
	
	
	@Override
	public int register(SalesVO sales) {
		log.info("SalesServiceImpl.register() 서비스 실행.....");
		return mappsal.insert(sales) ;
	}

	@Override
	public List<SalesVO> getList(String resNum) {
		log.info("SalesServiceImpl.getList() 서비스 실행.....");
		return mappsal.readList(resNum);
	}

	@Override
	public SalesVO get(String resNum, int tableNum) {
		log.info("SalesServiceImpl.get() 서비스 실행.....");
		return mappsal.read(resNum, tableNum);
	}

	@Override
	public boolean modify(SalesVO sales) {
		log.info("SalesServiceImpl.modify() 서비스 실행.....");
		return mappsal.update(sales) == 1;
	}

	@Override
	public boolean remove(String resNum, int tableNum) {
		log.info("SalesServiceImpl.remove() 서비스 실행.....");
		return mappsal.deleteAll(resNum) == 1;
	}

	@Override
	public int removeAll(String resNum) {
		log.info("SalesServiceImpl.removeAll() 서비스 실행.....");
		return mappsal.deleteAll(resNum);
	}

	@Override
	public int countTable(String resNum) {
		log.info("SalesServiceImpl.countTable() 서비스 실행.....");
		return mappsal.countTable(resNum);
	}
	
	

}
