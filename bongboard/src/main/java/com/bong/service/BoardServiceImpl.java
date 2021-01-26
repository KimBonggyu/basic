package com.bong.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bong.dao.BoardDAO;
import com.bong.domain.BoardVO;

@Repository
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;

	@Override
	public void write(BoardVO vo) throws Exception {

		dao.write(vo);
	}

	@Override
	public BoardVO read(int bno) throws Exception {

		return dao.read(bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {

		dao.update(vo);
	}

	@Override
	public void delete(int bno) throws Exception {

		dao.delete(bno);
	}

	@Override
	public List<BoardVO> list() throws Exception {

		return dao.list();
	}

	@Override
	public int count() throws Exception {

		return dao.count();
	}

	@Override
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {

		return dao.listPage(displayPost, postNum);
	}

}
