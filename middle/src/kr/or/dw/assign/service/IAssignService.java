package kr.or.dw.assign.service;

import java.util.List;

import kr.or.dw.vo.AssignVO;

public interface IAssignService {
	
	/**
	 * 해당 강의의 과제목록을 불러오는 메서드
	 * @param lec_code
	 * @return
	 */
	List<AssignVO> getLectureAssignList(String lec_code);

	/**
	 * 교수 과제등록 메서드
	 * @param assignVo
	 * @return
	 */
	int insertAssign(AssignVO assignVo);
	
	/**
	 * 과제 제출한 학생들 목록 가져오는 메서드
	 * @param assign_no
	 * @return
	 */
	List<AssignVO> getSubStudentList(int assign_no);
	
	/**
	 * 학생의 과제 목록 가져오기
	 * @param stu_id
	 * @return
	 */
	List<AssignVO> getStuAssignList(String stu_id);


}
