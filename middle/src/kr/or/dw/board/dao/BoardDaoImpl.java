package kr.or.dw.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;
import kr.or.dw.vo.BoardVO;


public class BoardDaoImpl implements IBoardDao{
	
private static BoardDaoImpl dao;
	
	private SqlMapClient smc; 	//ibatis 용 SqlMapClient 객체 변수 선언
	
	private BoardDaoImpl() {
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static BoardDaoImpl getInstance() {
		if(dao == null) {
			dao = new BoardDaoImpl();
		}
		return dao;
	}

	@Override
	public List<BoardVO> selectBoardList(Map<String, Object> paramMap) {
		List<BoardVO> boardList = null;
		
		try {
			boardList = smc.queryForList("board.selectBoardList", paramMap);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return boardList;
	}

	@Override
	public int selectBoardCount() {
		int totalCount = 0;
		try {
			totalCount = (int) smc.queryForObject("board.selectBoardCount");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public BoardVO selectBulletinBoeadView(int bd_no) {
		BoardVO boardVo = null;
		
		try {
			boardVo = (BoardVO) smc.queryForObject("board.getBulletinBoardView", bd_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return boardVo;
	}





	
}
