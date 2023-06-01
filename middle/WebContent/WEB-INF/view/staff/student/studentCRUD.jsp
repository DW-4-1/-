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
		let stu_id = "";
		$('input[name=stu_id]').on('click',function(){
			$('input[name=stu_id]').each(function(){
				stu_id = $(this).val();
			});
			console.log('stu_id');
		})
		$('input[name=update]').on('click', function(){
<%-- 			location.href="<%=request.getContextPath()%>/staff/studentUpdateForm.do?"; --%>
// 			$.ajax({
<%-- 				url : "<%=request.getContextPath()%>/staff/studentUpdateFrom.do", --%>
// 				data : stu_id,
// 				method : "post",
// 				success : function(res){
<%-- 					location.href="<%=request.getContextPath()%>/staff/studentUpdateFrom.do"; --%>
// 				},
// 				error : function(err){
// 					alert(err.status);
// 				}
// 			});
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
<body>
	<form id="form">
		<table border="1">
			<tr>
				<th class="1" style="display:none;"><input type="checkbox" id="all" style="display:none;"></th>
				<th id="up" style="display:none;"></th>
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
				<td class="updateTag" style="display:none;"><input type="button" name="update" value="수정"></td>
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
	<input type="button" id="updateFormBtn" value="수정하기">
	<input type="button" id="cancleBtn" value="뒤로가기" style="display:none;">	
</body>
</html>