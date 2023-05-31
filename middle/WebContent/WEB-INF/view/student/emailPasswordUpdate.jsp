<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<form method="post" id="email_passwordForm" action="/student/emailPassUpdateResult.do">
		<div class="form-floating w-75 m-auto" style="padding-bottom: 0.5em;">
			<input type="password" name="stu_pwdChange" class="form-control"
				placeholder="변경 비밀번호"> <label for="floatingPassword">변경
				비밀번호</label>
		</div>
		<div class="form-floating w-75 m-auto" style="padding-bottom: 0.5em;">
			<input type="password" name="stu_pwdCheck" class="form-control"
				placeholder="비밀번호 확인"> <label for="floatingPassword">비밀번호
				확인</label>
		</div>
		<br>
		<div class="center-input" style="padding-bottom: 5em;">
			<input class="w-10 btn btn-secondary" type="submit" id="saveBtn"
				value="저장"> <input class="w-10 btn btn-secondary"
				type="submit" id="resetBtn" value="취소">
		</div>
	</form>
</body>
</html>