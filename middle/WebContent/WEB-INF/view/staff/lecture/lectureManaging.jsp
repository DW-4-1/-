<%@page import="kr.or.dw.vo.LectureVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의관리</title>
</head>
<body>
<h2>강의관리페이지</h2>
<table>
	<tr>
		<th>강의코드</th>
		<th>강의명</th>
		<th>강의실</th>
		<th>강의년도</th>
		<th>강의학기</th>
		<th>강의시간</th>
		<th>학점</th>
		<th>강의구분</th>
	</tr>
<%
	List<LectureVO> lecList = (List<LectureVO>)request.getAttribute("lecList");
	String lec_time = null;
	double timecre = 0;
	for(LectureVO lecture : lecList){
		timecre = (double) lecture.getLec_time() / lecture.getLec_credit();
		if(timecre == 1.5){
			lec_time = "1, 2";
		}else if(timecre == 2){
			lec_time = "1, 2, 3";
		}else if(timecre == 2.5){
			lec_time = "2, 3";
		}else if(timecre == 3){
			lec_time = "2, 3, 4";
		}else if(timecre == 3.5){
			lec_time = "3, 4";
		}else if(timecre == 4){
			lec_time = "3, 4, 5";
		}else if(timecre == 4.5){
			lec_time = "4, 5";
		}else if(timecre == 5){
			lec_time = "4, 5, 6";
		}else if(timecre == 5.5){
			lec_time = "5, 6";
		}else if(timecre == 6){
			lec_time = "5, 6, 7";
		}else if(timecre == 6.5){
			lec_time = "6, 7";
		}else if(timecre == 7){
			lec_time = "6, 7, 8";
		}else if(timecre == 7.5){
			lec_time = "7, 8";
		}else if(timecre == 8){
			lec_time = "7, 8, 9";
		}else if(timecre == 8.5){
			lec_time = "8, 9";
		}
%>

	<tr>
		<td><%=lecture.getLec_code() %></td>
		<td><%=lecture.getLec_name() %></td>
		<td><%=lecture.getLec_loc() %></td>
		<td><%=lecture.getLec_year() %>년</td>
		<td><%=lecture.getLec_term() %>학기</td>
		<td><%=lecture.getLec_day() %> <%=lec_time %>교시</td>
		<td><%=lecture.getLec_credit() %></td>
		<td><%=lecture.getLec_div() %></td>
	</tr>		
<%
	}
%>
</table>
</body>
</html>