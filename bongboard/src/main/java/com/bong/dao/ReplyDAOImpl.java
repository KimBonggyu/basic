package com.bong.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bong.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.bong.mappers.replyMapper";

	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		
		return sql.selectList(namespace + ".replyList", bno);
	}

	@Override
	public void write(ReplyVO vo) throws Exception {

		sql.insert(namespace + ".replyWrite", vo);
	}
	
	@Override
	public void modify(ReplyVO vo) throws Exception {

		sql.update(namespace + ".replyModify", vo);
	}

	@Override
	public void delete(ReplyVO vo) throws Exception {

		sql.delete(namespace + ".replyDelete", vo);
	}
	

}
