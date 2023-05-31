<%@page import="kr.or.dw.vo.LectureVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<title>강의등록</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$(document).on('change', '#lec_plan', function(){
			$(this).parent().find('#savePlanBtn').css('display', '');
		})
		
		$(document).on('click', '#savePlanBtn', function(){
			let lec_code = $(this).parent().find('#lec_code').val();
			let form = $(this).parents('form');
			
			let formData = new FormData(form[0]);
			
			$.ajax({
				url : "<%=request.getContextPath()%>/lecture/lecturePlan.do",
				processData : false,
				contentType : false,
				data : formData,
				dataType : "json",
				method : "post",
				success : function(res){
					console.log(res);
					alert('계획안이 등록되었습니다.');
					location.href="<%=request.getContextPath()%>/lecture/lectureManaging.do";
				},
				error : function(){
					
				}
			});
			$(this).css('display', 'none');
		});
	})
</script>

<%
	String lecCode = "";
	String lecName = "";
	String lecLoc = "";
	String lecYear = "";
	String lecMaxPeo = "";
	String title = "등록";
	if(request.getAttribute("lecVo") != null){
		LectureVO lecVo = (LectureVO) request.getAttribute("lecVo");
		lecCode = lecVo.getLec_code();
		title = "수정";
		lecName = lecVo.getLec_name();
		lecLoc = lecVo.getLec_loc();
		lecYear = "" + lecVo.getLec_year();
		lecMaxPeo = "" + lecVo.getLec_maxpeo();
%>
		
	<script>
		$(function(){
			$('#planFile').css('display', '');
			$('input[id=lec_term][value=<%=lecVo.getLec_term()%>]').prop('checked',true);
			$('#lec_day').val('<%=lecVo.getLec_day()%>').prop('selected',true);
		<%
			for(int i = 0; i < lecVo.getLec_hour(); i++){
				int lecTime = lecVo.getLec_time();
		%>
			$('input[id=lec_time][value=<%=lecTime + i%>]').prop('checked',true);
				
		<%
			}
		%>
			$('#lec_div').val('<%=lecVo.getLec_div()%>').prop('selected',true);
			$('input[id=lec_credit][value=<%=lecVo.getLec_credit()%>]').prop('checked',true);
		})
	</script>		
		
<%
	}
%>

