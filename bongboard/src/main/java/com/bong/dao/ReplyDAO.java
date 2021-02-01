package com.bong.dao;

import java.util.List;

import com.bong.domain.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> list(int bno) throws Exception;
	
	public void write(ReplyVO vo) throws Exception;
	
	public void modify(ReplyVO vo) throws Exception;
	
	public void delete(ReplyVO vo) throws Exception;

}
