<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수추가 페이지 입니다.</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function(){
		$('#saveBtn').on('click', function({
			$('#staffInsertForm').submit();
		})
	})
</script>

<body>
	<form id="staffInsertForm" method="post" action="<%=request.getContextPath()%>/staff/staffInsert.do">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="staff_id" required></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="staff_name" required></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<select name="staff_gender" required>
						<option value="Male">남</option>
						<option value="Female">여</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td><input type="text" name="staff_resnum" required></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="staff_addr" required></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="staff_zipcode" required></td>
			</tr>
			<tr>
				<th>학과</th>
				<td><input type="text" name=""></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="staff_tel" required></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="staff_email" required></td>
			</tr>
			<tr>
				<th>상태</th>
				<td><input type="text" name="staff_state" required></td>
			</tr>
			<tr>
				<th>직분</th>
				<td>
					<select name="auth_cd">
						<option value="P">교수</option>
						<option value="A">관리자</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="staff_pwd" required></td>
			</tr>
		</table>
		<input type="button" id="saveBtn" value="저장">
		<input type="button" id="resetBtn" value="취소">
	</form>
</body>
</html>