</head>
<body>
	<%-- <h2>강의<%=title %>페이지</h2>
	<form id="insertLectureForm" method="post" action="<%=request.getContextPath()%>/lecture/lectureInsert.do">
		<table>
			<input type="hidden" id="lec_code" name="lec_code" value="<%=lecCode %>">
			<tr>
				<td>강의명</td>
				<td><input type="text" id="lec_name" name="lec_name" value="<%=lecName %>" required></td>
			</tr>
			<tr>
				<td>강의실</td>
				<td><input type="text" id="lec_loc" name="lec_loc" value="<%=lecLoc %>" required></td>
			</tr>
			<tr>
				<td>강의년도</td>
				<td><input type="text" id="lec_year" name="lec_year" placeholder="YYYY" value="<%=lecYear %>" required></td>
			</tr>
			<tr>
				<td>강의학기</td>
				<td>
					<label><input type="radio" id="lec_term" name="lec_term" value="1">1학기</label>
					<label><input type="radio" id="lec_term" name="lec_term" value="2">2학기</label>
				</td>
			</tr>
			<tr>
				<td>강의요일</td>
				<td>
					<select id="lec_day" name="lec_day" form="insertLectureForm">
						<option value="월">월요일</option>
						<option value="화">화요일</option>
						<option value="수">수요일</option>
						<option value="목">목요일</option>
						<option value="금">금요일</option>
						<option value="토">토요일</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>강의교시</td>
				<td id="lec_time_td">
					<label><input type="checkbox" id="lec_time" name="lec_time" value="1">1</label>
					<label><input type="checkbox" id="lec_time" name="lec_time" value="2">2</label>
					<label><input type="checkbox" id="lec_time" name="lec_time" value="3">3</label>
					<label><input type="checkbox" id="lec_time" name="lec_time" value="4">4</label>
					<label><input type="checkbox" id="lec_time" name="lec_time" value="5">5</label>
					<label><input type="checkbox" id="lec_time" name="lec_time" value="6">6</label>
					<label><input type="checkbox" id="lec_time" name="lec_time" value="7">7</label>
					<label><input type="checkbox" id="lec_time" name="lec_time" value="8">8</label>
					<label><input type="checkbox" id="lec_time" name="lec_time" value="9">9</label>
				</td>
			</tr>
			<tr>
				<td>강의구분</td>
				<td>
					<select id="lec_div" name="lec_div" form="insertLectureForm">
						<option value="전공필수">전공필수</option>
						<option value="전공선택">전공선택</option>
						<option value="교양">교양</option>
						<option value="교직">교직</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>강의학점</td>
				<td>
					<label><input type="radio" id="lec_credit" name="lec_credit" value="1">1학점</label>
					<label><input type="radio" id="lec_credit" name="lec_credit" value="2">2학점</label>
					<label><input type="radio" id="lec_credit" name="lec_credit" value="3">3학점</label>
					<label><input type="radio" id="lec_credit" name="lec_credit" value="4">4학점</label>
				</td>
			</tr>
			<tr>
				<td>최대 수강인원</td>
				<td><input type="text" id="lec_maxpeo" name="lec_maxpeo" placeholder="숫자만 기재해주세요." value="<%=lecMaxPeo %>" required></td>
			</tr>
			<tr id="planFile" style="display : none;">
				<form id="lec_form" method="post" enctype="multipart/form-data">
					<td>강의계획안</td>
					<td>
							<input type="hidden" id="lec_code" name= "lec_code" value="<%=lecCode %>">
							<input type="file" id="lec_plan" name="lec_plan" accept=".pdf">
							<input type="button" id="savePlanBtn" value="계획안저장" style="display : none">
					</td>
				</form>	
			</tr>
			<tr>
				<td><input type="submit" value="<%=title%>"></td>
			</tr>
		</table>
	</form> --%>
	
	<div class="col-md-7 col-lg-8" style="margin: 0 auto;">
        <h4 class="mb-3">강의 <%=title %></h4>
        <form class="needs-validation" id="insertLectureForm" method="post" action="<%=request.getContextPath()%>/lecture/lectureInsert.do">
          <div class="row g-3" id="lec_code" name="lec_code" value="<%=lecCode %>">
            <div class="col-12">
              <label class="form-label">강의명</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="lec_name" name="lec_name" value="<%=lecName %>" placeholder="강의명을 입력해주세요." required>
              	<div class="invalid-feedback">
                  강의명을 입력해주세요.
                </div>
              </div>
            </div>

            <div class="col-12">
              <label class="form-label">강의실</label>
              <input type="text" class="form-control" id="lec_loc" name="lec_loc" placeholder="강의실 이름과 호수를 입력해주세요." value="<%=lecLoc %>" required>
              <div class="invalid-feedback">
                강의실 이름과 호수를 입력해주세요.
              </div>
            </div>
            
            <div class="col-12">
              <label for="lec_year" class="form-label">강의 연도</label>
              <input type="text" class="form-control" id="lec_year" name="lec_year" placeholder="YYYY" value="<%=lecYear %>" required>
              <div class="invalid-feedback">
                강의 도를 입력해주세요.
              </div>
            </div>
            <div class="col-md-12">
              <label for="lec_term" class="form-label">강의 학기</label>
              <select class="form-select" id="lec_term" name="lec_term"" required="">
                <option value="">선택</option>
                <option id="lec_term" name="lec_term" value="1">1학기</option>
                <option id="lec_term" name="lec_term" value="2">2학기</option>
              </select>
              <div class="invalid-feedback">
                강의 학기를 선택해주세요.
              </div>
            </div>

            <div class="col-md-12">
              <label for="lec_day" class="form-label">강의 요일</label>
              <select class="form-select" id="lec_day" name="lec_day" form="insertLectureForm" required>
                <option value="">선택</option>
                <option value="월">월요일</option>
				<option value="화">화요일</option>
				<option value="수">수요일</option>
				<option value="목">목요일</option>
				<option value="금">금요일</option>
				<option value="토">토요일</option>
              </select>
              <div class="invalid-feedback">
                강의 요일을 선택해주세요.
              </div>
            </div>
				
            <div class="col-md-12">
           	<hr class="my-3">
			<table>
				<tr>    	
					<td id="lec_time_td">
					&nbsp;&nbsp;<span style="font-size: 1.2em;">강의 교시</span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label class="form-check-label" for="same-address">
						<input type="checkbox" class="form-check-input" id="lec_time" name="lec_time" value="1">
						1교시
						</label>
						&nbsp;&nbsp;
						<label class="form-check-label" for="same-address">
						<input type="checkbox" class="form-check-input" id="lec_time" name="lec_time" value="2">
						2교시
						</label>
						&nbsp;&nbsp;						
						<label class="form-check-label" for="same-address">
						<input type="checkbox" class="form-check-input" id="lec_time" name="lec_time" value="3">
						3교시
						</label>
						&nbsp;&nbsp;
						<label class="form-check-label" for="same-address">
						<input type="checkbox" class="form-check-input" id="lec_time" name="lec_time" value="4">
						4교시
						</label>
						&nbsp;&nbsp;
						<label class="form-check-label" for="same-address">
						<input type="checkbox" class="form-check-input" id="lec_time" name="lec_time" value="5">
						5교시
						</label>
						&nbsp;&nbsp;
						<label class="form-check-label" for="same-address">
						<input type="checkbox" class="form-check-input" id="lec_time" name="lec_time" value="6">
						6교시
						</label>
						&nbsp;&nbsp;
						<label class="form-check-label" for="same-address">
						<input type="checkbox" class="form-check-input" id="lec_time" name="lec_time" value="7">
						7교시
						</label>
						&nbsp;&nbsp;
						<label class="form-check-label" for="same-address">
						<input type="checkbox" class="form-check-input" id="lec_time" name="lec_time" value="8">
						8교시
						</label>
						&nbsp;&nbsp;
						<label class="form-check-label" for="same-address">
						<input type="checkbox" class="form-check-input" id="lec_time" name="lec_time" value="9">
						9교시
						</label>
					</td>
				</tr>
			</table>
			<hr class="my-3">
			</div>
			
			<div class="col-md-12">
              <label for="lec_div" class="form-label">강의 구분</label>
              <select class="form-select" id="lec_div" name="lec_div" form="insertLectureForm" required>
                <option value="">선택</option>
                <option value="전공필수">전공필수</option>
				<option value="전공선택">전공선택</option>
				<option value="교양">교양</option>
              </select>
              <div class="invalid-feedback">
                강의 구분을 선택해주세요.
              </div>
            </div>
            
            <div class="col-md-12">
              <label for="lec_credit" class="form-label">강의 학점</label>
              <select class="form-select" id="lec_credit" name="lec_credit" required="">
                <option value="">선택</option>
                <option value="1">1학점</option>
                <option value="1">2학점</option>
                <option value="1">3학점</option>
                <option value="1">4학점</option>
              </select>
              <div class="invalid-feedback">
                강의 학점을 선택해주세요.
              </div>
            </div>

            <div class="col-12">
              <label for="lec_maxpeo" class="form-label">최대 수강인원</label>
              <input type="text" class="form-control" id="lec_maxpeo" name="lec_maxpeo" placeholder="숫자만 입력해주세요." value="<%=lecMaxPeo %>" required>
            </div>
            
			<div class="col-md-12" id="planFile">
	           	<hr class="my-3">
	           	<form id="lec_form" method="post" enctype="multipart/form-data">
						&nbsp;&nbsp;<span style="font-size: 1.2em;">강의계획안</span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	              				<input type="hidden" id="lec_code" name= "lec_code" value="<%=lecCode %>">
								<input type="file" id="lec_plan" name="lec_plan" accept=".pdf">
								<input type="button" id="savePlanBtn" value="계획안저장" style="display : none">
		              <div class="invalid-feedback">
		                강의계획안을 첨부해주세요.
		              </div>
	              </form>
	              <hr class="my-3">
            </div>

          <button class="w-100 btn btn-primary btn-lg" type="submit"><%=title%></button>
          </div>
        </form>
      </div>

<%@ include file="../footer.jsp" %>