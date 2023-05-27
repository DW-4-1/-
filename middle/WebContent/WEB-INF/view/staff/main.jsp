<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	
	<h2>메인 페이지입니다.</h2>
	
	<li id="logout">
		<a href="<%=request.getContextPath()%>/staff/staffLogout.do">로그아웃</a>
	</li>
	<li id="stu_managing">학생관리
		<ul><a href="<%=request.getContextPath()%>/staff/studentCRUD.do">학생 추가 수정 삭제</a></ul>
	</li>
	<li id="lecture">강의관리
		<ul><a href="<%=request.getContextPath()%>/lecture/lectureInsertForm.do">강의 등록</a></ul>
		<ul><a href="<%=request.getContextPath()%>/lecture/lectureManaging.do">강의 관리</a></ul>
	</li>
	<li id="score">성적관리
		<ul><a href="<%=request.getContextPath()%>/lecture/lectureScoreList.do">성적등록</a></ul>
	</li>
	<li id="board">게시판
		<ul><a href="<%=request.getContextPath()%>">공지사항</a></ul>
		<ul><a href="<%=request.getContextPath()%>">문의게시판</a></ul>
	</li>
</body>
<script>
	
</script>
</html>