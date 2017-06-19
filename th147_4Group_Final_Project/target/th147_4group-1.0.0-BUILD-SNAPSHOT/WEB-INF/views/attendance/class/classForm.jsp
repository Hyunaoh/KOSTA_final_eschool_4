<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<jsp:include page="../../home/head.jsp"></jsp:include>
</head>

<body>
	<jsp:include page="../../home/menu.jsp"></jsp:include>
	출석부 입력 폼
	<br>
	<div style="margin-top: 15%; margin-left: 10%">
		<form action="/attendance/insertPeople.do">
			<tr>
				<td>
				<th>이름</th>
				<input type="text" name="atName">
				<br>
				</td>
			</tr>
			<tr>
				<td>
				<th>등교</th>
				<input type="text" name="atAttendance">
				<br>
				</td>
			</tr>
			<tr>
				<td>
				<th>하교</th>
				<input type="text" name="atAttendance2">
				<br>
				</td>
			</tr>

			<tr>
				<td>
				<th>날짜</th>
				<input type="text" name="atDate">
				<br>
				</td>
			</tr>
			<tr>
				<td>
				<th>학년</th>
				<input type="text" name="atGrade">
				<br>
				</td>
			</tr>
			<tr>
				<td>
				<th>반</th>
				<input type="text" name="atClass">
				<br>
				</td>
			</tr>
			<tr>
				<td>
				<th>학번</th>
				<input type="text" name="atNum">
				<br>
				</td>
			</tr>
			<tr>
				<td>
				<th>직급</th>
				<input type="text" name="atLevel">
				<br>
				</td>
			</tr>
			<tr>
				<td>
				<th>담당교사</th>
				<input type="text" name="atTeacher">
				<br>
				</td>
			</tr>
			<tr>
				<td>Flag <select name="atFlag" id="atFlag">
						<option value="0">0</option>
						<option value="1">1</option>
				</select>
				</td>
			</tr>

			<input type="submit" value="저장">
		</form>
	</div>

	<div style="margin-top: 15%; margin-left: 10%">
		<jsp:include page="../../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>