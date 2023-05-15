<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="heesung.Quartz" %> <!-- Quartz.java 파일을 불러온다. -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quartz</title>
</head>
<style>
	#div1 {
		position: relative;
		left: 37%;
		top: 150px;
	}
	
	#div2 {
		position: relative;
		left: 46%;
		top: 200px;
	}
</style>
<body>
	<div id="div1">
		<h1>예시를 위한 로그인 페이지 입니다.</h1>
	</div>
	
	<div id="div2">
		<form method="post" action="<%=request.getContextPath() %>/LoginServlet.do">
			<!-- 1. form 태그의 method 방식은 post로 한다. (로그인 정보를 담아서 세션에 등록하기 위함) -->
			<!-- 2. name의 값이 id, password로 등록된 입력 정보는 submit 타입의 input 버튼을 누를때 session으로 전달된다. -->
			<!-- 3. loginServlet.java 서블렛 실행 -->
			<input type="text" name="id" width="500px" placeholder="관리자 아이디"><br><br>
			<input type="password" name="password" width="500px" placeholder="관리자 비밀번호"><br><br>
			<input type="submit" value="로그인">
			<input type="button" value="비밀번호 찾기"><br><br>
			<input type="button" value="     회    원    가    입     ">
		</form>
	</div>
	
</body>
</html>