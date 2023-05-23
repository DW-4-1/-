package kr.or.dw.staff.dao;

import kr.or.dw.vo.StaffVO;

public interface IStaffDao {

	/**
	 * 교직원 로그인 메서드
	 * @param staVo(교직원 객체)
	 * @return 존재하는 컬럼수
	 */
	int staffLogin(StaffVO staVo);

}
