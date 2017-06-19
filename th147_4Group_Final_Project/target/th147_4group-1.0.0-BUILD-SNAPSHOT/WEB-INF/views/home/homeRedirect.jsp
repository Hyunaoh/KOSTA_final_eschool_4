<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>homeRedirect</title>
<script>
	$(document).ready(function() {
		var id = document.querySelector("#sessionID").value;
		alert(id + '님 환영합니다');
		window.close();
		window.open("${pageContext.request.contextPath}/");
		self.close();
	});
</script>
</head>

<body>
	<input type="hidden" id="sessionID" name="sessionID" value="${ sessionScope.id }" />
</body>
</html>