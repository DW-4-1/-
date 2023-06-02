package kr.or.dw.assign.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.assign.service.AssignServiceImpl;
import kr.or.dw.assign.service.IAssignService;
import kr.or.dw.vo.AssignVO;
import kr.or.dw.web.IAction;

public class InsertAssignAction implements IAction{

	@Override
	public boolean isRedirect() {
		
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String lec_code = req.getParameter("lec_code");
		String assign_name = req.getParameter("assign_name");
		String assign_content = req.getParameter("assign_content");
		String assign_start = req.getParameter("assign_start");
		String assign_end = req.getParameter("assign_end");
		
		AssignVO assignVo = new AssignVO();
		assignVo.setAssign_content(assign_content);
		assignVo.setAssign_end(assign_end);
		assignVo.setAssign_name(assign_name);
		assignVo.setAssign_start(assign_start);
		assignVo.setLec_code(lec_code);
		
		IAssignService service = AssignServiceImpl.getInstance();
		int assign_no = 0;
		assign_no = service.insertAssign(assignVo);
		
		return "/assign/assignView.do?assign_no=" + assign_no;
	}

}
