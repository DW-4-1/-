<%@page import="java.util.List"%>
<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생관리 페이지입니다.</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<%
	List<StudentVO> stuVoList = (List)request.getAttribute("stuVoList");
%>
<script>
	$(function(){
		$('#studentFormBtn').on('click', function(){
			location.href = "/staff/studentForm.do"
		});
		
	})
</script>
<body>
<% for(StudentVO stuVo : stuVoList) {%>
	<form>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>성별</th>
				<th>주민등록번호</th>
				<th>주소</th>
				<th>우편번호</th>
				<th>학과</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>상태</th>
				<th>졸업예정일</th>
				<th>직분</th>
				<th>비밀번호</th>
			</tr>
			<tr>
				<td><%=stuVo.getStu_id()%></td>
				<td><%=stuVo.getStu_name()%></td>
				<td><%=stuVo.getStu_gender()%></td>
				<td><%=stuVo.getStu_resnum()%></td>
				<td><%=stuVo.getStu_addr()%></td>
				<td><%=stuVo.getStu_zipcode()%></td>
				<td><%=stuVo.getDept_name()%></td>
				<td><%=stuVo.getStu_tel()%></td>
				<td><%=stuVo.getStu_email()%></td>
				<td><%=stuVo.getStu_state()%></td>
				<td><%=stuVo.getStu_grddate()%></td>
				<td><%=stuVo.getAuth_cd()%></td>
				<td><%=stuVo.getStu_pwd()%></td>
			</tr>
		</table>
	</form>
	<%	 }	 %>
	<input type="button" id="studentFormBtn" value="학생추가">
</body>
</html>