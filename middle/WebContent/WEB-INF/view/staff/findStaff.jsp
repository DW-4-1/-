<%@page import="kr.or.dw.util.SendEmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지입니다.</title>
<script src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery.js"></script>
<script>
	$(function(){
		let ver_code = null;
		
		$('#idEmailChkBtn').on('click', function(){
			let staff_id = $('#staff_id').val();
			let staff_email = $('#staff_email').val();
			console.log(staff_id);
			console.log(staff_email);
			$.ajax({
				url : "<%=request.getContextPath()%>/staff/idEmailCheck.do",
				method : "post",
				dataType : "json",
				data : {
					"staff_id" : staff_id,
					"staff_email" : staff_email
				},
				success : function(res){
					if(res != null){
						console.log(res);
						ver_code = res;
						alert("인증코드가 전송되었습니다.");
						$('#ver_code').css("display", "");
						$('#verCodeBtn').css("display", "");
					}else{
						alert("아이디 혹은 이메일이 일치하지 않습니다.");
					}
				},
				error : function(err){
					
				}
			});
		});
		
		$(document).on('click', '#verCodeBtn', function(e) {
			if($('#ver_code').val() == ver_code){
			alert("인증코드가 일치.");
				
<%-- 			location.href="<%=request.getContextPath()%>/staff/staffPasswordUpdate.do"; --%>
			}else{
				alert("인증코드가 잘못입력되었습니다.");
			}
		});
	})
</script>
</head>
<body>
	<h2>비밀번호 찾기</h2>
	
	<form id="findstaffpwd" method="post" action="">
		아이디 <input id="staff_id" name="staff_id">
		<br>
		<br>
		이메일 <input id="staff_email" name="staff_email">
		
		<input type="button" id="idEmailChkBtn" value="인증코드 전송">
		<br>
		<br>
		<input type="text" id="ver_code" name="ver_code" placeholder="인증코드 입력" style="display: none">
		<input type="button" id="verCodeBtn" value="인증코드 확인" style="display: none">
	</form>
</body>
</html>