<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>index</title>
</head>
<body>

	<h1>home page</h1>

	<h1>로그인으로 가는 태그 및 회원가입</h1>
	<div>
		<ul id="loginmenu" class="block_hlist">
			<!-- Spring 을 통한 login 과 logout 처리 -->

			<li><a href="${pageContext.request.contextPath}/home.do">HOME</a></li>

			
			<se:authorize ifNotGranted="ROLE_USER">
				<li><a href="${pageContext.request.contextPath}/loginform.do">로그인</a></li>
				<li><a href="${pageContext.request.contextPath}/joinform.do">회원가입</a></li>
			</se:authorize>

			<se:authentication property="name" var="LoingUser" />

			<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
				<li><a href="${pageContext.request.contextPath}/j_spring_security_logout">(${LoingUser})로그아웃</a></li>
			</se:authorize>



			
		</ul>
	</div>


</body>
</html>
