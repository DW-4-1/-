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

public class StuAssignListAction implements IAction{

	@Override
	public boolean isRedirect() {
		
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String stu_id = (String) session.getAttribute("stu_id");
		
		List<AssignVO> assignList = null;
		IAssignService service = AssignServiceImpl.getInstance();
		
		assignList = service.getStuAssignList(stu_id);
		
		req.setAttribute("assignList", assignList);
		
		return "/student/assign/assignList.jsp";
	}

}
