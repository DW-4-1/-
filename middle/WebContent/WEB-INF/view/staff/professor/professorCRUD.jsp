<%@page import="kr.or.dw.vo.StaffVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수관리 페이지입니다.</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<%
	List<StaffVO> staVoList = (List)request.getAttribute("staVoList");
%>
<script>
	$(function(){
		$('#studentInsertBtn').on('click', function(){
			location.href = "/staff/stdentInsert.do"
		});
	})
</script>
<body>
<% for(StaffVO staVo : staVoList) {%>
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
				<th>고용일</th>
				<th>직분</th>
				<th>비밀번호</th>
			</tr>
			<tr>
				<td><%=staVo.getStaff_id()%></td>
				<td><%=staVo.getStaff_name()%></td>
				<td><%=staVo.getStaff_gender()%></td>
				<td><%=staVo.getStaff_resnum()%></td>
				<td><%=staVo.getStaff_addr()%></td>
				<td><%=staVo.getStaff_zipcode()%></td>
				<td><%=staVo.getDept_name()%></td>
				<td><%=staVo.getStaff_tel()%></td>
				<td><%=staVo.getStaff_email()%></td>
				<td><%=staVo.getStaff_state()%></td>
				<td><%=staVo.getStaff_hiredate()%></td>
				<td><%=staVo.getAuth_cd()%></td>
				<td><%=staVo.getStaff_pwd()%></td>
			</tr>
		</table>
	</form>
	<%	 }	 %>
	<input type="button" id="studentInsertBtn" value="학생추가">
</body>
</html>