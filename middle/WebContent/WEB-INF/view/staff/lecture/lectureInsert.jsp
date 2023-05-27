<%@page import="kr.or.dw.vo.LectureVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의등록</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>

<%
	String lecName = "";
	String lecLoc = "";
	String lecYear = "";
	String lecMaxPeo = "";
	if(request.getAttribute("lecVo") != null){
	LectureVO lecVo = (LectureVO) request.getAttribute("lecVo");
		lecName = lecVo.getLec_name();
		lecLoc = lecVo.getLec_loc();
		lecYear = "" + lecVo.getLec_year();
		lecMaxPeo = "" + lecVo.getLec_maxpeo();
%>
		
	<script>
		$(function(){
			$('#lec_term').attr('value')
			$('input[value=<%=lecVo.getLec_term()%>][id=lec_term]').is('checked');
		})
	</script>		
		
<%
	}
%>

</head>
<body>
	<h2>강의등록페이지</h2>
	<form id="insertLectureForm" method="post" action="<%=request.getContextPath()%>/lecture/lectureInsert.do">
		<table>
			<tr>
				<td>강의명</td>
				<td><input type="text" id="lec_name" name="lec_name" value="<%=lecName %>"></td>
			</tr>
			<tr>
				<td>강의실</td>
				<td><input type="text" id="lec_loc" name="lec_loc" value="<%=lecLoc %>"></td>
			</tr>
			<tr>
				<td>강의년도</td>
				<td><input type="text" id="lec_year" name="lec_year" placeholder="YYYY" value="<%=lecYear %>"></td>
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
				<td>
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
				<td><input type="text" id="lec_maxpeo" name="lec_maxpeo" placeholder="숫자만 기재해주세요." value="<%=lecMaxPeo %>"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" id="lectureInsertBtn"></td>
				<td colspan="2"><input type="submit" value="수정" id="lectureUpdateBtn" style="display: none;"></td>
			</tr>
		</table>
	</form>
</body>
</html>