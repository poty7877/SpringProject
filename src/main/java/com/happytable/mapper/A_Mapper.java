package com.happytable.mapper;

import java.util.List;

import com.happytable.domain.A_VO;

public interface A_Mapper {
	
	//C
	public void insert(A_VO appoint);
	//R
	public List<A_VO> read(A_VO appoint);	
	//U
	public int update(A_VO appoint);
	//D
	public int delete(String a_no);

}
