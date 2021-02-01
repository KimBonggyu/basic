package com.bong.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bong.dao.ReplyDAO;
import com.bong.domain.ReplyVO;

@Repository
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> list(int bno) throws Exception {

		return dao.list(bno);
	}

	@Override
	public void write(ReplyVO vo) throws Exception {

		dao.write(vo);
	}
	
	@Override
	public void modify(ReplyVO vo) throws Exception {

		dao.modify(vo);
	}

	@Override
	public void delete(ReplyVO vo) throws Exception {

		dao.delete(vo);
	}
	

}
