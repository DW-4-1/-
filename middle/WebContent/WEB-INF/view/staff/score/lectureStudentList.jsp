<%@page import="kr.or.dw.vo.LectureVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의수강 학생 리스트</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$('input[type=number]').on('change', function(){
			let sum = 0;
			  for (let i = 0; i < $('input[type=number]').length; i++) {
	       			sum += +$('input[type=number]').eq(i).val();
	            };
			let grade = "";
			$('#sum').attr('value', sum);
		});
	})
</script>
</head>
<body>
<h2>수강생 목록</h2>
<form id="scoreInsert" method="post">
<%
	String lec_code = request.getParameter("lecCode");
%>
	<input type="hidden" name="lec_code" value="<%=lec_code%>">
	<div style="width:1000px; height:50%; overflow:auto">
		<table border="1" width="100%" cellspacing="0" cellpadding="0" >
			<tr style="height: 50px;">
				<th>학생학번</th>
				<th>이름</th>
				<th>과</th>
				<th>중간</th>
				<th>기말</th>
				<th>과제</th>
				<th>출석</th>
				<th>가산점</th>
				<th>합계</th>
				<th>등급</th>
			</tr>
		<%
			List<LectureVO> stuList = (List<LectureVO>)request.getAttribute("stuList");
			for(LectureVO stu : stuList){
		%>
				
			<tr style="text-align: center;">
				<td><%=stu.getStu_id() %></td>
				<td><%=stu.getStu_name() %></td>
				<td><%=stu.getDept_name() %></td>
				<td><input id="middle" style="width: 40px;" type="number"></td>
				<td><input id="final" style="width: 40px;" type="number"></td>
				<td><input id="assign" style="width: 40px;" type="number"></td>
				<td><input id="attend" style="width: 40px;" type="number"></td>
				<td><input id="point" style="width: 40px;" type="number"></td>
				<td><input id="sum" style="width: 40px;" type="text" readonly></td>
				<td>
					<select id="stu_grade" name="stu_grade">
						<option value="P">P</option>
						<option value="A+">A+</option>
						<option value="A">A</option>
						<option value="B+">B+</option>
						<option value="B">B</option>
						<option value="C+">C+</option>
						<option value="C">C</option>
						<option value="D+">D+</option>
						<option value="D">D</option>
						<option value="F">F</option>
					</select>
				</td>
			</tr>
		<%
			}
		%>
		</table>
	</div>
	<br>
	<input type="submit" value="저장하기">
</form>
</body>
</html>