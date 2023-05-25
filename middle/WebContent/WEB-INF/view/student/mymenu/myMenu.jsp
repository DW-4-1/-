<%@page import="kr.or.dw.vo.StudentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>

</head>
<body>
	<h2>나의 정보 확인하기</h2>
	<table>
	<%
		StudentVO stuVo = (StudentVO)request.getAttribute("stuInfo");
		
		for(StudentVO vo : stuVo){
	%>
		<tr>
			<th>학번</th>
			<td><%=vo.getStu_id() %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=vo.getStu_name() %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=vo.getStu_gender() %></td>
		</tr>
		<tr>
			<th>주민번호</th>
			<td><%=vo.getStu_resnum() %></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=vo.getStu_addr() %></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><%=vo.getStu_zipcode() %></td>
		</tr>
		<tr>
			<th>학과명</th>
			<td><%=vo.getStu_deptname() %></td>
		</tr>
		<tr>
			<th>학과코드</th>
			<td><%=vo.getStu_deptcode() %></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=vo.getStu_tel() %></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=vo.getStu_email() %></td>
		</tr>

	<% 
		}
	%>			
	
	</table>
</body>
</html>