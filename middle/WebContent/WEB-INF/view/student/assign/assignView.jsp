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