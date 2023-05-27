<%@page import="kr.or.dw.vo.LectureVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의목록</title>
</head>
<body>
<h2>성적관리</h2>
<div style="width:1000px; height:50%; overflow:auto">
	<table border="1" width="100%" cellspacing="0" cellpadding="0" >
		<tr style="height: 50px;">
			<th>강의코드</th>
			<th>강의명</th>
			<th>강의년도</th>
			<th>강의학기</th>
			<th>학점</th>
			<th>수강생</th>
		</tr>
		<%
		List<LectureVO> lecList = (List<LectureVO>)request.getAttribute("lecList");
	
		for(LectureVO vo : lecList){
			
	%>
	
		<tr style="text-align: center; height: 30px;">
			<td><%=vo.getLec_code() %></td>
			<td><%=vo.getLec_name() %></td>
			<td><%=vo.getLec_year() %>년</td>
			<td><%=vo.getLec_term() %>학기</td>
			<td><%=vo.getLec_credit() %></td>
			<td><input type="button" value="수강생조회" onclick="location.href='<%=request.getContextPath()%>/lecture/lectureStudentList.do?lecCode=<%=vo.getLec_code()%>'"></td>
		</tr>		
	<%
		}
	%>
		
	</table>
</body>
</html>