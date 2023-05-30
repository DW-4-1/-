<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생추가 페이지 입니다.</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function(){
		$("#saveBtn").on('click', function(){
			$("#studentInsertForm").submit();
		});
	})
</script>
<%
	StudentVO stuVo = (StudentVO)request.getAttribute("dept");
%>
<body>
	<form id="studentInsertForm" method="post" action="<%=request.getContextPath()%>/staff/studentInsert.do">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" required></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" required></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<select>
						<option value="Male">남</option>
						<option value="Female">여</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td><input type="text" required></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" required></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" required></td>
			</tr>
			<tr>
				<th>학과</th>
				<td>
					<select>
					<% for(StudentVO vo : stuVo){ %>
						<option><%=stuVo.getDept_code()%> <%=stuVo.getDept_name()%></option>
					<% 	 }	 %>
					</select>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" required></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" required></td>
			</tr>
			<tr>
				<th>상태</th>
				<td><input type="text" required></td>
			</tr>
			<tr>
				<th>졸업예정일</th>
				<td><input type="Date" required></td>
			</tr>
			<tr>
				<th>직분</th>
				<td>
					<select>
						<option value="S">학생</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" required></td>
			</tr>
			<tr>
				<td><input id="saveBtn" type="button" value="저장"></td>
				<td><input id="resetBtn" type="button" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>