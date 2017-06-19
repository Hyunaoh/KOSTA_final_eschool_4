<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript">
	function updatePeople() {
		var form = document.getElementById("updatePeopleForm");
		form.submit();
	}
</script>
<jsp:include page="../../home/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../../home/menu.jsp"></jsp:include>
	<div style="margin-top: 15%; margin-left: 10%">
		- 출석뷰 - <br/><br/>
		<input type="hidden" name="" value="">
		<c:forEach var="vo" items="${list}" begin="0" end="50">
			이름 : ${vo.atName} / 등교 : ${vo.atAttendance} / 하교 : ${vo.atAttendance2} <br>
			<br>
		</c:forEach>
		<input type="button" value="수정"
			onclick="location.href='updatePeopleForm.do?${list[0].atTeacher}'">
		<input type="button" value="Flag수정"
			onclick="location.href='classFlagForm.do'">

		<div style="margin-top: 15%; margin-left: 10%">
			<jsp:include page="../../home/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>