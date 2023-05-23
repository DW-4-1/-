<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="kr.or.dw.vo.LectureVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적조회</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>

</head>
<body>
	<h3>성적조회</h3>

	</select>
	
	<div style="width:1000px; height:200px; overflow:auto">
		<table border="1" width="100%" cellspacing="0" cellpadding="0">
			<tr style="height:50px;">
				<th>수강년도 및 학기</th>
				<th>신청학점</th>
				<th>평점계</th>
				<th>평점평균</th>
			</tr>
			
		<% 
			List<LectureVO> lecList = (List)request.getAttribute("lecList"); //학생이 수강한 년도만 보이게
			Set<String> yearTermList = new HashSet<>();
			for(LectureVO vo : lecList){
				yearTermList.add(vo.getStu_year() + "년 " + vo.getStu_term());
			};
			for(String yearterm : yearTermList){
		%>
				<tr type="var" name="<%=yearterm %>" style="text-align:center; height:30px;">
					<td><%=yearterm%></td>
				</tr>
		<%	} %>
		
<%-- 			<% --%>
			
<%-- 			for(LectureVO vo : lecList){%> --%>
<%-- 				<tr type="var" name="<%=vo.getStu_year() %>" style="text-align:center; height:30px;"> --%>
<%-- 					<td><%=vo.getStu_year() %></td> --%>
<%-- 					<td><%=vo.getStu_term() %></td> --%>
<%-- 					<td><%=vo.getLec_div() %></td> --%>
<%-- 					<td><%=vo.getLec_credit() %></td> --%>
<!-- 				</tr> -->
			
<%-- 			<%}%> --%>
		
		
		</table>
	</div>
	
	<br>
	<br>
	
	<div style="width:1000px; height:200px; overflow:auto">
		<table border="1" width="100%" cellspacing="0" cellpadding="0">
			<tr style="height:50px;">
				<th>강의명</th>
				<th>교수명</th>
				<th>구분</th>
				<th>학점</th>
				<th>등급</th>
				<th>평점</th>
			</tr>
			<%
			
			for(LectureVO vo : lecList){%>
				<tr type="var" name="<%=vo.getStu_year() %>" style="text-align:center; height:30px;">
					<td><%=vo.getLec_name() %></td>
					<td><%=vo.getLec_pro() %></td>
					<td><%=vo.getLec_div() %></td>
					<td><%=vo.getLec_credit() %></td>
				</tr>
			
			<%}%>
		
		
		</table>
	</div>
</body>
</html>