<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<jsp:include page="../../home/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../../home/menu.jsp"></jsp:include>
	
	<div style="margin-top: 15%; margin-left: 10%">
		클래스 서치 
		<br/><br/>
		<c:forEach var="vo" items="${Info}" begin="0" end="50">
			${vo.atDate} / ${vo.atName} / 등교 : ${vo.atAttendance} / 하교 : ${vo.atAttendance2} <br>
			<br>
		</c:forEach>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<jsp:include page="../../home/footer.jsp"></jsp:include>
</body>
</html>