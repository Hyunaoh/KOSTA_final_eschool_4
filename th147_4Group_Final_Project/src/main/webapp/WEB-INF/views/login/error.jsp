<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
		alert("아이디나 패스워드가 틀립니다.");
		window.close();
		window.open("${pageContext.request.contextPath}/login/loginForm.do");
		self.close();
	});	
	
	</script>
</head>
<body>
</body>
</html>