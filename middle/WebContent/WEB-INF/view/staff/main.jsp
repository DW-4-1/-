<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<title>메인화면</title>
</head>
<body>
	<%
		String staff_id = (String) session.getAttribute("staff_id");
	
		if(staff_id == null){
	%>
		<script>
			alert("로그인이 필요합니다.");
			location.href = "<%=request.getContextPath()%>/";
		</script>
	<%
		}
	%>

	<main>
		<div
			class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-body-tertiary">
			<div class="col-md-5 p-lg-5 mx-auto my-5">
				<h1 class="display-4 fw-normal">교수 및 관리자</h1>
				<p class="lead fw-normal">And an even wittier subheading to
					boot. Jumpstart your marketing efforts with this example based on
					Apple’s marketing pages.</p>
				<a class="btn btn-outline-secondary" href="#">Coming soon</a>
			</div>
			<div class="product-device shadow-sm d-none d-md-block"></div>
			<div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
		</div>
		<hr>
	</main>

<%@ include file="footer.jsp" %>