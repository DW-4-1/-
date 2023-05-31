package kr.or.dw.board.service;

import java.util.List;
import java.util.Map;

import kr.or.dw.vo.BoardVO;

public interface IBoardService {

	/**
	 * 게시판 전체 레코드 수를 가져오는 메서드
	 * @return 전체 레코드 수
	 */
	int selectBoardCount();

	/**
	 * 게시판 목록을 가져오는 메서드
	 * @param paramMap rownum 의 시작과 끝값이 있는 map
	 * @return 게시판 목록 list
	 */
	List<BoardVO> selectBoardList(Map<String, Object> paramMap);
	
	/**
	 * 공지사항 보는 메서드
	 * @param bd_no
	 * @return
	 */
	BoardVO selectBulletinBoardView(int bd_no);


	
}
