package kr.or.dw.staff.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.staff.service.StaffServiceImpl;
import kr.or.dw.staff.service.IStaffService;
import kr.or.dw.vo.StudentVO;
import kr.or.dw.web.IAction;

public class StaffLoginAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IStaffService service = StaffServiceImpl.getInstance();
		
		int cnt = 0;
		
		String view = "";
		
		String staff_id = req.getParameter("staff_id");
		String staff_pwd = req.getParameter("staff_pwd");

		StudentVO stuVo = new StudentVO();
		stuVo.setStu_id(staff_id);
		stuVo.setStu_pwd(staff_pwd);
		
		cnt = service.stuLogin(stuVo);
		if(cnt == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("staff_id", staff_id);
			view = "/student/main.jsp";
		}else {
			view = "/index.jsp";
		}
		
		return view;
	}

}
