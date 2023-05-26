package kr.or.dw.student.dao;

import java.util.List;

import kr.or.dw.vo.LectureVO;
import kr.or.dw.vo.StudentVO;

public interface IStudentDao {

	/**
	 * 학생 로그인 메서드
	 * @param stu_id(학생아이디)
	 * @return 위의 파라미터로 조회한 컬럼값
	 */
	public StudentVO stuLogin(String stu_id);

	/**
	 * 학생의 정보를 가져오는 메서드
	 * @param stu_id 
	 * @return
	 */
	public StudentVO getAllStudentInfo(String stu_id);

	/**
	 * 학생의 정보를 가져오는 메서드
	 * @param stu_id
	 * @return 
	 */
	public StudentVO studentInfo(String stu_id);

	/**
	 * 학생의 정보를 수정하는 메서드
	 * @param stuVo
	 * @return
	 */
	public int studentInfoUpdate(StudentVO stuVo);

	public String passwordUpdate(StudentVO stuVo);

}
