package kr.or.dw.board.dao;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;


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





	
}
