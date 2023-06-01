<%@page import="java.util.List"%>
<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<title>학생관리 페이지입니다.</title>
<%
	List<StudentVO> stuVoList = (List)request.getAttribute("stuVoList");
%>
<script>
	$(function(){
		$('#studentFormBtn').on('click', function(){
			location.href = "/staff/studentForm.do"
		});
		$('#deleteFormBtn').on('click', function(){
			$('input[type=checkbox]').show();
			$('th[class=1]').show();
			$('#Btn').show();
			$('#studentFormBtn').hide();
			$('#deleteFormBtn').hide();
			$('#updateFormBtn').hide();
// 			$('#deleteBtn').show();
// 			$('#resetBtn').show();
		});
		let stu_id_arr = new Array();
		$('.chk').on('change',function(){
			if($(this).is(":checked")){
				stu_id_arr = [];
				$('.chk:checked').each(function(){
					stu_id_arr.push($(this).val())
				})
			}
		})
		$('#deleteBtn').on('click', function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/staff/studentDelete.do",
				data : {"stu_id_arr" : stu_id_arr},
				method : "post",
				success : function(res){
					alert('삭제가 완료되었습니다.');
					location.href="<%=request.getContextPath()%>/staff/studentCRUD.do";
				},
				error : function(err){
					alert(err.status);
				}
			})
		})
		$('#resetBtn').on('click', function(){
			$('input[type=checkbox]').hide();
			$('th[class=1]').hide();
			$('#Btn').hide();
			$('#studentFormBtn').show();
			$('#deleteFormBtn').show();
			$('#updateFormBtn').show();
		})
		$('#updateFormBtn').on('click', function(){
			$('#up').show();
			$('td[class=updateTag]').show();
			$('#studentFormBtn').hide();
			$('#deleteFormBtn').hide();
			$('#updateFormBtn').hide();
			$('#cancleBtn').show();
		});
		$('#cancleBtn').on('click', function(){
			$('#up').hide();
			$('td[class=updateTag]').hide();
			$('#cancleBtn').hide();
			$('#studentFormBtn').show();
			$('#deleteFormBtn').show();
			$('#updateFormBtn').show();
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
					<h2 class="card-title" style="padding-top: 0.2em;">학생 관리</h2>
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
											<th>상세주소</th>
											<th>우편번호</th>
											<th>학과</th>
											<th>전화번호</th>
											<th>이메일</th>
											<th>상태</th>
											<th>직분</th>
											<th id="up" style="display:none;"></th>
										</tr>
										</thead>
										<% for(StudentVO stuVo : stuVoList) {%>
										<tbody>
											<tr style="text-align: center;">
												<th class="1" style="display:none;">
													<input type="checkbox" class="chk" style="display:none; " name="stu_id" value="<%=stuVo.getStu_id()%>">
												</th>
												<td><%=stuVo.getStu_id()%></td>
												<td><%=stuVo.getStu_name()%></td>
												<td><%=stuVo.getStu_gender()%></td>
												<td><%=stuVo.getStu_resnum()%></td>
												<td><%=stuVo.getStu_addr()%></td>
												<td><%=stuVo.getStu_detailaddr()%></td>
												<td><%=stuVo.getStu_zipcode()%></td>
												<td><%=stuVo.getDept_name()%></td>
												<td><%=stuVo.getStu_tel()%></td>
												<td><%=stuVo.getStu_email()%></td>
												<td><%=stuVo.getStu_state()%></td>
												<td><%=stuVo.getAuth_cd()%></td>
												<td class="updateTag" style="display:none;"><input type="button" name="update" value="수정" onclick="location.href='<%=request.getContextPath()%>/staff/studentUpdateForm.do?stu_id=<%=stuVo.getStu_id()%>'"></td>
											</tr>
										</tbody>
										<%	 }	 %>
									</table>
									<div style="float: right;"> 
										<div id="Btn" style="display:none; text-align: center">
											<input type="button" class="btn btn-primary col-md-2" style="width:4em;" id="deleteBtn" value="삭제">
											<input type="button" class="btn btn-primary col-md-2" style="width:4em;" id="resetBtn" value="취소">
										</div>
										<input type="button" class="btn btn-primary col-md-2" style="width:4em;" id="studentFormBtn" value="추가">
										<input type="button" class="btn btn-primary col-md-2" style="width:4em;" id="deleteFormBtn" value="삭제">
										<input type="button" class="btn btn-primary col-md-2" style="width:4em;" id="updateFormBtn" value="수정">
										<input type="button" class="btn btn-primary col-md-2" style="width:6em; display:none;" id="cancleBtn" value="뒤로가기" >
									</div>	
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