package kr.or.dw.student.dao;

import kr.or.dw.vo.LectureVO;
import kr.or.dw.vo.StudentVO;

public interface IStudentDao {

	/**
	 * 학생 로그인 메서드
	 * @param stuVo(학생객체)
	 * @return 위의 파라미터로 조회한 컬럼값
	 */
	public int stuLogin(StudentVO stuVo);

}
