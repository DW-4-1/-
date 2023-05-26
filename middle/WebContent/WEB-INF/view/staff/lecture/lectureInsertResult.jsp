<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	<%
	 if(request.getAttribute("result") != null){
		 int result = (int)request.getAttribute("result");
		 if(result != 0){
	%>
		alert("등록되었습니다.");
		location.href="<%=request.getContextPath()%>/lecture/lectureInsertForm.do";
	<%
		 }else{
	%>
		alert("등록에 실패하였습니다.");
		location.href="<%=request.getContextPath()%>/lecture/lectureInsertForm.do";
	<%
		 }
	 }
	%>
</script>