package kr.or.dw.staff.service;

import java.util.List;

import kr.or.dw.vo.LectureVO;
import kr.or.dw.vo.StaffVO;
import kr.or.dw.vo.StudentVO;

public interface IStaffService {

	/**
	 * 교직원 로그인 메서드
	 * @param staff_id(교직원 아이디)
	 * @return staff객체
	 */
	public StaffVO staffLogin(String staff_id);

	public String getStaffName(String staff_id);

	/**
	 * 아이디 이메일 체크 후 인증코드 이메일로 보내는 메서드
	 * @param staffVo
	 * @return
	 */
	public int idEmailCheck(StaffVO staffVo);
	
	/**
	 * 모든 교수들을 불러오는 메서드
	 * @return
	 */
	public List<StaffVO> getAllProfessorList();
	
}
