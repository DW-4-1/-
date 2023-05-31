package kr.or.dw.board.service;

import kr.or.dw.board.dao.BoardDaoImpl;
import kr.or.dw.board.dao.IBoardDao;

public class BoardServiceImpl implements IBoardService{

	private IBoardDao dao;
	private static BoardServiceImpl service;
	
	public static BoardServiceImpl getInstance() {
		if(service == null) {
			service = new BoardServiceImpl();
		}
		return service;
	}
	
	//생성자
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInstance();
	}


}
