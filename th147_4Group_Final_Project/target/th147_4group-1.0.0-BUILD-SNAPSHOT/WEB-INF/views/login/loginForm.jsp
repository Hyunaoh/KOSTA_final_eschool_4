<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	<div id="content">
		<h2 style="margin-top: 200px; margin-left: 300px">로그인</h2>
		<div style="margin-top: 50px; margin-left: 300px">

			<form action="<c:url value="/j_spring_security_check"/>" method="post">
			
				ID : &nbsp;&nbsp;<input type="text" name="id" id="id" /> <br /> 
				PW : <input type="password" name="pw" id="pw"/> <br /> <br />
				<div style="margin-left: 10%">
				<input type="submit" value="로그인">
				<a href="/login/joinForm.do">
				<c:out value="회원가입" /></a>
				</div>
				
			</form>
		</div>

		<div style="margin-top: 10%; margin-left: 300px">
			<jsp:include page="../home/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>