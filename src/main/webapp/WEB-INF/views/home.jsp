<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

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
				 	<!-- 1단계 
				 	JSTL 사용 (pageContext.request.userPrincipal.name)
				 	
				 	<c:if test="${empty pageContext.request.userPrincipal}">
					<li><a href="${pageContext.request.contextPath}/joinus/login.htm">로그인</a></li>
					</c:if>
					<c:if test="${not empty pageContext.request.userPrincipal}">
					<li><a href="${pageContext.request.contextPath}/j_spring_security_logout">
					(${pageContext.request.userPrincipal.name})로그아웃</a></li>
					</c:if>
					-->
					<!-- 2단계 Spring tablib  -->
						<se:authorize ifNotGranted="ROLE_USER">
							<li><a href="${pageContext.request.contextPath}/login/login.do">로그인</a></li>
						</se:authorize>
						
						<se:authentication property="name" var="LoingUser" />
						
						<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
							<li><a href="${pageContext.request.contextPath}/j_spring_security_logout">
							(${LoingUser})로그아웃</a></li>
						</se:authorize>
						
						<!--  
							<se:authorize ifNotGranted="ROLE_USER">
								NOT ROLE_USER (로그인한 사용자가 ROLE_USER 그룹이 아니면)
							</se:authorize>
							<se:authorize ifAllGranted="ROLE_USER , ROLE_ADMIN">
					 		ALL -> AND => ROLE_USER and ROLE_ADMIN  (로그인한 사용자 ..둘다 만족)
							</se:authorize>
							<se:authorize ifAnyGranted="ROLE_USER , ROLE_ADMIN">
					 		Any -> OR => ROLE_USER OR ROLE_ADMIN  (로그인한 사용자 ..둘 중에 하나만 만족한다면)
							</se:authorize>
						-->
						
						
			<li><a href="${pageContext.request.contextPath}/login/join.do">회원가입</a></li>
		</ul>
	</div>


</body>
</html>
