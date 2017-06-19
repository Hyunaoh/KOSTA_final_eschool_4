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
	출석부 Flag 폼
	<br>
	<div style="margin-top: 15%; margin-left: 10%">
		<form action="" id="updateFlag">
			<tr>
				<td>Flag 변경 할 학생의 학번을 입력하세요. <input type="text" name="atNum">
				</td>
			</tr>
			<tr>
				<td>Flag 변경 할 학생의 학번을 입력하세요. <select name="atFlag" id="atFlag">
						<option value="0">0</option>
						<option value="1">1</option>
				</select>
				</td>
			</tr>
			<input type="submit" value="확인">
		</form>
	</div>

	<div style="margin-top: 15%; margin-left: 10%">
		<jsp:include page="../../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>