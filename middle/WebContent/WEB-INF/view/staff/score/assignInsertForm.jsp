<%@page import="kr.or.dw.vo.AssignVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<title>과제등록</title>
<body>
<%
	String assign_name = "";
	String assign_start = "";
	String assign_end = "";
	String lec_name = "";
	String assign_content = "";
	String title = "등록";
	if(request.getAttribute("assingVo") != null){
		AssignVO assignVo = (AssignVO) request.getAttribute("assignVo");
		title = "수정";
		assign_name = assignVo.getAssign_name();
		assign_content = assignVo.getAssign_content();
		assign_start = assignVo.getAssign_start();
		assign_end = assignVo.getAssign_end();
		lec_name = assignVo.getLec_name();
%>
	
	<div class="col-md-7 col-lg-8" style="margin: 0 auto;">
        <h4 class="mb-3">과제 <%=title %></h4>
        <form class="needs-validation" id="insertLectureForm" method="post" action="<%=request.getContextPath()%>/lecture/lectureInsert.do">
          <div class="row g-3">
            <div class="col-12">
              <label class="form-label">과제명</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="assign_name" name="assign_name" value="<%=assign_name %>" placeholder="과제명을 입력해주세요." required>
              	<div class="invalid-feedback">
                  	과제명을 입력해주세요.
                </div>
              </div>
            </div>
            
			<div class="col-12">
	          <label class="form-label">과제 시작일</label>
	          <div class="input-group has-validation">
	            <input type="Date" class="form-control" name="assign_start" value="<%=assign_start%>" required>
	          	<div class="invalid-feedback">
	              	과제 시작일을 선택해주세요.
	            </div>
	          </div>
	        </div>
	        
			<div class="col-12">
	          <label class="form-label">과제 마감일</label>
	          <div class="input-group has-validation">
	            <input type="Date" class="form-control" name="assign_end" value="<%=assign_end%>" required>
	          	<div class="invalid-feedback">
	              	과제 마감일을 선택해주세요.
	            </div>
	          </div>
	        </div>
	        
            <div class="col-12">
              <label class="form-label">과제내용</label>
              <input type="text" class="form-control" id="assign_content" name="assign_content" placeholder="내용을 입력해주세요." value="<%=assign_content %>" required>
              <div class="invalid-feedback">
               	 과제 내용을 입력해주세요.
              </div>
            </div>
            

          <button class="w-100 btn btn-primary btn-lg" type="submit"><%=title%></button>
          </div>
        </form>
      </div>
</body>
<%@ include file="../footer.jsp" %>