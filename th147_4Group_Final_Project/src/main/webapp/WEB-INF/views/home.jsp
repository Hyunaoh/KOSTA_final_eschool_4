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

	<div id="" class="">
		<c:if test="${param.error != null }">
			<div>
				로그인 실패<br>
				<!-- spring에서 제공하는것 -->
				<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
					오류 이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
				</c:if>
			</div>
		</c:if>
		
		<c:url value="/j_spring_security_check" var="loginURL"></c:url>
		<form name='f' action="${loginURL}" method="post">
			<!-- fieldset 양식에 그룹 관련 요소 그룹화  -->
			<fieldset>
				<legend class="hidden">로그인 폼</legend>
			<h3>
			</h3>
			<!-- loginBox -->
			<ul id="">
				<li><label for="uid">아이디</label>
				<input name="j_username" class="text"/>
				</li>
				<li><label for="pwd">비밀번호</label>
				<input type="password" name="j_password" class="text"/>
				</li>
			</ul>
			<p>
				<input type="submit" id="btnLogin" value=""/>
			</p>
			
			<!-- 기능 구현이 필요 *********-->
			<ul id="loginOption">
				<li>
					<span>아이디 또는 비밀번호를 분실하셨나요?</span>
					<a href="/Member/FindID"><img alt="ID/PWD 찾기" src=""></a>
				</li>
				<li><span>아이디가 없으신 분은 회원가입을 해주세요.</span>
					<a href="/Member/Agree"><img alt="회원가입" src="images/btnJoin.png" /></a>
				</li>
			</ul>
			</fieldset>
		</form>	
	</div>


</body>
</html>
