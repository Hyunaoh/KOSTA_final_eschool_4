<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="WEB-INF/views/home/head.jsp"></jsp:include>
</head>
<body>
	

	<!-- menu 부분 INCLUDE -->
	<div>
	<jsp:include page="WEB-INF/views/home/menu.jsp"></jsp:include>
	</div>

	<!-- body 부분 INCLUDE -->
	<jsp:include page="WEB-INF/views/home/body.jsp"></jsp:include>

	<!-- footer 부분 INCLUDE -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<jsp:include page="WEB-INF/views/home/footer.jsp"></jsp:include>

	
	<!-- /.container -->
	<!-- script references -->

</body>
</html>