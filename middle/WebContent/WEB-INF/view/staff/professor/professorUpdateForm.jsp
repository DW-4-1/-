<%@page import="kr.or.dw.vo.StaffVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수정보 수정 페이지 입니다.</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<%
	StaffVO staVo = (StaffVO)request.getAttribute("staVo");
%>
<%
	List<StaffVO> staList = (List)request.getAttribute("dept");
%>
<script>
	$(function(){
		$('#saveBtn').on('click', function(){
			$('#professorUpdateForm').submit();
			alert('변경이 완료되었습니다.');
		});
		$("#resetBtn").on('click', function(){
			location.href="<%=request.getContextPath()%>/staff/professorCRUD.do";
		});
		
		$('select[name=staff_gender]').val('<%=staVo.getStaff_gender()%>').prop('selected', true);
		$('select[name=dept_code]').val('<%=staVo.getDept_code()%>').prop('selected', true);
	})
	
</script>

</head>
<body>
	<form id="professorUpdateForm" method="post" action="<%=request.getContextPath()%>/staff/professorUpdate.do">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="staff_id" required readonly value="<%=staVo.getStaff_id()%>"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="staff_name" required value="<%=staVo.getStaff_name()%>"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<select name="staff_gender">
						<option value="Male">남</option>
						<option value="Female">여</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td><input type="text" name="staff_resnum" required value="<%=staVo.getStaff_resnum()%>"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input id="sta_zipcode" name="staff_zipcode" type="text" value="<%=staVo.getStaff_zipcode()%>" readonly onclick="findAddr()" required></td>
			</tr>
			<tr>
				<th>주소</th>
				<td> <input id="sta_addr" name="staff_addr" type="text" value="<%=staVo.getStaff_addr()%>" readonly required></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="staff_detailaddr" value="<%=staVo.getStaff_detailaddr()%>" required></td>
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
			            document.getElementById('sta_zipcode').value = data.zonecode;
			            if(roadAddr !== ''){
			                document.getElementById("sta_addr").value = roadAddr;
			            } 
			            else if(jibunAddr !== ''){
			                document.getElementById("sta_addr").value = jibunAddr;
			            }
			        }
			    }).open();
			}
			</script>
			<tr>
				<th>학과</th>
				<td>
					<select name="dept_code">
					<% for(StaffVO vo : staList){ %>
						<option value="<%=vo.getDept_code()%>"><%=vo.getDept_code()%> <%=vo.getDept_name()%></option>
					<% 	 }	 %>
					</select>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="staff_tel" required value="<%=staVo.getStaff_tel()%>"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="staff_email" required value="<%=staVo.getStaff_email()%>"></td>
			</tr>
			<tr>
				<th>상태</th>
				<td><input type="text" name="staff_state" required value="<%=staVo.getStaff_state()%>"></td>
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