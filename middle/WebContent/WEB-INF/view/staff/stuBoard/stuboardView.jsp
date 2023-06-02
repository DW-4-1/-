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
		$('#re_contentSave').on('click', function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/board/stuBoardReplyUpdate.do?bd_no=<%=boardVo.getBd_no()%>&staff_id=<%=staff_id%>",
				data : {"re_content" : re_content},
				method : "post",
				success : function(res){
					location.href="<%=request.getContextPath()%>/board/stuBoardView.do?bd_no=<%=boardVo.getBd_no()%>";
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


	<div class="card-header">
		<h3><%=boardVo.getBd_title()%></h3>
	</div>

	<div class="card-body p-0">
		<div class="mailbox-read-info">
				<%=boardVo.getStu_name() %>
			<h6>
				<span class="mailbox-read-time float-right"><%=fomatter.format(boardVo.getBd_wdt())%></span>
			</h6>
		</div>

		<div class="mailbox-read-message">
			<p><%=boardVo.getBd_content()%></p>
		</div>
		<div>
		<% if(reVo != null){ %>
			<span><%=reVo.getStaff_name() %></span>
				<span id="re_contentView" style="display:none;"><%=reVo.getRe_content() %></span>
				<a id="re_contentUpdateForm" style="float:right;">수정</a>
				<a id="re_contentSave" style="float:right; display:none;">저장</a>
				<a id="re_contentReset" style="float:right; display:none;">취소</a>
			<%   }else{	%>
				<input type="text" name="re_content" style="width:60%;"> 
				<input type="hidden" name="staff_id" value="<%=staff_id%>">
				<a id="re_contentInsert">추가</a>	
			<% 	  }	 %>
				<input type="text" id="re_contentUpdate" style="display:none;" value="<%=reVo.getRe_content()%>">
		</div>
	</div>

	<div class="card-footer">
		<div class="float-right">
			<a type="button"
				href="<%=request.getContextPath()%>/board/stuBoardList.do">목록
			</a>
		</div>
		<hr>

	
	</div>
				
					
<%@ include file="../footer.jsp"%>