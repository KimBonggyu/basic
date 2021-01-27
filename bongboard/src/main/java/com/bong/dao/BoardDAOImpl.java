package com.bong.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bong.domain.BoardVO;
import com.bong.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.bong.mappers.boardMapper";

	@Override
	public void write(BoardVO vo) throws Exception {

		sql.insert(namespace + ".write", vo);
	}

	@Override
	public BoardVO read(int bno) throws Exception {

		return sql.selectOne(namespace + ".read", bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {

		sql.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int bno) throws Exception {

		sql.delete(namespace + ".delete", bno);
	}

	@Override
	public List<BoardVO> list() throws Exception {

		return sql.selectList(namespace + ".list");
	}

	@Override
	public int count() throws Exception {

		return sql.selectOne(namespace + ".count");
	}

	@Override
	public List<BoardVO> listPage(int page) throws Exception {

		if(page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		
		return sql.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {

		return sql.selectList(namespace + ".listCriteria", cri);
	}

}
