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
	<h2>메인 페이지입니다.</h2>
	<li id="myInfo">내 정보
		<ul><a href="<%=request.getContextPath()%>">내 정보 수정</a></ul>
	</li>
	<li id="lecture">강의관리
		<ul><a href="<%=request.getContextPath()%>/lecture/lectureList.do">수강 강의 조회</a></ul>
		<ul><a href="<%=request.getContextPath()%>/lecture/gradeView.do">성적 조회</a></ul>
	</li>
	<li id="board">게시판
		<ul><a href="<%=request.getContextPath()%>">공지사항</a></ul>
		<ul><a href="<%=request.getContextPath()%>">문의게시판</a></ul>
	</li>
</body>
<script>
	
</script>
</html>