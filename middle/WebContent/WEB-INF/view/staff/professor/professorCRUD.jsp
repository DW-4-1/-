<%@page import="kr.or.dw.vo.StaffVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
    
<title>교수관리 페이지입니다.</title>
<%
	List<StaffVO> staVoList = (List)request.getAttribute("staVoList");
%>
<script>
	$(function(){
		$('#professorInsertBtn').on('click', function(){
			location.href = "/staff/professorForm.do"
		});
	})
</script>
<section class="content">
	<div class="card card-solid">
		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">교수 관리</h3>
					<div class="d-flex flex-row-reverse bd-highlight d-grid gap-2" style="height: 2em; display:inline;">
						<input type="button" id="professorInsertBtn" value="교수추가">
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
								<form>
									<table id="example2"
										class="table table-bordered table-hover dataTable dtr-inline"
										aria-describedby="example2_info">
									<thead style="text-align:center;">
									<tr>
										<th>ID</th>
										<th>이름</th>
										<th>성별</th>
										<th>주민등록번호</th>
										<th>주소</th>
										<th>우편번호</th>
										<th>학과</th>
										<th>전화번호</th>
										<th>이메일</th>
										<th>상태</th>
										<th>고용일</th>
										<th>직분</th>
									</tr>
									</thead>
						<% for(StaffVO staVo : staVoList) {%>
						<tbody>
									<tr class="odd" type="var" style="text-align: center; height: 30px;">
										<td><%=staVo.getStaff_id()%></td>
										<td><%=staVo.getStaff_name()%></td>
										<td><%=staVo.getStaff_gender()%></td>
										<td><%=staVo.getStaff_resnum()%></td>
										<td><%=staVo.getStaff_addr()%></td>
										<td><%=staVo.getStaff_zipcode()%></td>
										<td><%=staVo.getDept_name()%></td>
										<td><%=staVo.getStaff_tel()%></td>
										<td><%=staVo.getStaff_email()%></td>
										<td><%=staVo.getStaff_state()%></td>
										<td><%=staVo.getStaff_hiredate()%></td>
										<td><%=staVo.getAuth_cd()%></td>
									</tr>
									</tbody>
							<%	 }	 %>
								</table>
							</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>	

<%@ include file="../footer.jsp" %>