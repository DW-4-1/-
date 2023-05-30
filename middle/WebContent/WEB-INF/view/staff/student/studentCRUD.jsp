<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생관리 페이지 입니다.</title>
</head>
<%
	StudentVO stuVo = new StudentVO();
%>


<body>
	<form>
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>학과</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>상태</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>졸업예정일</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>직분</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text"></td>
			</tr>
		</table>
	</form>
</body>
</html>