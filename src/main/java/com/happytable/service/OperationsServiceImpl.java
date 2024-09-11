package com.happytable.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happytable.domain.OperationsVO;
import com.happytable.mapper.OperationsMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class OperationsServiceImpl implements OperationsService{
	@Setter(onMethod_ = @Autowired)
	private OperationsMapper mappop;

	@Override
	public int register(OperationsVO oper) {
		log.info("OperationsServiceImpl.register() 서비스 실행.....");
		return mappop.insert(oper);
	}

	@Override
	public OperationsVO get(String resNum) {
		log.info("OperationsServiceImpl.get() 서비스 실행.....");
		return mappop.read(resNum);
	}

	@Override
	public boolean modify(OperationsVO oper) {
		log.info("OperationsServiceImpl.modify() 서비스 실행.....");
		return mappop.update(oper) ==1;
	}

	@Override
	public boolean remove(String resNum) {
		log.info("OperationsServiceImpl.remove() 서비스 실행.....");
		return mappop.delete(resNum)==1;
	}

	@Override
	public int countOper(String resNum) {
		log.info("operation 등록여부 확인.....");
		return mappop.checkOper(resNum);
	}
	
	

}
