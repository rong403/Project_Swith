package kh.team2.swith.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.board.model.dao.BoardWriteDao;
import kh.team2.swith.board.model.vo.BoardWrite;

@Service
public class BoardWriteServiceImpl {
	
	@Autowired
	private BoardWriteDao dao;
	
	public int insertBoard(BoardWrite vo) {
		return dao.insertBoard(vo);
	}
}
