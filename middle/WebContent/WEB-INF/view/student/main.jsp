<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script
	src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>조낸 맞는거다..</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/dist/css/adminlte.min.css">
<script>
	function changeImage(element) {
		var imagePath = element.getAttribute("src");
		var mainImage = document.getElementById("mainImage");
		mainImage.setAttribute("src", imagePath);
	}
</script>
<style>
/*   .main-header, .main-sidebar { */
/*     border: none; */
/*   } */
</style>
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- Navbar -->

		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="index3.html" class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Contact</a></li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
				<li class="nav-item"><a class="nav-link"
					data-widget="navbar-search" href="#" role="button"> <i
						class="fas fa-search"></i>
				</a>
					<div class="navbar-search-block">
						<form class="form-inline">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search"
									placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button"
										data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>

				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-comments"></i>
						<span class="badge badge-danger navbar-badge">3</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="dist/img/user1-128x128.jpg" alt="User Avatar"
									class="img-size-50 mr-3 img-circle">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Brad Diesel <span class="float-right text-sm text-danger"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">Call me whenever you can...</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="dist/img/user8-128x128.jpg" alt="User Avatar"
									class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										John Pierce <span class="float-right text-sm text-muted"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">I got your message bro</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="dist/img/user3-128x128.jpg" alt="User Avatar"
									class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Nora Silvester <span class="float-right text-sm text-warning"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">The subject goes here</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Messages</a>
					</div></li>
				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
						class="badge badge-warning navbar-badge">15</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-header">15 Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-envelope mr-2"></i> 4 new messages <span
							class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-users mr-2"></i> 8 friend requests <span
							class="float-right text-muted text-sm">12 hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
							3 new reports <span class="float-right text-muted text-sm">2
								days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Notifications</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="fullscreen" href="#" role="button"> <i
						class="fas fa-expand-arrows-alt"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-slide="true" href="#"
					role="button"> <i class="fas fa-th-large"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<!--   사이드바 색상 후보 -->
		<!--   sidebar-light-dark -->
		<!--	sidebar-light-light -->
		<!-- sidebar-light-secondary -->

		<aside class="main-sidebar sidebar-light-dark elevation-2">
			<!-- Brand Logo -->
			<a href="index3.html" class="brand-link"> <img
				src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-dark">페이지명</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="dist/img/user2-160x160.jpg"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">OOO 학생</a>
					</div>
				</div>

				<!-- SidebarSearch Form -->
				<div class="form-inline">
					<div class="input-group" data-widget="sidebar-search">
						<input class="form-control form-control-sidebar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-sidebar">
								<i class="fas fa-search fa-fw"></i>
							</button>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-item menu-open"><a id="myInfo" href="#"
							class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									내 정보 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="<%=request.getContextPath()%>/student/studentInfo.do"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>내 정보 수정</p>
								</a></li>
							</ul></li>

						<li id="lecture" class="nav-item menu-open"><a id="myInfo"
							href="#" class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									강의 관리 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="<%=request.getContextPath()%>/lecture/lectureList.do"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>수강 강의 조회</p>
								</a></li>
								<li class="nav-item"><a
									href="<%=request.getContextPath()%>/lecture/gradeView.do"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>성적 조회</p>
								</a></li>
							</ul></li>

						<li class="nav-item menu-open"><a id="board" href="#"
							class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									게시판 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="<%=request.getContextPath()%>" class="nav-link active">
										<i class="far fa-circle nav-icon"></i>
										<p>공지사항</p>
								</a></li>
								<li class="nav-item"><a
									href="<%=request.getContextPath()%>" class="nav-link active">
										<i class="far fa-circle nav-icon"></i>
										<p>문의게시판</p>
								</a></li>
							</ul></li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="min-height: 635px;">
			<!-- Content Header (Page header) -->
			<!-- /.content-header -->


			<section class="content-header" style="padding: 3.8px 0.5rem;">
				<div class="container-fluid">
					<div class="row mb-20"></div>
				</div>
			</section>


			<!-- Main content -->
			<section class="content">
				<div class="card card-solid">
					<div class="card-body">
						<div class="row">
							<div class="col-12 col-sm-6">
								<div class="col-12">
									<img id="mainImage"
										src="<%=request.getContextPath()%>/img/정문.jpg"
										class="product-image" alt="Product Image">
								</div>
								<div class="col-12 product-image-thumbs">
									<div class="product-image-thumb active">
										<img src="<%=request.getContextPath()%>/img/정문.jpg"
											alt="Product Image" onclick="changeImage(this)">
									</div>
									<div class="product-image-thumb">
										<img src="<%=request.getContextPath()%>/img/행정관.jpg"
											alt="Product Image" onclick="changeImage(this)">
									</div>
									<div class="product-image-thumb">
										<img src="<%=request.getContextPath()%>/img/풍산마당.jpg"
											onclick="changeImage(this)">
									</div>
									<div class="product-image-thumb">
										<img src="<%=request.getContextPath()%>/img/미술관.jpg"
											onclick="changeImage(this)">
									</div>
									<div class="product-image-thumb">
										<img src="<%=request.getContextPath()%>/img/자하연.jpg"
											onclick="changeImage(this)">
									</div>
								</div>
							</div>
							<div class="col-12 col-sm-6">
								<h3 class="my-3">이곳은 메인 페이지입니다.</h3>
								<p>
									학교에 대한 소개글을 입력합니다.<br> 학교에 대한 소개글을 입력합니다.<br> 학교에 대한
									소개글을 입력합니다.<br> 학교에 대한 소개글을 입력합니다.<br> 학교에 대한 소개글을
									입력합니다.<br> 학교에 대한 소개글을 입력합니다.<br> 학교에 대한 소개글을 입력합니다.<br>
									학교에 대한 소개글을 입력합니다.
								</p>

								<hr>
								<h4>Available Colors</h4>
								<div class="bg-gray py-2 px-3 mt-4">
									<h2 class="mb-0">$80.00</h2>
									<h4 class="mt-0">
										<small>Ex Tax: $80.00 </small>
									</h4>
								</div>
							</div>
						</div>
						<div class="row mt-4">
							<nav class="w-100">
								<div class="nav nav-tabs" id="product-tab" role="tablist">
									<a class="nav-item nav-link active" id="product-desc-tab"
										data-toggle="tab" href="#product-desc" role="tab"
										aria-controls="product-desc" aria-selected="true">형 왔다</a> <a
										class="nav-item nav-link" id="product-comments-tab"
										data-toggle="tab" href="#product-comments" role="tab"
										aria-controls="product-comments" aria-selected="false">굴다리
										밑으로..</a> <a class="nav-item nav-link" id="product-rating-tab"
										data-toggle="tab" href="#product-rating" role="tab"
										aria-controls="product-rating" aria-selected="false">집합</a>
								</div>
							</nav>
							<div class="tab-content p-3" id="nav-tabContent">
								<div class="tab-pane fade show active" id="product-desc"
									role="tabpanel" aria-labelledby="product-desc-tab">Lorem
									ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae
									condimentum erat. Vestibulum ante ipsum primis in faucibus orci
									luctus et ultrices posuere cubilia Curae; Sed posuere, purus at
									efficitur hendrerit, augue elit lacinia arcu, a eleifend sem
									elit et nunc. Sed rutrum vestibulum est, sit amet cursus dolor
									fermentum vel. Suspendisse mi nibh, congue et ante et, commodo
									mattis lacus. Duis varius finibus purus sed venenatis. Vivamus
									varius metus quam, id dapibus velit mattis eu. Praesent et
									semper risus. Vestibulum erat erat, condimentum at elit at,
									bibendum placerat orci. Nullam gravida velit mauris, in
									pellentesque urna pellentesque viverra. Nullam non pellentesque
									justo, et ultricies neque. Praesent vel metus rutrum, tempus
									erat a, rutrum ante. Quisque interdum efficitur nunc vitae
									consectetur. Suspendisse venenatis, tortor non convallis
									interdum, urna mi molestie eros, vel tempor justo lacus ac
									justo. Fusce id enim a erat fringilla sollicitudin ultrices vel
									metus.</div>
								<div class="tab-pane fade" id="product-comments" role="tabpanel"
									aria-labelledby="product-comments-tab">Vivamus rhoncus
									nisl sed venenatis luctus. Sed condimentum risus ut tortor
									feugiat laoreet. Suspendisse potenti. Donec et finibus sem, ut
									commodo lectus. Cras eget neque dignissim, placerat orci
									interdum, venenatis odio. Nulla turpis elit, consequat eu eros
									ac, consectetur fringilla urna. Duis gravida ex pulvinar mauris
									ornare, eget porttitor enim vulputate. Mauris hendrerit, massa
									nec aliquam cursus, ex elit euismod lorem, vehicula rhoncus
									nisl dui sit amet eros. Nulla turpis lorem, dignissim a sapien
									eget, ultrices venenatis dolor. Curabitur vel turpis at magna
									elementum hendrerit vel id dui. Curabitur a ex ullamcorper,
									ornare velit vel, tincidunt ipsum.</div>
								<div class="tab-pane fade" id="product-rating" role="tabpanel"
									aria-labelledby="product-rating-tab">Cras ut ipsum
									ornare, aliquam ipsum non, posuere elit. In hac habitasse
									platea dictumst. Aenean elementum leo augue, id fermentum risus
									efficitur vel. Nulla iaculis malesuada scelerisque. Praesent
									vel ipsum felis. Ut molestie, purus aliquam placerat
									sollicitudin, mi ligula euismod neque, non bibendum nibh neque
									et erat. Etiam dignissim aliquam ligula, aliquet feugiat nibh
									rhoncus ut. Aliquam efficitur lacinia lacinia. Morbi ac
									molestie lectus, vitae hendrerit nisl. Nullam metus odio,
									malesuada in vehicula at, consectetur nec justo. Quisque
									suscipit odio velit, at accumsan urna vestibulum a. Proin
									dictum, urna ut varius consectetur, sapien justo porta lectus,
									at mollis nisi orci et nulla. Donec pellentesque tortor vel
									nisl commodo ullamcorper. Donec varius massa at semper posuere.
									Integer finibus orci vitae vehicula placerat.</div>
							</div>
						</div>
					</div>
					<!-- /.row -->
				</div>
			</section>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content -->
		<!-- /.content-wrapper -->
		<!-- Control Sidebar -->

		<!-- /.control-sidebar -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="float-right d-none d-sm-inline">Anything you want</div>
			<!-- Default to the left -->
			<strong style="text-align: center;">Copyright &copy;
				2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
		</footer>
		<!-- ./wrapper -->

		<!-- REQUIRED SCRIPTS -->

		<!-- jQuery -->
		<script src="plugins/jquery/jquery.min.js"></script>
		<!-- Bootstrap 4 -->
		<script
			src="<%=request.getContextPath()%>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- AdminLTE App -->
		<script
			src="<%= request.getContextPath() %>/assets/dist/js/adminlte.min.js"></script>
</body>
</html>
