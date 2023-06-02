<%@page import="kr.or.dw.vo.AssignVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.dw.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>    
<%
	AssignVO assignVo = (AssignVO) request.getAttribute("assignVo");

	DateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");

%>
<style>
	input[type=file]::file-selector-button {
	  width: 100px;
	  height: 30px;
	  background: #fff;
	  border: 1px solid rgb(77,77,77);
	  border-radius: 10px;
	  cursor: pointer;
	  &:hover {
	    background: rgb(77,77,77);
	    color: #fff;
	  }
	}
</style>

<script>
	$(document).on('change', '#assignfile', function(){
		$(this).parent().find('#saveAssignBtn').css('display', '');
	})
</script>

<div class="col-md-7 col-lg-7" style="margin: 0 auto;">
	<div class="col">
        <div class="card mb-4 rounded-3 shadow-sm">
          <div class="card-header py-3">
            <h4 class="my-0 fw-normal" style="display:inline;"><%=assignVo.getAssign_name()%></h4>
            <span class="mailbox-read-time float-right" style="float: right; vertical-align: middle;">&emsp;&emsp;제출 기간 : <%=fomatter.format(assignVo.getAssign_start())%> ~ <%=fomatter.format(assignVo.getAssign_end())%>&emsp;&emsp;</span>
            
          </div>
          <div class="card-body">
            <!-- content -->
		<div class="mailbox-read-message" style="margin: 1em; height: 400px;">
			<p><%=assignVo.getAssign_content()%></p>
		</div>
			<br>
			<hr>
			<form id="assign_form" method="post" enctype="multipart/form-data">
						&nbsp;&nbsp;<span style="font-size: 1.2em;">과제제출</span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="file" id="assignfile" name="assignfile">
								<input type="button" class="btn btn-primary" id="saveAssignBtn" value="제출하기" style="display : none; float: right;">
	        </form>
			<hr>
            <div style="text-align: center">
            	
            	<button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/assign/assignList.do'">
            		목록
           		</button>
			</div>
        </div>
      </div>
	</div>
</div>

<%@ include file="../footer.jsp"%>