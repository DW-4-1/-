<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script>
	$(function(){
		$('#stuInfoUpdateBtn').on('click', function(){
			location.href="<%=request.getContextPath()%>/student/updateInfo.do";
		});
		$('#passUpdateBtn').on('click', function(){
			location.href="<%=request.getContextPath()%>/student/studentPasswordUpdate.do";
		});
	})
	
</script>
<%
StudentVO stu = (StudentVO) request.getAttribute("stuVo");
%>
<section class="content">
	<div class="card card-solid">
		<div class="card-body">
			<div class="row">
				<div class="col-12 col-sm-12">
					<h4>
						<i class="fas fa-globe" class="m-0"> </i> 내 정보 확인 <small
							class="float-right">Date: 2/10/2014</small> <br> <br>
					</h4>
				</div>

			</div>

			<div class="row invoice-info">
				<div class="col-6" id="text-center">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<th style="width: 50%">학번</th>
									<td><%=stu.getStu_id()%></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><%=stu.getStu_name()%></td>
								</tr>
								<tr>
									<th>성별</th>
									<td><%=stu.getStu_gender()%></td>
								</tr>
								<tr>
									<th>주민번호</th>
									<td><%=stu.getStu_resnum()%></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><%=stu.getStu_addr()%></td>
								</tr>
								<tr>
									<th>우편번호</th>
									<td><%=stu.getStu_zipcode()%></td>
								</tr>
								<tr>
									<th>학과명</th>
									<td><%=stu.getDept_name()%></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><%=stu.getStu_tel()%></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><%=stu.getStu_email()%></td>
								</tr>
							</tbody>
						</table>
						<input class="btn btn-primary" type="button" id="stuInfoUpdateBtn"
							value="내 정보 수정하기"> <input class="btn btn-primary"
							type="button" id="passUpdateBtn" value="비밀번호 변경하기">
						<!-- 							<button type="button" class="btn btn-success float-right"> -->
						<!-- 								<i class="far fa-credit-card"></i>SubmitPayment -->
						<!-- 							</button> -->

						<!-- 							<button type="button" class="btn btn-primary float-right" -->
						<!-- 								style="margin-right: 5px;"> -->
						<!-- 								<i class="fas fa-download"></i>Generate PDF -->
						<!-- 							</button> -->
					</div>
				</div>
				<div
					class="col-5 text-center d-flex align-items-center justify-content-center">
					<div class="">
						<h2>
							Admin<strong>LTE</strong>
						</h2>
						<p class="lead mb-5">
							123 Testing Ave, Testtown, 9876 NA<br> Phone: +1 234
							56789012
						</p>
					</div>
				</div>
			</div>

			<div class="col-12" id="text-center">
				<p class="lead">Payment Methods:</p>
				<p class="text-muted well well-sm shadow-none"
					style="margin-top: 10px;">
					Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, <br>weebly
					ning heekya handango imeem plugg dopplr jibjab, movity jajah
					plickers sifteo edmodo ifttt zimbra.
				</p>
			</div>
		</div>
	</div>
</section>
<%@ include file="../footer.jsp"%>