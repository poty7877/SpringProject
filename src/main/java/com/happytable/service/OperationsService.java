package com.happytable.service;

import com.happytable.domain.OperationsVO;

public interface OperationsService {
	
	public int register(OperationsVO oper);
	
	public OperationsVO get(String resNum);
	
	public boolean modify(OperationsVO oper);
	
	public boolean remove(String resNum);
	
	public int countOper(String resNum);

}
