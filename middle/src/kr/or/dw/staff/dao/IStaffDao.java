package kr.or.dw.staff.dao;

import kr.or.dw.vo.LectureVO;
import kr.or.dw.vo.StaffVO;

public interface IStaffDao {

	/**
	 * 교직원 로그인 메서드
	 * @param staff_id(교직원 아이디)
	 * @return staffVO 객체
	 */
	public StaffVO staffLogin(String staff_id);

	public String getStaffName(String staff_id);

	/**
	 * 아이디 이메일 체크 후 이메일로 인증코드 전송하는 메서드
	 * @param staffVo
	 * @return
	 */
	public int idEmailCheck(StaffVO staffVo);

}
