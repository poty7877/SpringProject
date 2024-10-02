package com.happytable.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.happytable.domain.Criteria;
import com.happytable.domain.ReplyVO;
import com.happytable.domain.UpdateReplyDTO;

public interface ReplyMapper {
	// xml와 연동해서 sql 처리 // 추상메서드가 필요하다

	public int insert(ReplyVO vo);
	// 댓글쓰기 -> ReplyVO 객체가 넘어오고 리턴는 int가 됨 (c)

	public ReplyVO read(Long rno);
	// 댓글확인 -> 댓글번호로 댓글(객체)를 가져옴 (r)

	public int update(ReplyVO reply);
	// 댓글 -> 수정 객체가 넘어가서 수정되고 결과는 int처리 됨.

	public int delete(Long rno);
	// 댓글 삭제 -> 댓글 번호로 레코드를 삭제한 후 int로 리텀 됨

	// 댓글 리스트 페이징 처리
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("resNum") String resNum);

	public int getCountByRno(String resNum);

	// 평점 평균 구하기
	public Double getRatingAverage(String resNum);

	// 평점 평균 반영하기
	public int updateRating(UpdateReplyDTO dto);
	
	public int allDelete(String resNum);
}
