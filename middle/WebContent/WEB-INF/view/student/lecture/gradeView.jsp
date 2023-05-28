<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<%@page import="kr.or.dw.util.LectureAbout"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="kr.or.dw.vo.LectureVO"%>
<%@page import="java.util.List"%>
<title>성적조회</title>
<script>
	$(function() {
		$('select[name=yearTerm]').change(
				function() { //년도와 학기 선택하면 해당 년도와 학기의 성적만 보이는 함수
					for (let i = 0; i < $('tr[type=var]').length; i++) {
						if ($(this).val() == 'select') {
							$('tr[type=var]').css('display', 'none');
							$('#none').css('display', '');
						} else if ($(this).val() == $($('tr[type=var]')[i])
								.attr('name')) {
							$($('tr[type=var]')[i]).css('display', '');
							$('#none').css('display', 'none');
						} else {
							$($('tr[type=var]')[i]).css('display', 'none');
							$('#none').css('display', 'none');
						}
					}

				});
	})
</script>
<section class="content">
	<div class="card card-solid">
		<div class="card-body">
			<h3>성적조회</h3>

			<select id="yearTerm" name="yearTerm">
				<option name="year" value="select">학기선택</option>
				<%
							List<LectureVO> lecList = (List) request.getAttribute("lecList"); //학생이 수강한 년도만 보이게

							Set<String> yearTermList = new HashSet<>();
							for (LectureVO vo : lecList) {
								String yearTerm = vo.getLec_year() + "년 " + vo.getLec_term() + "학기";
								yearTermList.add(yearTerm);
							}
							;
							for (String yearTerm : yearTermList) {
							%>
				<option name="year" value="<%=yearTerm%>"><%=yearTerm%></option>
				<%
							}
							%>

				<%
							double numGrade = 0;
							LectureAbout la = new LectureAbout();

							Set<List> yearTermDiv = new HashSet<>();
							for (String yearterm : yearTermList) {
								int creditSum = 0;
								double gradeSum = 0;
								for (LectureVO vo : lecList) {

									if (yearterm.equals(vo.getLec_year() + "년 " + vo.getLec_term() + "학기")) {

								numGrade = la.numGrade(vo.getStu_grade(), vo.getLec_credit());
								System.out.println(vo.getStu_grade());
								creditSum += vo.getLec_credit();
								gradeSum += numGrade;
									}
								}
								List list = new ArrayList();
								list.add(0, yearterm);
								list.add(1, creditSum);
								list.add(2, gradeSum);
								list.add(3, gradeSum / creditSum);
								yearTermDiv.add(list);
							}
							%>
			</select> <br> <br>
			<div style="width: 1000px; height: 50%; overflow: auto">
				<table border="1" width="100%" cellspacing="0" cellpadding="0">
					<tr style="height: 50px;">
						<th style="width: 30%">강의명</th>
						<th style="width: 15%">교수명</th>
						<th style="width: 15%">구분</th>
						<th style="width: 10%">학점</th>
						<th style="width: 10%">등급</th>
						<th style="width: 20%">평점</th>
					</tr>

					<tr>
						<td style="text-align: center" colspan="6" id="none">데이터가
							없습니다.</td>
					</tr>
					<%
								for (LectureVO vo : lecList) {
									numGrade = la.numGrade(vo.getStu_grade(), vo.getLec_credit());
								%>
					<tr type="var"
						name="<%=vo.getLec_year()%>년 <%=vo.getLec_term()%>학기"
						style="text-align: center; height: 30px; display: none">
						<td><%=vo.getLec_name()%></td>
						<td><%=vo.getStaff_name()%></td>
						<td><%=vo.getLec_div()%></td>
						<td><%=vo.getLec_credit()%></td>
						<td><%=vo.getStu_grade().equals("null") ? "" : vo.getStu_grade()%></td>
						<td><%=vo.getStu_score() * vo.getLec_credit() == 0 ? "아직 데이터가 없습니다." : numGrade%></td>
					</tr>

					<%
								}
								%>


				</table>
				<table border="1" width="100%" cellspacing="0" cellpadding="0">


					<%
								for (List l : yearTermDiv) {
								%>
					<tr type="var" name="<%=l.get(0)%>"
						style="text-align: center; height: 30px; display: none;">
						<td style="width: 30%"><b><%=l.get(0)%> 성적 소계</b></td>
						<td style="width: 15%"></td>
						<td style="width: 15%"></td>
						<td style="width: 10%"><%=l.get(1)%></td>
						<td style="width: 10%"></td>
						<td style="width: 10%"><%=l.get(2)%></td>
						<td style="width: 20%"><%=l.get(3)%></td>
					</tr>
					<%	} %>
				</table>
			</div>
		</div>
	</div>
</section>
<%@ include file="../footer.jsp"%>