<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

	<%
		StudentVO stu = (StudentVO)request.getAttribute("stuVo");
		
	%>
<style>
	.div-center {
		margin: 0 auto;
		margin-top: 3em;
	}
	
	.text-size-up {
		font-size: large;
	}
	
	input + input {
		margin-left: 0.5em;
	}
</style>
<script>
	$(function(){
		let changeFlag = false;
		let stu_addr = "<%=stu.getStu_addr() %>";
		let stu_zipcode = "<%=stu.getStu_zipcode() %>";
		let stu_tel = "<%=stu.getStu_tel() %>";
		let ValArr = [stu_addr, stu_zipcode, stu_tel];
		
		$('#studentInfoUpdateForm').on('propertychange keyup paste', function(){
			let inputArr = $(this).find('input[type=text]');
			for(let i = 0; i < inputArr.length; i++){
				if($(inputArr[i]).val() == ValArr[i]){
					changeFlag = false;
				}else{
					changeFlag = true;
					break;
				};
			};
		});
		
		$('#updateBtn').on('click', function(){
			if(changeFlag == true){
				$('#studentInfoUpdateForm').submit();
			}else{
				alert('변경된 정보가 없습니다.');
			};
		});
		$('#infoBtn').on('click', function(){
			location.href = "<%=request.getContextPath()%>/student/studentInfo.do";
		});
	})
</script>

<section class="content">
	<div class="card card-solid">
		<div class="card-body">
			<form method="post" id="studentInfoUpdateForm" action="<%=request.getContextPath()%>/student/studentInfoUpdate.do">
				<div class="col-8 text-center div-center text-size-up">
					<div class="table-responsive">
						<table class="table">
							<tbody style="border-top: solid 1px #dee2e6">
								<tr>
									<th style="width: 50%">학번</th>
									<td><%=stu.getStu_id()%></td>
									<input type="hidden" value="<%=stu.getStu_id()%>" name="stu_id">
								</tr>
								<tr>
									<th>이름</th>
									<td><%=stu.getStu_name()%></td>
								</tr>
								<tr>
									<th>성별</th>
									<td><%=stu.getStu_gender()%></td>
								</tr>
								<tr>
									<th>주민번호</th>
									<td><%=stu.getStu_resnum()%></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><input type="text" name="stu_addr" value="<%= stu.getStu_addr() %>"></td>
								</tr>
								<tr>
									<th>우편번호</th>
									<td><input type="text" name="stu_zipcode" value="<%=stu.getStu_zipcode() %>"></td>
								</tr>
								<tr>
									<th>학과명</th>
									<td><%=stu.getDept_name()%></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" name="stu_tel" value="<%=stu.getStu_tel() %>"></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><%=stu.getStu_email()%></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="float: right;">
						<div style="margin: 0 auto; padding: 1em;">
							<input class="btn btn-secondary" type="button" id="updateBtn" value="저장하기">
							<input class="btn btn-secondary" type="button" id="infoBtn" value="내 정보">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>

<%@ include file="../footer.jsp"%>