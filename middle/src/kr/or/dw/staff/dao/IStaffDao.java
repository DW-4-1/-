package kr.or.dw.staff.dao;

import kr.or.dw.vo.StaffVO;

public interface IStaffDao {

	/**
	 * 교직원 로그인 메서드
	 * @param staff_id(교직원 아이디)
	 * @return staffVO 객체
	 */
	public StaffVO staffLogin(String staff_id);

}
