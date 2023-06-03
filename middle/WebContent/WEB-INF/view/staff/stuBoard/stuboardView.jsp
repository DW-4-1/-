<%@page import="kr.or.dw.vo.ReplyVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.dw.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>    
<%
	BoardVO boardVo = (BoardVO) request.getAttribute("boardVo");
	ReplyVO reVo = null;
	if(request.getAttribute("reVo") != null){
	    reVo = (ReplyVO)request.getAttribute("reVo");
	}

	String content = "";
	if (reVo != null) {
	    content = (reVo.getRe_content() == null) ? "" : reVo.getRe_content();
	}
	DateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");
	HttpSession stasession = request.getSession();
	String staff_id = (String)stasession.getAttribute("staff_id");
%>

<script>
	$(function(){
		$('#contentDelBtn').on('click', function(){
			if(confirm("정말 삭제하시겠습니까?") == true){
				location.href = "<%=request.getContextPath()%>/board/deleteStuContent.do?bd_no=<%=boardVo.getBd_no()%>";
				};
		});
		let re_content;
		let sta_id;
		$('input[name=re_content]').on('keyup', function(){
			re_content = $(this).val();
			staff_id = $('input[name=staff_id]').val();
			console.log($('input[name=staff_id]').val());
			});
		$('#re_contentInsert').on('click', function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/board/stuBoardReplyInsert.do?bd_no=<%=boardVo.getBd_no()%>&staff_id=<%=staff_id%>",
				data : {"re_content" : re_content},
				method : "post",
				success : function(res){
					location.href="<%=request.getContextPath()%>/board/stuBoardView.do?bd_no=<%=boardVo.getBd_no()%>";
					alert('저장이 완료되었습니다.');
				},
				error : function(err){
					alert(err.status);
				}
			})
		});
		
		$('#re_contentView').show();
		$('#re_contentUpdateForm').on('click', function(){
			$('#re_contentUpdate').show();
			$('#re_contentView').hide();
			$('#re_contentUpdateForm').hide();
			$('#re_contentSave').show();
			$('#re_contentReset').show();
		});
		let re_contentUpdate;
		$('#re_contentUpdate').on('keyup', function(){
			re_contentUpdate = $(this).val();
			console.log(re_contentUpdate);
		});
		$('#re_contentSave').on('click', function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/board/stuBoardReplyUpdate.do?bd_no=<%=boardVo.getBd_no()%>&staff_id=<%=staff_id%>",
				data : {"re_content" : re_contentUpdate},
				method : "post",
				success : function(res){
					location.href="<%=request.getContextPath()%>/board/stuBoardView.do?bd_no=<%=boardVo.getBd_no()%>";
					alert('수정이 완료되었습니다.');
				},
				error : function(err){
					alert(err.status);
				}
			})
		});
		$('#re_contentReset').on('click', function(){
			location.href="<%=request.getContextPath()%>/board/stuBoardView.do?bd_no=<%=boardVo.getBd_no()%>";
		});
	});
</script>

<div class="col-md-7 col-lg-7" style="margin: 0 auto;">
	<div class="col">
		<div class="card mb-4 rounded-3 shadow-sm">
			<div class="card-header py-3">
				<h4 class="my-0 fw-normal" style="display:inline;">
					<%=boardVo.getBd_title()%>
				</h4>
	            <span class="mailbox-read-time float-right" style="float: right; vertical-align: middle;">&emsp;&emsp;작성일 : <%=fomatter.format(boardVo.getBd_wdt())%>&emsp;</span>
	            <p style="float: right; margin: auto" >작성자 : <%=boardVo.getStu_name() %></p>
			</div>
			<div class="card-body">
	            <!-- content -->
				<div class="mailbox-read-message" style="margin: 1em;">
					<p><%=boardVo.getBd_content()%></p>
				</div>
				<br>
				<hr>
				<div style="text-align: center">
				<% 
					if(reVo != null){ 
				%>
					<span><%=reVo.getStaff_name()%></span>
						<p id="re_contentView" style="display:none;"><%=content%></p>
						<button id="re_contentSave" style="display:none; float: right; width: 4em;" class="btn btn-danger">
		            		저장
						</button> 
 						<button id="re_contentUpdateForm" style=" float: right; width: 4em; margin-right:0.5em;" class="btn btn-primary" <%--onclick="location.href='<%=request.getContextPath()%>/board/stuContentInsertForm.do?bd_no=<%=boardVo.getBd_no()%>' --%>"> 
							수정
						</button>
						<button id="re_contentReset" style="display:none; float: right; width: 4em; margin-right:0.5em;" class="btn btn-primary" <%-- onclick="location.href='<%=request.getContextPath()%>/board/stuContentInsertForm.do?bd_no=<%=boardVo.getBd_no()%>'--%>">
							취소
						</button>
				<%
					} else {
				%>
					<input type="hidden" name="staff_id" value="<%=staff_id%>">
					
					<!-- 관리자 답변 -->
					<div class="mb-3">
					    <input type="text" name="re_content" class="form-control">
					</div>
					
					<button id="re_contentInsert" type="button" class="btn btn-primary" style="width: 6em; float: right;" onclick="location.href='<%=request.getContextPath()%>/board/stuBoardList.do'">
	            		추가
	           		</button>
	           	<%
					}
	           	%>
	           		<button type="button" class="btn btn-outline-dark" style="width: 6em; float: left;" onclick="location.href='<%=request.getContextPath()%>/board/stuBoardList.do'">
	            		목록
	           		</button>
					<input type="text" id="re_contentUpdate" style="display:none;" value="<%=content%>">
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>