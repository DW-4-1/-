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
		
		
		$('#saveBtn').on('click', function(e){
			if($('input[name=stu_pwd]') != stu_pwd){
				alert('현재 비밀번호가 일치하지 않습니다.');
				e.prevaentDefault();
			}else if($('input[name=stu_pwd]') == stu_pwd){
				if($('input[name=stu_pwdChange]') != $('input[name=stu_pwdChcek]')){
				alert('변경한 비밀번호가 일치하지 않습니다.');
				e.prevaentDefault();
				}
			}else if($('input[name=stu_pwdChange]') == stu_pwd){
				alert('변경한 비밀번호가 현재 비밀번호와 일치합니다. 다른 비밀번호를 입력해주세요');
				e.prevaentDefault();				
			};
		});
		
		
		
		
		$('#resetBtn').on('click', function(){
			location.href = "<%=request.getContextPath()%>/student/studentInfo.do";
		});
	})
</script>
</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/student/passwordUpdate.do">
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
			<td><input type="text" name="stu_pwdChcek" ></td>
		</tr>
	</table>
	</form>
		<input type="submit" id="saveBtn" value="저장">
		<input type="button" id="resetBtn" value="취소">
</body>
</html>