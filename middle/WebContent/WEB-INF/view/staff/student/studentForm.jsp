<%@page import="java.util.List"%>
<%@page import="kr.or.dw.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생추가 페이지 입니다.</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function(){
		$("#saveBtn").on('click', function(){
			$("#studentInsertForm").submit();
		});
		$("#resetBtn").on('click', function(){
			history.go(-1);
		});
	})
</script>
<%
	List<StudentVO> stuVo = (List)request.getAttribute("dept");
%>
<body>
	<form id="studentInsertForm" method="post" action="<%=request.getContextPath()%>/staff/studentInsert.do">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="stu_id" required></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="stu_name" required></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<select name="stu_gender">
						<option value="Male">남</option>
						<option value="Female">여</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td><input type="text" name="stu_resnum" required></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input id="stu_zipcode" name="stu_zipcode" type="text" readonly onclick="findAddr()" required></td>
			</tr>
			<tr>
				<th>주소</th>
				<td> <input id="stu_addr" name="stu_addr" type="text" readonly required></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="stu_detailaddr" required></td>
			</tr>
	
			<script>
			function findAddr(){
				new daum.Postcode({
			        oncomplete: function(data) {
			        	
			        	console.log(data);
			        	
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var roadAddr = data.roadAddress; // 도로명 주소 변수
			            var jibunAddr = data.jibunAddress; // 지번 주소 변수
			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('stu_zipcode').value = data.zonecode;
			            if(roadAddr !== ''){
			                document.getElementById("stu_addr").value = roadAddr;
			            } 
			            else if(jibunAddr !== ''){
			                document.getElementById("stu_addr").value = jibunAddr;
			            }
			        }
			    }).open();
			}
			</script>
			<tr>
				<th>학과</th>
				<td>
					<select name="dept_code">
					<% for(StudentVO vo : stuVo){ %>
						<option value="<%=vo.getDept_code()%>"><%=vo.getDept_code()%> <%=vo.getDept_name()%></option>
					<% 	 }	 %>
					</select>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="stu_tel" required></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="stu_email" required></td>
			</tr>
			<tr>
				<th>상태</th>
				<td><input type="text" name="stu_state" required></td>
			</tr>
			<tr>
				<th>졸업예정일</th>
				<td><input type="Date" name="stu_grddate"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="stu_pwd" required></td>
			</tr>
			<tr>
				<td><input id="saveBtn" type="button" value="저장"></td>
				<td><input id="resetBtn" type="button" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>