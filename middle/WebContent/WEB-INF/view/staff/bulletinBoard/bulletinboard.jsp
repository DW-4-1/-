<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="kr.or.dw.vo.BoardVO"%>
<%@page import="kr.or.dw.util.PaginationUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>    

<script>

</script>

<h3>게시판</h3>
<div>

	<%
		if(session.getAttribute("auth_cd") != null && ((String)session.getAttribute("auth_cd")).equals("A")){
	%>	
	<a class="btn btn-primary btn-sm" href="<%=request.getContextPath()%>/board/boardInsert.do">글작성</a> 
			
	<%
		}
	%>	
	<input type="text" placeholder="Search Title">
	
	

</div>

<div>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
		
		
		<% 
			if(request.getAttribute("boardList") != null){
				
			
				List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");
				DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				
				for(BoardVO board : boardList){
					int bd_no = board.getBd_no();
					String bd_title = board.getBd_title();
				
					String bd_pic_path = "/profilePath/default/defaultprofile.png";
					
					int bd_hit = board.getBd_hit();
				
		%>
			<a href="#">
				<tr>
					<td><%=bd_no %></td>
					<td>
						<a href="<%=request.getContextPath()%>/board/boardView.do?bd_no=<%=bd_no%>">
							<%=bd_title %>
						</a>
					</td>
					<td>
						관리자
					</td>
					<td><%=bd_hit %></td>
					<td><%=formatter.format(board.getBd_wdt()) %></td>
				</tr>
			</a>
									
		<% 
			}}
		%>
			
		</tbody>
	</table>
	<div style="margin-top: 20px;">
		<%
			PaginationUtil pagination = (PaginationUtil) request.getAttribute("pagingConfigMap");
 		%>
		<%= pagination.getPaginationHtml(request,new String[] {"search"}) %>
	</div>
</div>


<%@ include file="../footer.jsp"%>