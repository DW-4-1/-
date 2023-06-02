<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="kr.or.dw.vo.AssignVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<title>과제 목록</title>
<%

	String lec_code = (String)request.getAttribute("lec_code");
	DateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");
%>
<script type="text/javascript">
	$(function(){
		
		
	})
</script>

<section class="content">
	<div class="card card-solid">
		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">과제 목록</h3>
					<div class="d-flex flex-row-reverse bd-highlight d-grid gap-2" style="height: 2em; display:inline;">

					</div>
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
									<thead style="text-align:center;">
										<tr>
											<th class="sorting sorting_asc" tabindex="0"
												aria-controls="example2" rowspan="1" colspan="1"
												aria-sort="ascending"
												aria-label="Rendering engine: activate to sort column descending">
												강의명
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending">
												과제명
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending">
												시작일
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												마감일
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												제출상태
											</th>
										</tr>
									</thead>
									<tbody>
									<%
									if(request.getAttribute("assignList") == null){
									%>
									<tr class="odd" type="var" name="" style="text-align: center; height: 30px;">
										<td colspan="5">과제가 없습니다.</td>
									</tr>	
									<%
									}else{
										String subState = "제출전";
										List<AssignVO> assignList = (List)request.getAttribute("assignList");
										for(AssignVO vo : assignList){
											if(vo.getAssign_path() != null && !"".equals(vo.getAssign_path())){
												subState = "제출완료";
											}else{
												subState = "제출전";
											}
									%>
										<tr class="odd" type="var" name="" style="text-align: center; height: 30px;">
											<td><%=vo.getLec_name() %></td>
											<td><a href="<%=request.getContextPath()%>/assign/viewAssign.do?assign_no=<%=vo.getAssign_no()%>"><%= vo.getAssign_name()%></a></td>
											<td><%=fomatter.format(vo.getAssign_start())%></td>
											<td><%=fomatter.format(vo.getAssign_end())%></td>
											<td><%=subState %></td>
										</tr>		
									<% }} %>
									</tbody>
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