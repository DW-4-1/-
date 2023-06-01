<%@page import="kr.or.dw.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<%
	BoardVO boardVo = null;
	if(request.getAttribute("boardVo") != null){
		boardVo = (BoardVO) request.getAttribute("boardVo");
	}
%>


<h3 class="card-title">글작성</h3>

<form method="post" action="<%=request.getContextPath()%>/board/bulletinContentInsert.do">
	<%
	if(boardVo != null){
	%>
		<input type="hidden" name="bd_no" value="<%=boardVo.getBd_no()%>">
	<%
	}
	%>
	<div>
		<div>
			<label for="inputName">제목</label> 
			<input type="text" id="inputName" name="bd_title" value="<%=boardVo != null ? boardVo.getBd_title() : ""%>" required>
		</div>
		<div>
			<label for="inputDescription">내용</label>
			<textarea id="inputDescription" rows="20" name="bd_content" ><%=boardVo != null ? boardVo.getBd_content() : ""%></textarea>
		</div>
		<div>
		
			<button type="submit"><%=boardVo != null ? "수정" : "등록" %></button>
				

			<button onclick="history.go(-1)">취소</button>
		</div>
	</div>
</form>



<%@ include file="../footer.jsp"%>