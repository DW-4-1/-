package kr.or.dw.board.service;

import java.util.List;
import java.util.Map;

import kr.or.dw.board.dao.BoardDaoImpl;
import kr.or.dw.board.dao.IBoardDao;
import kr.or.dw.vo.BoardVO;

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

	@Override
	public int selectBoardCount() {
		return dao.selectBoardCount();
	}

	@Override
	public List<BoardVO> selectBoardList(Map<String, Object> paramMap) {
		return dao.selectBoardList(paramMap);
	}

	@Override
	public BoardVO selectBulletinBoardView(int bd_no) {
		return dao.selectBulletinBoeadView(bd_no);
	}


}
