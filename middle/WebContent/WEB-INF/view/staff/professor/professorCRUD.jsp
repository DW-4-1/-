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
		$('#professorInsertFormBtn').on('click', function(){
			location.href = "<%=request.getContextPath()%>/staff/professorForm.do"
		});
		$('#professorDeleteFormBtn').on('click', function(){
			$('input[type=checkbox]').show();
			$('th[class=1]').show();
			$('#deleteBtn').show();
			$('#resetBtn').show();
			$('#professorInsertFormBtn').hide();
			$('#professorDeleteFormBtn').hide();
			$('#professorUpdateFormBtn').hide();
		});
		let sta_id_arr = new Array();
		$('.chk').on('change',function(){
			if($(this).is(":checked")){
				sta_id_arr = [];
				$('.chk:checked').each(function(){
					sta_id_arr.push($(this).val())
				})
			}
		})
		$('#deleteBtn').on('click', function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/staff/professorDelete.do",
				data : {"sta_id_arr" : sta_id_arr},
				method : "post",
				success : function(res){
					alert('삭제가 완료되었습니다.');
					location.href="<%=request.getContextPath()%>/staff/professorCRUD.do";
				},
				error : function(err){
					alert(err.status);
				}
			})
		})
		$('#resetBtn').on('click', function(){
			$('input[type=checkbox]').hide();
			$('th[class=1]').hide();
			$('#deleteBtn').hide();
			$('#resetBtn').hide();
			$('#professorInsertFormBtn').show();
			$('#professorDeleteFormBtn').show();
			$('#professorUpdateFormBtn').show();
		})
		$('#professorUpdateFormBtn').on('click', function(){
			$('#up').show();
			$('td[class=updateTag]').show();
			$('#professorInsertFormBtn').hide();
			$('#professorDeleteFormBtn').hide();
			$('#professorUpdateFormBtn').hide();
			$('#cancleBtn').show();
		});
		$('#cancleBtn').on('click', function(){
			$('#up').hide();
			$('td[class=updateTag]').hide();
			$('#cancleBtn').hide();
			$('#professorInsertFormBtn').show();
			$('#professorDeleteFormBtn').show();
			$('#professorUpdateFormBtn').show();
		});

		$('#all').on('click', function(){
			$('.chk').prop('checked', $(this).prop('checked'));
		})
		$('.chk').on('click', function() {
    		if ($('.chk:checked').length != $('.chk').length) {
      			$('#all').prop('checked', false);
    		}else if ($('.chk:checked').length == $('.chk').length) {
      			$('#all').prop('checked', true);
    		}
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
						<input type="button" id="professorInsertFormBtn" value="교수추가">
						<input type="button" id="professorDeleteFormBtn" value="교수삭제">
						<input type="button" id="professorUpdateFormBtn" value="수정하기">
						<input type="button" id="cancleBtn" value="뒤로가기" style="display:none;">
						<input type="button" id="deleteBtn" value="삭제" style="display:none;">
						<input type="button" id="resetBtn" value="취소" style="display:none;">
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
										<th class="1" style="display:none;"><input type="checkbox" id="all" style="display:none;"></th>
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
										<th class="1" style="display:none;"><input type="checkbox" class="chk"  name="stu_id" value="<%=staVo.getStaff_id()%>"></th>
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
										<td class="updateTag" style="display:none;"><input type="button" name="update" value="수정" onclick="location.href='<%=request.getContextPath()%>/staff/professorUpdateForm.do?sta_id=<%=staVo.getStaff_id()%>'"></td>
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