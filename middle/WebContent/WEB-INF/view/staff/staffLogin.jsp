<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h2>교직원 및 관리자 로그인 페이지입니다.</h2>
	<form id="login" action="<%=request.getContextPath()%>/staff/staffLogin.do" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" id="ad_id" name="ad_id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="ad_pwd" name="stu_pwd"></td>
		</tr>
		<tr>
			<td colspan="1"><input type="submit" value="로그인" id="loginInformation"></td>
			<td colspan="1"><input type="button" onclick="location.href='<%=request.getContextPath()%>/staff/findPassword.jsp'" value="비밀번호 찾기" id="findPassword"></td>
		</tr>
		<tr>
		</tr>
	</table>
	</form>
	
</body>
<script>
	
</script>
</html>