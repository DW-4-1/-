package kr.or.dw.calendar.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.dw.calendar.service.CalendarServiceImpl;
import kr.or.dw.calendar.service.ICalendarService;
import kr.or.dw.vo.CalendarVO;
import kr.or.dw.web.IAction;

public class GetAllEventAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		ICalendarService service = CalendarServiceImpl.getInstance();
		List<CalendarVO> calList = null;
		calList = service.getAllEvents();
		System.out.println(calList.get(0).getCal_no());
		System.out.println(calList.get(1).getCal_no());
		
		Gson gson = new Gson();
		
		String events = gson.toJson(calList);
		PrintWriter out = res.getWriter();
		out.println(events);
		out.flush();
		
		return null;
	}

}
