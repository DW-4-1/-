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
		$('#idEmailChkBtn').on('click', function(){
			let stu_id = $('#stu_id').val();
			let stu_email = $('#stu_email').val();
			
			$.ajax({
				url : "<%=request.getContextPath()%>/student/idEmailCheck.do",
				method : "post",
				dataType : "json",
				data : {
					"stu_id" : stu_id,
					"stu_email" : stu_email
				},
				success : function(res){
					alert(res);
				},
				error : function(err){
					alert(err.staus);
				}
			});
		});
	})
</script>
</head>
<body>
	<h2>비밀번호 찾기</h2>
	
	<form id="findstupwd" method="post" action="">
		아이디 <input id="stu_id" name="stu_id">
		<br>
		<br>
		이메일 <input id="stu_email" name="stu_email">
		
		<input type="button" id="idEmailChkBtn" value="인증코드 전송">
	</form>
</body>
</html>