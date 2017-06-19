<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../../home/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../../home/menu.jsp"></jsp:include>
	<div style="margin-top: 15%; margin-left: 10%">
	출석부 수정 폼
	<br>
		<form action="/attendance/updatePeople.do" id="updatePeople">
			<c:forEach var="vo" items="${list}" begin="0" end="50">
				<div>
					<tr>
						<td>${vo.atName}</td>
					</tr>
					<tr>
						<td>등교 <select name="atAttendance" id="atAttendance"
							class="input_select" title="schoolAttendance">
								<option value="-" title="-">-</option>
								<option value="O" title="O">출석</option>
								<option value="*" title="*">지각</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>하교 <select name="atAttendance2" id="atAttendance2"
							class="input_select" title="schoolAttendance">
								<option value="-" title="-">-</option>
								<option value="*" title="*">조퇴</option>
								<option value="O" title="O">하교</option>
								<option value="X" title="X">결석</option>
						</select>
						</td>
					</tr>
					<input type="hidden" name="atName" value="${vo.atName}"> <input
						type="hidden" name="atDate" value="${vo.atDate}"> <input
						type="hidden" name="atGrade" value="${vo.atGrade}"> <input
						type="hidden" name="atClass" value="${vo.atClass}"> <input
						type="hidden" name="atNum" value="${vo.atNum}"> <input
						type="hidden" name="atLevel" value="${vo.atLevel}"> <input
						type="hidden" name="atTeacher" value="${vo.atTeacher}"> <input
						type="hidden" name="atFlag" value="${vo.atFlag}">
				</div>
			</c:forEach>
			<input type="submit" value="입력"">

		</form>
	</div>

	<div style="margin-top: 15%; margin-left: 10%">
		<jsp:include page="../../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>