<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<script
	src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>타이틀</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/dist/css/adminlte.min.css">
</head>
<style>
	.transparent-image img {
  opacity: 0.5;
}
</style>

<body class="login-page" style="min-height: 496.797px; background-image: url('img/행정관.jpg'); background-size: cover;">
	<div class="login-box">
		<div class="login-logo">
			<a href="../../index2.html"><b>Project</b>&nbsp;Page</a>
		</div>

		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">학생 전용 로그인 페이지 입니다.</p>
				<form id="login" action="<%=request.getContextPath()%>/student/studentLogin.do" method="post">
					<div class="input-group mb-3">
						<input type="text" id="stu_id" name="stu_id" class="form-control" placeholder="ID">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" id="stu_pwd" name="stu_pwd" class="form-control" placeholder="Password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<button type="submit" id="loginInformation" class="btn btn-primary btn-block">로그인</button>
						</div>
					</div>
				</form>
				<div class="social-auth-links text-center mb-3">
					<a href="<%=request.getContextPath()%>/student/findStudentPassword.do" id="findPassword" class="btn btn-block btn-danger"> 
						<i class="fab fa-google-plus mr-2"></i> 비밀번호 찾기 및 변경
					</a>
				</div>
				<div class="social-auth-links text-center mb-3">
					<a href="/staff/staffLoginForm.do" class="btn btn-outline-primary btn-block"> 
						<i class="fab fa-google-plus mr-2"></i> 교직원 및 관리자 로그인으로 이동
					</a>
				</div>
<!-- 				메인 페이지 임시 경로 -->
				<div class="social-auth-links text-center mb-3">
					<a href="<%=request.getContextPath()%>/student/mainTest.do" class="btn btn-outline-primary btn-block"> 
						<i class="fab fa-google-plus mr-2"></i> 메인 페이지 임시 경로 입니다.(삭제예정)
					</a>
				</div>
			</div>

		</div>
	</div>


	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/assets/dist/js/adminlte.min.js"></script>


</body>