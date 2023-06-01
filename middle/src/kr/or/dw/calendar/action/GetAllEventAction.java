package kr.or.dw.calendar.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
//		Map<String, CalendarVO> calMap = new HashMap<String, CalendarVO>();
		
//		calMap = service.getAllEventsMap();
		calList = service.getAllEvents();
//		System.out.println(calList.get(0).getCal_no());
//		System.out.println(calList.get(1).getCal_no());
//		System.out.println(calMap.get(0).getCal_no());
//		System.out.println(calMap.get(1).getCal_no());
		
//		for(int i = 0; i < calList.size(); i++) {
//			calMap.put("evt" + i, calList.get(i));
//		}
		
		
        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
 
        HashMap<String, Object> hash = new HashMap<>();
 
        for (int i = 0; i < calList.size(); i++) {
            hash.put("title", calList.get(i).getTitle());
            hash.put("start", calList.get(i).getStart());
 
            jsonObj = new JSONObject(hash);
            jsonArr.add(jsonObj);
        }
//        log.info("jsonArrCheck: {}", jsonArr);

        Gson gson = new Gson();
        
//		String events = gson.toJson(calList);
//        String events = gson.toJson(calMap);
        String events = gson.toJson(jsonArr);
        PrintWriter out = res.getWriter();
        out.println(jsonArr);
        out.flush();
		
		return null;
	}

}
