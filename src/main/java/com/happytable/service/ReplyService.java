package com.happytable.service;

import java.util.List;

import com.happytable.domain.Criteria;
import com.happytable.domain.ReplyPageDTO;
import com.happytable.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);	// 댓글 등록용
	
	public ReplyVO get(Long rno); 		// 댓글 1개 호출
	
	public int modify(ReplyVO vo); 		// 댓글 객체 수정
	
	public int remove(Long rno); 		// 댓글 삭제
	
	public List<ReplyVO> getList(Criteria cri, String resNum); 
	// 게시글 번호로 모든 댓글을 리스트로 호출
	
	public ReplyPageDTO getListPage(Criteria cri, String resNum);
}
