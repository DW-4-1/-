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
<section class="content">
	<div class="card card-solid">
		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">강의 관리</h3>
				</div>

				<div class="card-body">
					<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
						<div class="row">
							<div class="col-sm-12 col-md-6"></div>
							<div class="col-sm-12 col-md-6"></div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<table id="example2"
									class="table table-bordered table-hover dataTable dtr-inline"
									aria-describedby="example2_info">
									<thead>
										<tr>
											<th class="sorting sorting_asc" tabindex="0"
												aria-controls="example2" rowspan="1" colspan="1"
												aria-sort="ascending"
												aria-label="Rendering engine: activate to sort column descending">
												강의코드
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending">
												강의명
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Platform(s): activate to sort column ascending">
												강의실
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												강의년도
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">
												강의학기
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">
												강의교시
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">
												학점
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">
												강의구분
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">
												강의계획안
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">
												수정
											</th>
										</tr>
									</thead>
									<%
										List<LectureVO> lecList = (List<LectureVO>)request.getAttribute("lecList");
										String disabled = "";
										for(LectureVO vo : lecList){
											if(vo.getPlan_path() == null || vo.getPlan_path().equals("")){
												disabled = "disabled";
											}else{
												disabled = "";
											}
											String lec_time = "" + vo.getLec_time();
											for(int i = 1; i < vo.getLec_hour(); i++){
												lec_time += ", " + (vo.getLec_time() + i);
											}
									%>
									<tbody>
										<tr class="odd" type="var" style="text-align: center; height: 30px;">
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
											<td>
												<input type="button" value="수정" onclick="location.href='<%=request.getContextPath()%>/lecture/lectureInsertForm.do?lecCode=<%=vo.getLec_code()%>'">
											</td>
										</tr>		
									</tbody>
									<% } %>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../footer.jsp" %>