<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
</head>
<body>
	<%
		StudentVO stu = (StudentVO)request.getAttribute("stuVo");
		
	%>
<script>
	$(function(){
// 		let changeFlag = false;
<%-- 		let stu_addr = "<%=stu.getStu_addr() %>"; --%>
<%-- 		let stu_zipcode = "<%=stu.getStu_zipcode() %>"; --%>
<%-- 		let stu_tel = "<%=stu.getStu_tel() %>"; --%>
// 		let ValArr = [stu_addr, stu_zipcode, stu_tel];
		
// 		$('#studentInfoUpdateForm').on('propertychange keyup paste', function(){
// 			let inputArr = $(this).find('input[type=text]');
// 			for(let i = 0; i < inputArr.length; i++){
// 				if($(inputArr[i]).val() == ValArr[i]){
// 					changeFlag = false;
// 				}else{
// 					changeFlag = true;
// 					break;
// 				};
// 			};
// 		});
		
		$('#updateBtn').on('click', function(){
			if(changeFlag == true){
				$('#studentInfoUpdateForm').submit();
			}else{
				alert('변경된 정보가 없습니다.');
			};
		});
		$('#infoBtn').on('click', function(){
			location.href = "<%=request.getContextPath()%>/student/studentInfo.do";
		});
	})
</script>
	
	<form method="post" id="studentInfoUpdateForm" action="<%=request.getContextPath()%>/student/studentInfoUpdate.do">
		<table>
			<tr>
				<th>학번</th>
				<td><%=stu.getStu_id() %></td>
				<input type="hidden" name="stu_id" value="<%=stu.getStu_id() %>">
			</tr>
			<tr>
				<th>이름</th>
				<td><%=stu.getStu_name() %></td>
				<input type="hidden" name="stu_name" value="<%=stu.getStu_name() %>">
			</tr>
			<tr>
				<th>성별</th>
				<td><%=stu.getStu_gender() %></td>
				<input type="hidden" name="stu_gender" value="<%=stu.getStu_gender() %>">
			</tr>
			<tr>
				<th>주민번호</th>
				<td><%=stu.getStu_resnum() %></td>
				<input type="hidden" name="stu_resnum" value="<%=stu.getStu_resnum() %>">
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="stu_addr"value="<%=stu.getStu_addr() %>"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="stu_zipcode"value="<%=stu.getStu_zipcode() %>"></td>
			</tr>
			<tr>
				<th>학과명</th>
				<td><%=stu.getStu_deptname() %></td>
				<input type="hidden" name="stu_deptname" value="<%=stu.getStu_deptname() %>">
			</tr>
			<tr>
				<th>학과코드</th>
				<td><%=stu.getStu_deptcode() %></td>
				<input type="hidden" name="stu_deptcode" value="<%=stu.getStu_deptcode() %>">
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="stu_tel" value="<%=stu.getStu_tel() %>"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=stu.getStu_email() %></td>
				<input type="hidden" name="stu_email" value="<%=stu.getStu_email() %>">
			</tr>
			<tr>
				<td colspan="2">
						<input type="button" value="저장" id="updateBtn">
						<input type="button" value="내정보" id="infoBtn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>