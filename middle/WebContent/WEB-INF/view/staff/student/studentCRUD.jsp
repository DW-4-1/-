<%@page import="java.util.List"%>
<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생관리 페이지입니다.</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
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
// 			$('#deleteBtn').show();
// 			$('#resetBtn').show();
		});
		let val = $('td[name=stu_id]').text()
		$('#deleteBtn').on('click', function(){
			console.log($('.chk'));
			
		})
		$('#resetBtn').on('click', function(){
			$('input[type=checkbox]').hide();
			$('th[class=1]').hide();
			$('#Btn').hide();
		})
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
		$('.chk').on('click',function(){
			if($(this).is(":checked")){
				var stuid
			}
		})
		let formData = new FormData($('#form')[0]);
		console.log(formData);
		$.ajax({
			url : "<%=request.getContextPath()%>/staff/studentDelete.do",
			processData : false,
			contentType : false,
			data : formData,
			dataType : "json",
			method : "post",
			success : function(res){
				alert('삭제가 완료되었습니다.');
			},
			error : function(){
				
			}
		})
	})
</script>
<body>
	<form id="form">
		<table border="1">
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
				<th>졸업예정일</th>
				<th>직분</th>
			</tr>
	<% for(StudentVO stuVo : stuVoList) {%>
			<tr>
				<th class="1" style="display:none;"><input type="checkbox" class="chk" style="display:none;" name="stu_id" id="stu_id" value="<%=stuVo.getStu_id()%>"></th>
				<td><%=stuVo.getStu_id()%></td>
				<td><%=stuVo.getStu_name()%></td>
				<td><%=stuVo.getStu_gender()%></td>
				<td><%=stuVo.getStu_resnum()%></td>
				<td><%=stuVo.getStu_addr()%></td>
				<td><%=stuVo.getStu_zipcode()%></td>
				<td><%=stuVo.getDept_name()%></td>
				<td><%=stuVo.getStu_tel()%></td>
				<td><%=stuVo.getStu_email()%></td>
				<td><%=stuVo.getStu_state()%></td>
				<td><%=stuVo.getStu_grddate()%></td>
				<td><%=stuVo.getAuth_cd()%></td>
			</tr>
	<%	 }	 %>
		</table>
	</form>
	<div id="Btn" style="display:none;">
		<input type="button" id="deleteBtn" value="삭제">
		<input type="button" id="resetBtn" value="취소">
	</div>
	<input type="button" id="studentFormBtn" value="학생추가">
	<input type="button" id="deleteFormBtn" value="삭제하기">
</body>
</html>