<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content">
	<h2>로그인</h2>
	     
	<form action="<c:url value="/j_spring_security_check"/>" method="post">
	ID:<input type="text" name="id"/>
	PW:<input type="password" name="pw"/>
	<input type="submit" value="로그인">
	</form>
	

</div>