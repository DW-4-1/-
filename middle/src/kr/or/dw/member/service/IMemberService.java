package kr.or.dw.member.service;

import java.util.List;

import kr.or.dw.vo.MemberVO;

/*
 * Service객체는 Dao에 설정된 메서드를 원하는 작업에 맞게 호출하여 결과를 받아오고,
 * 받아온 결과 자료를 Controller 에게 보내주는 역할을 한다.
 * 보통 DAO메서드와 메서드명을 같게 한다.
 */
public interface IMemberService {
	
	/**
	 * 전체 회원 정보를 DB에서 가져와 List에 담아서 반환하는 메서드
	 * @return 회원정보(MemberVO)가 저장될 List객체
	 */
	public List<MemberVO> getAllMember();

	/**
	 * 회원을 등록할 때 ID의 중복 확인을 하는 메서드
	 * @param mem_id(회원ID)
	 * @return 회원 ID를 조건으로 한 SELECT COUNT() 값
	 */
	public int getMemberCount(String mem_id);
	
	/**
	 * 회원의 정보를 등록하는 메서드
	 * @param memVo(MemberVO 객체)
	 * @return INSERT 대상 수
	 */
	public int insertMember(MemberVO memVo);

	/**
	 * 회원의 상세정보를 조회하는 메서드
	 * @param id(회원ID)
	 * @return MemberVo(회원객체)
	 */
	public MemberVO getMember(String mem_id);

}
