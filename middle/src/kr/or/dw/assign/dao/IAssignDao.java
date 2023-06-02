package kr.or.dw.assign.dao;

import java.util.List;

import kr.or.dw.vo.AssignVO;

public interface IAssignDao {

	/**
	 * 해당 강의의 과제물을 모두 가져오는 메서드
	 * @param lec_code
	 * @return
	 */
	public List<AssignVO> getLectureAssignList(String lec_code);
	
	/**
	 * 교수과제등록메서드
	 * @param assignVo
	 * @return
	 */
	public int insertAssign(AssignVO assignVo);

}
