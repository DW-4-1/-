<%@page import="kr.or.dw.vo.LectureVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

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
			for(let i = 0; i < $(this).parents('tr').find('input[type=number]').length; i++){
				sum += +$(this).parents('tr').find('input[type=number]').eq(i).val();
				console.log(sum);
			}
			$(this).parents('tr').find('input[name=stu_score]').attr('value', sum);
		});
		
		$('#cancelBtn').on('click', function(){
			location.href="<%=request.getContextPath()%>/lecture/lectureScoreList.do";
		})
	})
</script>
</head>
<body>
<h2>수강생 목록</h2>
<%
	String lec_code = request.getParameter("lecCode");
	

%>
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
				<th>저장</th>
			</tr>
		
		<%
			List<LectureVO> stuList = (List<LectureVO>)request.getAttribute("stuList");
			String stu_grade = "";
			for(LectureVO stu : stuList){
				if(!stu.getStu_grade().equals("null")){
		%>
				<script>
						$(function(){
							let stu_grade = '<%=stu.getStu_grade()%>';
							$('#<%=stu.getStu_id()%>').find('.stu_grade').val(stu_grade).prop('selected', true);
						})
				</script>					
					
		<%
				}
		%>
		<form id="scoreInsert" method="post" action="<%=request.getContextPath()%>/lecture/scoreUpdate.do">
		<input type="hidden" name="lec_code" value="<%=lec_code%>">
			<tr style="text-align: center;" id="<%=stu.getStu_id()%>">
				<td><%=stu.getStu_id() %></td>
				<input type="hidden" name="stu_id" id="stu_id" value="<%=stu.getStu_id()%>">
				<td><%=stu.getStu_name() %></td>
				<td><%=stu.getDept_name() %></td>
				<td><input id="middle" style="width: 40px;" type="number" min="0"></td>
				<td><input id="final" style="width: 40px;" type="number" min="0"></td>
				<td><input id="assign" style="width: 40px;" type="number" min="0"></td>
				<td><input id="attend" style="width: 40px;" type="number" min="0"></td>
				<td><input id="point" style="width: 40px;" type="number" min="0"></td>
				<td><input id="<%=stu.getStu_id() %>" name="stu_score" style="width: 40px;" type="text" value="<%=stu.getStu_score() %>" readonly></td>
				<td>
					<select class='stu_grade' id="<%=stu.getStu_grade()%>" name="stu_grade">
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
				<td><input type="submit" value="저장하기" id="updateBtn"></td>
				<td><input type="button" value="학생 삭제하기" id="stuDeleteBtn" onclick="location.href='<%=request.getContextPath()%>/lecture/deleteStudentLecture.do?stu_id=<%=stu.getStu_id() %>&lec_code=<%=lec_code %>'"></td>
			</tr>
		</form>
		<%
			}
		%>
		</table>
	<br>
	
</div>
<input type="button" value="뒤로가기" id="cancelBtn">
</body>
</html>

<%@ include file="../footer.jsp" %>