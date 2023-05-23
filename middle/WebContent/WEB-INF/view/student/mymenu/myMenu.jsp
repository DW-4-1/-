<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>

<script>
	$(function(){
		$('#stuInfoUpdateBtn').on('click', function(){
			location.href="<%=request.getContextPath()%>/student/stuInfoUpdate.do";
		});
	})
</script>
</head>
<body>
	<h2>나의 정보 확인하기</h2>
	<table>
	<%
		StudentVO stu = (StudentVO)request.getAttribute("stu_id");
		
	%>
		<tr>
			<th>학번</th>
			<td><%=stu.getStu_id() %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=stu.getStu_name() %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=stu.getStu_gender() %></td>
		</tr>
		<tr>
			<th>주민번호</th>
			<td><%=stu.getStu_resnum() %></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=stu.getStu_addr() %></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><%=stu.getStu_zipcode() %></td>
		</tr>
		<tr>
			<th>학과명</th>
			<td><%=stu.getStu_deptname() %></td>
		</tr>
		<tr>
			<th>학과코드</th>
			<td><%=stu.getStu_deptcode() %></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=stu.getStu_tel() %></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=stu.getStu_email() %></td>
		</tr>
	</table>
		<input type="button" id="stuInfoUpdateBtn" value="내 정보 수정하기">
		<input type="button" id="passUpdateBtn" value="비밀번호 변경하기">
</body>
</html>