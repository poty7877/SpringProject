package com.happytable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happytable.domain.Criteria;
import com.happytable.domain.ReplyPageDTO;
import com.happytable.domain.ReplyVO;
import com.happytable.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2

public class ReplyServiceImpl implements ReplyService {
	// 필드
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	// 메서드
	@Override
	public int register(ReplyVO vo) {
		log.info("ReplyServiceImpl.register 메서드 실행 " + vo);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("ReplyServiceImpl.get 메서드 실행 " + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("ReplyServiceImpl.modify 메서드 실행 " + vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		log.info("ReplyServiceImpl.remove 메서드 실행 " + rno);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, String resNum) {
		log.info("ReplyServiceImpl.getList 메서드 실행 게시물 번호 " + resNum);
		return mapper.getListWithPaging(cri, resNum);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, String resNum) {

		return new ReplyPageDTO(mapper.getCountByRno(resNum), mapper.getListWithPaging(cri, resNum));
	}

}
