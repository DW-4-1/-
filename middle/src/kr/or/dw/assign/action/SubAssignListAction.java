package kr.or.dw.assign.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.assign.service.AssignServiceImpl;
import kr.or.dw.assign.service.IAssignService;
import kr.or.dw.vo.AssignVO;
import kr.or.dw.web.IAction;

public class SubAssignListAction implements IAction{

	@Override
	public boolean isRedirect() {
		
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int assign_no = Integer.parseInt(req.getParameter("assign_no"));
		
		List<AssignVO> stuList = null;

		
		IAssignService service = AssignServiceImpl.getInstance();
		
		stuList = service.getSubStudentList(assign_no);
		
		req.setAttribute("stuAssignList", stuList);
		req.setAttribute("assign_no", assign_no);
		
		return "/staff/score/submitAssignList.jsp";
	}

}
