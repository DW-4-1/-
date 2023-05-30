<%@page import="kr.or.dw.vo.LectureVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript">
		$(function(){
			$(document).on('change', '#lec_plan', function(){
				$(this).next('#savePlanBtn').css('display', '');
			})
			
			$('#savePlanBtn').on('click', function(){
				let lec_code = $(this).parents('#lec_code').val();
				console.log($(this).parents('input[type=hidden]'));

				let formData = new FormData($('#lec_form')[0]);
				/*
					FormData를 사용하여 <form>태그처럼 파일을 넘기는 방식을 알아보려고 한다.
					dataType은 내가 보내는 데이터의 타입이 아니고 서버가 응답(response)할 때 보내줄 데이터의 타입이다.
					processData 관련하여, 일반적으로 서버에 전달되는 데이터는 쿼리스트링 query String 이라는 형태로 전달된다.
						data속성의 값을 Jquery제이쿼리 내부적으로 쿼리 스트링으로 만드는데,
						파일전송의 경우 이를 하지 않아야 하고 이를 설정하는 것이 processData : false 이다.
					contentType은 default 값이 "application/x-www-form-urlencoded; charset=utf-8"인데,
						"multipart/form-data"로 전송되게 false로 넣어준다.
						
					[요약]
					-contentType : false로 선언시 content-type 헤더가 multipart/form-data로 전송
					-processData : false로 선언시 formData를 String으로 변환하지 않음
				*/
				
				$.ajax({
					url : "<%=request.getContextPath()%>/lecture/lecturePlan.do?lec_code=" + lec_code,
					processData : false,
					contentType : false,
					data : formData,
					dataType : "json",
					method : "post",
					success : function(res){
						console.log(res);
					},
					error : function(){
						
					}
				});
				$('#savePlanBtn').css('display', 'none');
			});
			
			
			
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
			<th>강의계획안 등록</th>
			<th>수정</th>
		</tr>
	<%
		List<LectureVO> lecList = (List<LectureVO>)request.getAttribute("lecList");
	
		for(LectureVO vo : lecList){
			String lec_time = "" + vo.getLec_time();
			for(int i = 1; i < vo.getLec_hour(); i++){
				lec_time += ", " + (vo.getLec_time() + i);
			}
	%>
		<form id="lec_form" method="post" enctype="multipart/form-data">
			<tr style="text-align: center; height: 30px;">
			<input type="hidden" id="lec_code" name= "lec_code" value="<%=vo.getLec_code() %>">
				<td><%=vo.getLec_code() %></td>
				<td><%=vo.getLec_name() %></td>
				<td><%=vo.getLec_loc() %></td>
				<td><%=vo.getLec_year() %>년</td>
				<td><%=vo.getLec_term() %>학기</td>
				<td><%=vo.getLec_day() %> <%=lec_time %>교시</td>
				<td><%=vo.getLec_credit() %></td>
				<td><%=vo.getLec_div() %></td>
				<td>
					<input type="file" id="lec_plan" name="lec_plan" value="강의계획안 수정" accept=".pdf">
					<a href="#" id="savePlanBtn" style="display : none"><b>계획안 저장</b></a>
				</td>
				<td><input type="button" value="수정" onclick="location.href='<%=request.getContextPath()%>/lecture/lectureInsertForm.do?lecCode=<%=vo.getLec_code()%>'"></td>
			</tr>		
		</form>	
	<%
		}
	%>
	</table>
</div>

<%@ include file="../footer.jsp" %>