<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<title>비밀번호 변경 페이지입니다.</title>
	<%
		StudentVO stu = (StudentVO)request.getAttribute("stu_id");
	%>
<script>
	$(function(){
		let stu_id = "<%=stu.getStu_id()%>"
		let stu_pwd = "<%=stu.getStu_pwd()%>"
		
		let pwdChk = false;
		let pwdFlag = false;
		
		let pwdCheck = $('input[name=stu_pwdCheck]');
		let pwdChange = $('input[name=stu_pwdChange]');
		let stuPwd = $('input[name=stu_pwd]');
		
		pwdCheck.on('keyup', function(){
			let pwdCheckVal = pwdCheck.val();
			let pwdVal = pwdChange.val();
			if(pwdVal == pwdCheckVal){
				pwdChk = true;
			}else{
				pwdChk = false;
			}
		});
		stuPwd.on('keyup', function(){
			let stu_pwd = stuPwd.val();
			if(stu_pwd == <%=stu.getStu_pwd()%>){
				pwdFlag = true;
			}else{
				pwdFlag = false;
			}
		});
		
		$('#save').on('submit', function(e){
			if(!(pwdChk = true) || !(pwdFlag == true)){
				alert('비밀번호가 틀린 부분이 있습니다. 다시 입력해주세요.');
				e.preventDefault();
			}else{
				alert('비밀번호 변경이 완료 되었습니다.');
			}
			
		});
		
		$('#resetBtn').on('click', function(){
			location.href = "<%=request.getContextPath()%>/student/studentInfo.do";
		});
	})
</script>
</head>
<body>
	<form method="post" id="save" action="<%=request.getContextPath()%>/student/passwordUpdate.do">
	<table>
		<tr>
			<th>현재 비밀번호</th>
			<td><input type="text" name="stu_pwd" ></td>
		</tr>
		<tr>
			<th>변경 할 비밀번호</th>
			<td><input type="text" name="stu_pwdChange" ></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="text" name="stu_pwdCheck" ></td>
		</tr>
	</table>
		<input type="submit" id="saveBtn" value="저장">
		<input type="button" id="resetBtn" value="취소">
	</form>
</body>
</html>