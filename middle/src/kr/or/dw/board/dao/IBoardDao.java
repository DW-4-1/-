package kr.or.dw.board.dao;

import java.util.List;
import java.util.Map;

import kr.or.dw.vo.BoardVO;


public interface IBoardDao {
	/**
	 * 게시판 목록을 가져오는 메서드
	 * @param paramMap rownum 의 시작과 끝값이 있는 map
	 * @return 게시판 목록 list
	 */
	public List<BoardVO> selectBoardList(Map<String, Object> paramMap);

	/**
	 * 게시판 전체 레코드 수를 가져오는 메서드
	 * @return 전체 레코드 수
	 */
	public int selectBoardCount();
	
	/**
	 * 공지사항 글 보는 메서드
	 * @param bd_no
	 * @return
	 */
	public BoardVO selectBulletinBoeadView(int bd_no);
}
