<%@page import="kr.or.dw.vo.LectureVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript">
	$(function(){
		$(document).on('click', '#planDownBtn', function(){
			let plan_path = $(this).prop('name');
			console.log(plan_path);
			location.href="<%=request.getContextPath()%>/lecture/downloadLecturePlan.do?plan_path=" + plan_path;
			
		})
	})
</script>
<title>강의관리</title>
</head>
<body>
<h2>강의관리페이지</h2>
<div style="width:1000px; height:50%; overflow:auto">
	<table border="1" width="100%" cellspacing="0" cellpadding="0" >
		<tr style="height: 50px;">
			<th>강의코드</th>
			<th>강의명</th>
			<th>강의실</th>
			<th>강의년도</th>
			<th>강의학기</th>
			<th>강의시간</th>
			<th>학점</th>
			<th>강의구분</th>
			<th>강의계획안</th>
			<th>수정</th>
		</tr>
	<%
		List<LectureVO> lecList = (List<LectureVO>)request.getAttribute("lecList");
		String disabled = "";
		for(LectureVO vo : lecList){
			if(vo.getPlan_path() == null){
				disabled = "disabled";
			}
			String lec_time = "" + vo.getLec_time();
			for(int i = 1; i < vo.getLec_hour(); i++){
				lec_time += ", " + (vo.getLec_time() + i);
			}
	%>
			<tr style="text-align: center; height: 30px;">
				<td><%=vo.getLec_code() %></td>
				<td><%=vo.getLec_name() %></td>
				<td><%=vo.getLec_loc() %></td>
				<td><%=vo.getLec_year() %>년</td>
				<td><%=vo.getLec_term() %>학기</td>
				<td><%=vo.getLec_day() %> <%=lec_time %>교시</td>
				<td><%=vo.getLec_credit() %></td>
				<td><%=vo.getLec_div() %></td>
				<td>
					<input type="button" value="다운로드" <%=disabled %> id="planDownBtn" name="<%=vo.getPlan_path()%>">
				</td>
				<td><input type="button" value="수정" onclick="location.href='<%=request.getContextPath()%>/lecture/lectureInsertForm.do?lecCode=<%=vo.getLec_code()%>'"></td>
			</tr>		
	<%
		}
	%>
	</table>
</div>

<%@ include file="../footer.jsp" %>