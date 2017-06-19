<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../home/menu.jsp"></jsp:include>

	<table id="schoolInfo">
		<div style="margin-top: 15%; margin-left: 10%">
			<ul>
				<li><a href="attendance.do?atGrade=1">1학년</a></li>
				<li><a href="attendance.do?atGrade=2">2학년</a></li>
				<li><a href="attendance.do?atGrade=3">3학년</a></li>
				<li><a href="attendance.do?atGrade=4">4학년</a></li>
				<li><a href="attendance.do?atGrade=5">5학년</a></li>
				<li><a href="attendance.do?atGrade=6">6학년</a></li>
				<li><a href="attendanceInsertForm.do">출석부입력폼</a></li>
				<li><a href="updatePeople.do">출석부수정폼</a></li>
			</ul>
		</div>
	</table>

	<div style="margin-top: 15%; margin-left: 10%">
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>