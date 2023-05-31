<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="kr.or.dw.vo.LectureVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<title>강의목록</title>
<script type="text/javascript">
	$(function(){
		$('select[name=year]').change(
				function() { //년도 선택하면 해당 년도의 강의만 보이는 함수
					for (let i = 0; i < $('tr[type=var]').length; i++) {
						if ($(this).val() == 'all') {
							$('tr[type=var]').css('display', '');
						} else if ($(this).val() == $($('tr[type=var]')[i])
								.attr('name')) {
							$($('tr[type=var]')[i]).css('display', '');
						} else {
							$($('tr[type=var]')[i]).css('display', 'none');
						}
					}

		});
	})
</script>
</head>
<body>
<h2>성적관리</h2>
<select id="year" name="year" style="margin-left: auto;">
	<option name="year" value="all">전체보기</option>
	<%
	List<LectureVO> lecList = (List) request.getAttribute("lecList"); //학생이 수강한 년도만 보이게
	Set<Integer> yearList = new HashSet<>();
	for (LectureVO vo : lecList) {
		yearList.add(vo.getLec_year());
	}
	
	for (int year : yearList) {
	%>
	<option name="year" value="<%=year%>"><%=year%>년
	</option>
	<%
	}
	%>
</select>
<div style="width:1000px; height:50%; overflow:auto">
	<table border="1" width="100%" cellspacing="0" cellpadding="0" >
		<tr style="height: 50px;">
			<th>강의코드</th>
			<th>강의명</th>
			<th>강의년도</th>
			<th>강의학기</th>
			<th>학점</th>
			<th>수강생</th>
		</tr>
		<%
		
		for(LectureVO vo : lecList){
			
	%>
	
		<tr class="odd" type="var" name="<%=vo.getLec_year()%>" style="text-align: center; height: 30px;">
			<td><%=vo.getLec_code() %></td>
			<td><%=vo.getLec_name() %></td>
			<td><%=vo.getLec_year() %>년</td>
			<td><%=vo.getLec_term() %>학기</td>
			<td><%=vo.getLec_credit() %></td>
			<td><input type="button" value="수강생조회" onclick="location.href='<%=request.getContextPath()%>/lecture/lectureStudentList.do?lecCode=<%=vo.getLec_code()%>'"></td>
		</tr>		
	<%
		}
	%>
		
	</table>

<%@ include file="../footer.jsp" %>