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
				<h2 class="card-title" style="margin: 1em 0em 0em 1.5em; display:inline">공지사항</h2>
				<div style="float: right; margin-right: 3em;">
					<%
						if(session.getAttribute("auth_cd") != null && ((String)session.getAttribute("auth_cd")).equals("A")){
					%>	
					<a style="width: 5em;" class="btn btn-outline-primary" href="<%=request.getContextPath()%>/board/bulletinContentInsertForm.do">글작성</a> 
							
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
				              <th scope="col">글번호</th>
				              <th scope="col">제목</th>
				              <th scope="col">작성자</th>
				              <th scope="col">조회수</th>
				              <th scope="col">작성일</th>
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
								
								int bd_hit = board.getBd_hit();
							
					%>
					<a href="#">
						<tr>
							<td><%=bd_no %></td>
							<td>
								<a style="text-decoration: none;" href="<%=request.getContextPath()%>/board/bulletinBoardView.do?bd_no=<%=bd_no%>">
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
				<br>
				
				<!-- 페이지 -->
				<div style="display: flex; justify-content: center;">
					<%
						PaginationUtil pagination = (PaginationUtil) request.getAttribute("pagingConfigMap");
			 		%>
					<%= 
						pagination.getPaginationHtml(request,new String[] {"search"}) 
					%>
				</div>
				
				<!-- 검색 -->
				<div>
					<div style="display: flex; justify-content: center;">
						<form method="get" name="search" action="board-search">
							<table class="pull-right">
								<tr>
									<td>
										<select class="form-select" name="searchCategory">
											<option value="0">선택</option>
											<option value="1">작성자</option>
											<option value="2">제목</option>
											<option value="3">제목 + 내용</option>
										</select>
									</td>
									<td>
										&nbsp;
										<input type="text" class="form-control" name="searchKeyword" style="width: 15em; float: right; text-align: center; margin: 0 auto;" placeholder="Search" required>
									</td>
									<td>
										&nbsp;
										<input type="submit" class="btn btn-outline-dark" style="width:6em;" value="검색">
									</td>
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