<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<title>Insert title here</title>
	<%
		StudentVO stu = (StudentVO)request.getAttribute("stuVo");
		
	%>
</head>
<body>
	<table>
		<tr>
			<th>현재 비밀번호</th>
			<td><input type="text" name="stu_pwd" value="<%=stu.getStu_pwd() %>"></td>
		</tr>
		<tr>
			<th>바꿀 비밀번호</th>
			<td><input type="text" name="stu_pwd" value="<%=stu.getStu_pwd() %>"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="text" name="stu_pwd" value="<%=stu.getStu_pwd() %>"></td>
		</tr>
	</table>
</body>
</html>