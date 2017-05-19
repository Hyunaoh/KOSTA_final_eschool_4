<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="sc" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
		<h1>로그인된 페이지</h1>
		<p></p>  
		<a href="loginform.do">로그인 </a><br>
		
		<sc:authorize ifAnyGranted="Role_Student">
		<a href="student/test.do">학생 로그인함 </a>
		</sc:authorize>
		
		<sc:authorize ifAnyGranted="Role_Teacher">
		<a href="student/test.do">선생님 로그인함 </a>
		</sc:authorize>
		
		<sc:authorize ifAnyGranted="Role_Parent">
		<a href="student/test.do">학부모 로그인함 </a>
		</sc:authorize>
				
		<sc:authorize ifAnyGranted="Role_Admin">
		<a href="student/test.do">admin 로그인함 </a>
		</sc:authorize>
	
</h1>

	<h2>로그인</h2>
	<h3 class="hidden"> 방문페이지 로그</h3>
	<ul id="" class="">
		<li>HOME</li>
		<li>회원가입</li>
		<li>로그인</li>
	</ul>

	
	<h1>로그인으로 가는 태그 및 회원가입</h1>
	<div>
	<ul id="loginmenu" class="block_hlist">
		<!-- Spring 을 통한 login 과 logout 처리 -->
		
			<li><a href="${pageContext.request.contextPath}/home.do">HOME</a></li>
				 
					<!-- 2단계 Spring tablib  -->
						<se:authorize ifNotGranted="Role_Student">
							<li><a href="${pageContext.request.contextPath}/login/login.do">로그인</a></li>
						</se:authorize>
						
						<se:authentication property="name" var="LoingUser" />
						
						<se:authorize ifAnyGranted="Role_Student, Role_Teacher, Role_Parent, Role_Admin">
							<li><a href="${pageContext.request.contextPath}/j_spring_security_logout">
							(${LoingUser})로그아웃</a></li>
						</se:authorize>
						
						
			<li><a href="${pageContext.request.contextPath}/login/join.do">회원가입</a></li>
		</ul>
	</div>


</body>
</html>
