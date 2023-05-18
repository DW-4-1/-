<%@page import="kr.or.dw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세 보기</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$('#listBtn').on('click', function(){
			location.href = "<%=request.getContextPath()%>/member/memberList.do"
		})
		
		
	})
</script>
</head>
<body>
<body>
	<%
		MemberVO memVo = (MemberVO)request.getAttribute("memDtl"); 
	%>
	<h2>회원 정보 상세보기</h2>
	<form method="post" action="<%=request.getContextPath()%>/member/memberUpdate.do">
		<table border="1">
			<tr>
				<td>회원ID</td>
				<td><%=memVo.getMem_id() %></td>
			</tr>
			<tr>
				<td>회원이름</td>
				<td><input type="text" name="name" maxlength="10" value="<%=memVo.getMem_name() %>"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tel" maxlength="13" value="<%=memVo.getMem_tel() %>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" maxlength="50" value="<%=memVo.getMem_addr() %>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="저장" id="updateBtn">
					<input type="button" value="회원목록" id="listBtn">
					<input type="button" value="회원삭제" id="deleteBtn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>