<%@page import="kr.or.dw.vo.LectureVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의수강 학생 리스트</title>
</head>
<body>
<h2>수강생 목록</h2>
<div style="width:1000px; height:50%; overflow:auto">
	<form id="scoreInsert" method="post">
		<table border="1" width="100%" cellspacing="0" cellpadding="0" >
			<tr style="height: 50px;">
				<th>학생학번</th>
				<th>이름</th>
				<th>과</th>
				<th>중간</th>
				<th>기말</th>
				<th>과제</th>
				<th>출석</th>
				<th>가산점</th>
				<th>합계</th>
				<th>등급</th>
			</tr>
		<%
			List<LectureVO> stuList = (List<LectureVO>)request.getAttribute("stuList");
			for(LectureVO stu : stuList){
		%>
				
			<tr style="text-align: center;">
				<td><%=stu.getStu_id() %></td>
				<td><%=stu.getStu_name() %></td>
				<td><%=stu.getDept_name() %></td>
				<td id="middle"><input style="width: 40px;" type="number"></td>
				<td id="final"><input style="width: 40px;" type="number"></td>
				<td id="assign"><input style="width: 40px;" type="number"></td>
				<td id="attend"><input style="width: 40px;" type="number"></td>
				<td id="point"><input style="width: 40px;" type="number"></td>
				<td id="sum">합계</td>
				<td id="grade" name="grade">등급</td>
			</tr>
		<%
			}
		%>
		</table>
	</form>
</div>
</body>
</html>