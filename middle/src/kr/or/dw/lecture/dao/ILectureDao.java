package kr.or.dw.lecture.dao;

import java.util.List;

import kr.or.dw.vo.LectureVO;

public interface ILectureDao {
	
	/**
	 * 모든 강의 목록을 가져오는 메서드
	 * @param id(학생 아이디)
	 * @return	강의목록이 저장될 LecVO 리스트
	 */
	List<LectureVO> getAllLecture(String id);

	
	int insertLecture(LectureVO lecVo);

	/**
	 * lec_code 가져오는 메서드
	 * @return
	 */
	String getLecCode();

	/**
	 * 교수 강의 목록 가져오는 메서드
	 * @param staff_id
	 * @return
	 */
	List<LectureVO> staffLecList(String staff_id);

}
