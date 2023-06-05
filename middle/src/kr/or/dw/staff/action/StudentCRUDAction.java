package kr.or.dw.staff.action;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.student.service.IStudentService;
import kr.or.dw.student.service.StudentServiceImpl;
import kr.or.dw.util.PaginationUtil;
import kr.or.dw.vo.StudentVO;
import kr.or.dw.web.IAction;

public class StudentCRUDAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IStudentService service = StudentServiceImpl.getInstance();
		
		List<StudentVO> stuVoList = service.getAllStudentInfo();
		
		req.setAttribute("stuVoList", stuVoList);
		
		// 페이징 처리
		Map<String, Integer> pagingConfigMap = null;
		PaginationUtil pagination = new PaginationUtil();
		String pageParam = req.getParameter("page");	//사용자가 선택한 페이지번호
		int page = (pageParam == null ? 1 : Integer.parseInt(pageParam));
		// 추가
		String search = "";
		if(req.getParameter("search") == null) {
			search = "%%";
		}else {
			search = "%" + req.getParameter("search") + "%";
		}
		
		return "/staff/student/studentCRUD.jsp";
	}

}
