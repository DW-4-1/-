<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="kr.or.dw.vo.BoardVO"%>
<%@page import="kr.or.dw.util.PaginationUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>



<section class="content">
	<div class="card card-solid">
		<div class="card-body">
			<div style="height: 1em; margin: 1em;">
				<h2 class="card-title" style="margin: 1em 0em 0em 1.5em; display:inline">문의게시판</h2>
				<div style="float: right; margin-right: 3em;">
					<%
						if(session.getAttribute("auth_cd") != null && ((String)session.getAttribute("auth_cd")).equals("S")){
					%>	
					<a style="width: 5em;" class="btn btn-outline-primary" href="<%=request.getContextPath()%>/board/stuContentInsertForm.do">글작성</a> 
					<%
						}
					%>	
				</div>
				<hr>
			</div>
			<br>
			<div class="table-responsive" style="margin: 1em;">
		        <table class="table table-striped table-sm" style="text-align: center;">
		          	<thead>
						<tr>
				              <th scope="col">상태</th>
				              <th scope="col">글번호</th>
				              <th scope="col">제목</th>
				              <th scope="col">작성자</th>
				              <th scope="col">조회수</th>
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
								String stu_name = board.getStu_name();
								int bd_hit = board.getBd_hit();
							
					%>
					<a href="#">
						<tr>
							<td>답변전</td>
							<td><%=bd_no %></td>
							<td>
								<a href="<%=request.getContextPath()%>/board/stuBoardView.do?bd_no=<%=bd_no%>">
									<%=bd_title %>
								</a>
							</td>
							<td>
								<%=stu_name %>
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
				<br>
			
				<div>
					<div style="display: flex; justify-content: center;">
						<form method="post" name="search" action="searchbbs.jsp">
							<table class="pull-right">
								<tr>
									<td>
										<select class="form-select " name="searchField">
											<option value="0">선택</option>
											<option value="bbsTitle">제목</option>
											<option value="userID">작성자</option>
										</select>
									</td>
									<td>
										&nbsp;
										<input class="form-control" style="width: 15em; float: right; text-align: center; margin: 0 auto;" type="text" placeholder="Search">
									</td>
									<td>
										&nbsp;
										<button type="submit" class="btn btn-outline-dark" style="width:5em;">검색</button>
									</td>
									
									<div style="display: flex; justify-content: center;">
										<%
											PaginationUtil pagination = (PaginationUtil) request.getAttribute("pagingConfigMap");
								 		%>
										<%= 
											pagination.getPaginationHtml(request,new String[] {"search"}) 
										%>
									</div>
								</tr>
							</table>
						</form>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</section>


<%@ include file="../footer.jsp"%>