package com.happytable.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happytable.domain.A_VO;
import com.happytable.mapper.A_Mapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@AllArgsConstructor
@Log4j2
public class A_ServiceImpl implements A_Service{
	
	@Setter(onMethod_=@Autowired)	
	private A_Mapper mapper;

	@Override
	public int insert(A_VO appoint) {
		log.info("insert......." + appoint.toString());
		
		return mapper.insert(appoint);
	}

	@Override
	public List<A_VO> read(A_VO appoint) {
		log.info("read......." + appoint.getA_No() + " | " + appoint.getResNum() + " | " + appoint.getMemUno());
		return mapper.read(appoint);
	}

	@Override
	public boolean update(A_VO appoint) {
		log.info("update....." + appoint.toString());
		return mapper.update(appoint)==1;
	}

	@Override
	public boolean delete(String A_no) {
		log.info("delete...." + A_no);
		return mapper.delete(A_no) == 1;
	}

	@Override
	public int count(A_VO appoint) {
		log.info("count.....");
		return mapper.count(appoint);
	}

	@Override
	public int count_Select(A_VO appoint) {
		log.info("count.....");
		return mapper.countSelect(appoint);
	}
	


}
