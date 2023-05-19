<%@page import="kr.or.dw.vo.LectureVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 강의</title>
</head>
<body>
	<h3>수강 강의</h3>
	<select name="year"> 
	<% List<LectureVO> lecList = (List)request.getAttribute("lecList");
		for(LectureVO vo : lecList){%>
			<option><%=vo.getStu_year() %></option>
	<%	} %>

	</select>
	<br>
	<br>
	<table border="1">
		<tr>
			<th>강의코드</th>
			<th>강의명</th>
			<th>수강년도</th>
			<th>수강학기</th>
			<th>교수명</th>
			<th>강의실</th>
			<th>시간</th>
			<th>구분</th>
			<th>학점</th>
			<th>강의계획서</th>
		</tr>
		<%
		
		for(LectureVO vo : lecList){%>
			<tr>
				<td><%=vo.getLec_code() %></td>
				<td><%=vo.getLec_name() %></td>
				<td><%=vo.getStu_year() %></td>
				<td><%=vo.getStu_term() %></td>
				<td><%=vo.getLec_pro() %></td>
				<td><%=vo.getLec_loc() %></td>
				<td><%=vo.getLec_time() %></td>
				<td><%=vo.getLec_div() %></td>
				<td><%=vo.getLec_credit() %></td>
				<td><input type="button" value="강의계획서 보기"></td>
			</tr>
		
		<%}%>
	
	
	</table>
</body>
</html>