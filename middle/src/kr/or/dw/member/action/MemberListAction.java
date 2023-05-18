package kr.or.dw.member.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.member.service.IMemberService;
import kr.or.dw.member.service.MemberServiceImpl;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.web.IAction;

public class MemberListAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String view = "";
		
		IMemberService memService = MemberServiceImpl.getInstance();
		List<MemberVO> memList = memService.getAllMember();
	
		req.setAttribute("memList", memList);
		view = "/admin/member/memberList.jsp";
		
		return view;
	}

	
}
