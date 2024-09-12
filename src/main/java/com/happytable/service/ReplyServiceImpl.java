package com.happytable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happytable.domain.Criteria;
import com.happytable.domain.ReplyPageDTO;
import com.happytable.domain.ReplyVO;
import com.happytable.domain.UpdateReplyDTO;
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

		setRating(vo.getResNum());

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

		setRating(vo.getResNum());

		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		log.info("ReplyServiceImpl.remove 메서드 실행 " + rno);

		ReplyVO vo = mapper.read(rno);
		int result = mapper.delete(rno);
		/* setRating(vo.getResNum()); */

		return result;
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

	public void setRating(String resNum) {

		// 선언한 메서드의 구현부에 먼저 상품의 평점 평균값을 구하는 Mapper 메서드를 호출하여 반환받은 값을 새로 선언한 변수에 대입하는 코드
		Double ratingAvg = mapper.getRatingAverage(resNum);

		// 반환 받은 값이 null 일 경우 변수에 0이 저장되도록 if문을 사용해서 작성

		if (ratingAvg == null) {
			ratingAvg = 0.0;
		}

		// 평균값의 소수점 첫째 자리까지 표시
		ratingAvg = (double) (Math.round(ratingAvg * 10));
		ratingAvg = ratingAvg / 10;

		// UpdateReplyDTO 객체를 인스턴스화 하여 resNum, ratingAvg 값을 객체의 변수에 저장
		UpdateReplyDTO urd = new UpdateReplyDTO();
		urd.setResNum(resNum);
		urd.setRatingAvg(ratingAvg);

		// 값이 세팅된 UpdateReplyDTO 객체를 인자로 하는 updateRating Mapper 메서드(테이블에 평균 평점 반영)를 호출
		mapper.updateRating(urd);

	}

}
