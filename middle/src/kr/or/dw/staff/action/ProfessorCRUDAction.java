package kr.or.dw.staff.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.staff.service.IStaffService;
import kr.or.dw.staff.service.StaffServiceImpl;
import kr.or.dw.util.PaginationUtil;
import kr.or.dw.vo.StaffVO;
import kr.or.dw.web.IAction;

public class ProfessorCRUDAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IStaffService service = StaffServiceImpl.getInstance();
		List<StaffVO> staVoList = service.getAllProfessorList();
		
		req.setAttribute("staVoList", staVoList);
		
		// 페이징 처리
		Map<String, Integer> pagingConfigMap = null;
		PaginationUtil pagination = new PaginationUtil();
		String pageParam = req.getParameter("page");	//사용자가 선택한 페이지번호
		//추가
		String search = "";
		if(req.getParameter("search") == null) {
			search = "%%";
		}else {
			search = "%" + req.getParameter("search") + "%";
		}
		int page = (pageParam == null ? 1 : Integer.parseInt(pageParam));
		
		int totalCount = service.selectProfessorCount(search);
		
		pagination.setConfig(page, 10, 10, totalCount);
		pagingConfigMap = pagination.getConfig();
		
		//ibatis에서 받을 parameterMap을 만든다.
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("start", pagingConfigMap.get("start"));
		paramMap.put("end", pagingConfigMap.get("end"));
		//추가
		paramMap.put("search", search);
		req.setAttribute("pagingConfigMap", pagination);
		
		req.setAttribute("titleName", "교수 관리");
		return "/staff/professor/professorCRUD.jsp";
	}

}
