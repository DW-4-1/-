package kr.or.dw.lecture.service;

import java.util.List;

import kr.or.dw.vo.LectureVO;
import kr.or.dw.vo.StudentVO;

public interface ILectureService {

	/**
	 * 학생 강의 목록을 가져오는 메서드
	 * @param id(학생 아이디)
	 * @return	강의목록이 저장될 LecVO 리스트
	 */
	List<LectureVO> getAllLecture(String id);

	/**
	 * 강의등록 메서드
	 * @param lecVo(강의객체)
	 * @return
	 */
	int insertLecture(LectureVO lecVo);

	/**
	 * lec_code 가져오는 메서드
	 * @return
	 */
	String getLecCode();

	/**
	 * 교수 강의 목록 가져오는 메서드
	 * @param staff_id (교수아이디)
	 * @return
	 */
	List<LectureVO> staffLecList(String staff_id);

	/**
	 * 강의코드로 강의정보 가져오는 메서드
	 * @param lec_code
	 * @return
	 */
	LectureVO selectLecture(String lec_code);

	/**
	 * 강의 수정할때 원래 있던 강의 삭제하는 메서드
	 * @param lec_code
	 * @return
	 */
	int deleteLecture(String lec_code);

	/**
	 * 강의듣는 학생들 리스트
	 * @param lec_code
	 * @return
	 */
	List<LectureVO> getLectureStudentList(String lec_code);

	/**
	 * 점수입력하는 메서드
	 * @param lecVo
	 * @return
	 */
	int updateScore(LectureVO lecVo);
	
	/**
	 * 강의계획안 업로드 메서드
	 * @param lecVo
	 * @return
	 */
	int updatePlanFile(LectureVO lecVo);

}
